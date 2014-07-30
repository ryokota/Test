@RestResource(urlMapping='/bod/services/bodmembers/*')
global without sharing class BOD_UtilityRESTWS {

    global class BODMemberInfo {
    	global String Id { get; set; }
        global String Name { get; set; }
        global String LastName { get; set; }
        global String FirstName { get; set; }
        global String AboutMe { get; set; } 
        global String FullPhotoUrl { get; set; }
        global String SmallPhotoUrl { get; set; }
        global String ProfileName { get; set; }        
        global Integer Order { get; set; }
        //global String Type { get; set; }
    } 
    
    //BOD_UtilityRestWS.getBODMembersInfoListForiPad();	
	@HttpGet
	global static void getBODMembersInfoListForiPad() {
		RestRequest instRestRequest = RestContext.request;
        RestResponse instRestResponse = RestContext.response;
        
    	RestContext.response.addHeader('Content-Type', 'application/json');
    	
    	String strGroupBODMember = BOD_Constants.PublicGroupName_BODMember;
    	Id idGroupBODMember = BOD_Utility.getPuglicGroupId(strGroupBODMember);
    	Set<Id> setBODMemberIds = 
    		BOD_Utility.getBODGroupMembersOfUsers( idGroupBODMember );
    	system.debug('----- setBODMemberIds: ' + setBODMemberIds);
    	
    	if(setBODMemberIds != null && setBODMemberIds.size() > 0) {
    		List<BODMemberInfo> listBODMemberInfo = new List<BODMemberInfo>();
    		
    		for(User member : [
    			Select Id, Name, Lastname, Firstname, AboutMe, FullphotoUrl, SmallPhotoUrl, Profile.Name, UserRole.Name
    			from User 
    			where Id IN:setBODMemberIds and IsActive = true]
    		) {
    			BODMemberInfo aBODMember = new BODMemberInfo();
    			aBODMember.Id = member.Id;
    			aBODMember.Name = member.Name;	
    			aBODMember.LastName = member.Lastname;	
    			aBODMember.FirstName = member.Firstname;	
    			aBODMember.AboutMe = member.AboutMe;
    			aBODMember.FullPhotoUrl = member.FullPhotoUrl;
    			aBODMember.SmallPhotoUrl = member.SmallPhotoUrl;
    			aBODMember.ProfileName = member.Profile.Name;
    			aBODMember.Order = BOD_Constants.mapBODMemberIdToOrders.get(member.Id);
    			
    			
    			listBODMemberInfo.add( aBODMember );	
    		}
    		system.debug('------- listBODMemberInfo: ' + listBODMemberInfo);
    		
    		RestContext.response.responseBody = 
        		Blob.valueOf(
        			JSON.serialize( (List<BODMemberInfo>)listBODMemberInfo )
        			//JSON.serializePretty( (List<BODMemberInfo>)listBODMemberInfo )
        		);      		   		
    	}//end of if();
 			
	}//end of @HttpGet;	
	
	//BOD_UtilityRestWS.testBODMemberRestWS();
	public static void testBODMemberRestWS() {				
		Http instHttp = new Http();
		HttpRequest instHttpRequest = new HttpRequest();
		instHttpRequest.setMethod('GET');
		instHttpRequest.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId()) ;
		
		String strEndpoint = URL.getSalesforceBaseUrl().toExternalForm() 
			+ '/services/apexrest/bod/services/bodmembers';
		system.debug('------- Endpoint: ' + strEndpoint);
		
		instHttpRequest.setEndpoint(strEndpoint);
		HttpResponse instHttpResponse = instHttp.send(instHttpRequest);
		
		String strBody = instHttpResponse.getbody();
		
		System.debug(' ------ ' + strBody);		
		
		/*
			https://developer.salesforce.com/page/Getting_Started_with_Apex_JSON
		*/
		List<BODMemberInfo> listMembers =   (List<BODMemberInfo>)JSON.deSerialize(strBody, List<BODMemberInfo>.class);
		system.debug('------ List<BODMemberInfo> from GET: ' + listMembers);
		
		integer i = 1;
		for(BODMemberInfo member : listMembers) {
			system.debug('------ i : ' + i);
			system.debug('------ Id: ' + member.Id);
			system.debug('------ Name: ' + member.Name);
			system.debug('------ Last Name: ' + member.LastName);
			system.debug('------ First Name: ' + member.FirstName);
			system.debug('------ AboutMe: ' + member.Aboutme);
			system.debug('------ ProfileName: ' + member.ProfileName);
			system.debug('------ FullPhotoUrl: ' + member.FullPhotoUrl);
			system.debug('------ SmallPhotoUrl: ' + member.SmallPhotoUrl);
			system.debug('------ Order: ' + member.Order);
			i++;
		}
		
	}		

}