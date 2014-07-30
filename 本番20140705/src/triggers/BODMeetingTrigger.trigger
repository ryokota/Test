trigger BODMeetingTrigger on BOD_Meeting__c (
	before insert, after insert, 
	before update, after update, 
	before delete, after delete,
	after undelete
) {
	
	BOD_BODMeetingTriggerHandler instTriggerHandler = new BOD_BODMeetingTriggerHandler();
	

	
	if(trigger.isBefore && trigger.isInsert) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}		
		
	}
	

	if(trigger.isAfter && trigger.isInsert) {
		instTriggerHandler.insertBODMembersWithNewMeeting(trigger.new);
		
	}
	

	if(trigger.isBefore && trigger.isUpdate) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}			
		
	}	
	
	if(trigger.isAfter && trigger.isUpdate) {
		
	}		
	
	
	
	
	if(trigger.isBefore && trigger.isDelete) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.old[0].addError(Label.BOD_Trigger_Info_BODUser);
		}		
		
	}	
	
	
	
	
	if(trigger.isAfter && trigger.isDelete) {
		
	}		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
	}		
	
	

}