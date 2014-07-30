/*
Rest:
https://www.salesforce.com/us/developer/docs/api_rest/Content/using_resources_working_with_processes.htm
Soap:
http://www.salesforce.com/us/developer/docs/api/Content/sforce_api_erd_process.htm

http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_rest_code_sample_basic.htm

Apex:
http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_namespace_Approval.htm

Apex Approval Processing Example
http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_process_example.htm
http://www.salesforce.com/us/developer/docs/apexcode/Content/apex_methods_system_approval.htm#apex_methods_system_approval

http://www.shivasoft.in/blog/salesforce/dynamic-approval-process-based-on-the-apex-and-trigger/
*/
@RestResource(urlMapping='/process/approvals/statusofagendarecord/*')
global without sharing class BOD_ApexRestApprovalProcess {
	
	/*
		List<ProcessInstance> listProcessInstances = [Select Id, TargetObjectId, Status from ProcessInstance];
		/services/data/v30.0/process/approvals/
	*/
	//URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/process/approvals/statusofagendarecord';
	//Save error: Invalid type: HTTP GET/DELETE methods do not support parameters
	/*
		Return the Approval Process status of One Agenda Item record based on the Agenda Item Id
	*/
	@HttpGet
	global static String getCurrentApprovalStatusOfOneAgendaItemRecord() {//String strAgendaItemRecordId
		
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
        String strAgendaItemRecordId = instRestRequest.params.get('agendaid');
		
		if(strAgendaItemRecordId != null) {
			List<ProcessInstance> listProcessInstance = [
				Select Id, Status, TargetObjectId, CreatedDate, CreatedById, 
					IsDeleted, LastModifiedById, LastModifiedDate					
					from ProcessInstance where TargetObjectId =: strAgendaItemRecordId 
					order by CreatedDate desc];	
		
			if(listProcessInstance != null && listProcessInstance.size() > 0) {
				return listProcessInstance[0].Status;
			} else {
				return 'NoApprovals';
			}
			
		} else {
			return 'NoAgendaId';
		}
		
		return '';
	}
	
	
	/*
		Agenda_Item__c agenda = [Select Id from Agenda_Item__c where id = 'a0hN0000000gr1o'];
		BOD_ApexRestApprovalProcess.submitApprovalProcess(agenda);	
		
	*/
	public static void startApprovalProcess(Agenda_Item__c agenda) {
		// Create an approval request for the account
		Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
		//necessary
		req1.setObjectId(agenda.id);
		
		//not necessary
		req1.setComments('submit from apex!!!');

		// Submit the approval request for the account
		//System.DmlException: Process failed. First exception on row 0; first error: ALREADY_IN_PROCESS, Cannot submit object already in process.: []
		Approval.ProcessResult result = Approval.process(req1);
		//Approval.ProcessResult result = Approval.process(req1, false);
		
		//approver ids
		//IDs of the users who are currently assigned to this approval step.
		system.debug('------------ getActorIds(): ' + result.getActorIds()  );
		//Agenda Item record id
		//The object being processed.
		system.debug('------------ getEntityId(): ' + result.getEntityId()  ); 
		//The set of errors returned if the request failed.
		system.debug('------------ getErrors(): ' + result.getErrors()  );
		//04gN00000009PlwIAE   can't access from browser
		//The ID of the ProcessInstance associated with the object submitted for processing.
		system.debug('------------ getInstanceId(): ' + result.getInstanceId() );
		//Pending
		//The status of the current process instance (not an individual object but the entire process instance). 
		//The valid values are “Approved,” “Rejected,” “Removed,” or “Pending.”
		system.debug('------------ getInstanceStatus(): ' + result.getInstanceStatus() );
		//same Number with approvers, can't access from browser
		//Case-insensitive IDs that point to ProcessInstanceWorkitem items (the set of pending approval requests).
		system.debug('------------ getNewWorkitemIds(): ' + result.getNewWorkitemIds() );
		//true if processing or approval completed successfully.
		system.debug('------------ isSuccess(): ' + result.isSuccess() );
		
	}	
	
	/*
		BOD_ApexRestApprovalProcess.submitApproval('a0hN0000000hAna', '005N0000000aw8P');
		Actual Approver is the login user, that is login_user approved for user '005N0000000aw8P'!
		
	*/
	public static void submitApproval(String strAgendaItemRecordId, String strApproverUId) {
		ProcessInstance instProcessInstance = [
			Select Id, Status, TargetObjectId, CreatedDate, CreatedById, 
				IsDeleted, LastModifiedById, LastModifiedDate					
				from ProcessInstance where TargetObjectId =: strAgendaItemRecordId 
				order by CreatedDate desc limit 1];		
		
		Id idProcessInstance;
		
		if(instProcessInstance != null) {
			idProcessInstance = instProcessInstance.Id;
		}		
		
		if(idProcessInstance != null) {
			List<ProcessInstanceWorkitem> listWorkitems = [
				Select Id from ProcessInstanceWorkitem 
				where ProcessInstanceId =: idProcessInstance and ActorId =: strApproverUId
			];
			
			if(listWorkitems != null && listWorkitems.size() > 0) {
				Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
				req.setAction('Approve'); //'Approve'
				req.setComments('approval from apex code!');
				req.setWorkitemId( listWorkitems[0].Id );
				
				Approval.ProcessResult result =  Approval.process(req);
				system.debug('------------ getActorIds(): ' + result.getActorIds()  );
				system.debug('------------ getEntityId(): ' + result.getEntityId()  ); 
				system.debug('------------ getErrors(): ' + result.getErrors()  );
				system.debug('------------ getInstanceId(): ' + result.getInstanceId() );
				system.debug('------------ getNewWorkitemIds(): ' + result.getNewWorkitemIds() );
			}
			
		}
				
	}
	
	/*
		get only one current Approval Process from Agenda Item record Id
	*/
	public static void getAgendaItemCurrentProcessInstance(String strAgendaItemId) {
		/*
			ProcessInstance.Status --- 9 Picklist Values:
			Approved, Rejected, Recalled, Fault, Pending, Hold Reassigned, Submitted, NoResponse
			
			ProcessInstanceStep.StepStatus --- 9 Picklist Values:
			Approved, Rejected, Recalled, Fault, Pending, Hold, Reassigned, Submitted, NoResponse						
		
		*/
		ProcessInstance instProcessInstance = [
			Select Id, Status, TargetObjectId, CreatedDate, CreatedById, 
				IsDeleted, LastModifiedById, LastModifiedDate

				, (SELECT Id, ProcessInstanceId, StepStatus, Comments, RemindersSent, IsPending,
					ActorId, OriginalActorId, CreatedById, CreatedDate FROM StepsAndWorkitems) 
									
				, (SELECT Id, ProcessInstanceId, StepStatus, Comments, 
					ActorId, OriginalActorId, CreatedById, CreatedDate FROM Steps) 
					
				, (SELECT Id, ProcessInstanceId, IsDeleted, 
					ActorId, OriginalActorId, CreatedById, CreatedDate FROM Workitems)
					
				from ProcessInstance where TargetObjectId =: strAgendaItemId 
				order by CreatedDate desc limit 1];
		
		List<ProcessInstanceHistory> listProcessInstanceHistory = instProcessInstance.StepsAndWorkitems;
		
		List<ProcessInstanceStep> listProcessInstanceSteps = instProcessInstance.Steps;
		
		List<ProcessInstanceWorkitem> listProcessInstanceWorkitems = instProcessInstance.Workitems;
			
		system.debug('-------- ProcessInstance --------- ');		
		system.debug('-------- ProcessInstance.Id: ' + instProcessInstance.Id);
		//Pending, 
		system.debug('-------- ProcessInstance.Status: ' + instProcessInstance.Status);
		system.debug('-------- ProcessInstance.TargetObjectId: ' + instProcessInstance.TargetObjectId);
		
		system.debug('-------- ProcessInstanceHistory --------- ');		
		if(listProcessInstanceHistory != null && listProcessInstanceHistory.size() > 0) {
			for(integer i = 0; i < listProcessInstanceHistory.size(); i++) {
				system.debug('-------- ProcessInstanceHistory --------- No. ' + (i + 1));	
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.Id:  ' + listProcessInstanceHistory[i].Id);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.ProcessInstanceId:  ' + listProcessInstanceHistory[i].ProcessInstanceId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.StepStatus:  ' + listProcessInstanceHistory[i].StepStatus);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.Comments:  ' + listProcessInstanceHistory[i].Comments);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.RemindersSent:  ' + listProcessInstanceHistory[i].RemindersSent);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.IsPending:  ' + listProcessInstanceHistory[i].IsPending);				
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.ActorId:  ' + listProcessInstanceHistory[i].ActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.OriginalActorId:  ' + listProcessInstanceHistory[i].OriginalActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.CreatedById:  ' + listProcessInstanceHistory[i].CreatedById);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceHistory.CreatedDate:  ' + listProcessInstanceHistory[i].CreatedDate);
			}
		}		
		
		/*
			Represents one step in an approval process (ProcessInstance).
			describeSObjects(), query(), retrieve()
			Query or retrieve a new step in an approval process (ProcessInstance).
		*/
		system.debug('-------- ProcessInstanceStep --------- ');		
		if(listProcessInstanceSteps != null && listProcessInstanceSteps.size() > 0) {
			for(integer i = 0; i < listProcessInstanceSteps.size(); i++) {
				system.debug('-------- ProcessInstanceStep --------- No. ' + (i + 1));	
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.Id: ' + listProcessInstanceSteps[i].Id);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.ProcessInstanceId:  ' + listProcessInstanceSteps[i].ProcessInstanceId);
				//Started, Approved, 
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.StepStatus:  ' + listProcessInstanceSteps[i].StepStatus);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.Comments:  ' + listProcessInstanceSteps[i].Comments);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.ActorId: ' + listProcessInstanceSteps[i].ActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.OriginalActorId:  ' + listProcessInstanceSteps[i].OriginalActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.CreatedById:  ' + listProcessInstanceSteps[i].CreatedById);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceStep.CreatedDate:  ' + listProcessInstanceSteps[i].CreatedDate);
			}
		}
		
		/*
			Represents a user's pending approval request.
			Use this object to manage a pending approval request for a user.
			delete(), describeSObjects(), query(), retrieve(), update()
		*/
		system.debug('-------- ProcessInstanceWorkitem --------- ');
		if(listProcessInstanceWorkitems != null && listProcessInstanceWorkitems.size() > 0) {
			for(integer i = 0; i < listProcessInstanceWorkitems.size(); i++) {
				system.debug('-------- ProcessInstanceWorkitems --------- No. ' + (i + 1));	
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.Id:  ' + listProcessInstanceWorkitems[i].Id);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.ProcessInstanceId:  ' + listProcessInstanceWorkitems[i].ProcessInstanceId);			
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.ActorId:  ' + listProcessInstanceWorkitems[i].ActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.OriginalActorId:  ' + listProcessInstanceWorkitems[i].OriginalActorId);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.CreatedById:  ' + listProcessInstanceWorkitems[i].CreatedById);
				system.debug('-------- No. ' + (i + 1) + ' ProcessInstanceWorkitems.CreatedDate:  ' + listProcessInstanceWorkitems[i].CreatedDate);
			}
		}		

	}

/*
BOD_ApexRestApprovalProcess.testAgendaItemApprovalStatus(String strAgendaItemId)
BOD_ApexRestApprovalProcess.testAgendaItemApprovalStatus('a0hN0000000Sfjf');
'/services/apexrest/process/approvals/statusofagendarecord?agendaid=' + strAgendaItemId

Pending

*/	
	//BOD_ApexRestApprovalProcess.testAgendaItemApprovalStatus();
	public static void testAgendaItemApprovalStatus(String strAgendaItemId) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET');
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			//+ '/services/apexrest/process/approvals/statusofagendarecord?agendaid= \'' + strAgendaItemId + '\'';
			+ '/services/apexrest/process/approvals/statusofagendarecord?agendaid=' + strAgendaItemId;

		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}
	
	
	
	

}