public without sharing class BOD_Utility {

	public static boolean ifBODUser(Id UserId) {
		
		User aUser = [Select Id, BOD__c from User where id =: UserId];
		
		if(aUser.BOD__c) {
			return true;
		} else {
			return false;
		}	
	}
	
	/*
        BOD_BODMeetingTriggerHandler.getRecordType('BOD_Member', 'BOD_Members__c');
    */  
    public static Id getRecordType(String strRecordTypeName, String strSObjectType)
    {
        system.debug('------- getRecordType() RT Name: ' + strRecordTypeName + ' Object: ' + strSObjectType);
        return [Select Id, Name, DeveloperName, SObjectType 
        	FROM RecordType Where SObjectType =: strSObjectType AND DeveloperName =: strRecordTypeName].Id;
    } 		

    public static boolean isBlank(String str) 
    {
        return str == null || str.trim() == null || str.trim().length() == 0;
    }    
    
    public static String processNullString(String str) {
    	if(isBlank(str)) {
    		return ' ';
    	} else {
    		return str;
    	}
    }
    
    //Group Name -> DeveloperName
    public static Id getPuglicGroupId(String strGroupName) {
    	return [Select Id from Group where DeveloperName =: strGroupName and Type = 'Regular' ].Id;
    }
    
	//need to check if the member is active and is BOD user!
	public static Set<Id> getBODGroupMembersOfUsers(Id idPublicGroup) {
		Set<Id> setMemberIds = new Set<Id>();
		for(GroupMember member : [Select Id, UserOrGroupId from GroupMember where GroupId =: idPublicGroup]) {
			if(String.valueOf(member.UserOrGroupId).startsWith('005')) {
				setMemberIds.add(member.UserOrGroupId);
			}
		}
		
		//only select BOD members
		Map<ID, User> mapIdToUsers = new Map<ID, User>([
			Select Id from User where Id IN:setMemberIds and IsActive = true and BOD__c = true
			]);
		
		Set<Id> setBODMemberIds = new Set<Id>();
		
		if(mapIdToUsers != null && mapIdToUsers.keySet() != null) {
			setBODMemberIds = mapIdToUsers.keySet();
		}
		
		return setBODMemberIds;
	}    
    
    public static boolean isBODAdminByUId(Id idRunningUser) {
    	
    	Set<Id> setBODAdminGroupMemberIds = 
    		getBODGroupMembersOfUsers( 
    			getPuglicGroupId(BOD_Constants.PublicGroupName_BODAdmin) );
    	
    	system.debug('--------------- idRunningUser: ' + idRunningUser);
    	
    	//川本-san has the same permission with BOD Admins
    	//取締役	       常勤	川本　成彦       Kawamoto Naruhiko 00510000001rhvJ
    	Id idKawamotoUid = '00510000001rhvJ';
    	
    	if(setBODAdminGroupMemberIds.contains(idRunningUser)) {    		
    		return true;   		
    	} else if(idRunningUser == idKawamotoUid) {
    		return true;
    	}
    	
    	return false;
    }
    
    public static boolean isBODMemberByUId(Id idRunningUser) {
    	
    	Set<Id> setBODMemberGroupMemberIds = 
    		getBODGroupMembersOfUsers( 
    			getPuglicGroupId(BOD_Constants.PublicGroupName_BODMember) );
    	
    	system.debug('--------------- idRunningUser: ' + idRunningUser);
    	
    	if(setBODMemberGroupMemberIds.contains(idRunningUser)) {
    		
    		return true;
    		
    	}
    	return false;
    }    
    
	public static boolean isBODAdminByPid(Id idProfileId) {
		if( (String.valueOf( idProfileId ).substring(0, 15)).equals('00e10000000n8Hx') ) {
			return true;
		}
		return false;
	}
	
	public static boolean isSandbox() {
		return URL.getSalesforceBaseUrl().getHost().left(2).equalsignorecase('cs');
	}

	public static boolean isProduction() {
		return URL.getSalesforceBaseUrl().getHost().left(2).equalsignorecase('ap');
	}
	
}