/*
 * Version History  : 1.0
 * Creation         : 2014/05/30
 * Description : CM_FinalApprovalMailDistination test class
 *  
 */
@isTest
private class CM_FinalApprovalMailDistinationTest {

    /* setFinalApprovalMailDistinationGroup() test */
    static testMethod void testSetFinalApprovalMailDistinationGroup_typeB() {

		CM_TestData.buildRFACommercialData();

        /*
         create final approval mail group
         */ 
        // #todo
		CM_FinalApprovalMailGroup__c famg = CM_TestData.createFinalApprovalMailFixedGroup (
			'test/Fixed Group',
			'B. Approval of Customer Terms and Conditions',	// category
			'1. Approval of Field Sales Operation and VM Customer Agreement', // sub category
			'01. Contract unit price', // sub category2 (label Name)
			null  // sub category3
		);

 		Test.startTest();
        
        // RFA__c 
        // #todo
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'1. Approval of Field Sales Operation and VM Customer Agreement',
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
/*
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
*/        
        // execute test
        CM_FinalApprovalMailDistination testTarget = new CM_FinalApprovalMailDistination();
        
        // create rfa
        testTarget.setFinalApprovalMailDistinationGroup(testRFA);

        // end test
        test.stopTest();
        
        /*
         check data / related mail group id
        */
        system.assertEquals([select CM_RFA__c,CM_FinalApprovalMailGroup__c 
        	from CM_FinalApprovalMailDestination__c where 
        	CM_RFA__c =:testRFA.id].CM_FinalApprovalMailGroup__c, famg.id);
    }

    /* setFinalApprovalMailDistinationGroup() test */
    static testMethod void testSetFinalApprovalMailDistinationGroup_typeD() {

		CM_TestData.buildRFACommercialData();

        // create final approval mail fixed group
		CM_FinalApprovalMailGroup__c famg = CM_TestData.createFinalApprovalMailFixedGroup(
				'test/Fixed Group',
	        	'D. Credit Terms / Policies',
	        	'1. Initial setting of credit limits',
	        	'1. Amount of Credit limit',
	        	'≦ 10,000,000 yen'
		);

		// start test
		test.startTest();
        
        // rfa
        RFA__c testRfa = CM_TestData.createTestRFA_TypeB_D(
        	RFA_Utility_Constants.RFA_STATUS_DRAFT,
        	'D. Credit Terms / Policies',
        	'1. Initial setting of credit limits',
        	'1. Amount of Credit limit',
        	'≦ 10,000,000 yen');
        
		// execute setFinalApprovalMailDistinationGroup()
        CM_FinalApprovalMailDistination testTarget = new CM_FinalApprovalMailDistination();
        testTarget.setFinalApprovalMailDistinationGroup(testRfa);

        // end test
        test.stopTest();
        
        /*
         check data / related mail group id
        */
        system.assertEquals([select CM_RFA__c,CM_FinalApprovalMailGroup__c 
        	from CM_FinalApprovalMailDestination__c where 
        	CM_RFA__c =:testRFA.id].CM_FinalApprovalMailGroup__c, famg.id);
    }    
}