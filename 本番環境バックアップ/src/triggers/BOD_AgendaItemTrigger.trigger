/*
only one level lookup
insert, clear Document Title  / Version Count by clone
how about delete?
*/
trigger BOD_AgendaItemTrigger on Agenda_Item__c (
	before insert, after insert, 
	before update, after update, 
	before delete, after delete,
	after undelete
) {
	
	BOD_AgendaItemTriggerHandler instTriggerHandler = new BOD_AgendaItemTriggerHandler();
	
	if(trigger.isBefore && trigger.isInsert) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}		
		
		//clear these two fields when clone from an existing Agenda Item
		for(Agenda_Item__c agenda : trigger.new) {
			if(agenda.Document_Title__c != null) {
				agenda.Document_Title__c = ' ';
			}
			
			if(agenda.Version_Count__c != 0) {
				agenda.Version_Count__c = 0;
			}
		}		
		
	}
	

	if(trigger.isAfter && trigger.isInsert) {

		instTriggerHandler.insertAgendaItemMembersWithNewAgendaItem(trigger.new);
		
	}
	

	if(trigger.isBefore && trigger.isUpdate) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.new[0].addError(Label.BOD_Trigger_Info_BODUser);
		}			
		
		instTriggerHandler.processParentAgdendaLanguageChange(Trigger.new, Trigger.oldMap);
		
		//lock the Japanese Version Agenda Item updating on Approval
		instTriggerHandler.lockJapaneseAgendaItemOnApproval(trigger.newMap, trigger.oldMap);	
		
		
		
	}	
	
	if(trigger.isAfter && trigger.isUpdate) {
		
		//Japanese version Agenda Item cannot start Approval Process
		//should be in After Update Trigger
		instTriggerHandler.checkApprovalProcessOnJapaneseAgendaItem(Trigger.new, Trigger.oldMap);	
		
		//process Confidential__c field update
		instTriggerHandler.processConfidentialFieldChangedOfAgendaItemMembers(Trigger.new, Trigger.oldMap);			
		
		//set up Japanese agenda status as same as English agenda status
		insttriggerHandler.processApprovalProcessStatusOnJapaneseAgendaItem(Trigger.new, Trigger.oldMap);
	}		
	
	
	
	
	if(trigger.isBefore && trigger.isDelete) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		if(!runningUser.BOD__c) {
			Trigger.old[0].addError(Label.BOD_Trigger_Info_BODUser);
		}		
		
		//can not delete Agenda in Approval for English/Japanese
		insttriggerHandler.checkApprovalStatusOnDeletedAgenda(trigger.old, trigger.oldMap);
	}	
	
	
	
	
	if(trigger.isAfter && trigger.isDelete) {
		
	}		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
	}	
	

}