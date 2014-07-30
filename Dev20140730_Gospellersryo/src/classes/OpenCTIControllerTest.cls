@isTest
private class OpenCTIControllerTest {
    
    private static final String CONTACT_FIRST_NAME = 'みつひろ';
    private static final String PHONE_ANI = '09066525540';
    private static  String CASE_NO;
        
    private static void createTestData(){
    	Account acc = new Account();
        acc.name = '株式会社セールスフォース・ドットコム';
        insert acc;
        
        Contact con = new Contact();
    	con.FirstName = CONTACT_FIRST_NAME;
        con.LastName = 'おかもと';
        con.Phone = PHONE_ANI;
        con.email = 'mokamoto@salesforce.com';
        con.account = acc;
        insert con;
        
        Case cas = new Case();
        cas.subject = 'テストケース';
        cas.contact = con;
        
        insert cas;
        CASE_NO = [SELECT caseNumber FROM Case WHERE Id = :cas.Id Limit 1].caseNumber;
    }
    
    
    private static testMethod void testDoSearch() {
		OpenCTIControllerTest.createTestData();
        Test.startTest();

        OpenCTIController openCTIController = new OpenCTIController();       
        openCTIController.contactName = CONTACT_FIRST_NAME;
        openCTIController.doSearch();
        System.assert(OpenCTIController.contactList.size() > 0, 'Result list should contain at least one contact');       
        Test.stopTest();
    }

    private static testMethod void testGetContacts() {
        OpenCTIControllerTest.createTestData();
        Test.startTest();
        System.assert(OpenCTIController.getContacts(PHONE_ANI).contains(PHONE_ANI), 'Result should contain at least one contact with ANI');
        Test.stopTest();
    }
    
    private static testMethod void testGetCases() {
        OpenCTIControllerTest.createTestData();
        Test.startTest();
        System.assert(openCTIController.getCases(CASE_NO).contains(CASE_NO), 'Result should contain at least one case with this case number');
        Test.stopTest();
    }
}