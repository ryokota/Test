/*
add member and add permission
first add to public group and then meeting

delete member then delete permission

user can belong to multipule groups, no way to stop this

*/
trigger BODMembersTrigger on BOD_Members__c (
	before insert, after insert, 
	before update, after update, 
	before delete, after delete,
	after undelete
) {
	
	BOD_BODMembersTriggerHandler instTriggerHandler = new BOD_BODMembersTriggerHandler();
	
	if(trigger.isBefore && trigger.isInsert) {
		
		if(!BOD_Utility.ifBODUser(Userinfo.getUserId())) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}			
		
		//add Duplicate Check logic
		for(BOD_Members__c member : trigger.new) {
			member.duplicate_check__c = String.valueOf(member.BOD_Meeting__c) + String.valueOf(member.Username__c);
		}
		
	}
	
	if(trigger.isAfter && trigger.isInsert) {
		
		instTriggerHandler.addPermissionForNewMembers(Trigger.new);
		
	}
	
	if(trigger.isBefore && trigger.isUpdate) {

		//add Duplicate Check logic
		for(BOD_Members__c member : trigger.new) {
			member.duplicate_check__c = String.valueOf(member.BOD_Meeting__c) + String.valueOf(member.Username__c);
		}
		
		//Can't change Record Type for members
		for(BOD_Members__c member : trigger.new) {
			if(member.RecordTypeId != trigger.oldMap.get(member.Id).RecordTypeId) {
				member.addError(Label.BOD_Trigger_Info_RecordType);
			}
		}	
		
		//Can't change User of members
		for(BOD_Members__c member : trigger.new) {
			if(member.Username__c != trigger.oldMap.get(member.Id).Username__c) {
				member.addError(Label.BOD_Trigger_Info_UserChange);
			}
		}				
		
	}
	
	if(trigger.isAfter && trigger.isUpdate) {
		
	}	
	
	if(trigger.isBefore && trigger.isDelete) {

		if(!BOD_Utility.ifBODUser(Userinfo.getUserId())) {
			Trigger.old[0].addError(Label.BOD_Trigger_Info_BODUser);
		}	
					
		
	}	
	
		
	
	if(trigger.isAfter && trigger.isDelete) {
		instTriggerHandler.removePermissionForDeletedMembers(Trigger.old);
	}		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
	}			

}