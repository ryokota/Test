/**
 * RM_VFC_Project_CopyCtrl.cls
 */
@isTest
private class RM_VFC_Project_CopyCtrl_Test {

	private static String PROJECT_API = 'Milestone1_Project__c';
	private static String BI_RECORDTYPE = 'BusinessIntegration';

    static testMethod void Test_RM_VFC_Project_CopyCtrl_ApprovalStep_null() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		Test.startTest();
		
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_CopyCtrl ctrl = new RM_VFC_Project_CopyCtrl(sc);
		
		Test.stopTest();
    }
    
    static testMethod void Test_RM_VFC_Project_CopyCtrl_ApprovalSetp_Initiate() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		p.RM_Approval_Status__c = RFA_Utility_Constants.ApprovalSetp_InitiateApproved;
		update p;
		
		Test.startTest();
		
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_CopyCtrl ctrl = new RM_VFC_Project_CopyCtrl(sc);
		
		Test.stopTest();
    }
    
    static testMethod void Test_RM_VFC_Project_CopyCtrl_ApprovalSetp_Charter() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		p.RM_Approval_Status__c = RFA_Utility_Constants.ApprovalSetp_CharterApproved;
		update p;
		
		Test.startTest();
		
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_CopyCtrl ctrl = new RM_VFC_Project_CopyCtrl(sc);
		
		Test.stopTest();
    }
    
    static testMethod void Test_RM_VFC_Project_CopyCtrl_ApprovalSetp_CloseOut() {
		
		//Test Date Create
		Id rId = Utility_Helper_RecordType.getRecordTypeIdByAPIName(PROJECT_API, BI_RECORDTYPE);
		Milestone1_Project__c p = createProject(rId);
		
		p.RM_Approval_Status__c = RFA_Utility_Constants.ApprovalSetp_CloseOutApproved;
		update p;
		
		Test.startTest();
		
		Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(p);
		RM_VFC_Project_CopyCtrl ctrl = new RM_VFC_Project_CopyCtrl(sc);
		
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