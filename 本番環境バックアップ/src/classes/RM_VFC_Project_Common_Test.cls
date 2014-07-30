/**
 *  RM_VFC_Project_Common Test Class
 */
@isTest
private class RM_VFC_Project_Common_Test {


    static testMethod void Test_RM_VFC_Project_Common_Initiate() {
        
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST);
        Milestone1_Project__c p = createProject();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        
        Test.stopTest();
        
    }
    
    static testMethod void Test_RM_VFC_Project_Common_Charter() {
        
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST);
        Milestone1_Project__c p = createProject();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        
        Test.stopTest();
        
    }
    
    static testMethod void Test_RM_VFC_Project_Common_CloseOut() {
        
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Milestone1_Project__c p = createProject();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        
        Test.stopTest();
        
    }
    
    static testMethod void Test_SaveOfCharter() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST);
        Milestone1_Project__c p = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.SaveOfCharter();
        
        Test.stopTest();
    	
    }
    
    static testMethod void Test_SaveAndNewOfCharter() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST);
        Milestone1_Project__c p = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.isRfa();
        cls.SaveAndNewOfCharter();
        
        Test.stopTest();
    	
    }
    
    static testMethod void Test_SaveOfCloseOut() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Milestone1_Project__c p = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.saveOfCloseOut();
        
        Test.stopTest();
    	
    }
    
    static testMethod void Test_SaveAndNewOfCloseOut() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Milestone1_Project__c p = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', p.Id);
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.isRfa();
        cls.saveAndNewOfCloseOut();
        
        Test.stopTest();
    	
    }
    
    static testMethod void Test_getProjectData() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Milestone1_Project__c p = createProject(true);
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', String.valueOf(p.Id));
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.projectId = p.Id;
        cls.getProjectData();
        
        Test.stopTest();
    	
    }
    
    static testMethod void Test_createMilestoneHistory() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST);
        Milestone1_Project__c p = createProject(true);
        Milestone1_Milestone__c m = new Milestone1_Milestone__c();
        m.Project__c = p.Id;
        insert m;
        
        Test.startTest();
        
        PageReference pageRef = Page.RM_VFC_Project_Initiate;
        pageRef.getParameters().put('RecordType', rId);
        pageRef.getParameters().put('retURL', 'hogehoge');
        pageRef.getParameters().put('pjid', String.valueOf(p.Id));
        
        Test.setCurrentPage(pageRef);
        Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Project_Common cls = new RM_VFC_Project_Common(sc);
        cls.projectId = p.Id;
        cls.rfa.RM_Related_Project__c = p.Id;
        cls.SaveOfCharter();
        
        Test.stopTest();
    	
    }
    
    static Milestone1_Project__c createProject() {
    	
    	Milestone1_Project__c p = createProject(false);
    	return p;
    	
    	return null;
    }
    
    static Milestone1_Project__c createProject(boolean exe) {
    	
    	Milestone1_Project__c p = new Milestone1_Project__c();
    	p.Name = 'test Method';
    	if (exe) {
    		insert p;
    	}
    	return p;
    	
    	return null;
    }
}