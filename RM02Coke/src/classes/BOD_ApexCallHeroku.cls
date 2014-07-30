@RestResource(urlMapping='/bod/services/orgid/*')
global without sharing class BOD_ApexCallHeroku {
	
	
	@HttpGet
	global static Id getOrgId() {
		return Userinfo.getOrganizationId();
	}

	/*
		Test: sending one Attachment to Heroku with Content
	*/
    public static void uploadAttachmentToHeroku() {
        Http h = new Http();

        Attachment instAttachment = [Select Id, Name, ParentId, Body 
        	from Attachment where Id = '00PN0000000hMnz'];
        system.debug('------- Attachment to pass: ' + instAttachment);

        HttpRequest req = new HttpRequest();
        //req.setEndpoint('http://herokujettyapp.herokuapp.com/rest/uploadfile/postbyform');
        req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/postbyform');
        req.setMethod('POST');
        //req.setCompressed(true); // otherwise we hit a limit of 32000
        
    	req.setBody('attachmentId=' + instAttachment.Id 
        	+ '&Title=' + instAttachment.Name 
        	+ '&parentId=' + instAttachment.ParentId
        	+ '&Body=' + EncodingUtil.base64Encode(instAttachment.Body)
    	);
    	
    	req.setMethod('POST');
    	req.setCompressed(false);
    	req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        HttpResponse res = h.send(req);
        res.getBody();    
        
        system.debug('------- Body: ' + res.getBody());
    }   

	@future (callout=true)
    public static void uploadAttachmentsToHeroku(Set<Id> setNewAttIds) {
    	
    	//only 10 callout in 1 apex transcation
    	for(Attachment instAttachment : [
    		Select Id, Name, ParentId, Body 
    			from Attachment where Id =: setNewAttIds 
    			order by CreatedDate ASC limit 10
    	]) {
    		
    		system.debug('------- Attachment to pass: ' + instAttachment);
        	
        	Http h = new Http();
  
        	HttpRequest req = new HttpRequest();
        	//req.setEndpoint('http://herokujettyapp.herokuapp.com/rest/uploadfile/postbyform');
        	req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/postbyform');
        	req.setMethod('POST');
        	//req.setCompressed(true); // otherwise we hit a limit of 32000
        
    		req.setBody('attachmentId=' + instAttachment.Id 
        		+ '&Title=' + instAttachment.Name 
        		+ '&parentId=' + instAttachment.ParentId
        		+ '&Body=' + EncodingUtil.base64Encode(instAttachment.Body)
    		);
    
    		req.setMethod('POST');
    		req.setCompressed(false);
    		req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        	HttpResponse res = h.send(req);
        	
        	/*
        		can only upload file in 2MB
        		Maximum size of callout request or response (HTTP request or Web services call)    3 MB
        	*/
        	//res.getBody();           
        	//system.debug('------- Body: ' + res.getBody());
        
    	}//end of for();
    	
    }//end of method;  
    
    public static void passAttachmentId() {
        Http h = new Http();

        Attachment instAttachment = [Select Id, Name, ParentId from Attachment order by CreatedDate Desc limit 1];
        system.debug('------- Attachment to pass: ' + instAttachment);

        HttpRequest req = new HttpRequest();
        //req.setEndpoint('http://herokujettyapp.herokuapp.com/rest/uploadfile/postbyform');
        req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/passoneid');
        req.setMethod('POST');
        //req.setCompressed(true); // otherwise we hit a limit of 32000
        
    	req.setBody('attachmentId=' + instAttachment.Id);
    	req.setMethod('POST');
    	req.setCompressed(false);
    	req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        HttpResponse res = h.send(req);
        res.getBody();    
        
        system.debug('------- Body: ' + res.getBody());
    }       
    
	/*
		For real use: Only sending the uploaded Attachment Ids to Heroku
		Heroku will use Ids to attrive the content of Attachments
	*/    
	@future (callout=true)		
    public static void passAttachmentIdsToHeroku(Set<Id> setNewAttachmentIds) {
    	
        Http h = new Http();

		//add Userinfo.getOrganizationId() to distinguish attachment from which orgs
		/*
			add OrgId as the first parameter
		*/
		String strIds = Userinfo.getOrganizationId();
		system.debug('--------- Org Id: ' + strIds);
		/*
        for(Attachment att : [
        	Select Id, Name, ParentId, OwnerId, Description 
        	from Attachment where Id IN: setNewAttachmentIds 
        	order by CreatedDate ASC //limit 10
        ]) {
        */
        for(Id aId : setNewAttachmentIds) {		        	
			if(strIds == null) {
				strIds = aId;
			} else {
				strIds = strids + ', ' + aId;
			}
        }
        
        System.debug('--------- strIds:' + strIds);
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/passing/' + strIds);       
        req.setMethod('GET');
    	req.setCompressed(false);
    	//req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        HttpResponse res = h.send(req);
        res.getBody();    
        
        system.debug('------- Body: ' + res.getBody());
    }      
    
    /*
    	After & Delete Trigger
    */
	@future (callout=true)		
    public static void passDeletedAttachmentIdsToHeroku(Set<Id> setAttachmentIds) {
    	
        Http h = new Http();

		//add Userinfo.getOrganizationId() to distinguish attachment from which orgs
		/*
			add OrgId as the first parameter
		*/
		String strIds = Userinfo.getOrganizationId();
		system.debug('--------- Org Id: ' + strIds);
		
        for(Id aId :setAttachmentIds) {
        	
			if(strIds == null) {
				strIds = aId;
			} else {
				strIds = strids + ', ' + aId;
			}
        }      
        System.debug('--------- strIds:' + strIds);
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/passing/deleted/' + strIds);       
        req.setMethod('GET');
    	req.setCompressed(false);
    	//req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        HttpResponse res = h.send(req);
        res.getBody();    
        
        system.debug('------- Body: ' + res.getBody());
    }     
    
    
    
    /*
    	After & UnDelete Trigger
    */
	@future (callout=true)		
    public static void passUnDeletedAttachmentIdsToHeroku(Set<Id> setAttachmentIds) {
    	system.debug('------- Un Deleted: ' + setAttachmentIds);
        Http h = new Http();
		/*
			add OrgId as the first parameter
		*/
		String strIds = Userinfo.getOrganizationId();
		system.debug('--------- Org Id: ' + strIds);
		
        for(Id aId : setAttachmentIds) {      	
			if(strIds == null) {
				strIds = aId;
			} else {
				strIds = strids + ', ' + aId;
			}
        }      
        System.debug('--------- strIds:' + strIds);
        
        HttpRequest req = new HttpRequest();       
        req.setEndpoint('http://bod-attachment-ws.herokuapp.com/services/attachment/passing/undeleted/' + strIds);       
        req.setMethod('GET');
    	req.setCompressed(false);
    	//req.setHeader('Content-Type','application/x-www-form-urlencoded');        

        HttpResponse res = h.send(req);
        res.getBody();    
        
        system.debug('------- Body: ' + res.getBody());
    }       
    
    
        
    
	public static void testOrgId() {				
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET');
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;
		
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			+ '/services/apexrest/bod/services/orgid';
		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		
		String strBody = instHttpResponse.getbody();
		
		System.debug(' ------ ' + strBody);		
		
	}	    

}