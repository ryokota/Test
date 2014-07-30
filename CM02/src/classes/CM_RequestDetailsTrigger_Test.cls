@isTest(SeeAllData=false) 
private class CM_RequestDetailsTrigger_Test {
    
    // change recordtype
    static testMethod void changeRecrodTypeTest() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        String companyList = 'TOKYO'; // multi picklist ';'
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					null, //2
					null, //3
					null, //4
					null, //5 
					null,  //6
					null,  //7
					null, //8
					null, //9
					null,	//10
					// a.〜e.
					null,	//a 
					null, 	//b
					null, 	//c
					null, 	//d
					null,					//e
					companyList 
		);

		CM_RequestDetails__c testRequestDetail = new CM_RequestDetails__c();
		testRequestDetail.CM_RFA__c = testRFA.id;
		testRequestDetail.RecordTypeId = CM_TestData.getRecordTypeId('CM_RequestDetails__c', RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price);
		testRequestDetail.CM_Contract_term_from__c = System.today();
		testRequestDetail.CM_Contract_term_to__c = System.today();
		testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
		testRequestDetail.CM_Description__c = 'desciption/test';
		insert testRequestDetail;
		
		// change RecordType
		testRequestDetail.RecordTypeId = CM_TestData.getRecordTypeId('CM_RequestDetails__c', RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount);
		try {
			update testRequestDetail;
		} catch (System.Exception se) {
			
		}
		Test.stopTest();
	}    

    // Approved delete check
    static testMethod void deleteRecrodTypeTest() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        // RFA__c 
        String companyList = 'TOKYO'; // multi picklist
        
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_APPROVED,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					null, //2
					null, //3
					null, //4
					null, //5 
					null,  //6
					null,  //7
					null, //8
					null, //9
					null,	//10
					// a.〜e.
					null,	//a 
					null, 	//b
					null, 	//c
					null, 	//d
					null,					//e 
					companyList
		);

		CM_RequestDetails__c testRequestDetail = new CM_RequestDetails__c();
		testRequestDetail.CM_RFA__c = testRFA.id;
		testRequestDetail.RecordTypeId = CM_TestData.getRecordTypeId('CM_RequestDetails__c', RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price);
		testRequestDetail.CM_Contract_term_from__c = System.today();
		testRequestDetail.CM_Contract_term_to__c = System.today();
		testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
		testRequestDetail.CM_Description__c = 'desciption/test';
		insert testRequestDetail;
		
		// delete request detail
		try {
			delete testRequestDetail;
		} catch (System.Exception se) {
		}
		Test.stopTest();
	}    

    // duplicate recordtype
    static testMethod void duplicateRecrodTypeTest() {
        Test.startTest();
        CM_TestData.buildRFACommercialData();
        String companyList = 'TOKYO'; // multi picklist ';''
        // RFA__c 
		RFA__c testRFA = CM_TestData.createTestRFA_TypeB_B(
					RFA_Utility_Constants.RFA_STATUS_DRAFT,
					'B. Approval of Customer Terms and Condition',
					'4. Decision/change of VM standard wholesale price',
					// 01.〜10.
					'Category A', //1
					null, //2
					null, //3
					null, //4
					null, //5 
					null,  //6
					null,  //7
					null, //8
					null, //9
					null,	//10
					// a.〜e.
					null,	//a 
					null, 	//b
					null, 	//c
					null, 	//d
					null,					//e
					companyList 
		);

		CM_RequestDetails__c testRequestDetail = new CM_RequestDetails__c();
		testRequestDetail.CM_RFA__c = testRFA.id;
		testRequestDetail.RecordTypeId = CM_TestData.getRecordTypeId('CM_RequestDetails__c', RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price);
		testRequestDetail.CM_Contract_term_from__c = System.today();
		testRequestDetail.CM_Contract_term_to__c = System.today();
		testRequestDetail.CM_Automatic_Renewed__c = 'Yes';
		testRequestDetail.CM_Description__c = 'desciption/test';
		insert testRequestDetail;
		
		// duplicate RecordType
		try {
			CM_RequestDetails__c testRequestDetail2 = new CM_RequestDetails__c();
			testRequestDetail2.CM_RFA__c = testRFA.id;
			testRequestDetail2.RecordTypeId = CM_TestData.getRecordTypeId('CM_RequestDetails__c', RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price);
			testRequestDetail2.CM_Contract_term_from__c = System.today();
			testRequestDetail2.CM_Contract_term_to__c = System.today();
			testRequestDetail2.CM_Automatic_Renewed__c = 'No';
			testRequestDetail2.CM_Description__c = 'desciption/test';
			insert testRequestDetail2;
		} catch (System.Exception se) {
		}
		Test.stopTest();
	}    
}