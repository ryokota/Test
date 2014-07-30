@RestResource(urlMapping='/process/approvals/actions/*')
global without sharing class BOD_ApexRestApprovalProcessWorkitemEdit {
	
	/*
		One BOD member to Approve/Reject on one Agenda Item
	*/
	@HttpPost
	global static Boolean submitApprovalActionsByHttpPost(
		String agendaid, 
		String uid, 
		String action, 
		String comment
	) {
		/*
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
        String strAgendaItemRecordId = instRestRequest.params.get('agendaid');
        String strBODMemberUid = instRestRequest.params.get('uid');		
        String strAction = instRestRequest.params.get('action');	
        String strComment = instRestRequest.params.get('comment');	 
        */       
		
		if(agendaid != null && uid != null) {
			
			Id idProcessInstance = BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceId(agendaid);
			
			if(idProcessInstance != null) {
				ProcessInstanceWorkitem instProcessInstanceWorkitem = 
					BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceWorkitemForApprove(
						idProcessInstance, uid);
										
				if(instProcessInstanceWorkitem != null) {
					
					Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
					req.setAction( action ); //'Approve'
					if(comment != null) {
						req.setComments( comment );
					}
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

	
	@HttpGet
	global static Boolean submitApprovalActionsByHttpGet() {
		
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
        String strAgendaItemRecordId = instRestRequest.params.get('agendaid');
        String strBODMemberUid = instRestRequest.params.get('uid');		
        String strAction = instRestRequest.params.get('action');	
        String strComment = instRestRequest.params.get('comment');	        
        
        //strComment =  instRestResponse.getHeader('Comment1');
		
		if(strAgendaItemRecordId != null && strBODMemberUid != null) {
			
			Id idProcessInstance = BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceId(strAgendaItemRecordId);
			
			if(idProcessInstance != null) {
				ProcessInstanceWorkitem instProcessInstanceWorkitem = 
					BOD_ApexRestApprovalProcessWorkitem.getCurrentProcessInstanceWorkitemForApprove(
						idProcessInstance, strBODMemberUid);
										
				if(instProcessInstanceWorkitem != null) {
					
					Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
					req.setAction( strAction ); //'Approve'
					if(strComment != null) {
						req.setComments( strComment );
					}
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
	
	/*
BOD_ApexRestApprovalProcessWorkitemEdit.testApproveActionByHttpPost('a0hN0000000hAr8', '00510000001rooj', 'Approve', 'a b c ありがとう！');
	
	*/
	public static void testApproveActionByHttpPost(
		String strAgendaItemId, 
		String strBODMemberUid, 
		String strAction, 
		String strComment
	) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET'); //POST
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;	
		
		instHttpRequest.setHeader('Content-Type', 'application/json');  
        
        instHttpRequest.setBody('{"agendaid":"' + strAgendaItemId 
        	+ '", "uid":"' + strBODMemberUid 
        	+ '", "action":"' + strAction 
        	+ '", "comment":"' + strComment + '"}');	
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			+ '/services/apexrest/process/approvals/actions';

		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}			
	
	/*
	BOD_ApexRestApprovalProcessWorkitemEdit.testApprove('a0hN0000000hAo4', '00510000001rooj', 'Approve' ,  'nocomment');
	BOD_ApexRestApprovalProcessWorkitemEdit.testApprove('a0hN0000000hAo4', '00510000001rolz', 'Reject' ,  'nocomment');
	*/
	public static void testApproveActionByHttpGet(
		String strAgendaItemId, 
		String strBODMemberUid, 
		String strAction, 
		String strComment
	) {
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET'); //POST
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;		
		
		//dont' include space in the link
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			+ '/services/apexrest/process/approvals/actions?agendaid=' 
			+ strAgendaItemId + '&uid=' + strBODMemberUid + '&action=' + strAction + '&comment=' + strComment;
		
		//instHttpRequest.setBody('strAgendaItemRecordId=' + strAgendaItemId + '&strApproverUId=' + strBODMemberUid + '&strAction=Approve&strComment=value4');			
		//instHttpRequest.setHeader('Content-Type', 'application/x-www-form-urlencoded'); 

		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		System.debug(' ------ ' + instHttpResponse.getbody() );		
	}		
	

}