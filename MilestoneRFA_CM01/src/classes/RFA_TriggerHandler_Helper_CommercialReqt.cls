public with sharing class RFA_TriggerHandler_Helper_CommercialReqt {

	/*
		============ isAfter & isInsert ============
		add by yoshinari 2014/05/23
		Final Approved mail destination group create relation 
	*/
	public static void processCommercialRFAsInAfterInsert(
		List<RFA__c> listNewRFAs)
	{

		CM_FinalApprovalMailDistination inst = new CM_FinalApprovalMailDistination();

	
		for(RFA__c rfa : listNewRFAs) {
			inst.setFinalApprovalMailDistinationGroup(rfa);
		}
	}



	/*
		============ isBefore & isUpdate ============ 
	*/

	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public static void processCommercialRFAsInAfterUpdate(		
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		
		CM_RequestDetailValidation inst = new CM_RequestDetailValidation();
		
		for(RFA__c rfa : listNewRFAs) {
			
			if(
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT
				&& rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST)
				)	
				||
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
				&& rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST)
				)										
			) {
				List<String> errorList = inst.commercialCirculationCheck(rfa);
        		// add yoshinari 2014/05/23 processing error message 
        		integer index = 1;
        		for(String str : errorList) {
        			//Trigger.new[0].addError( index + '. ' + str );
        			//Trigger.new[0].addError( str );
        			rfa.addError( str );
       				//index++;
        		}
				
			}
			
		}
	}
	
	/*
		============ isBefore & isDelete ============ 
	*/


	
	
	/*
		============ isAfter & isDelete ============ 
	*/



	/*
		============ isAfter & isUnDelete ============ 
	*/	


}