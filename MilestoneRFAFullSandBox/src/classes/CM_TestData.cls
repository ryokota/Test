/*
    Commercial Test Data
    create by yoshinari 2014/05/29
    last update by yoshinari 2014/06/23
 */

@isTest(SeeAllData=false) 
public class CM_TestData {

    public static User requester = new User();    
    //for All
    public static ProfitCenter__c testProfitCenter = new ProfitCenter__c();
       
    // used to generate random unique strings for creating user records
    private static Integer ctr = 0; 


	/*
		Commercial Test Data RFA/Request Detail/Final Approval Mail Group/ ...
	*/
    /*
    	Commercial / RFA登録 (A. Approval of Pricing Policy)
    */
    public static RFA__c createTestRFA_TypeB_A(
	    	String pStage,
	    	String pPrimaryCOACategory, String pPrimaryCOASubCategory, String pPrimaryCOASubCategory2, String pPrimaryCOASubCategory3,
	    	String pSecondCOACategory, String pSecondCOASubCategory, String pSecondCOASubCategory2, String pSecondCOASubCategory3,
	    	String pThirdCOACategory, String pThirdCOASubCategory, String pThirdCOASubCategory2, String pThirdCOASubCategory3
    	) {

        RFA__c testRFA = new RFA__c();

		// status        
        testRFA.Stage__c = pStage;
		// type b
        testRFA.RecordTypeId = getRecordTypeId('RFA__c', RFA_Utility_Constants.RECORDTYPE_Commercial_A_REQUEST);
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.PrimaryCOACategory__c = pPrimaryCOACategory;
        testRFA.PrimaryCOASubCategory__c = pPrimaryCOASubCategory;
        testRFA.PrimaryCOASubCategory2__c = pPrimaryCOASubCategory2;
        testRFA.PrimaryCOASubCategory3__c = pPrimaryCOASubCategory3;

        // Second COA Category
        testRFA.SecondCOACategory__c = pSecondCOACategory;
        testRFA.SecondCOASubCategory__c = pSecondCOASubCategory;
        testRFA.SecondCOASubCategory2__c = pSecondCOASubCategory2;
        testRFA.SecondCOASubCategory3__c = pSecondCOASubCategory3;

        // Third COA Category
        testRFA.ThirdCOACategory__c = pThirdCOACategory;
        testRFA.ThirdCOASubCategory__c = pThirdCOASubCategory;
        testRFA.ThirdCOASubCategory2__c = pThirdCOASubCategory2;
        testRFA.ThirdCOASubCategory3__c = pThirdCOASubCategory3;
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    
    /*
		Commercial / RFA (C. Price Promotion for Marketing & Commercial Leadership)
	*/
    public static RFA__c createTestRFA_TypeB_C(
	    	String pStage,
	    	String pPrimaryCOACategory, 
	    	String pPrimaryCOASubCategory, 
	    	String pPrimaryCOASubCategory2, 
	    	String pPrimaryCOASubCategory3
    ) {
        RFA__c testRFA = new RFA__c();
        
        testRFA.Stage__c = pStage;

        //Id rtId = RFA_Utility_Constants.getRecordType('C. Price Promotion for Marketing & Commercial Leadership', 'RFA__c'); // C. Price Promotion for Marketing & Commercial Leadership
        testRFA.RecordTypeId = getRecordTypeId('RFA__c' ,RFA_Utility_Constants.RECORDTYPE_Commercial_C_REQUEST);
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.PrimaryCOACategory__c = pPrimaryCOACategory;
        testRFA.PrimaryCOASubCategory__c = pPrimaryCOASubCategory;
        testRFA.PrimaryCOASubCategory2__c = pPrimaryCOASubCategory2;
        testRFA.PrimaryCOASubCategory3__c = pPrimaryCOASubCategory3;
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    /*
    	Commercial / RFA (D. Credit Terms / Policies)
    */
    public static RFA__c createTestRFA_TypeB_D(
    	String pStage, 
    	String pPrimaryCOACategory, 
    	String pPrimaryCOASubCategory, 
    	String pPrimaryCOASubCategory2,
    	String pPrimaryCOASubCategory3) {
    		
        RFA__c testRFA = new RFA__c();
        
        // status
        testRFA.Stage__c = pStage;

        //Id rtId = RFA_Utility_Constants.getRecordType('C. Price Promotion for Marketing & Commercial Leadership', 'RFA__c'); // C. Price Promotion for Marketing & Commercial Leadership
        testRFA.RecordTypeId = getRecordTypeId('RFA__c',RFA_Utility_Constants.RECORDTYPE_Commercial_D_REQUEST);
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.PrimaryCOACategory__c = pPrimaryCOACategory;
        testRFA.PrimaryCOASubCategory__c = pPrimaryCOASubCategory;
        testRFA.PrimaryCOASubCategory2__c = pPrimaryCOASubCategory2;
        testRFA.PrimaryCOASubCategory3__c = pPrimaryCOASubCategory3;
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    /*
    	Commercial / RFA (D. Credit Terms / Policies)
    	change required
    */
    public static RFA__c createTestRFA_TypeB_D(
    	String pStage, 
    	String pPrimaryCOACategory, 
    	String pPrimaryCOASubCategory, 
    	String pPrimaryCOASubCategory2,
    	String pPrimaryCOASubCategory3,
    	String pCompanyRecevingAfterApprovaleMail) {	// add by yoshinari
    		
        RFA__c testRFA = new RFA__c();
        
        // status
        testRFA.Stage__c = pStage;

        //Id rtId = RFA_Utility_Constants.getRecordType('C. Price Promotion for Marketing & Commercial Leadership', 'RFA__c'); // C. Price Promotion for Marketing & Commercial Leadership
        testRFA.RecordTypeId = getRecordTypeId('RFA__c',RFA_Utility_Constants.RECORDTYPE_Commercial_D_REQUEST);
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.PrimaryCOACategory__c = pPrimaryCOACategory;
        testRFA.PrimaryCOASubCategory__c = pPrimaryCOASubCategory;
        testRFA.PrimaryCOASubCategory2__c = pPrimaryCOASubCategory2;
        testRFA.PrimaryCOASubCategory3__c = pPrimaryCOASubCategory3;
        testRFA.CM_Company_receiving_after_approval_mail__c = pCompanyRecevingAfterApprovaleMail;
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    /*
    	Commercial / RFA (B. Approval of Customer Terms and Conditions) select category
    */
    public static RFA__c createTestRFA_TypeB_B(
			String stage, String pCategory, String pSubCategory, 
			String pContApproval_1, String pContApproval_2,	String pContApproval_3, 
			String pContApproval_4, String pContApproval_5, String pContApproval_6, 
			String pContApproval_7, String pContApproval_8, String pContApproval_9, String pContApproval_10, 
			String pContApproval_a,	String pContApproval_b,	String pContApproval_c,
			String pContApproval_d,	String pContApproval_e
			) {
        RFA__c testRFA = new RFA__c();
        
        //testRFA.Stage__c = RFAConstants.RFA_STATUS_DRAFT; // Draft
        testRFA.Stage__c = stage;
        
        //Id rtId = RFA_Utility_Constants.getRecordType('B. Approval of Customer Terms and Conditions', 'RFA__c'); // B. Approval of Customer Terms and Conditions
        Id rtId = [Select Id, Name, DeveloperName FROM RecordType Where SObjectType ='RFA__c' AND DeveloperName =: RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST].id;
        system.debug('-- rtId:' + rtId);
        testRFA.RecordTypeId = rtId; 
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.CM_PrimaryCOACategory__c = pCategory;
        testRFA.CM_PrimaryCOASubCategory__c = pSubCategory;

		// Content Approval
		// 01. - 10. a.-e.
		testRFA.CM_Contract_unit_price__c = pContApproval_1;
		testRFA.CM_SpecialPricePromotionDiscount__c = pContApproval_2;
		testRFA.CM_FS_selling_price__c = pContApproval_3;
		testRFA.CM_FS_Commission_Variable__c = pContApproval_4;
		testRFA.CM_FS_Commission_Fixed__c = pContApproval_5;
		testRFA.CM_KeyMoney_Rebate_Sport_Other__c = pContApproval_6;
		testRFA.CM_Only_in_the_case_of_Rebate__c = pContApproval_7;
		testRFA.CM_Other_support__c = pContApproval_8;
		testRFA.CM_Promotion_OtherExpense__c = pContApproval_9;
		testRFA.CM_Promotion_CooperationSampling__c = pContApproval_10;
		testRFA.CM_Non_standard_Equipment__c = pContApproval_a;
		testRFA.CM_Vending_Equipment_parts__c = pContApproval_b;
		testRFA.CM_Incidental_work__c = pContApproval_c;
		testRFA.CM_Vending_Equipment_Lease__c = pContApproval_d;
		testRFA.CM_Equipment_retirement__c = pContApproval_e;

		// Payment type
		testRFA.Payment_type__c = 'Cash';
		
		// Sales Chanel
		testRFA.CM_SalesChanel_FS_RTD__c = true;
		testRFA.CM_SalesChanel_FS_Other__c = true;
		testRFA.CM_SalesChanel_OTC_RS__c = true;
		testRFA.CM_SalesChanel_OTC_SY__c = true;
		testRFA.CM_SalesChanel_SM_DD__c = true;
		testRFA.CM_SalesChanel_CVS__c = true;
		testRFA.CM_SalesChanel_Other__c = true;

		// Equipment
		testRFA.CM_Establishment_CanPet__c = 1;
		testRFA.CM_Equipment_CVM__c = 2;
		testRFA.CM_Equipment_OtherVM__c = 3;
		testRFA.CM_Equipment_Cooler__c = 4;
		testRFA.CM_Equipment_Dispenser__c = 5;
		testRFA.CM_Equipment_Other__c = 6;

		// XX_after is required
		testRFA.CM_SalesValue_BAPC_After__c = 100; 
		//testRFA.CM_SalesValue_BAPC_Before__c = 
		//testRFA.CM_SalesValue_BAPC_Difference__c = 
		testRFA.CM_NSR_After__c = 500;
		//testRFA.CM_NSR_Before__c = 
		//testRFA.CM_NSR_Difference__c = 
		testRFA.CM_GP_After__c = 600;
		//testRFA.CM_GP_Before__c = 
		//testRFA.CM_GP_Difference__c = 
		testRFA.CM_Direct_Profit_After__c = 700; 
		//testRFA.CM_Direct_Profit_Before__c = 
		//testRFA.CM_Direct_Profit_Difference__c = 
		testRFA.CM_Contribution_margin_After__c = 800; 
		//testRFA.CM_Contribution_margin_Before__c = 
		//testRFA.CM_Contribution_margin_Difference__c = 
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    /*
    	Commercial / RFA (B. Approval of Customer Terms and Conditions) select category
    	change required
    */
    public static RFA__c createTestRFA_TypeB_B(
			String stage, String pCategory, String pSubCategory, 
			String pContApproval_1, String pContApproval_2,	String pContApproval_3, 
			String pContApproval_4, String pContApproval_5, String pContApproval_6, 
			String pContApproval_7, String pContApproval_8, String pContApproval_9, String pContApproval_10, 
			String pContApproval_a,	String pContApproval_b,	String pContApproval_c,
			String pContApproval_d,	String pContApproval_e,
			String pCompanyRecevingAfterApprovalMail				// add by yoshinari
			) {
        RFA__c testRFA = new RFA__c();
        
        //testRFA.Stage__c = RFAConstants.RFA_STATUS_DRAFT; // Draft
        testRFA.Stage__c = stage;
        
        //Id rtId = RFA_Utility_Constants.getRecordType('B. Approval of Customer Terms and Conditions', 'RFA__c'); // B. Approval of Customer Terms and Conditions
        Id rtId = [Select Id, Name, DeveloperName FROM RecordType Where SObjectType ='RFA__c' AND DeveloperName =: RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST].id;
        system.debug('-- rtId:' + rtId);
        testRFA.RecordTypeId = rtId; 
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.CM_PrimaryCOACategory__c = pCategory;
        testRFA.CM_PrimaryCOASubCategory__c = pSubCategory;

		testRFA.CM_Company_receiving_after_approval_mail__c = pCompanyRecevingAfterApprovalMail; // add by yoshinari

		// Content Approval
		// 01. - 10. a.-e.
		testRFA.CM_Contract_unit_price__c = pContApproval_1;
		testRFA.CM_SpecialPricePromotionDiscount__c = pContApproval_2;
		testRFA.CM_FS_selling_price__c = pContApproval_3;
		testRFA.CM_FS_Commission_Variable__c = pContApproval_4;
		testRFA.CM_FS_Commission_Fixed__c = pContApproval_5;
		testRFA.CM_KeyMoney_Rebate_Sport_Other__c = pContApproval_6;
		testRFA.CM_Only_in_the_case_of_Rebate__c = pContApproval_7;
		testRFA.CM_Other_support__c = pContApproval_8;
		testRFA.CM_Promotion_OtherExpense__c = pContApproval_9;
		testRFA.CM_Promotion_CooperationSampling__c = pContApproval_10;
		testRFA.CM_Non_standard_Equipment__c = pContApproval_a;
		testRFA.CM_Vending_Equipment_parts__c = pContApproval_b;
		testRFA.CM_Incidental_work__c = pContApproval_c;
		testRFA.CM_Vending_Equipment_Lease__c = pContApproval_d;
		testRFA.CM_Equipment_retirement__c = pContApproval_e;

		// Payment type
		testRFA.Payment_type__c = 'Cash';
		
		// Sales Chanel
		testRFA.CM_SalesChanel_FS_RTD__c = true;
		testRFA.CM_SalesChanel_FS_Other__c = true;
		testRFA.CM_SalesChanel_OTC_RS__c = true;
		testRFA.CM_SalesChanel_OTC_SY__c = true;
		testRFA.CM_SalesChanel_SM_DD__c = true;
		testRFA.CM_SalesChanel_CVS__c = true;
		testRFA.CM_SalesChanel_Other__c = true;

		// Equipment
		testRFA.CM_Establishment_CanPet__c = 1;
		testRFA.CM_Equipment_CVM__c = 2;
		testRFA.CM_Equipment_OtherVM__c = 3;
		testRFA.CM_Equipment_Cooler__c = 4;
		testRFA.CM_Equipment_Dispenser__c = 5;
		testRFA.CM_Equipment_Other__c = 6;

		// XX_after is required
		testRFA.CM_SalesValue_BAPC_After__c = 100; 
		//testRFA.CM_SalesValue_BAPC_Before__c = 
		//testRFA.CM_SalesValue_BAPC_Difference__c = 
		testRFA.CM_NSR_After__c = 500;
		//testRFA.CM_NSR_Before__c = 
		//testRFA.CM_NSR_Difference__c = 
		testRFA.CM_GP_After__c = 600;
		//testRFA.CM_GP_Before__c = 
		//testRFA.CM_GP_Difference__c = 
		testRFA.CM_Direct_Profit_After__c = 700; 
		//testRFA.CM_Direct_Profit_Before__c = 
		//testRFA.CM_Direct_Profit_Difference__c = 
		testRFA.CM_Contribution_margin_After__c = 800; 
		//testRFA.CM_Contribution_margin_Before__c = 
		//testRFA.CM_Contribution_margin_Difference__c = 
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }

    /*
    	Commercial / RFA (
    		B. Approval of Customer Terms and Conditions And D. Credit Terms / Policies) 
    		select category
    	change required
    */
    public static RFA__c createTestRFA_TypeB_B(
			String stage, String pCategory, String pSubCategory, 
			String pContApproval_1, String pContApproval_2,	String pContApproval_3, 
			String pContApproval_4, String pContApproval_5, String pContApproval_6, 
			String pContApproval_7, String pContApproval_8, String pContApproval_9, String pContApproval_10, 
			String pContApproval_a,	String pContApproval_b,	String pContApproval_c,
			String pContApproval_d,	String pContApproval_e,
			String pPrimaryCategory, String pPrimarySubCategory, String pPrimarySubCategory2, String pPrimarySubCategory3, 
			String pCompanyRecevingAfterApprovalMail				// add by yoshinari


			) {
        RFA__c testRFA = new RFA__c();
        
        //testRFA.Stage__c = RFAConstants.RFA_STATUS_DRAFT; // Draft
        testRFA.Stage__c = stage;
        
        //Id rtId = RFA_Utility_Constants.getRecordType('B. Approval of Customer Terms and Conditions', 'RFA__c'); // B. Approval of Customer Terms and Conditions
        Id rtId = [Select Id, Name, DeveloperName FROM RecordType Where SObjectType ='RFA__c' AND DeveloperName =: RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST].id;
        system.debug('-- rtId:' + rtId);
        testRFA.RecordTypeId = rtId; 
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';

        // Primary COA Category
        testRFA.CM_PrimaryCOACategory__c = pCategory;
        testRFA.CM_PrimaryCOASubCategory__c = pSubCategory;

		testRFA.CM_Company_receiving_after_approval_mail__c = pCompanyRecevingAfterApprovalMail; // add by yoshinari

		// Content Approval
		// 01. - 10. a.-e.
		testRFA.CM_Contract_unit_price__c = pContApproval_1;
		testRFA.CM_SpecialPricePromotionDiscount__c = pContApproval_2;
		testRFA.CM_FS_selling_price__c = pContApproval_3;
		testRFA.CM_FS_Commission_Variable__c = pContApproval_4;
		testRFA.CM_FS_Commission_Fixed__c = pContApproval_5;
		testRFA.CM_KeyMoney_Rebate_Sport_Other__c = pContApproval_6;
		testRFA.CM_Only_in_the_case_of_Rebate__c = pContApproval_7;
		testRFA.CM_Other_support__c = pContApproval_8;
		testRFA.CM_Promotion_OtherExpense__c = pContApproval_9;
		testRFA.CM_Promotion_CooperationSampling__c = pContApproval_10;
		testRFA.CM_Non_standard_Equipment__c = pContApproval_a;
		testRFA.CM_Vending_Equipment_parts__c = pContApproval_b;
		testRFA.CM_Incidental_work__c = pContApproval_c;
		testRFA.CM_Vending_Equipment_Lease__c = pContApproval_d;
		testRFA.CM_Equipment_retirement__c = pContApproval_e;

		// add Credit Policies
		testRFA.PrimaryCOACategory__c = pPrimaryCategory;
		testRFA.PrimaryCOASubCategory__c = pPrimarySubCategory;
		testRFA.PrimaryCOASubCategory2__c = pPrimarySubCategory2;
		testRFA.PrimaryCOASubCategory3__c = pPrimarySubCategory3;

		// Payment type
		testRFA.Payment_type__c = 'Cash';
		
		// Sales Chanel
		testRFA.CM_SalesChanel_FS_RTD__c = true;
		testRFA.CM_SalesChanel_FS_Other__c = true;
		testRFA.CM_SalesChanel_OTC_RS__c = true;
		testRFA.CM_SalesChanel_OTC_SY__c = true;
		testRFA.CM_SalesChanel_SM_DD__c = true;
		testRFA.CM_SalesChanel_CVS__c = true;
		testRFA.CM_SalesChanel_Other__c = true;

		// Equipment
		testRFA.CM_Establishment_CanPet__c = 1;
		testRFA.CM_Equipment_CVM__c = 2;
		testRFA.CM_Equipment_OtherVM__c = 3;
		testRFA.CM_Equipment_Cooler__c = 4;
		testRFA.CM_Equipment_Dispenser__c = 5;
		testRFA.CM_Equipment_Other__c = 6;

		// XX_after is required
		testRFA.CM_SalesValue_BAPC_After__c = 100; 
		//testRFA.CM_SalesValue_BAPC_Before__c = 
		//testRFA.CM_SalesValue_BAPC_Difference__c = 
		testRFA.CM_NSR_After__c = 500;
		//testRFA.CM_NSR_Before__c = 
		//testRFA.CM_NSR_Difference__c = 
		testRFA.CM_GP_After__c = 600;
		//testRFA.CM_GP_Before__c = 
		//testRFA.CM_GP_Difference__c = 
		testRFA.CM_Direct_Profit_After__c = 700; 
		//testRFA.CM_Direct_Profit_Before__c = 
		//testRFA.CM_Direct_Profit_Difference__c = 
		testRFA.CM_Contribution_margin_After__c = 800; 
		//testRFA.CM_Contribution_margin_Before__c = 
		//testRFA.CM_Contribution_margin_Difference__c = 
        
		testRFA.CM_Summary_Purpose_rationnale_background__c = 'test data create';

        insert testRFA;
        return testRFA;
    }


	/* 
		create request detail Register individually
	*/

	public static CM_RequestDetails__c createRequestDetail(CM_RequestDetails__c obj) {
		insert obj;
		return obj;
	}

	/* 
		create request detail from recrodTypeDevelopername
	*/
	public static void createRequestDetails(Id rfaId, List<String> recordTypeList) {
		List<CM_RequestDetails__c> detaillist = new List<CM_RequestDetails__c>();
		CM_RequestDetails__c testRequestDetail; 
		for ( String recordTypeName : recordTypeList )
		{
			testRequestDetail = new CM_RequestDetails__c();
			testRequestDetail.RecordTypeId = getRecordTypeId('CM_RequestDetails__c', recordTypeName);
			testRequestDetail.CM_RFA__c = rfaId;
			
			// 01. Contract unit price
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price) {
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today();
				testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// 02. Special price / Promotion discount
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount) {
				testRequestDetail.CM_Chanel_Of_Price_Guidelines__c = 'R-Institutional SAKAYA';
				testRequestDetail.CM_Delivery_term_from__c = System.today();
				testRequestDetail.CM_Delivery_term_to__c = System.today() + 1;
				testRequestDetail.CM_Target_Dealer__c = 'All';
				testRequestDetail.CM_CHIRASHI__c = 'Yes';
				testRequestDetail.CM_Description__c = 'desciption/test';
				
			}
			// 03. FS selling price
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price) {
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
				testRequestDetail.CM_Contract_Condition_Price_Description__c = 'test:';
				
			}
			// 04. FS commission (Variable)
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable) {
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
				testRequestDetail.CM_Contract_Condition_Price_Description__c = 'test:';
			}
			// 05. FS commission (Fixed)
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 50000001;
				testRequestDetail.CM_Monthly_amount_Tax_exclusive_price__c = 5000000;
				testRequestDetail.CM_Payment_method__c = 'Prepayment';
				testRequestDetail.CM_Payment_timing__c = 'One time Payment'; 
				//testRequestDetail.CM_Other_payment_methods__c = '';
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'No';
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;
				testRequestDetail.CM_Description__c = 'desciption/test';
				
			}
			// 06. Key money / Rebate / Spot / Other
			
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 50000001;
				testRequestDetail.CM_Payment_method__c = 'Prepayment';
				testRequestDetail.CM_Payment_timing__c = 'One time Payment'; 
				//CM_Other_payment_methods__c = '';
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'No';
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;

				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// 07. Only in the case of Rebate
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 50000001;
				testRequestDetail.CM_Payment_method__c = 'Prepayment';
				testRequestDetail.CM_Payment_timing__c = 'One time Payment'; 
				//CM_Other_payment_methods__c = '';
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'No';
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;

				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// 08. Other support
			
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Other_support	) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 25000001;
				testRequestDetail.CM_Payment_method__c = 'Prepayment';
				testRequestDetail.CM_Payment_timing__c = 'One time Payment'; 
				//CM_Other_payment_methods__c = '';
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'No';
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;

				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// 09. Promotion / Other expense
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 50000001;
				testRequestDetail.CM_Payment_method__c = 'Prepayment';
				testRequestDetail.CM_Payment_timing__c = 'One time Payment'; 
				//CM_Other_payment_methods__c = '';
				testRequestDetail.CM_Contract_term_from__c = System.today();
				testRequestDetail.CM_Contract_term_to__c = System.today() + 30;
				testRequestDetail.CM_Automatic_Renewed__c = 'No';
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;

				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// 10. Promotion (Cooperation / Sampling)
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 100000;
				testRequestDetail.CM_Payment_due_date__c = System.today() + 60;
				testRequestDetail.CM_Number_of_SampleCase__c = 50;
				testRequestDetail.CM_Execution_due_date__c = System.today() + 60;
				testRequestDetail.CM_Description__c = 'desciption/test';
			}
			// a. Non-standard Equipment
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment) {
				testRequestDetail.CM_Model_Name__c = 'test/model';
				testRequestDetail.CM_Can_Stand__c = 1;
				testRequestDetail.CM_Cup_Stand__c = 2;
				testRequestDetail.CM_Cooler_Stand__c = 3;
				testRequestDetail.CM_Dispenser_Stand__c = 4;
				testRequestDetail.CM_Other_Stand__c = 5;
				testRequestDetail.CM_Description__c = 'test';
			}
			// b. Vending Equipment parts
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts) {
				testRequestDetail.CM_Part_Name__c = 'test/parts';
				testRequestDetail.CM_Description__c = 'test';
			}
			// c. Incidental work
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork) {
				testRequestDetail.CM_Payment_amount_Tax_exclusive_price__c = 1000;
				testRequestDetail.CM_Contractor__c = 'test/Contractor';
				testRequestDetail.CM_New_Equipment__c = true;
				testRequestDetail.CM_Used_Equipment__c = true;
				testRequestDetail.CM_Existing_Equipment__c = true;		
				testRequestDetail.CM_Description__c = 'test';
			}
			// d. Vending Equipment Lease
			// e. Equipment retirement
			if (recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease
			|| recordTypeName == RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement) {
				
				testRequestDetail.CM_Description__c = 'test';
			}
			detaillist.add(testRequestDetail);
		}
		insert detaillist;
	}

	/*
		Mail Group created manually
	*/
	public static CM_FinalApprovalMailGroup__c createFinalApprovalMailGroup(String pGroupName, String pCategory, String pSub_Category1, String pSub_Category2, String pSub_Category3) {
		CM_FinalApprovalMailGroup__c testGroup = new CM_FinalApprovalMailGroup__c();
		testGroup.Name = pGroupName;
		testGroup.RecordTypeId = getRecordTypeId('CM_FinalApprovalMailGroup__c','Standard_Group_Member');
		testGroup.CM_OpenCheck__c = false;
		testGroup.CM_Description__c = 'test:' + pGroupName;
		insert testGroup;
		return testGroup;
	}
	
	/*
		Fixed Group creation
	*/
	public static CM_FinalApprovalMailGroup__c createFinalApprovalMailFixedGroup(
		String pGroupName, 
		String pCategory, String pSub_Category1, String pSub_Category2, String pSub_Category3) 
	{
		CM_FinalApprovalMailGroup__c testGroup = new CM_FinalApprovalMailGroup__c();
		testGroup.Name = pGroupName;
		testGroup.RecordTypeId = getRecordTypeId('CM_FinalApprovalMailGroup__c','Fixed_Group_Member');
		testGroup.CM_Category__c = pCategory;
		testGroup.CM_Sub_Category1__c = pSub_Category1;
		testGroup.CM_Sub_Category2__c = pSub_Category2;
		testGroup.CM_Sub_Category3__c = pSub_Category3;
		testGroup.CM_OpenCheck__c = false;
		testGroup.CM_Description__c = 'test:' + pGroupName;
		insert testGroup;
		return testGroup;
	}
	
	/*
		Fixed Group creation
		change required
	*/
	public static CM_FinalApprovalMailGroup__c createFinalApprovalMailFixedGroup(
		String pGroupName, 
		String pCategory, String pSub_Category1, String pSub_Category2, String pSub_Category3, String pCompanyRecevingAfterApprovalMail) 
	{
		CM_FinalApprovalMailGroup__c testGroup = new CM_FinalApprovalMailGroup__c();
		testGroup.Name = pGroupName;
		testGroup.RecordTypeId = getRecordTypeId('CM_FinalApprovalMailGroup__c','Fixed_Group_Member');
		testGroup.CM_Category__c = pCategory;
		testGroup.CM_Sub_Category1__c = pSub_Category1;
		testGroup.CM_Sub_Category2__c = pSub_Category2;
		testGroup.CM_Sub_Category3__c = pSub_Category3;
		testGroup.CM_OpenCheck__c = false;
		testGroup.CM_Description__c = 'test:' + pGroupName;
		testGroup.CM_Company_receiving_after_approval_mail__c = pCompanyRecevingAfterApprovalMail; // add by yoshinari   
		insert testGroup;
		return testGroup;
	}
	
	// get recordtypeid from developerName
	public static id getRecordTypeId(String pSObjectType, String pDeveloperName) {
		return [Select Id, Name, DeveloperName 
						FROM RecordType 
						Where SObjectType =: pSObjectType
						AND DeveloperName =: pDeveloperName].id;
	}

	/////////////////// End Commercial Test Data //////////////////////////////////////




    
    /*
     * This method creates a user record
     * @Paran : String profileId, String alias, String lastName
     * @return: User__c
     * @return void
     */
    //public User createUser(String profileId, String alias, String lastName, User testUser)
    public User createUser(String profileId, String alias, String lastName)
    {
        User testUser = new User();
        testUser.alias = alias;
        testUser.email = 'cokeuserfortest@cocacola.com' + ctr++;
        testUser.emailencodingkey ='UTF-8';
        testUser.lastName = lastName;
        testUser.languagelocalekey ='en_US';
        testUser.localesidkey ='en_US';
        testUser.ProfileId = profileId;
        testUser.timezonesidkey ='Europe/London';
        testUser.UserName = alias + String.valueOf(Math.Round( Math.Random() * 100000)) + '@rfa.cocacola.com';
        insert testUser;
        return testUser;
    }  

    /* RFA Standard User */
    public User createUser(String strGroup, String strAcronym)
    {
        User testUser = new User();
        testUser.alias = 'a' + String.valueOf(Math.Round( Math.Random() * 1000000));
        testUser.email = 'cokeuserfortest@cocacola.com' + ctr++;
        testUser.emailencodingkey ='UTF-8';
        testUser.lastName = 'l' + String.valueOf(Math.Round( Math.Random() * 100000));
        testUser.languagelocalekey ='en_US';
        testUser.localesidkey ='en_US';
        testUser.ProfileId = RFAConstants.getRFAStandardUserProfileId();
        testUser.timezonesidkey ='Europe/London';
        testUser.UserName = 'a' + String.valueOf(Math.Round( Math.Random() * 100000)) + '@rfa.cocacola.com';
        testUser.COA_Group__c = strGroup;
        testUser.COA_Acronym__c = strAcronym;
        insert testUser;
        return testUser;
    }      
    
    public User createCOAUser(String strGroup, String strAcronym, String Level, String L2EFunction, String L3EFunction, String L4EFunction)
    {
        User testUser = new User();
        testUser.alias = 'a' + String.valueOf(Math.Round( Math.Random() * 1000000));
        testUser.email = 'cokeuserfortest@cocacola.com' + ctr++;
        testUser.emailencodingkey ='UTF-8';
        testUser.lastName = 'l' + String.valueOf(Math.Round( Math.Random() * 100000));
        testUser.languagelocalekey ='en_US';
        testUser.localesidkey ='en_US';
        testUser.ProfileId = RFAConstants.getRFAStandardUserProfileId();
        testUser.timezonesidkey ='Europe/London';
        testUser.UserName = 'a' + String.valueOf(Math.Round( Math.Random() * 100000)) + '@rfa.cocacola.com';
        testUser.COA_Group__c = strGroup;
        testUser.COA_Acronym__c = strAcronym;
        testUser.L_level__c = Level;
        testUser.L2_Function_E__c = L2EFunction;
        testUser.L3_Function_E__c = L3EFunction;
        testUser.L4_Function_E__c = L4EFunction;
        insert testUser;
        return testUser;
    }     
       
    public User createRequester()
    {
        requester = createUser(RFAConstants.getRFAStandardUserProfileId(), 'rUsert', 'reqlastt');
        return requester;
    }      
    
    public Cost_Center__c buildCostCenter(String Function) {
        Cost_Center__c CostCenter = new Cost_Center__c();
        CostCenter.Name = RFAConstants.CostCenter_Name;
        CostCenter.ActiveInactive__c = 'Active';
        CostCenter.Function__c = Function;
        CostCenter.Function_En__c = Function;
        
        insert CostCenter;
        return CostCenter;
    }
    
    public void buildTaxRate() {       
        List<Financial_Constant__c> FCList = new List<Financial_Constant__c>();
        Financial_Constant__c FinCont1 = new Financial_Constant__c();
        FinCont1.isActive__c = true;
        FinCont1.Tax_Rate__c = 0.05;
        FinCont1.RecordTypeId = RFAConstants.getRecordType(
                                RFAConstants.FinancialConstant_RT_TaxRate, 'Financial_Constant__c');
        FCList.add(FinCont1);
        
        Financial_Constant__c FinCont2 = new Financial_Constant__c();
        FinCont2.isActive__c = true;
        FinCont2.WACC__c = 0.05;
        FinCont2.RecordTypeId = RFAConstants.getRecordType(
                                RFAConstants.FinancialConstant_RT_WACC, 'Financial_Constant__c');
        FCList.add(FinCont2);        
                
        insert FCList;                
    }    
    
    public void buildProfitCenter()
    {
        testProfitCenter.ProfitCenterName__c = RFAConstants.ProfitCenter_Name_CCEJ; 
        testProfitCenter.Name = '0001';
        testProfitCenter.ActiveInactive__c = 'Active';
        insert testProfitCenter;
        
        buildProfitCenterUserRole(testProfitCenter.Id);                 
    }
     
    public void buildProfitCenterUserRole(String pcId)
    {
        List<ProfitCenterUserRole__c> pcUserRoleForInsert = new List<ProfitCenterUserRole__c>();
        
        User viewerUser = createUser(RFAConstants.getRFAStandardUserProfileId(), 'viewUser', 'viewerlastt');                    
        ProfitCenterUserRole__c viewerUserRole = new ProfitCenterUserRole__c();
        viewerUserRole.ProfitCenter__c = pcId;
        viewerUserRole.UserName__c = viewerUser.Id;
        viewerUserRole.UserType__c = RFAConstants.ProfitCenterUserRole_UserType_Viewer;    
        pcUserRoleForInsert.add(viewerUserRole);    
        
        /*
        User capUser = createUser(RFAConstants.getRFAStandardUserProfileId(), 'capUsert', 'caplastt');                  
        ProfitCenterUserRole__c capUserRole = new ProfitCenterUserRole__c();
        capUserRole.ProfitCenter__c = pcId;
        capUserRole.UserName__c = capUser.Id;
        capUserRole.UserType__c = RFAConstants.ProfitCenterUserRole_UserType_Capital;    
        pcUserRoleForInsert.add(capUserRole);  
        */         
                    
        insert pcUserRoleForInsert;
    }
    
    
	



    



    
    public static RFA__c createTestRFAwithType(String stage, String rt, Integer amount) {
        RFA__c testRFA = new RFA__c();
        
        testRFA.Stage__c = stage;
        Id rtId = RFAConstants.getRecordType(rt, 'RFA__c'); //'General Request'
        testRFA.RecordTypeId = rtId;
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';
        testRFA.LCOACategorySubCategory__c = 'Testing 3 years Cash Spent';
        
        testRFA.Cost_Center_Number__c = [Select Id from Cost_Center__c limit 1].Id;

        testRFA.Legal_Entity__c = '【CCEJ】 Coca-Cola East Japan';
        testRFA.RequestAmountFunctionalCurrency__c = amount;
        
        testRFA.Expected_Cash_Spend_Date__c = System.Today();
        testRFA.Expected_Capitalization_Date__c = System.Today();
        testRFA.ExpectedCommitmentDate__c = System.Today();
        
        testRFA.PrimaryCOACategory__c = 'Purchase, Disposal, Revaluation or Write-off of Assets';
        testRFA.PrimaryCOASubCategory__c = 'Asset Impairments';
        testRFA.Objectives_Rationale_Background__c = 'test';
        testRFA.Benefits_Financial_Metrics_Assumptions__c = 'test';
        testRFA.Cost_Estimates__c = 'test';
        testRFA.Risks_and_Alternatives__c = 'test';
        testRFA.Other_Considerations__c = 'test';
        
        testRFA.IsthisanAnnualCapitalPlanrequest__c = 'Yes';
        testRFA.Budget_Approval_Number__c = 'Number';
        testRFA.InitialBudgetYear__c = '2013';
        testRFA.BudgetType__c = 'Formal';
        testRFA.OPEX_Amount__c = amount; //1200;
        
        testRFA.DiscountedPaybackPeriodYears__c = 0.05;
        testRFA.IRR__c = 0.05;
        testRFA.CashflowYears__c = 3;
        testRFA.NPVUSD__c = amount; //1200;

        insert testRFA;
        return testRFA;
    }    

    public static RFA__c createTestRFAForCOA(
        String stage, String rt, Id idCostCenter, 
        String PrimaryCOACategory, String PrimaryCOASubCategory, String PrimaryCOASubCategory2, String PrimaryCOASubCategory3,
        String SecondCOACategory, String SecondCOASubCategory, String SecondCOASubCategory2, String SecondCOASubCategory3,
        String ThirdCOACategory, String ThirdCOASubCategory, String ThirdCOASubCategory2, String ThirdCOASubCategory3
        ) {
        RFA__c testRFA = new RFA__c();

        testRFA.PrimaryCOACategory__c = PrimaryCOACategory;
        testRFA.PrimaryCOASubCategory__c = PrimaryCOASubCategory;
        if(!RFAConstants.isBlank(PrimaryCOASubCategory2)) {
            testRFA.PrimaryCOASubCategory2__c = PrimaryCOASubCategory2;
        }
        if(!RFAConstants.isBlank(PrimaryCOASubCategory3)) {
            testRFA.PrimaryCOASubCategory3__c = PrimaryCOASubCategory3;
        }
        
        if(!RFAConstants.isBlank(SecondCOACategory)) {
            testRFA.SecondCOACategory__c = SecondCOACategory;
        }
        if(!RFAConstants.isBlank(SecondCOASubCategory)) {
            testRFA.SecondCOASubCategory__c = SecondCOASubCategory;
        }
        if(!RFAConstants.isBlank(SecondCOASubCategory2)) {
            testRFA.SecondCOASubCategory2__c = SecondCOASubCategory2;
        }
        if(!RFAConstants.isBlank(SecondCOASubCategory3)) {
            testRFA.SecondCOASubCategory3__c = SecondCOASubCategory3;        
        }
        
        if(!RFAConstants.isBlank(ThirdCOACategory)) {
            testRFA.ThirdCOACategory__c = ThirdCOACategory;
        }
        if(!RFAConstants.isBlank(ThirdCOASubCategory)) {
            testRFA.ThirdCOASubCategory__c = ThirdCOASubCategory;
        }
        if(!RFAConstants.isBlank(ThirdCOASubCategory2)) {
            testRFA.ThirdCOASubCategory2__c = ThirdCOASubCategory2;
        }
        if(!RFAConstants.isBlank(ThirdCOASubCategory3)) {
            testRFA.ThirdCOASubCategory3__c = ThirdCOASubCategory3;     
        }     
        
        testRFA.Stage__c = stage;
        Id rtId = RFAConstants.getRecordType(rt, 'RFA__c'); //'General Request'
        testRFA.RecordTypeId = rtId;
                
        testRFA.RequestTitle__c = 'Test Data Created in test class';
        testRFA.LCOACategorySubCategory__c = 'Testing 3 years Cash Spent';
        
        testRFA.Cost_Center_Number__c = idCostCenter; //[Select Id from Cost_Center__c limit 1].Id;

        testRFA.Legal_Entity__c = '【CCEJ】 Coca-Cola East Japan';
        testRFA.RequestAmountFunctionalCurrency__c = 1200;
        
        testRFA.Expected_Cash_Spend_Date__c = System.Today();
        testRFA.Expected_Capitalization_Date__c = System.Today();
        testRFA.ExpectedCommitmentDate__c = System.Today();
               
        testRFA.Objectives_Rationale_Background__c = 'test';
        testRFA.Benefits_Financial_Metrics_Assumptions__c = 'test';
        testRFA.Cost_Estimates__c = 'test';
        testRFA.Risks_and_Alternatives__c = 'test';
        testRFA.Other_Considerations__c = 'test';
        
        testRFA.IsthisanAnnualCapitalPlanrequest__c = 'Yes';
        testRFA.Budget_Approval_Number__c = 'Number';
        testRFA.InitialBudgetYear__c = '2013';
        testRFA.BudgetType__c = 'Formal';
        testRFA.OPEX_Amount__c = 1200;
        
        testRFA.DiscountedPaybackPeriodYears__c = 0.05;
        testRFA.IRR__c = 0.05;
        testRFA.CashflowYears__c = 3;
        testRFA.NPVUSD__c = 1200;

        Test.startTest();
        insert testRFA;
        Test.stopTest();
        
        return testRFA;
    }                

      
    
    public static void updateThreeYearCashSpentForRFA(RFA__c rfaObj, Double amount)
    {
        ThreeYearCashSpend__c[] cashSpents = [Select 
            //ARERate__c, 
            Name FROM ThreeYearCashSpend__c where RFA__c =: rfaObj.Id];
            
        cashSpents[0].X3YearCashSpendFunc__c = amount;
        update cashSpents[0];
    }
    
    public static void updateCapitalExpenditure(RFA__c rfaObj, Double amount)
    {
        Capital_Expenditure__c[] expenditureArray = [
            Select Amount__c 
            From Capital_Expenditure__c where RFA__c =: rfaObj.Id
        ];
        
        if(expenditureArray[0] != null) {
            expenditureArray[0].Amount__c = amount;
            update expenditureArray[0];
        }
        
    }
    
    //Approver
    public static RFAUserRole__c buildApprover(
        String rfaId, 
        User approver //, 
        //String level
    )
    {            
        RFAUserRole__c approver1 = new RFAUserRole__c();
        approver1.RFA__c = rfaId;
        approver1.UserName__c = approver.Id;
        //approver1.Level__c = level;
        approver1.RecordTypeId = RFAGlobalConstants.RECORDTYPESMAP.get(
            Schema.sObjectType.RFAUserRole__c.getName()).get(RFAConstants.RTLabel_RFAUserRole_Approver).Id;
        approver1.ApprovalOrder__c = 1;
        insert approver1;    
        return approver1;
    }
    //can delete?
    /*
    public static RFAUserRole__c buildApprover(
        String rfaId //, String level
        )
    {            
        RFAUserRole__c approver1 = new RFAUserRole__c();
        approver1.RFA__c = rfaId;
        //approver1.UserName__c = approver.Id;
        //approver1.Level__c = level;
        approver1.RecordTypeId 
            = RFAGlobalConstants.RECORDTYPESMAP.get(
                Schema.sObjectType.RFAUserRole__c.getName()).get(RFAGlobalConstants.APPROVER_RECORDTYPE).Id;
        return approver1;
    } */
    
    
    //Primary Point of Contact
    public static RFAUserRole__c buildPPOC(String rfaId, User PPOCUser)
    {
        RFAUserRole__c ppoc = new RFAUserRole__c();
        ppoc.RFA__c = rfaId;
        ppoc.UserName__c = PPOCUser.Id;
        ppoc.RecordTypeId 
            = RFAGlobalConstants.RECORDTYPESMAP.get(
                Schema.sObjectType.RFAUserRole__c.getName()).get(RFAConstants.RTLabel_RFAUserRole_PPOC).Id;
        insert ppoc;
        return ppoc;   
    }
    //Info Copy Only
    public static RFAUserRole__c buildInfoOnlyUsers(String rfaId, User infoUsers)
    {
        RFAUserRole__c reviewer = new RFAUserRole__c();
        reviewer.RFA__c = rfaId;
        reviewer.UserName__c = infoUsers.Id;
        reviewer.RecordTypeId = RFAGlobalConstants.RECORDTYPESMAP.get(
            Schema.sObjectType.RFAUserRole__c.getName()).get(RFAConstants.RTLabel_RFAUserRole_InfoOnly).Id;
        insert reviewer;
        return reviewer;
    }
    
    
    public void buildCapitalExpenditure() {
        List<RFACapitalExpenditure__c> CapitalExpenditureList = new List<RFACapitalExpenditure__c>();
        
        Id rtId1 = RFAConstants.getRecordType('Capital Project Request', 'Capital_Expenditure__c');
        
        RFACapitalExpenditure__c ceC1 = new RFACapitalExpenditure__c();
        ceC1.Name = 'CPR-1';
        ceC1.Record_Type_Name__c = 'Capital Project Request';
        ceC1.RecordTypeId__c = rtId1;
        ceC1.AssetCategory__c = '土地 / Land';
        ceC1.InvestmentObjective__c = '';
        CapitalExpenditureList.add(ceC1);

        RFACapitalExpenditure__c ceC2 = new RFACapitalExpenditure__c();
        ceC2.Name = 'CPR-2';
        ceC2.Record_Type_Name__c = 'Capital Project Request';
        ceC2.RecordTypeId__c = rtId1;
        ceC2.AssetCategory__c = '構築物 / Land Improvements';
        ceC2.InvestmentObjective__c = '';
        CapitalExpenditureList.add(ceC2);       
        
        RFACapitalExpenditure__c ceC3 = new RFACapitalExpenditure__c();
        ceC3.Name = 'CPR-3';
        ceC3.Record_Type_Name__c = 'Capital Project Request';
        ceC3.RecordTypeId__c = rtId1;
        ceC3.AssetCategory__c = 'ﾘｰｽ物件改良費 / Leasehold Improvements';
        ceC3.InvestmentObjective__c = '';
        CapitalExpenditureList.add(ceC3);       
        
        Id rtId2 = RFAConstants.getRecordType('Medium Project Request', 'Capital_Expenditure__c');
        
        RFACapitalExpenditure__c ceSA1 = new RFACapitalExpenditure__c();
        ceSA1.Name = 'SPR-1';
        ceSA1.Record_Type_Name__c = 'Medium Project Request';
        ceSA1.RecordTypeId__c = rtId2;
        ceSA1.AssetCategory__c = '土地 / Land';
        ceSA1.InvestmentObjective__c = 'その他の戦略的対応 / Strategic Initiatives';
        CapitalExpenditureList.add(ceSA1);

        RFACapitalExpenditure__c ceSA2 = new RFACapitalExpenditure__c();
        ceSA2.Name = 'SPR-2';
        ceSA2.Record_Type_Name__c = 'Medium Project Request';
        ceSA2.RecordTypeId__c = rtId2;
        ceSA2.AssetCategory__c = '土地 / Land';
        ceSA2.InvestmentObjective__c = '顧客ﾆｰｽﾞへの対応 / Customer Specific and Consumer Focus';
        CapitalExpenditureList.add(ceSA2);      
        
        RFACapitalExpenditure__c ceSA3 = new RFACapitalExpenditure__c();
        ceSA3.Name = 'SPR-3';
        ceSA3.Record_Type_Name__c = 'Medium Project Request';
        ceSA3.RecordTypeId__c = rtId2;
        ceSA3.AssetCategory__c = '土地 / Land';
        ceSA3.InvestmentObjective__c = '効率性/生産性向上 / Efficiency ・ Productivity';
        CapitalExpenditureList.add(ceSA3);          
        
        
        Id rtId3 = RFAConstants.getRecordType('Small Project Request', 'Capital_Expenditure__c');
        
        RFACapitalExpenditure__c ceSB1 = new RFACapitalExpenditure__c();
        ceSB1.Name = 'OPR-1';
        ceSB1.Record_Type_Name__c = 'Small Project Request';
        ceSB1.RecordTypeId__c = rtId3;
        ceSB1.AssetCategory__c = '土地 / Land';
        ceSB1.InvestmentObjective__c = 'その他の戦略的対応 / Strategic Initiatives';
        CapitalExpenditureList.add(ceSB1);

        RFACapitalExpenditure__c ceSB2 = new RFACapitalExpenditure__c();
        ceSB2.Name = 'OPR-2';
        ceSB2.Record_Type_Name__c = 'Small Project Request';
        ceSB2.RecordTypeId__c = rtId3;
        ceSB2.AssetCategory__c = '土地 / Land';
        ceSB2.InvestmentObjective__c = '顧客ﾆｰｽﾞへの対応 / Customer Specific and Consumer Focus';
        CapitalExpenditureList.add(ceSB2);      
        
        RFACapitalExpenditure__c ceSB3 = new RFACapitalExpenditure__c();
        ceSB3.Name = 'OPR-3';
        ceSB3.Record_Type_Name__c = 'Small Project Request';
        ceSB3.RecordTypeId__c = rtId3;
        ceSB3.AssetCategory__c = '土地 / Land';
        ceSB3.InvestmentObjective__c = '効率性/生産性向上 / Efficiency ・ Productivity';
        CapitalExpenditureList.add(ceSB3);          
        
        insert CapitalExpenditureList;
        
        //return null;
    }
    
    public Attachment buildAttachment(Id RFAId) {
        Attachment attach = new Attachment();
        Blob body = Blob.valueOf('Some Text');
        attach.Body = body;
        // add the user entered name
        attach.Name = 'RFA_Attachment.pdf';
        attach.IsPrivate = false;
        // attach the pdf to the account
        attach.ParentId = RFAId;        
        insert attach;
        return attach;
    }
    
    public static void buildRFACommercialData() {
        CM_TestData inst = new CM_TestData();
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        inst.buildTaxRate();           
        
        User auser = inst.createRequester();
//        RFAUserRole__c approver = buildApprover(rfa.Id, auser);
//        RFAUserRole__c ppoc = buildPPOC(rfa.Id, auser);
//        RFAUserRole__c infoonly = buildInfoOnlyUsers(rfa.Id, auser);    
    	
    }
    
    
    public static RFA__c buildRFAGeneral() {
        CM_TestData inst = new CM_TestData();
        inst.buildCostCenter('Commercial');
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        inst.buildTaxRate();           
        RFA__c rfa = createTestRFAwithType('Draft', 'General Request', 1200);
        
        User auser = inst.createRequester();
        RFAUserRole__c approver = buildApprover(rfa.Id, auser);
        RFAUserRole__c ppoc = buildPPOC(rfa.Id, auser);
        RFAUserRole__c infoonly = buildInfoOnlyUsers(rfa.Id, auser);    
        return rfa;
    }
    
    private static testMethod void testRFAGeneral() {
        CM_TestData inst = new CM_TestData();
        inst.buildCostCenter('Commercial');
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        //inst.buildProfitCenterUserRole(testProfitCenterGeneral.id);
        inst.buildTaxRate();           
        
        Test.startTest();
        RFA__c rfa = createTestRFAwithType('Draft', 'General Request', 1200);
        Test.stopTest();
        
        User auser = inst.createRequester();
        RFAUserRole__c approver = buildApprover(rfa.Id, auser);
        RFAUserRole__c ppoc = buildPPOC(rfa.Id, auser);
        RFAUserRole__c infoonly = buildInfoOnlyUsers(rfa.Id, auser);
        
        Attachment attach = inst.buildAttachment(rfa.Id);
        
        RFA_Util_ObjectQuery instUtil = new RFA_Util_ObjectQuery();
        instUtil.getRFAwChilds(rfa.Id);
        instUtil.getAttachment(attach.Id);
        instUtil.getUserRole(approver.Id);
    }
    
    public static RFA__c buildRFACapital() {
        CM_TestData inst = new CM_TestData();
        inst.buildCostCenter('Commercial');
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        inst.buildTaxRate();
        
        inst.buildCapitalExpenditure();
        
        Test.startTest();
        integer amount = 70000000;
        RFA__c testRFACapital = createTestRFAwithType('Draft', 'Capital Project Request', amount);
        Test.stopTest();
        
        inst.buildAttachment(testRFACapital.Id);
        
        User auser = inst.createRequester();
        RFAUserRole__c approver = buildApprover(testRFACapital.Id, auser);
        RFAUserRole__c ppoc = buildPPOC(testRFACapital.Id, auser);
        RFAUserRole__c infoonly = buildInfoOnlyUsers(testRFACapital.Id, auser);  
        
        updateThreeYearCashSpentForRFA(testRFACapital, amount);  
        updateCapitalExpenditure(testRFACapital, amount); 
        
        return testRFACapital;      
    }    
    
    private static testMethod void testRFACapital() {   
        RFA__c testRFA = CM_TestData.buildRFACapital();
        
        RFAUserRole__c testRFARole = [Select Id, UserName__c, RFA__c 
            from RFAUserRole__c where RFA__c =: testRFA.Id limit 1];
    }
    
    public static RFA__c buildRFASmallA() {
        CM_TestData inst = new CM_TestData();
        inst.buildCostCenter('Commercial');
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        inst.buildTaxRate();
        
        inst.buildCapitalExpenditure();
             
        Test.startTest();
        integer amount = 40000000;
        RFA__c testRFASmallA = createTestRFAwithType('Draft', 'Medium Project Request', amount);
        Test.stopTest();
        
        inst.buildAttachment(testRFASmallA.Id);

        User auser = inst.createRequester();
        RFAUserRole__c approver = buildApprover(testRFASmallA.Id, auser);
        RFAUserRole__c ppoc = buildPPOC(testRFASmallA.Id, auser);
        RFAUserRole__c infoonly = buildInfoOnlyUsers(testRFASmallA.Id, auser);    
        
        updateThreeYearCashSpentForRFA(testRFASmallA, amount);  
        updateCapitalExpenditure(testRFASmallA, amount);   
        
        return testRFASmallA;        
    }    

    public static RFA__c buildRFASmallB() {
        CM_TestData inst = new CM_TestData();
        inst.buildCostCenter('Commercial');
        inst.buildProfitCenter();
        inst.buildProfitCenterUserRole(testProfitCenter.id);
        //inst.buildProfitCenterUserRole(testProfitCenterGeneral.id);
        inst.buildTaxRate();
        
        inst.buildCapitalExpenditure();   
        
        Test.startTest();     
        integer amount = 5000;
        RFA__c testRFASmallB = createTestRFAwithType('Draft', 'Small Project Request', amount);
        Test.stopTest();
        
        inst.buildAttachment(testRFASmallB.Id);
        
        User auser = inst.createRequester();
        RFAUserRole__c approver = buildApprover(testRFASmallB.Id, auser);
        RFAUserRole__c ppoc = buildPPOC(testRFASmallB.Id, auser);
        RFAUserRole__c infoonly = buildInfoOnlyUsers(testRFASmallB.Id, auser);          
        
        updateThreeYearCashSpentForRFA(testRFASmallB, amount);  
        updateCapitalExpenditure(testRFASmallB, amount);   
        
        return testRFASmallB;      
    }
    
    public static PageReference getPageReference(String page, Map<String, String> params) {
        String url = '/apex/'+page+'?';
        for (String param : params.keySet()) {
            url += param + '=' + params.get(param) + '&';
        }
        PageReference p = new PageReference(url);
        return p;
    }    
    
}