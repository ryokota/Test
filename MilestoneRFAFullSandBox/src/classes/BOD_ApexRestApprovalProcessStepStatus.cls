@RestResource(urlMapping='/process/approvals/bodmemberstepstatus/*')
global without sharing class BOD_ApexRestApprovalProcessStepStatus {
	
	/*
	@HttpGet
	global static String getCurrentStepStatusOfOneBODMember() {
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
        String strAgendaItemRecordId = instRestRequest.params.get('agendaid');
        String strBODMemberUid = instRestRequest.params.get('uid');
        
        if(strAgendaItemRecordId != null && strBODMemberUid != null) {
        	
        	Id idProcessInstance = getCurrentProcessInstanceId(strAgendaItemRecordId);
        	
        	if(idProcessInstance != null) {
        		
        		if(pendingApprovalRequest(idProcessInstance, strBODMemberUid)) {
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
	*/

}