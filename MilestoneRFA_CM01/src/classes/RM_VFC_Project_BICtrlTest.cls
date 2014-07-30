/**
 * RM_VFC_Project_BICtrl.cls
 */
@isTest
private class RM_VFC_Project_BICtrlTest {

	private static String PROJECT_API = 'Milestone1_Project__c';
	private static String BI_RECORDTYPE = 'BusinessIntegration';
	private static String COKE_RECORDTYPE = 'CokeOne';

	/*
	 * コンストラクタ 新規作成
	*/
	static testMethod void Test_RM_VFC_Project_BICtrl_NewRecord() {
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		Test.stopTest();
	}
	
	/*
	 * コンストラクタ 編集
	*/
	static testMethod void Test_RM_VFC_Project_BICtrl_EditRecord() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		Test.stopTest();
	}
	
	/*
	 * biCheck 新規作成 レコードタイプBI
	 * レコードタイプBIを新規作成する場合は、VF画面を使用する為、nullが返されること
	*/
	static testMethod void Test_biCheck_New_BiRecordType() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		pageReference retpf = ctrl.biCheck();
		
		//BIレコードタイプの場合はnullが返されること
		System.assertEquals(retpf, null);
		
		Test.stopTest();
		
	}
	
	/*
	 * biCheck 新規作成 レコードタイプBI以外
	 * レコードタイプBI以外を新規作成する場合は、標準画面を使用する為、標準画面が返されること
	*/
	static testMethod void Test_biCheck_New_NotBiRecordType() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, COKE_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		pageReference retpf = ctrl.biCheck();
		
		//BIレコードタイプ以外の場合はnull以外が返されること
		System.assertNotEquals(retpf, null);
		
		Test.stopTest();
		
	}
	
	/*
	 * biCheck 編集 レコードタイプBI
	 * レコードタイプBIを編集する場合は、VF画面を使用する為、nullが返されること
	*/
	static testMethod void Test_biCheck_Edit_BiRecordType() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		pageReference retpf = ctrl.biCheck();
		
		//BIレコードタイプの場合はnullが返されること
		System.assertEquals(retpf, null);
		
		Test.stopTest();
		
	}
	
	/*
	 * biCheck 編集 レコードタイプBI以外
	 * レコードタイプBI以外を編集する場合は、標準画面を使用する為、標準画面が返されること
	*/
	static testMethod void Test_biCheck_Edit_NotBiRecordType() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, COKE_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		pageReference retpf = ctrl.biCheck();
		
		//BIレコードタイプ以外の場合はnull以外が返されること
		System.assertNotEquals(retpf, null);
		
		Test.stopTest();
		
	}
	
	/*
	 * biSave 新規作成
	 * プロジェクトを新規作成する
	*/
	static testMethod void Test_biSave_New() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.biSave();
		
		Test.stopTest();
	}
	
	/*
	 * biSave 新規作成
	 * プロジェクトとプロジェクトチームを新規作成する
	*/
	static testMethod void Test_biSave_New_Team() {
		
		//Test Date Create
		RFATestData testData = new RFATestData();
		User u = testData.createUser(RFAConstants.getRFAStandardUserProfileId(), 'biSave', 'biSave');
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.ProjectTeamToNo mp = ctrl.projectTeams.Records.get(0);
		mp.record.UserName__c = u.Id;
		
		ctrl.biSave();
		
		Test.stopTest();
	}
	
	/*
	 * biSave 新規作成
	 * プロジェクトとプロジェクトチームを新規作成する
	 * プロジェクトチームに同一ユーザを指定した場合はエラー
	*/
	static testMethod void Test_biSave_New_Team_DuplicateErr() {
		
		//Test Date Create
		RFATestData testData = new RFATestData();
		User u = testData.createUser(RFAConstants.getRFAStandardUserProfileId(), 'biSave', 'biSave');
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.ProjectTeamToNo mp = ctrl.projectTeams.Records.get(0);
		mp.record.UserName__c = u.Id;
		mp = ctrl.projectTeams.Records.get(1);
		mp.record.UserName__c = u.Id;
		
		ctrl.biSave();
		
		Test.stopTest();
	}
	
	/*
	 * biSave 新規作成
	 * プロジェクトとマイルストーンを新規作成する
	*/
	static testMethod void Test_biSave_New_Milestone() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.MilestoneToNo m = ctrl.Milestones.Records.get(0);
		m.record.Name = 'Test Method Mileston 1';
		
		ctrl.biSave();
		
		Test.stopTest();
	}
	
	/*
	 * biSaveAndNew 新規作成 保存＆新規
	 * プロジェクトを新規作成する 保存＆新規
	*/
	static testMethod void Test_biSaveAndNew_New() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		ctrl.biSaveAndNew();
		
		Test.stopTest();
	}
	
	/*
	 * allViewChange
	*/
	static testMethod void Test_allViewChange() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		ctrl.allViewChange();
		
		Test.stopTest();
	}
	
	/*
	 * addRowsByProjectTeam
	*/
	static testMethod void Test_addRowsByProjectTeam() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		ctrl.addRowsByProjectTeam();
		
		Test.stopTest();
	}
	
	/*
	 * addRowsByMilestoneTeam
	*/
	static testMethod void Test_addRowsByMilestoneTeam() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		
		ctrl.addRowsByMilestoneTeam();
		
		Test.stopTest();
	}
	
	/*
	 * setTeamFunction
	*/
	static testMethod void Test_setTeamFunction() {
		
		//Test Date Create
		RFATestData testData = new RFATestData();
		User u = testData.createUser(RFAConstants.getRFAStandardUserProfileId(), 'biSave', 'biSave');
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.projectTeamNo = 1;
		ctrl.projectTeamUserId = u.Id;
		
		ctrl.setTeamFunction();
		
		Test.stopTest();
	}
	
	/*
	 * setTeamFunction
	*/
	static testMethod void Test_setTeamFunction_DuplicateErr() {
		
		//Test Date Create
		RFATestData testData = new RFATestData();
		User u = testData.createUser(RFAConstants.getRFAStandardUserProfileId(), 'biSave', 'biSave');
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.ProjectTeamToNo mp = ctrl.projectTeams.Records.get(0);
		mp.record.UserName__c = u.Id;
		
		ctrl.projectTeamNo = 2;
		ctrl.projectTeamUserId = u.Id;
		
		ctrl.setTeamFunction();
		
		Test.stopTest();
	}
	
	/*
	 * deleteMilestone 未登録
	 * 選択したマイルストーンを削除する
	*/
	static testMethod void Test_deleteMilestone() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.MilestoneToNo m = ctrl.Milestones.Records.get(0);
		m.record.Name = 'Test Method Mileston 1';
		ctrl.milestoneNo = 1;
		
		ctrl.deleteMilestone();
		
		Test.stopTest();
	}
	
	/*
	 * deleteMilestone 行番号の採番
	 * 選択したマイルストーンを削除する
	*/
	static testMethod void Test_deleteMilestone_reNumbering() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.addRowsByMilestoneTeam();
		ctrl.addRowsByMilestoneTeam();
		ctrl.milestoneNo = 1;
		
		ctrl.deleteMilestone();
		
		Test.stopTest();
	}
	
	/*
	 * deleteMilestone 登録済み
	 * 選択したマイルストーンを削除する
	*/
	static testMethod void Test_deleteMilestone_Registered() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		RM_VFC_Project_BICtrl.MilestoneToNo m = ctrl.Milestones.Records.get(0);
		m.record.Name = 'Test Method Mileston 1';
		
		ctrl.biSave();
		
		ctrl.milestoneNo = 1;
		ctrl.deleteMilestone();
		
		Test.stopTest();
	}
	
	/*
	 * setRendered
	 * isAllView true
	*/
	static testMethod void Test_setRendered_isAllView() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.pageRedered.isAllView = true;
		ctrl.allViewChange();
		
		Test.stopTest();
	}
	
	/*
	 * setRendered
	 * approval step Initiate
	*/
	static testMethod void Test_setRendered_Initiate() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.pageRedered.approvalStep = RFA_Utility_Constants.ApprovalSetp_InitiateApproved;
		ctrl.allViewChange();
		
		Test.stopTest();
	}
	
	/*
	 * setRendered
	 * approval step chater
	*/
	static testMethod void Test_setRendered_Chater() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		
		Test.startTest();
		
		PageReference pf = Page.RM_VFC_Project_BI;
		pf.getParameters().put('RecordType', rId);
		
		Test.setCurrentPage(pf);
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(new Milestone1_Project__c());
		RM_VFC_Project_BICtrl ctrl = new RM_VFC_Project_BICtrl(sc);
		ctrl.pageRedered.approvalStep = RFA_Utility_Constants.ApprovalSetp_CharterApproved;
		ctrl.allViewChange();
		
		Test.stopTest();
	}
	
	/*
	 * プロジェクト作成
	*/
	static private Milestone1_Project__c createProject(Id rId) {
		
		Milestone1_Project__c p = new Milestone1_Project__c();
		p.RecordTypeId = rId;
		p.Name = 'Test Method Project 1';
		
		insert p;
		return p;
		
	}
}