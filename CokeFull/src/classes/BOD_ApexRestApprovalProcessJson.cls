@RestResource(urlMapping='/process/approvals/service/*')
global with sharing class BOD_ApexRestApprovalProcessJson {


	global static Boolean submitApprovalActions(
		String strAgendaItemRecordId, 
		String strApproverUId, 
		String strAction, 
		String strComment
	) {
		
		if(strAgendaItemRecordId != null && strApproverUId != null) {
			
			Id idProcessInstance = BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceId(strAgendaItemRecordId);
			
			if(idProcessInstance != null) {
				ProcessInstanceWorkitem instProcessInstanceWorkitem = 
					BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceWorkitemForApprove(
						idProcessInstance, strApproverUId);
										
				if(instProcessInstanceWorkitem != null) {
					
					Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
					req.setAction( strAction ); //'Approve'
					req.setComments( strComment );
					req.setWorkitemId( instProcessInstanceWorkitem.Id );
				
					Approval.ProcessResult result =  Approval.process(req);
					system.debug('------------ getActorIds(): ' + result.getActorIds()  );
					system.debug('------------ getEntityId(): ' + result.getEntityId()  ); 
					system.debug('------------ getErrors(): ' + result.getErrors()  );
					system.debug('------------ getInstanceId(): ' + result.getInstanceId() );
					system.debug('------------ getNewWorkitemIds(): ' + result.getNewWorkitemIds() );
					system.debug('------------ isSuccess(): ' + result.isSuccess() );
					
					return result.isSuccess();
					
				} else {
					return false;
				}
						
			} else {//end of if(idProcessInstance);
				return false;	
			}
						
			
		}//end of if();
		
		return false;		
				
	}//end of method();	

	public static void testJsonService(
		String strAgendaItemId, 
		String strBODMemberUid, 
		String strAction, 
		String strComment
	) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('POST'); //POST
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;	
		instHttpRequest.setHeader('Content-Type', 'application/json');	
		
		instHttpRequest.setBody('{"foo":"bar"}');
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/process/approvals/service';		
		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}	

}