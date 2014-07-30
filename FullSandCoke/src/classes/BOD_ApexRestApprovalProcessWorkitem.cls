@RestResource(urlMapping='/process/approvals/statusofonebodmember/*')
global without sharing class BOD_ApexRestApprovalProcessWorkitem {
	
	//'/services/apexrest/process/approvals/statusofonebodmember?agendaid=' + strAgendaItemId + '&uid=' + strBODMemberUid
	@HttpGet
	global static String getCurrentStepStatusOfOneBODMember() {
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
        String strAgendaItemRecordId = instRestRequest.params.get('agendaid');
        String strBODMemberUid = instRestRequest.params.get('uid');
        
        if(strAgendaItemRecordId != null && strBODMemberUid != null) {
        	
        	Id idProcessInstance = BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceId(strAgendaItemRecordId);
        	
        	if(idProcessInstance != null) {
        		
        		if(BOD_ApexRestApprovalProcessWorkitem.pendingApprovalRequest(idProcessInstance, strBODMemberUid)) {
        			return 'WaitingApproval'; //waiting for BOD member's approval
        		} else {
        			//use OriginalActorId instead of ActorId means anyone (system admin) can Approve/Reject for this BOD member!
        			List<ProcessInstanceStep> listProcessInstanceStep = [
        				SELECT Id, ProcessInstanceId, StepStatus, Comments, 
						ActorId, OriginalActorId, CreatedById, CreatedDate 
						FROM ProcessInstanceStep 
						where ProcessInstanceId =: idProcessInstance and OriginalActorId =: strBODMemberUid
						order by CreatedDate Desc
					];
				
					if(listProcessInstanceStep != null && listProcessInstanceStep.size() > 0) {					
						return listProcessInstanceStep[0].StepStatus;
					} else {
						return 'NoApprovalSteps';
					}
        		}
        		
        		
        	} else {
        		return 'NoApprovals';
        	}
        	
        } else {
        	return 'NoAgendaIdOrUid';
        }
		
		
		return '';		
	}
	
	//ProcessInstanceWorkitem: Represents a user's pending approval request.
	public static boolean pendingApprovalRequest(
		Id idProcessInstance, 
		String strBODMemberUid
	) {
		
		List<ProcessInstanceWorkitem> listProcessInstanceWorkitems = [
			SELECT Id, ProcessInstanceId, IsDeleted, 
					ActorId, OriginalActorId, CreatedById, CreatedDate 
					FROM ProcessInstanceWorkitem 					
					where ProcessInstanceId =: idProcessInstance and ActorId =: strBODMemberUid
					and IsDeleted = false
					order by CreatedDate Desc
			];
		
		if(listProcessInstanceWorkitems != null && listProcessInstanceWorkitems.size() > 0) {
			return true;
		} 
		
		return false;
	}
	
	/*
		return the current Workitem for BOD member Approve/Reject
	*/
	public static ProcessInstanceWorkitem getCurrentProcessInstanceWorkitemForApprove(
		Id idProcessInstance, 
		String strBODMemberUid
	) {
		
		List<ProcessInstanceWorkitem> listProcessInstanceWorkitems = [
			SELECT Id, ProcessInstanceId, IsDeleted, 
					ActorId, OriginalActorId, CreatedById, CreatedDate 
					FROM ProcessInstanceWorkitem 					
					where ProcessInstanceId =: idProcessInstance and ActorId =: strBODMemberUid
					and IsDeleted = false
					order by CreatedDate Desc
			];
		
		if(listProcessInstanceWorkitems != null && listProcessInstanceWorkitems.size() > 0) {
			return listProcessInstanceWorkitems[0];
		} 
		
		return null;
	}	
	
	/*
		return the ProcessInstance Id from a Agenda Item record Id
	*/
	public static id getCurrentProcessInstanceId(String strAgendaItemRecordId) {
		Id idProcessInstance = null;

		List<ProcessInstance> listProcessInstance = [
			Select Id, Status, TargetObjectId, CreatedDate, CreatedById, 
				IsDeleted, LastModifiedById, LastModifiedDate					
					from ProcessInstance where TargetObjectId =: strAgendaItemRecordId 
						order by CreatedDate desc];	
		
		if(listProcessInstance != null && listProcessInstance.size() > 0) {
			return listProcessInstance[0].Id;
		}	
		
		return idProcessInstance;
	}
	
	/*
	BOD_ApexRestApprovalProcessWorkitem.testBODMemberStatus('a0hN0000000hAnf', '00510000001rhjI');
	"NoApprovals",  "Started", "Rejected"
	"NoApprovalSteps" --- member in approval pending
	
	*/
	public static void testBODMemberStatus(String strAgendaItemId, String strBODMemberUid ) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET');
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			//+ '/services/apexrest/process/approvals/statusofagendarecord?agendaid= \'' + strAgendaItemId + '\'';
			+ '/services/apexrest/process/approvals/statusofonebodmember?agendaid=' + strAgendaItemId + '&uid=' + strBODMemberUid;

		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}	

}