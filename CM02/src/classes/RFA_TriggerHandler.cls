/*
	Created by Jia Hu on 2014/05/22
	1. process by different Trigger actions
	2. process common actions for all Record Types, such as delete,...
	3. divided into different Record Type lists, send into different Record Type Helper class
*/
public without sharing class RFA_TriggerHandler {
	
	
	/*
		============ isBefore & isInsert ============ 
	*/

	public void processRFAsInBeforeInsertTrigger(List<RFA__c> listNewRFAs) {
		system.debug('---- RFA_TriggerHandler  Before & Insert');
		RFA_TriggerHandler_Helper.setLookups(listNewRFAs);
		
		RFA_TriggerHandler_Helper_TravelEnter.processTravelAndEntertainmentRFAs(listNewRFAs);
		
		//process COAs for each RFA record type
		//COA_Handler_For_RFATrigger.processCOAsInBeforeInsertTrigger(listNewRFAs);

		RFA_TriggerHandler_Helper.processRFAsOnBeforeInsertByRecordTypes(listNewRFAs);		
		
	}
	
	
	/*
		============ isAfter & isInsert ============ 
	*/

	public void processRFAsInAfterInsertTrigger(List<RFA__c> listNewRFAs) {
		system.debug('---- RFA_TriggerHandler  After & Insert');
		//process COAs for each RFA record type
		//COA_Handler_For_RFATrigger.processCOAsInAfterInsertTrigger(listNewRFAs);
		
		
		RFA_TriggerHandler_Helper.processRFAsOnAfterInsertByRecordTypes(listNewRFAs);
		
			
	}

	
	/*
		============ isBefore & isUpdate ============ 
	*/
	public void processRFAsInBeforeUpdateTrigger(List<RFA__c> listNewRFAs, Map<Id, RFA__c> mapOldRFAs) {
		
		RFA_TriggerHandler_Helper.checkChangeRecordType(listNewRFAs, mapOldRFAs);
		
		RFA_TriggerHandler_Helper.setCompletionDate(listNewRFAs, mapOldRFAs);
		
		RFA_TriggerHandler_Helper.processRFAsOnBeforeUpdateByRecordTypes(listNewRFAs, mapOldRFAs);
		
		//email function, in processing!!!
		RFA_TriggerHandler_Helper inst = new RFA_TriggerHandler_Helper();
		inst.sendEmails(listNewRFAs, mapOldRFAs);
				
	}
	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public void processRFAsInAfterUpdateTrigger(List<RFA__c> listNewRFAs, Map<Id, RFA__c> mapOldRFAs) {
		
		RFA_TriggerHandler_Helper.processRFAsOnAfterUpdateByRecordTypes(listNewRFAs, mapOldRFAs);
		
	}
	
	
	/*
		============ isBefore & isDelete ============ 
	*/
	public void processRFAsInBeforeDeleteTrigger(List<RFA__c> listOldRFAs) {
		RFA_TriggerHandler_Helper.checkDeleteRFAs(listOldRFAs);
	}

	
	
	/*
		============ isAfter & isDelete ============ 
	*/



	/*
		============ isAfter & isUnDelete ============ 
	*/	

}