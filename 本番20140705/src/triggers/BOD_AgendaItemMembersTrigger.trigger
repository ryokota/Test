trigger BOD_AgendaItemMembersTrigger on Agenda_Item_Members__c (
	before insert, after insert, 
	before update, after update, 
	before delete, after delete,
	after undelete
) {
	
	BOD_AgendaItemMembersTriggerHandler instTriggerHandler = new BOD_AgendaItemMembersTriggerHandler();
	
	if(trigger.isBefore && trigger.isInsert) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}		

		//add Duplicate Check logic
		for(Agenda_Item_Members__c member : trigger.new) {
			member.duplicate_check__c = String.valueOf(member.Agenda_Item__c) + String.valueOf(member.User__c);
		}		
		
	}
	

	if(trigger.isAfter && trigger.isInsert) {
		
		instTriggerHandler.addPermissionForNewAgendaItemMembers(trigger.new);
		
	}
	

	if(trigger.isBefore && trigger.isUpdate) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}	
		
		//add Duplicate Check logic
		for(Agenda_Item_Members__c member : trigger.new) {
			member.duplicate_check__c = String.valueOf(member.Agenda_Item__c) + String.valueOf(member.User__c);
		}
		
		//Can't change Record Type for members
		for(Agenda_Item_Members__c member : trigger.new) {
			if(member.RecordTypeId != trigger.oldMap.get(member.Id).RecordTypeId) {
				member.addError(Label.BOD_Trigger_Info_RecordType);
			}
		}	
		
		//Can't change User of members
		for(Agenda_Item_Members__c member : trigger.new) {
			if(member.User__c != trigger.oldMap.get(member.Id).User__c) {
				member.addError(Label.BOD_Trigger_Info_UserChange);
			}
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
		
		instTriggerHandler.removePermissionForDeletedAgendaItemMembers(trigger.old);
		
		
		
	}		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
	}	
	
}