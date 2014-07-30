/*
	Public Group
*/
public with sharing class Utility_Helper_Group {


    //Group Name -> DeveloperName
    //Utility_Helper_Group.getPuglicGroupId('BOD_Admin') 
    public static Id getPuglicGroupId(String strGroupDevName) {
    	return [Select Id from Group where DeveloperName =: strGroupDevName and Type = 'Regular' limit 1].Id;
    }

	//Utility_Helper_Group.getGroupMemberUserIds('00G10000001fkHQEAY');
	//only get User member not Group member in a Public Group!
	public static Set<Id> getGroupMemberUserIds(Id idPublicGroup) {
		Set<Id> setMemberIds = new Set<Id>();
		for(GroupMember member : [Select Id, UserOrGroupId from GroupMember where GroupId =: idPublicGroup]) {
			if(String.valueOf(member.UserOrGroupId).startsWith('005')) {
				setMemberIds.add(member.UserOrGroupId);
			}
		}
				
		return setMemberIds;
	}   
	
	/*
		If running user in a Member of a Public Group
	*/
    public static boolean isGroupMemberByUId(String strGroupDevName, Id idRunningUser) {
    	
    	Set<Id> setGroupMemberIds = 
    		getGroupMemberUserIds( 
    			getPuglicGroupId(strGroupDevName) 
    		);
    	
    	system.debug('--------------- idRunningUser: ' + idRunningUser);
    	
    	if(setGroupMemberIds.contains(idRunningUser)) {    		
    		return true;   		
    	}
    	return false;
    } 

}