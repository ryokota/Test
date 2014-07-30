/*

*/
public with sharing class COA_Handler_Appendix {
	
	
	/*
		============ isBefore & isInsert ============ 
	*/
	public static void processAppendix3BTypesInBeforeInsert(List<RFA__c> listNewRFAs) {
		system.debug('------- processAppendix3BTypesInBeforeInsert(): ' + listNewRFAs);
		for(RFA__c rfa : listNewRFAs) {
			
			List<RFA__c> listRFAsOfAppendix3_B1ToB7 = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8 = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB7_with_B8 = new List<RFA__c>();
			
			List<RFA__c> listRFAsOfAppendix3_B1ToB7_with_TypeD = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8_with_TypeD = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB8_with_TypeD = new List<RFA__c>();
			
			if(containsB1ToB7(rfa) && !containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && !containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7.add(rfa);
			}
			
			if(!containsB1ToB7(rfa) && containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- !containsB1ToB7(rfa) && containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B8.add(rfa);
			}		
			
			if(containsB1ToB7(rfa) && containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7_with_B8.add(rfa);
			}	
			
			if(containsB1ToB7(rfa) && !containsB8(rfa) && containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && !containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7_with_TypeD.add(rfa);
			}	
			
			if(!containsB1ToB7(rfa) && containsB8(rfa) && containsD(rfa)) {
				system.debug('---- !containsB1ToB7(rfa) && containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B8_with_TypeD.add(rfa);
			}					
			
			if(containsB1ToB7(rfa) && containsB8(rfa) && containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB8_with_TypeD.add(rfa);
			}					
			
			//--------
			
			if(listRFAsOfAppendix3_B1ToB7 != null && listRFAsOfAppendix3_B1ToB7.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB7: ' + listRFAsOfAppendix3_B1ToB7);
				COA_Handler_Appendix_Helper.setupFinalApproverOfAppendix3B1ToB7(listRFAsOfAppendix3_B1ToB7);
			}	
			
			if(listRFAsOfAppendix3_B8 != null && listRFAsOfAppendix3_B8.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B8: ' + listRFAsOfAppendix3_B8);
				COA_Handler_Appendix_Helper_B8.setupFinalApproverOfAppendix3B8(listRFAsOfAppendix3_B8);
			}		

			if(listRFAsOfAppendix3_B1ToB7_with_B8 != null && listRFAsOfAppendix3_B1ToB7_with_B8.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB7_with_B8: ' + listRFAsOfAppendix3_B1ToB7_with_B8);
				COA_Handler_Appendix_Helper_B1ToB7WithB8.setupFinalApproverOfAppendix3B1ToB7WithB8(listRFAsOfAppendix3_B1ToB7_with_B8);
			}		
			
			//--- with Type D
			if(listRFAsOfAppendix3_B1ToB7_with_TypeD != null && listRFAsOfAppendix3_B1ToB7_with_TypeD.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB7_with_TypeD: ' + listRFAsOfAppendix3_B1ToB7_with_TypeD);
				COA_Handler_Appendix_Helper.setupFinalApproverOfAppendix3B1ToB7(listRFAsOfAppendix3_B1ToB7_with_TypeD);
			}
			
			if(listRFAsOfAppendix3_B8_with_TypeD != null && listRFAsOfAppendix3_B8_with_TypeD.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B8_with_TypeD: ' + listRFAsOfAppendix3_B8_with_TypeD);
				COA_Handler_Appendix_Helper_B8.setupFinalApproverOfAppendix3B8(listRFAsOfAppendix3_B8_with_TypeD);
			}	
			
			if(listRFAsOfAppendix3_B1ToB8_with_TypeD != null && listRFAsOfAppendix3_B1ToB8_with_TypeD.size() > 0) {
				system.debug('--------- listRFAsOfAppendix3_B1ToB8_with_TypeD: ' + listRFAsOfAppendix3_B1ToB8_with_TypeD);
				COA_Handler_Appendix_Helper_B1ToB7WithB8.setupFinalApproverOfAppendix3B1ToB7WithB8(listRFAsOfAppendix3_B1ToB8_with_TypeD);				
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
	
	private static Boolean containsD(RFA__c rfa) {
		//need to confirm the conditions here	
		if(rfa.PrimaryCOASubCategory__c != null 

		) {
			return true;
		}		
		return false;
	}	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void processAppendix3BTypesInAfterInsert(List<RFA__c> listNewRFAs) {
		system.debug('------- processAppendix3BTypesInAfterInsert(): ' + listNewRFAs);
		for(RFA__c rfa : listNewRFAs) {
			
			List<RFA__c> listRFAsOfAppendix3_B1ToB7 = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8 = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB7_with_B8 = new List<RFA__c>();
			
			List<RFA__c> listRFAsOfAppendix3_B1ToB7_with_TypeD = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B8_with_TypeD = new List<RFA__c>();
			List<RFA__c> listRFAsOfAppendix3_B1ToB8_with_TypeD = new List<RFA__c>();			
			/*
			if(containsB1ToB7(rfa) && !containsB8(rfa)) {
				listRFAsOfAppendix3_B1ToB7.add(rfa);
			}
			
			if(!containsB1ToB7(rfa) && containsB8(rfa)) {
				listRFAsOfAppendix3_B8.add(rfa);
			}		
			
			if(containsB1ToB7(rfa) && containsB8(rfa)) {
				listRFAsOfAppendix3_B1ToB7_with_B8.add(rfa);
			}	*/
			system.debug('-------- containsB1ToB7(rfa): ' + containsB1ToB7(rfa));
			system.debug('-------- containsB8(rfa): ' + containsB8(rfa));
			system.debug('-------- containsD(rfa): ' + containsD(rfa));
			
			if(containsB1ToB7(rfa) && !containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && !containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7.add(rfa);
			}
			
			if(!containsB1ToB7(rfa) && containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- !containsB1ToB7(rfa) && containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B8.add(rfa);
			}		
			
			if(containsB1ToB7(rfa) && containsB8(rfa) && !containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && containsB8(rfa) && !containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7_with_B8.add(rfa);
			}	
			
			if(containsB1ToB7(rfa) && !containsB8(rfa) && containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && !containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB7_with_TypeD.add(rfa);
			}	
			
			if(!containsB1ToB7(rfa) && containsB8(rfa) && containsD(rfa)) {
				system.debug('---- !containsB1ToB7(rfa) && containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B8_with_TypeD.add(rfa);
			}					
			
			if(containsB1ToB7(rfa) && containsB8(rfa) && containsD(rfa)) {
				system.debug('---- containsB1ToB7(rfa) && containsB8(rfa) && containsD: ' + rfa);
				listRFAsOfAppendix3_B1ToB8_with_TypeD.add(rfa);
			}				
			
			
			if(listRFAsOfAppendix3_B1ToB7 != null && listRFAsOfAppendix3_B1ToB7.size() > 0) {
				COA_Handler_Appendix_Helper.setupApproverRoutesOfAppendix3B1ToB7(listRFAsOfAppendix3_B1ToB7);
			}	
			
			if(listRFAsOfAppendix3_B8 != null && listRFAsOfAppendix3_B8.size() > 0) {
				system.debug('------------ listRFAsOfAppendix3_B8 in After Insert : ' + listRFAsOfAppendix3_B8);
				COA_Handler_Appendix_Helper_B8.setupApproverRoutesOfAppendix3B8(listRFAsOfAppendix3_B8);
			}		

			if(listRFAsOfAppendix3_B1ToB7_with_B8 != null && listRFAsOfAppendix3_B1ToB7_with_B8.size() > 0) {
				COA_Handler_Appendix_Helper_B1ToB7WithB8.setupApproverRoutesOfAppendix3B1ToB7WithB8(listRFAsOfAppendix3_B1ToB7_with_B8);
			}	
			
			//--- with Type D
			if(listRFAsOfAppendix3_B1ToB7_with_TypeD != null && listRFAsOfAppendix3_B1ToB7_with_TypeD.size() > 0) {
				system.debug('----- After Insert listRFAsOfAppendix3_B1ToB7_with_TypeD: ' + listRFAsOfAppendix3_B1ToB7_with_TypeD);
				COA_Handler_Appendix_Helper_B1ToB7WithD.setupApproverRoutesOfAppendix3_B1ToB7_With_TypeD(listRFAsOfAppendix3_B1ToB7_with_TypeD);
			}
			
			if(listRFAsOfAppendix3_B8_with_TypeD != null && listRFAsOfAppendix3_B8_with_TypeD.size() > 0) {
				COA_Handler_Appendix_Helper_B8WithD.setupApproverRoutesOfAppendix3_B8_with_TypeD(listRFAsOfAppendix3_B8_with_TypeD);
			}	
			
			if(listRFAsOfAppendix3_B1ToB8_with_TypeD != null && listRFAsOfAppendix3_B1ToB8_with_TypeD.size() > 0) {
				COA_Handler_Appendix_Helper_B1ToB8WithD.setupApproverRoutesOfAppendix3_B1ToB8_With_TypeD(listRFAsOfAppendix3_B1ToB8_with_TypeD); 
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