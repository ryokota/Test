@isTest(SeeAllData=false) 
private class CM_AP04_UTIL_PdfCompletionMemo_Test {
    static testMethod void myUnitTest() {
      	
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
      
        CM_AP04_UTIL_PdfCompletionMemo.savePDF(testRFA.Id);
        Test.stopTest();
    }
	
}