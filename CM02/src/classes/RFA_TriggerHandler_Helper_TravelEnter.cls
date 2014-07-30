public without sharing class RFA_TriggerHandler_Helper_TravelEnter {

	/*
		============ isBefore & isInsert ============ 
	*/

	public static void processTravelAndEntertainmentRFAs(List<RFA__c> listNewRFAs) {       		
		
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Travel_Expenses_REQUEST)
			) {
				//system.debug('------- rfa.Estimated_Cost_Transportation__c: ' + rfa.Estimated_Cost_Transportation__c);				
				rfa.RequestAmountFunctionalCurrency__c = 
					Utility_Helper_String.removeNullInput(rfa.Estimated_Cost_Transportation__c) 
					+ Utility_Helper_String.removeNullInput(rfa.Estimated_Cost_Accommodation__c);
			}
			
			if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Entertainment_REQUEST)
			) {
				
				rfa.RequestAmountFunctionalCurrency__c = 
					Utility_Helper_String.removeNullInput(rfa.Estimated_Payment_1__c) 
					+ Utility_Helper_String.removeNullInput(rfa.Estimated_Payment_2__c) 
					+ Utility_Helper_String.removeNullInput(rfa.Estimated_Payment_3__c);
					
					/*					
                    rfa.FC_ConsumptionTax__c = [
                    	Select Id, Name from Financial_Constant__c 
                    	where isActive__c = true 
                    		And RecordTypeId =: RFAConstants.getRecordType(
                    			RFAConstants.FinancialConstant_RT_ConsumptionTax, 'Financial_Constant__c')
                    	Order By CreatedDate Desc limit 1].Id;		
                    */
                    rfa.FC_ConsumptionTax__c = RFA_TriggerHandler_Helper.sobjConsumptionTax.Id;	   
                                     							
			}						
		}
	}	
	
	/*
		============ isAfter & isInsert ============ 
	*/


	
	/*
		============ isBefore & isUpdate ============ 
	*/

	
	
	/*
		============ isAfter & isUpdate ============ 
	*/

	
	
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