public without sharing class COA_Handler_For_RFATrigger {	


	/*
		============ isBefore & isInsert ============ 
	*/
	
	//divide Commercial Requests to A, B, C, D types
	public static void processCommercialCOAsInBeforeInsertTrigger(List<RFA__c> listNewRFAs) {
		
		List<RFA__c> listCommercialRFAs_TypeA = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeB = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeC = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeD = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifCommercialTypeAReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeA.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialTypeBReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeB.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCommercialTypeCReqtByRTId(rfa.RecordTypeId)) {
												
				listCommercialRFAs_TypeC.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCommercialTypeDReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeD.add(rfa);
			}		
			
		}//end of for(RFAs);
				
		if(listCommercialRFAs_TypeA != null && listCommercialRFAs_TypeA.size() > 0) {

		}
		
		if(listCommercialRFAs_TypeB != null && listCommercialRFAs_TypeB.size() > 0) {
			//Final Approver of each cateogry and overall
			system.debug('-------- Before insert: listCommercialRFAs_TypeB: ' + listCommercialRFAs_TypeB);
			COA_Handler_Appendix.processAppendix3BTypesInBeforeInsert(listCommercialRFAs_TypeB);
		}
		
		if(listCommercialRFAs_TypeC != null && listCommercialRFAs_TypeC.size() > 0) {
			
		}
		
		if(listCommercialRFAs_TypeD != null && listCommercialRFAs_TypeD.size() > 0) {
			system.debug('-------- Before insert: listCommercialRFAs_TypeD: ' + listCommercialRFAs_TypeD);
		}							
	}
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	//divide Commercial Requests to A, B, C, D types
	public static void processCommercialCOAsInAfterInsertTrigger(List<RFA__c> listNewRFAs) {
		system.debug('------- processCommercialCOAsInAfterInsertTrigger(List<RFA__c> listNewRFAs): ' + listNewRFAs);
		
		List<RFA__c> listCommercialRFAs_TypeA = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeB = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeC = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs_TypeD = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifCommercialTypeAReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeA.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialTypeBReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeB.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCommercialTypeCReqtByRTId(rfa.RecordTypeId)) {
												
				listCommercialRFAs_TypeC.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCommercialTypeDReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs_TypeD.add(rfa);
			}		
			
		}//end of for(RFAs);
				
		if(listCommercialRFAs_TypeA != null && listCommercialRFAs_TypeA.size() > 0) {
			COA_Handler_Matrix.addRFAApproversFromCOA(listCommercialRFAs_TypeA, false);
		}
		
		if(listCommercialRFAs_TypeB != null && listCommercialRFAs_TypeB.size() > 0) {
			//Apporver Route
			COA_Handler_Appendix.processAppendix3BTypesInAfterInsert(listCommercialRFAs_TypeB);
		}
		
		if(listCommercialRFAs_TypeC != null && listCommercialRFAs_TypeC.size() > 0) {
			system.debug('---------- listCommercialRFAs_TypeC: ' + listCommercialRFAs_TypeC);
			COA_Handler_Appendix.processAppendix3TypeCInAfterInsert(listCommercialRFAs_TypeC);
		}
		
		if(listCommercialRFAs_TypeD != null && listCommercialRFAs_TypeD.size() > 0) {
			system.debug('-------- After insert: listCommercialRFAs_TypeD: ' + listCommercialRFAs_TypeD);
			COA_Handler_Matrix.addRFAApproversFromCOA(listCommercialRFAs_TypeD, false);
		}							
	}


	
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