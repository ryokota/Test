@isTest(SeeAllData=false) 
private class CM_VFC01_RequestDetailListCtl_Test {
	static testMethod void testCM_VRC01_RequestDetailListPage() {	
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
			
        PageReference pageRef = Page.CM_VFP01_RequestDetailList;
        Test.setCurrentPage(pageRef); 
        ApexPages.Standardcontroller stdController = new ApexPages.Standardcontroller(testRFA);
        CM_VFC01_RequestDetailListController controller = new CM_VFC01_RequestDetailListController(stdController);
        controller.Initialization();
	    System.assertEquals(controller.RECORDTYPE_Detail_Constract_unit_price,RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price);
	    System.assertEquals(controller.RECORDTYPE_Detail_Special_price_promotion_discount,RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount);
	    System.assertEquals(controller.RECORDTYPE_Detail_FS_selling_price,RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price);
	    System.assertEquals(controller.RECORDTYPE_Detail_FS_commission_Variable, RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable);
	    System.assertEquals(controller.RECORDTYPE_Detail_FS_commission_Fixed, RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed);
	    System.assertEquals(controller.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other, RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other);
	    System.assertEquals(controller.RECORDTYPE_Detail_Only_in_the_case_of_Rebate, RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate);
	    System.assertEquals(controller.RECORDTYPE_Detail_Other_support, RFA_Utility_Constants.RECORDTYPE_Detail_Other_support);
	    System.assertEquals(controller.RECORDTYPE_Detail_Promotion_OtherExpense, RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense);
	    System.assertEquals(controller.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling, RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling);
	    System.assertEquals(controller.RECORDTYPE_Detail_NonStandard_Equipment, RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment);
	    System.assertEquals(controller.RECORDTYPE_Detail_VendingEquipmentParts, RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts);
	    System.assertEquals(controller.RECORDTYPE_Detail_IncidentalWork, RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork);
	    System.assertEquals(controller.RECORDTYPE_Detail_VendingEquipmentLease, RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease);
	    System.assertEquals(controller.RECORDTYPE_Detail_Equipment_retirement, RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement);
        
        System.assertEquals(controller.getRequestDetailList().size() , 15);
        System.assertEquals(controller.getAttachments().size(), 0);
        Test.stopTest();
	}	
}