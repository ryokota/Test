@isTest
private class CM_RequestDetailValidation_Test {

	/*
	 validation all success
	 */
    static testMethod void testRequestDetailValidation() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					'Category A', //2
					'Category B', //3
					'Category B', //4
					'Pay in fixed amount', //5 
					'Total amount per transaction ＞ 50,000,000 yen',  //6
					'Total amount per transaction ＞ 50,000,000 yen',  //7
					'Total amount per transaction ＞　25,000,000 yen', //8
					'Total amount per transaction ＞　10,000,000 yen', //9
					'Per deal ≦ 50 cases and ≦ 100,000 yen',	//10
					// a.〜e.
					'1. Application for Non-standard Equipment',	//a 
					'Total amount per transaction ＞ 100,000 yen', 	//b
					'Total amount per transaction ＞ 500,000 yen', 	//c
					'1. Application for Vending Equipment Leases', 	//d
					'Necessity of sales/transfer'					//e 
		);
		// create request details record
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price,				// 1 
				RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount,   // 2
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price,		// 3
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable, //4
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed,	// 5
				RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other,	//6
				RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate,	// 7
				RFA_Utility_Constants.RECORDTYPE_Detail_Other_support,			// 8
				RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense,	// 9
				RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling, //10
				RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment,	//a
				RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts,	//b
				RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork,		//c
				RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease,	//d
				RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement	//e
			});
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		//System.debug('## Test > resultMessageSet:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 0);
        Test.stopTest();
    }
    
    /*
     Extra check error
     No selected & Detail records all registered
     */
    static testMethod void testRequestDetailValidationExtraError() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', 	// 1
					null, 	// 2
					null,
					null, 
					null, 
					null,
					null, 
					null, 
					null, 
					null,
					// a.〜e.
					null, 
					null, 
					null, 
					null, 
					null
		);
		// create request detail record
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price,				// 1 
				RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount,   // 2
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price,		// 3
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable, //4
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed,	// 5
				RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other,	//6
				RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate,	// 7
				RFA_Utility_Constants.RECORDTYPE_Detail_Other_support,			// 8
				RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense,	// 9
				RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling, //10
				RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment,	//a
				RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts,	//b
				RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork,		//c
				RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease,	//d
				RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement	//e
			});
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageList:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 13);  // extra record error
        Test.stopTest();
    }

    /*
     No record check error
     select all & no detail record
     */
    static testMethod void testRequestDetailValidationNoRecordError() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					'Category A', //2
					'Category B', //3
					'Category B', //4
					'Pay in fixed amount', //5 
					'Total amount per transaction ＞ 50,000,000 yen',  //6
					'Total amount per transaction ＞ 50,000,000 yen',  //7
					'Total amount per transaction ＞　25,000,000 yen', //8
					'Total amount per transaction ＞　10,000,000 yen', //9
					'Per deal ≦ 50 cases and ≦ 100,000 yen',	//10
					// a.〜e.
					'1. Application for Non-standard Equipment',	//a 
					'Total amount per transaction ＞ 100,000 yen', 	//b
					'Total amount per transaction ＞ 500,000 yen', 	//c
					'1. Application for Vending Equipment Leases', 	//d
					'Necessity of sales/transfer'					//e 
		);
/* No Request detail record
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price, 
				RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount
			});
*/
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageSet:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 14);
		
        Test.stopTest();
    }

    /*
       Approval 3 & 4 select 
        & request detail record type 3
    */
    static testMethod void testRequestDetailValidationCheckType3And4() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					null, 
					null, 
					'Category B', //3
					'Category B', //4
					null, 
					null,
					null, 
					null, 
					null, 
					null,
					// a.〜e.
					null, 
					null, 
					null, 
					null, 
					null
		);
		// Approval 3 or 4
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price // 3
			});
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageList:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 0);
        Test.stopTest();
    }

    /*
       Approval 3 & 4 select 
        & request detail record type 4
    */
    static testMethod void testRequestDetailValidationCheckType3And4_2() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					null, 
					null, 
					'Category B', //3
					'Category B', //4
					null, 
					null,
					null, 
					null, 
					null, 
					null,
					// a.〜e.
					null, 
					null, 
					null, 
					null, 
					null
		);
		// Approval 3 or 4
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable //4
			});
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageList:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 0);
        Test.stopTest();
    }

    /*
       Approval 3 & 4 select 
        & no request detail record
    */
    static testMethod void testRequestDetailValidationCheckType3And4_norecord() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					null, 
					null, 
					'Category B', //3
					'Category B', //4
					null, 
					null,
					null, 
					null, 
					null, 
					null,
					// a.〜e.
					null, 
					null, 
					null, 
					null, 
					null
		);
		// Approval 3 or 4 no record
		/*CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price // 3
			});
		*/
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageList:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 1);
        Test.stopTest();
    }
    /*
       Approval 3 & 4 Not selected 
        & no request 3 & 4 detail record
    */
    static testMethod void testRequestDetailValidationCheckType3And4_extraRecord() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					null, 
					null, //3
					null, //4
					null, 
					null,
					null, 
					null, 
					null, 
					null,
					// a.〜e.
					null, 
					null, 
					null, 
					null, 
					null
		);
		// Approval 3 or 4 no record
		CM_TestData.createRequestDetails(
			testRFA.id,
			new List<String>{
				RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price, // 1
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price, // 3
				RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable //4
			});
		List<String> resultMessageList = new CM_RequestDetailValidation().commercialCirculationCheck(testRFA);
		System.debug('## Test > resultMessageList:' + resultMessageList);
		System.assertEquals(resultMessageList.size(), 1);
        Test.stopTest();
    }        
}