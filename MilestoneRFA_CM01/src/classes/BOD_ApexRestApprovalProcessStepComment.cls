@RestResource(urlMapping='/process/approvals/bodmemberstepcomment/*')
global without sharing class BOD_ApexRestApprovalProcessStepComment {
	
	@HttpGet
	global static String getCurrentStepCommentsOfOneBODMember() {
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
						//return the latest Approval Comments of one BOD member on one Agenda Item record			
						return listProcessInstanceStep[0].Comments;
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
	
	
	public static void testStepComment(String strAgendaItemId, String strBODMemberUid ) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET');
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			+ '/services/apexrest/process/approvals/bodmemberstepcomment?agendaid=' + strAgendaItemId + '&uid=' + strBODMemberUid;

		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}			

}