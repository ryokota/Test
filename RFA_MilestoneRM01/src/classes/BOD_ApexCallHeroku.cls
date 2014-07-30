public without sharing class BOD_ApexCallHeroku {

    public static void uploadAttachmentToHeroku() {
        Http h = new Http();

        Attachment instAttachment = [Select Id, Name, ParentId, Body from Attachment where Id = '00PN0000000hMnz'];
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
    	for(Attachment instAttachment : [Select Id, Name, ParentId, Body 
    		from Attachment where Id =: setNewAttIds 
    		order by CreatedDate ASC limit 10]) {
    		
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
    
    

}