/*

*/
public with sharing class COA_Handler_Appendix {
	
	
	/*
		============ isBefore & isInsert ============ 
	*/
	public static void processAppendix3BTypesInBeforeInsert(List<RFA__c> listNewRFAs) {
		
		for(RFA__c rfa : listNewRFAs) {
			system.debug('------- processAppendix3BTypesInBeforeInsert(): ' + rfa);
			List<RFA__c> listRFAsOfAppendix3_B1ToB7Only = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8Only = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB8Mix = new List<RFA__c>();
			
			if(containsB1ToB7(rfa) && !containsB8(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && !containsB8(rfa): ' + rfa);
				listRFAsOfAppendix3_B1ToB7Only.add(rfa);
			}
			
			if(!containsB1ToB7(rfa) && containsB8(rfa)) {
				system.debug('---- !containsB1ToB7(rfa) && containsB8(rfa): ' + rfa);
				listRFAsOfAppendix3_B8Only.add(rfa);
			}		
			
			if(containsB1ToB7(rfa) && containsB8(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && containsB8(rfa): ' + rfa);
				listRFAsOfAppendix3_B1ToB8Mix.add(rfa);
			}	
			
			if(listRFAsOfAppendix3_B1ToB7Only != null && listRFAsOfAppendix3_B1ToB7Only.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB7Only: ' + listRFAsOfAppendix3_B1ToB7Only);
				COA_Handler_Appendix_Helper.setupFinalApproverOfAppendix3B1ToB7(listRFAsOfAppendix3_B1ToB7Only);
			}	
			
			if(listRFAsOfAppendix3_B8Only != null && listRFAsOfAppendix3_B8Only.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B8Only: ' + listRFAsOfAppendix3_B8Only);
				COA_Handler_Appendix_Helper_B8.setupFinalApproverOfAppendix3B8(listRFAsOfAppendix3_B8Only);
			}		

			if(listRFAsOfAppendix3_B1ToB8Mix != null && listRFAsOfAppendix3_B1ToB8Mix.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB8Mix: ' + listRFAsOfAppendix3_B1ToB8Mix);
				COA_Handler_Appendix_Helper_B1ToB7WithB8.setupFinalApproverOfAppendix3B1ToB7WithB8(listRFAsOfAppendix3_B1ToB8Mix);
			}			
							
		}//end of for(RFAs);
	}
	

	private static Boolean containsB1ToB7(RFA__c rfa) {
		
		if(rfa.CM_Contract_unit_price__c != null                //01. Contract unit price
			|| rfa.CM_SpecialPricePromotionDiscount__c != null  //02. Special price / Promotion discount
			|| rfa.CM_FS_selling_price__c != null               //03. FS selling price
			|| rfa.CM_FS_Commission_Variable__c != null         //04. FS commission (Variable)
			|| rfa.CM_FS_Commission_Fixed__c != null            //05. FS commission (Fixed)
			|| rfa.CM_KeyMoney_Rebate_Sport_Other__c != null    //06. Key money / Rebate / Spot / Other
			|| rfa.CM_Only_in_the_case_of_Rebate__c != null     //07. Only in the case of Rebate
			|| rfa.CM_Other_support__c != null                  //08. Other support
			|| rfa.CM_Promotion_OtherExpense__c != null         //09. Promotion / Other expense
			|| rfa.CM_Promotion_CooperationSampling__c != null  //10. Promotion (Cooperation / Sampling)
		) {
			system.debug('---------- rfa.CM_Contract_unit_price__c:' + rfa.CM_Contract_unit_price__c);
			system.debug('---------- rfa.CM_SpecialPricePromotionDiscount__c:' + rfa.CM_SpecialPricePromotionDiscount__c);
			system.debug('---------- rfa.CM_FS_selling_price__c:' + rfa.CM_FS_selling_price__c);
			system.debug('---------- rfa.CM_FS_Commission_Variable__c:' + rfa.CM_FS_Commission_Variable__c);
			system.debug('---------- rfa.CM_FS_Commission_Fixed__c:' + rfa.CM_FS_Commission_Fixed__c);
			system.debug('---------- rfa.CM_KeyMoney_Rebate_Sport_Other__c:' + rfa.CM_KeyMoney_Rebate_Sport_Other__c);
			system.debug('---------- rfa.CM_Only_in_the_case_of_Rebate__c:' + rfa.CM_Only_in_the_case_of_Rebate__c);
			system.debug('---------- rfa.CM_Other_support__c:' + rfa.CM_Other_support__c);			
			system.debug('---------- rfa.CM_Promotion_OtherExpense__c:' + rfa.CM_Promotion_OtherExpense__c);
			system.debug('---------- rfa.CM_Promotion_CooperationSampling__c:' + rfa.CM_Promotion_CooperationSampling__c);
						
			return true;
		}		
		return false;
	}

	private static Boolean containsB8(RFA__c rfa) {
		
		if(rfa.CM_Non_standard_Equipment__c != null 
			|| rfa.CM_Vending_Equipment_parts__c != null
			|| rfa.CM_Incidental_work__c != null
			|| rfa.CM_Vending_Equipment_Lease__c != null
			|| rfa.CM_Equipment_retirement__c != null
		) {
			return true;
		}		
		return false;
	}
	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void processAppendix3BTypesInAfterInsert(List<RFA__c> listNewRFAs) {
		
		for(RFA__c rfa : listNewRFAs) {
			
			List<RFA__c> listRFAsOfAppendix3_B1ToB7Only = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8Only = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB8Mix = new List<RFA__c>();
			
			if(containsB1ToB7(rfa) && !containsB8(rfa)) {
				listRFAsOfAppendix3_B1ToB7Only.add(rfa);
			}
			
			if(!containsB1ToB7(rfa) && containsB8(rfa)) {
				listRFAsOfAppendix3_B8Only.add(rfa);
			}		
			
			if(containsB1ToB7(rfa) && containsB8(rfa)) {
				listRFAsOfAppendix3_B1ToB8Mix.add(rfa);
			}	
			
			if(listRFAsOfAppendix3_B1ToB7Only != null && listRFAsOfAppendix3_B1ToB7Only.size() > 0) {
				COA_Handler_Appendix_Helper.setupApproverRoutesOfAppendix3B1ToB7(listRFAsOfAppendix3_B1ToB7Only);
			}	
			
			if(listRFAsOfAppendix3_B8Only != null && listRFAsOfAppendix3_B8Only.size() > 0) {
				system.debug('------------ listRFAsOfAppendix3_B8Only in After Insert : ' + listRFAsOfAppendix3_B8Only);
				COA_Handler_Appendix_Helper_B8.setupApproverRoutesOfAppendix3B8(listRFAsOfAppendix3_B8Only);
			}		

			if(listRFAsOfAppendix3_B1ToB8Mix != null && listRFAsOfAppendix3_B1ToB8Mix.size() > 0) {
				COA_Handler_Appendix_Helper_B1ToB7WithB8.setupApproverRoutesOfAppendix3B1ToB7WithB8(listRFAsOfAppendix3_B1ToB8Mix);
			}				
				
		}//end of for(RFAs);
	}



	public static void processAppendix3TypeCInAfterInsert(List<RFA__c> listNewRFAs) {
		
		COA_Handler_Appendix_Helper_C.processAppendix3TypeCInAfterInsert(listNewRFAs);
			
	}//end of processAppendix3TypeCInAfterInsert();	

	
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