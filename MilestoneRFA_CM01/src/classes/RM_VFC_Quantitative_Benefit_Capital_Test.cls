/**

 */
@isTest
private class RM_VFC_Quantitative_Benefit_Capital_Test {

    static testMethod void quantitativeBenefitCapitalTest() {
    	
        //Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        //Id pId = createProject();
        //RFATestData td = new RFATestData();
        //td.buildProfitCenter();
        //td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        //pageRef.getParameters().put('Id', rId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        cls.editCancel();
        cls.changeYear();        
        cls.saveSynergy();
        
        
        Test.stopTest();
        
    }
    /*
    static testMethod void quantitativeBenefitCapitalSaveError01Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList01Error(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        cls.editCancel();
        cls.changeYear();
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
    
    static testMethod void quantitativeBenefitCapitalSaveError02Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList03Error(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
    /*
    static testMethod void quantitativeBenefitCapitalSaveError03Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList04Error(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
    
     static testMethod void quantitativeBenefitCapitalSaveError04Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList05Error(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
    
    static testMethod void quantitativeBenefitCapitalSaveOK01Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList02OK(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
    
    static testMethod void quantitativeBenefitCapitalSaveOK03Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList06OK(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        //cls.quantitativeSynergyHistory
        cls.saveSynergy();
        
        Test.stopTest();
        
    }
*/
    static testMethod void quantitativeBenefitCapitalSaveOK04Test() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList07OK(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.editCancel();
        cls.changeYear();        
        cls.saveSynergy();
        
        Test.stopTest();
        
    }

    /*
    static testMethod void quantitativeBenefitCapitalCancelTest() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        Id pId = createProject();
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        
        cls.editCancel();

        Test.stopTest();
        
    }
    
    static testMethod void quantitativeBenefitCapitalYearSelectTest() {
    	
        Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(RFA_Utility_Constants.sObj_RFA_APIName, RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        RFATestData td = new RFATestData();
        td.buildProfitCenter();
        td.buildTaxRate();
        
        PageReference pageRef = Page.Milestone_RFA_02_Quantitative_Benefit;
        pageRef.getParameters().put('Id', rId);
        
        Id proId = createProject();
        Id rfaId = createRFA(proId);
        createSynergyHistoryList01Error(rfaId);
        
        Test.startTest();
        
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new RFA__c());
        RM_VFC_Quantitative_Benefit_Capital cls = new RM_VFC_Quantitative_Benefit_Capital(sc);
        cls.editCancel();
        cls.changeYear();
        
        Test.stopTest();
        
    }
    */
    static void createSynergyHistoryList01Error(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh = new RM_Milestone_Synergy_Management_History__c();
    	msmh.RM_Name__c = 'テスト予算';
    	msmh.RM_RFA__c = rfaId;
    	msmh.RM_This_Year_Q1__c = 100;
    	msmh.RM_This_Year_Q2__c = 100;
    	msmh.RM_This_Year_Q3__c = 100;
    	msmh.RM_This_Year_Q4__c = 200;
    	//msmh.RM_This_Year_Formula__c
    	msmh.RM_This_Year__c = 500;
    	msmh.RM_Next_Year__c = 500;
    	msmh.RM_The_Year_After_Next__c = 500;
    		
    	msmhList.add(msmh);
    		
	    RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
	    
	    msmh2.RM_Acquisition_Method__c = '2.リース';
		msmh2.RM_Asset_Category__c = '02.建物';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
	    msmh2.RM_This_Year__c = 30000;
	    msmh2.RM_Next_Year__c = 10000;
	    msmh2.RM_The_Year_After_Next__c = 10000;    	
	    
	    msmhList.add(msmh2);	
    	
    	insert msmhList;
    }
    
    static void createSynergyHistoryList02OK(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh1 = new RM_Milestone_Synergy_Management_History__c();
    	msmh1.RM_Name__c = 'テスト予算';
    	msmh1.RM_RFA__c = rfaId;
    	msmh1.RM_This_Year_Q1__c = 10000;
    	msmh1.RM_This_Year_Q2__c = 10000;
    	msmh1.RM_This_Year_Q3__c = 10000;
    	msmh1.RM_This_Year_Q4__c = 20000;
    	//msmh.RM_This_Year_Formula__c
    	msmh1.RM_This_Year__c = 30000;
    	msmh1.RM_Next_Year__c = 10000;
    	msmh1.RM_The_Year_After_Next__c = 10000;
    		
    	msmhList.add(msmh1);	
    	
    	RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
    	
    	msmh2.RM_Acquisition_Method__c = '2.リース';
		msmh2.RM_Asset_Category__c = '02.建物';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
    	msmh2.RM_This_Year__c = 30000;
    	msmh2.RM_Next_Year__c = 30000;
    	msmh2.RM_The_Year_After_Next__c = 40000;    	
    	
    	msmhList.add(msmh2);	
    	system.debug('●●' + msmhList);
    	insert msmhList;
    }
    
    static void createSynergyHistoryList03Error(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh1 = new RM_Milestone_Synergy_Management_History__c();
    	msmh1.RM_Name__c = 'テスト予算';
    	msmh1.RM_RFA__c = rfaId;
    	msmh1.RM_This_Year_Q1__c = 10000;
    	msmh1.RM_This_Year_Q2__c = 10000;
    	msmh1.RM_This_Year_Q3__c = 10000;
    	msmh1.RM_This_Year_Q4__c = 20000;
    	//msmh.RM_This_Year_Formula__c
    	msmh1.RM_This_Year__c = 30000;
    	msmh1.RM_Next_Year__c = 10000;
    	msmh1.RM_The_Year_After_Next__c = 10000;
    		
    	msmhList.add(msmh1);	
    	
    	RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
    	
    	msmh2.RM_Acquisition_Method__c = '2.リース';
		msmh2.RM_Asset_Category__c = '';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
    	msmh2.RM_This_Year__c = 30000;
    	msmh2.RM_Next_Year__c = 10000;
    	msmh2.RM_The_Year_After_Next__c = 10000;    	
    	
    	msmhList.add(msmh2);	
    	
    	insert msmhList;
    }
    
    static void createSynergyHistoryList04Error(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh1 = new RM_Milestone_Synergy_Management_History__c();
    	msmh1.RM_Name__c = 'テスト予算';
    	msmh1.RM_RFA__c = rfaId;
    	msmh1.RM_This_Year_Q1__c = 10000;
    	msmh1.RM_This_Year_Q2__c = 10000;
    	msmh1.RM_This_Year_Q3__c = 10000;
    	msmh1.RM_This_Year_Q4__c = 20000;
    	//msmh.RM_This_Year_Formula__c
    	msmh1.RM_This_Year__c = 30000;
    	msmh1.RM_Next_Year__c = 10000;
    	msmh1.RM_The_Year_After_Next__c = 10000;
    		
    	msmhList.add(msmh1);	
    	
    	RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
    	
    	msmh2.RM_Acquisition_Method__c = '';
		msmh2.RM_Asset_Category__c = '';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
    	msmh2.RM_This_Year__c = 30000;
    	msmh2.RM_Next_Year__c = 10000;
    	msmh2.RM_The_Year_After_Next__c = 10000;    	
    	
    	msmhList.add(msmh2);	
    	
    	insert msmhList;
    }
    
    static void createSynergyHistoryList05Error(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh1 = new RM_Milestone_Synergy_Management_History__c();
    	msmh1.RM_Name__c = '';
    	msmh1.RM_RFA__c = rfaId;
    	msmh1.RM_This_Year_Q1__c = 10000;
    	msmh1.RM_This_Year_Q2__c = 10000;
    	msmh1.RM_This_Year_Q3__c = 10000;
    	msmh1.RM_This_Year_Q4__c = 20000;
    	//msmh.RM_This_Year_Formula__c
    	msmh1.RM_This_Year__c = 30000;
    	msmh1.RM_Next_Year__c = 10000;
    	msmh1.RM_The_Year_After_Next__c = 10000;
    		
    	msmhList.add(msmh1);	
    	
    	RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
    	
    	msmh2.RM_Acquisition_Method__c = '';
		msmh2.RM_Asset_Category__c = '';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
    	msmh2.RM_This_Year__c = 30000;
    	msmh2.RM_Next_Year__c = 10000;
    	msmh2.RM_The_Year_After_Next__c = 10000;    	
    	
    	msmhList.add(msmh2);	
    	
    	insert msmhList;
    }
    
    static void createSynergyHistoryList06OK(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh1 = new RM_Milestone_Synergy_Management_History__c();
    	msmh1.RM_Name__c = '';
    	msmh1.RM_RFA__c = rfaId;
    	msmh1.RM_This_Year_Q1__c = 10000;
    	msmh1.RM_This_Year_Q2__c = 10000;
    	msmh1.RM_This_Year_Q3__c = 10000;
    	msmh1.RM_This_Year_Q4__c = 20000;
    	//msmh.RM_This_Year_Formula__c
    	msmh1.RM_This_Year__c = 30000;
    	msmh1.RM_Next_Year__c = 10000;
    	msmh1.RM_The_Year_After_Next__c = 10000;
    		
    	msmhList.add(msmh1);	
    	
    	insert msmhList;
    }
    
    static void createSynergyHistoryList07OK(Id rfaId) {
    	List<RM_Milestone_Synergy_Management_History__c> msmhList = new List<RM_Milestone_Synergy_Management_History__c>();
    	
    	RM_Milestone_Synergy_Management_History__c msmh2 = new RM_Milestone_Synergy_Management_History__c();
    	
    	msmh2.RM_Acquisition_Method__c = '';
		msmh2.RM_Asset_Category__c = '';
		msmh2.RM_Asset_Category_Detail__c = '02.建物 - 営業拠点';
		msmh2.RM_Asset_Name__c = 'テストリース';
		msmh2.RM_Useful_Life__c = 31;
		msmh2.RM_Depreciation_Rule__c = '定額法';
    	msmh2.RM_This_Year__c = 30000;
    	msmh2.RM_Next_Year__c = 10000;
    	msmh2.RM_The_Year_After_Next__c = 10000;    	
    	
    	msmhList.add(msmh2);	
    	
    	insert msmhList;
    }

    
    static Id createRFA(Id proId) {
		
		RFA__c rfa = new RFA__c(RM_Related_Project__c = proId,
								RM_Request_Record_Type__c = 'Capital',
								RequestTitle__c = 'テスト案件',
								RM_Project_Classification_Capital__c = 'テストClass',
								RM_Objectives__c = '更新投資(老朽に伴う入替) ',
								RM_Function_L2__c = 'Finance',
								RM_Investment_Amounts__c = 100000,
								RM_Function_L3__c = 'Finance Integration',
								RM_Background_Current_Issue__c = 'テストIssue',
								RM_Project_Objectives__c = 'テストObjectives',
								RM_Estimated_Benefit_Overview__c = 'テストOverView'
								); 
			Database.SaveResult sr = database.insert(rfa,false);
			system.debug('●●' + rfa);
		return sr.getId();
		
    }

    
    static Id createProject() {
    	
    	Milestone1_Project__c p = createProject(false);
    	return p.Id;
    	
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