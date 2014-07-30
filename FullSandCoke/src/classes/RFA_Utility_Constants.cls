/*  
 *  Class            : RFA_Utility_Constants
 *  Author           : Pasona-Tquila
 *  Version History  : 1.0
 *  Creation         : 2014/05/20
 *  Assumptions      : N/A
 *  Description      : Class for Constants used in RFA.                                  
 */
public with sharing class RFA_Utility_Constants {

    /*
        Custom Button Label
    */    
    public static final String Button_Send_To_Circulation = 'Send to Circulation'; 
    public static final String Button_Approval_Recommend = 'Submit Approval Recommendation';
    public static final String Button_Show_Approver = 'Show Approvers';
    public static final String Button_Close_RFA = 'Close RFA';
    //public static final String Button_Return_To_Requester = 'Return to Requester';
    
    /*
        RFA Object (API: RFA__c)
    */
    public static final String sObj_RFA_APIName = 'RFA__c'; 
      
    //previous name is Stage; Label: Status / API: Stage__c (Picklist)   
    public static final String RFA_STATUS_DRAFT = 'Draft'; 
    public static final String RFA_STATUS_ReturnToRequester = 'Return to Requester';   
     
    public static final String RFA_STATUS_CIRCULATION = 'Circulation'; 
    
    public static final String RFA_STATUS_APPROVED = 'Approved';  
    public static final String RFA_STATUS_REJECTED = 'Rejected';          
    public static final String RFA_STATUS_CLOSED = 'Closed';
    
    /* Record Type API Name  */   
    //RFA Record Type Value   //'Small Project Request ( < 25MM )';
    //Small Project Request B -> Small Project Request  by Jia Hu on 2013/12/02
    //RECORDTYPE_SMALL_PROJECT_REQUEST_LessThan25MM -> RECORDTYPE_SMALL_PROJECT_REQUEST
    public static final String RECORDTYPE_SMALL_PROJECT_REQUEST = 'RFA_SmallProjectRequest'; //'Small Project Request'; 
    //Small Project Request A -> Medium Project Request
    //RECORDTYPE_SMALL_PROJECT_REQUEST_A -> RECORDTYPE_Medium_PROJECT_REQUEST
    public static final String RECORDTYPE_Medium_PROJECT_REQUEST = 'RFA_Small_Project_Request'; //'Medium Project Request';   
    public static final String RECORDTYPE_CAPITAL_PROJECT_REQUEST = 'RFA_CapitalProjectRequest'; //'Capital Project Request';
    public static final String RECORDTYPE_General_PROJECT_REQUEST = 'RFA_RFARequest'; //'General Request';
    //CokeOne
    public static final String RECORDTYPE_Travel_Expenses_REQUEST = 'Travel_Expenses_Request';
    public static final String RECORDTYPE_Entertainment_REQUEST = 'Entertainment_Request';
    //Commercial
    public static final String RECORDTYPE_Commercial_A_REQUEST = 'A_Approval_of_Pricing_Policy';
    public static final String RECORDTYPE_Commercial_B_REQUEST = 'B_Approval_of_Customer_Terms_Conditions';
    public static final String RECORDTYPE_Commercial_C_REQUEST = 'C_Price_Promotion_for_Marketing_Commercial_Leadership'; 
    															//'C_Price_Promotion_for_Marketing_Commercial_Leadership';
    public static final String RECORDTYPE_Commercial_D_REQUEST = 'D_Credit_Terms_Policies';    
    //Paperless
    public static final String RECORDTYPE_Seal_Paperless_REQUEST = 'Seal_Paperless_Request'; 
    //Milestone
    public static final String RECORDTYPE_Project_Initiate_REQUEST = 'Project_Initiate_Request';    
    public static final String RECORDTYPE_Project_Charter_REQUEST = 'Project_Charter_Request';      
    public static final String RECORDTYPE_Project_Close_Out_REQUEST = 'Project_Close_Out_Request';    
    public static final String RECORDTYPE_Project_Budget_Initiate_REQUEST = 'Capital_Budget_Initial_Request';    
 
    // Commercial Request Detail 
    public static final String RECORDTYPE_Detail_Constract_unit_price           = 'CM_01_Contract_unit_price';
    public static final String RECORDTYPE_Detail_Special_price_promotion_discount = 'CM_02_Special_price_promotion_discount';
    public static final String RECORDTYPE_Detail_FS_selling_price               = 'CM_03_FS_selling_price';
    public static final String RECORDTYPE_Detail_FS_commission_Variable         = 'CM_04_FS_commission_Variable';
    public static final String RECORDTYPE_Detail_FS_commission_Fixed            = 'CM_05_FS_commission_Fixed';  
    public static final String RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other     = 'CM_06_KeyMoney_Rebate_Spot_Other';   
    public static final String RECORDTYPE_Detail_Only_in_the_case_of_Rebate     = 'CM_07_Only_in_the_case_of_Rebate'; 
    public static final String RECORDTYPE_Detail_Other_support                  = 'CM_08_Other_support';  
    public static final String RECORDTYPE_Detail_Promotion_OtherExpense         = 'CM_09_Promotion_OtherExpense';   
    public static final String RECORDTYPE_Detail_Promotion_CooperationSample_Sampling = 'CM_10_Promotion_CooperationSample_Sampling';   
    public static final String RECORDTYPE_Detail_NonStandard_Equipment          = 'CM_a_Nonstandard_Equipment'; 
    public static final String RECORDTYPE_Detail_VendingEquipmentParts          = 'CM_b_Vending_Equipment_parts'; 
    public static final String RECORDTYPE_Detail_IncidentalWork                 = 'CM_c_Incidental_work';    
    public static final String RECORDTYPE_Detail_VendingEquipmentLease          = 'CM_d_Vending_Equipment_Lease'; 
    public static final String RECORDTYPE_Detail_Equipment_retirement           = 'CM_e_Equipment_retirement';
 
 
    //Apex Sharing Reasons
    public static final String RowCause_Requestor = 'KORequestor__c'; //Label.RFA_CL076; //KORequestor
    public static final String RowCause_Approver = 'Approver__c';
    public static final String RowCause_PCReviewer = 'PCReviewer__c';
    public static final String RowCause_Reviewer = 'Reviewer__c';
    
    
    
    /*
        error msg of RFA object
    */
    //PrimaryCOACategory__c
    public static final String Primary_COA_Category_MandatoryMsg 
        = 'Select the Primary COA Category';
    

    /*
        RFA Approver/User Object (API: RFAUserRole__c)
    */
    public static final String sObj_RFAUserRole_APIName = 'RFAUserRole__c'; 
    
    public static final String RTLabel_RFAUserRole_Approver = 'Approver'; 
    public static final String RTLabel_RFAUserRole_PPOC = 'Primary Point of Contact'; 
    public static final String RTLabel_RFAUserRole_InfoOnly = 'Info Copy Only'; 
    
    public static final String RFAUserRole_RTAPIName_Approver = 'RUR_Approver'; 
    public static final String RFAUserRole_RTAPIName_PPOC = 'RUR_PrimaryPointofContact'; 
    public static final String RFAUserRole_RTAPIName_InfoOnly = 'RUR_InfoCopyOnly';     
    //will move this
    public static final String RFAUserRole_RTAPIName_InfoOnlyAfterApply = 'RM_Info_Copy_After_Apply';
    
    //Approval Recommendation (API: ApprovalRecommendation__c):Picklist
    public static final String ApproverRecommend_UnconditionalApproved = 'Unconditionally Approved / 承認（条件なし）'; 
    //public static final String ApproverRecommend_UnconditionalApproved_JP = '承認（条件なし）';
    public static final String ApproverRecommend_ConditionalApproved = 'Conditionally Approved / 承認（条件付き）'; 
    //public static final String ApproverRecommend_ConditionalApproved_JP = '承認（条件付き）';
    public static final String ApproverRecommend_Rejected = 'Rejected / 否認'; 
    //public static final String ApproverRecommend_Rejected_JP = '否認';
    public static final String ApproverRecommend_AwaitingApproval = 'Awaiting Approval / 承認待ち'; 
    //public static final String ApproverRecommend_AwaitingApproval_JP = '承認待ち';
    public static final String ApproverRecommend_ReturnToRequester = 'Return to Requester / 差し戻し'; 
    
    public static final String Approver_Source_COA = 'COA'; 
    public static final String Approver_Source_COA_Group = 'COA Group'; 
    public static final String Approver_Source_COA_Single = 'COA Single'; 
    public static final String Approver_Source_Manager = 'Manager'; 
    public static final String Approver_Source_CokeOneManager = 'CokeOne Manager'; 
    public static final String Approver_Source_Approver = 'Approver'; 
    public static final String Approver_Source_Requester = 'Requester'; 
    public static final String Approver_Source_CapitalMgmt = 'Capital Mgmt.';      
    public static final String Approver_Source_TreasuryMgr = 'Treasury Mgr'; 
    public static final String Approver_Source_FixAssetMgr = 'Fix Asset Mgr'; 
    public static final String Approver_Source_ELT = 'ELT'; 
    
    public static final String Approver_Source_InfoCopy = 'Info Copy';     
    public static final String Approver_Source_InfoCopy_Manager = 'Info Copy - Manager';  
    public static final String Approver_Source_InfoCopy_CorpAdmin = 'Info Copy - Corporate Administration';   
    public static final String Approver_Source_InfoCopy_BOD = 'Info Copy - BOD';  
    
    public static final String Approver_Source_CokeOne_ProjectFinance = 'CokeOne';
    public static final String Approver_Source_CokeOne_Gr2 = 'CokeOne Gr.2';

    //Milestone Request
    public static final String Approver_Source_Project = 'Project';
        
    //Seal Paperless Request
    public static final String Approver_Source_Seal = 'Seal';
    
    public static final String Approver_Source_Appendix3_B2 = 'Appendix 3.B.2';
    public static final String Approver_Source_Appendix3_D = 'Appendix 3.D';
    
    
    /*
        Approval Process Object (API: ApprovalProcess__c)
    */    
    public static final String ApprovalProcess_Not_Started = 'Not Started'; 
    public static final String ApprovalProcess_In_Progress = 'In Progress';
    public static final String ApprovalProcess_Completed = 'Completed';
    public static final String ApprovalProcess_Not_Completed = 'Not Completed';
    
    /*
        COA Object (API: COA__c)
    */      
    public static final String sObj_COA_APIName = 'COA__c'; 
    
    public static final String COA_RTAPIName_Matrix = 'COA_Matrix'; 
    public static final String COA_RTAPIName_Appendix3_B1ToB7 = 'COA_Appendix_3_B_1_To_B_7'; //'COA_Appendix_3_B_1_To_B_6';
    public static final String COA_RTAPIName_Appendix3_B1ToB7WithB8 = 'COA_Appendix_B_1_B_7_B_8';
    //public static final String COA_RTAPIName_Appendix3_B1 = 'COA_Appendix_3_B_1';     
    //public static final String COA_RTAPIName_Appendix3_B2 = 'COA_Appendix_3_B_2';  
    //public static final String COA_RTAPIName_Appendix3_B3 = 'COA_Appendix_3_B_3';      
    //public static final String COA_RTAPIName_Appendix3_B4 = 'COA_Appendix_3_B_4';      
    //public static final String COA_RTAPIName_Appendix3_B5 = 'COA_Appendix_3_B_5';     
    //public static final String COA_RTAPIName_Appendix3_B6 = 'COA_Appendix_3_B_6';     
    //public static final String COA_RTAPIName_Appendix3_B7 = 'COA_Appendix_3_B_7';         
    //public static final String COA_RTAPIName_Appendix3_B8 = 'COA_Appendix_3_B_8'; 
    public static final String COA_RTAPIName_Appendix3_C  = 'COA_Appendix_3_C';      
    public static final String COA_RTAPIName_Appendix3_D  = 'COA_Appendix_3_D';   
        
    public static final String Threshold_Type_All = 'All'; 
    public static final String Threshold_Type_Value = 'Value'; 
    public static final String Threshold_Type_ValueWithRT = 'Value with Record Type'; 
    public static final String Threshold_Type_Budgeted = 'Budgeted'; 
    
    public static final String Group1 = 'Gr.1'; 
    public static final String Group2 = 'Gr.2'; 
    public static final String Group3 = 'Gr.3'; 
    public static final String Group4 = 'Gr.4'; 
    public static final String Group5 = 'Gr.5'; 
    public static final String Group6 = 'Gr.6'; 
    public static final String Group7 = 'Gr.7'; 
    
    /*
        Profit Center Object (API: ProfitCenter__c)
    */  
    //Profit Center Name  API: ProfitCenterName__c / Text(100)
    
    public static final String ProfitCenter_Name_CCEJ = 'CCEJ'; 
    
    /*
        Profit Center User Role Object (API: ProfitCenterUserRole__c)
    */
    //User Type (UserType__c)
    //public static final String ProfitCenterUserRole_UserType_Coordinator = 'Coordinator';   
    public static final String ProfitCenterUserRole_UserType_Viewer = 'Viewer - All';   
    public static final String ProfitCenterUserRole_UserType_Capital = 'Viewer - Capital Only';     

    
    
    /*
        Cost Center Object (API: Cost_Center__c)
    */
    //Field Lable: Cost Center Number
    public static final String CostCenter_Name = '0001';    
    
    /*
        Old: RFA_TaxRate Object (API: RFA_TaxRate__c)
        New: Financial Constant (API: Financial_Constant__c)
        
    */
    //Field Lable: RFA_TaxRate Name 
    //public static final String TaxRate_Name = '0001';     
    
    public static final String sObj_FinancialConstant_APIName = 'Financial_Constant__c'; 
    
    public static final String FinancialConstant_RT_TaxRate = 'Tax_Rate';
    public static final String FinancialConstant_RT_WACC = 'WACC';
    public static final String FinancialConstant_RT_ConsumptionTax = 'Consumption_Tax';
    
    
    
    /*
        Related Document
    */
    public static final String Doc_Name_Investment_Category = 'Investment_Objective_Definition';        
    public static final String Doc_Name_Asset_Category = 'Asset_Category_Definition';
    
    
    /*
        =====================
            Config
        =====================
    */
    /*
        User Object
    */      
    public static final String SysAdminProfile  = 'System Administrator';
    public static final String SysAdminJPProfile  = 'システム管理者';
    
    public static final String RFASysAdminProfile = 'RFA - System Administrator';
    
    public static final String RFACapitalMgmtProfile = 'RFA - Capital Management Admin';
    public static final String RFAStandardProfile = 'RFA - Standard User';
    
    public static final String RFA_System_User = 'RFA System';
    
    
    /*
    	Public Group
    */
	public static final String PublicGroupName_SealAdminTeam = 'Company_Seals_Member'; //'Seal_Admin_Team';    
    
    /*
    	Projects Object (API:Milestone1_Project__c)
    */
    public static final String ApprovalSetp_InitiateApproved = 'Initiate Approved';
    public static final String ApprovalSetp_CharterApproved = 'Charter Approved';
    public static final String ApprovalSetp_CloseOutApproved = 'Close-Out Approved';
    
    
    /*
   		the mehtods below will be moved to other classes
    */
    
    public static Id getOrgWideEmailAddressId() {
        OrgWideEmailAddress[] owea = [select Id, IsAllowAllProfiles, DisplayName 
            from OrgWideEmailAddress where DisplayName =: RFA_System_User];
        system.debug('------ OrgWideEmailAddress[]: ' + owea);
        if(owea != null && owea.size() > 0) {
            return owea[0].Id;
        }
        return null;
    }
  
    public static boolean isRFAAdmin(String strProfileName)
    {       
        if(
            strProfileName == SysAdminProfile || // System Administrator
            strProfileName == SysAdminJPProfile  || //for Japanese
            strProfileName == RFASysAdminProfile // RFA - System Administrator           
          )
        { 
            return true; // user is a RFA system admin          
        }         
        return false;
    }    
    
    public static boolean evaluateIfAdmin(Id profileId)
    {
         boolean check = false;
         for(Profile profile : [
            Select Id From Profile 
                Where Name =: RFASysAdminProfile //'RFA - System Administrator' 
                    //OR Name = 'RFA - Capital Management Admin' 
                    OR Name =: SysAdminProfile //'System Administrator' 
                    OR Name =: SysAdminJPProfile //'システム管理者' 
                    ])
         {
             if(
                //UserInfo.getProfileId() 
                profileId == profile.Id) {
                check = true;
             }  
         }
         return check;
    }    
    
    public static Id getRFAStandardUserProfileId()
    {
        return [Select Id, Name FROM Profile where Name =: RFAStandardProfile LIMIT 1].Id;
    }   
    
    
    public static Id getRFACapitalMgmtProfileId()
    {
        return [Select Id, Name FROM Profile where Name =: RFACapitalMgmtProfile LIMIT 1].Id;
    }       
    
    /*
        RecordType Object: using label not API name
        Id approverRTId = RFAConstants.getRecordType('Approver', 'RFAUserRole__c');
        Record Type Label:  Approver
        Record Type Name:   RUR_Approver
    */  
    public static Id getRecordType(String pName, String sObjectType)
    {
        system.debug('------- getRecordType() RT Name: ' + pName + ' Object: ' + sObjectType);
        return [Select Id, Name FROM RecordType Where SObjectType =: sObjectType AND Name =: pName].Id;
    }   
  	
  	/* 
	 * getRecordType()
	 * parameter : Id RecordType.Id
	 *           : String SObjectType   'RFA__c' 
	 * return String RecordType.DeveloperName
	 * add by yoshinari 2014/05/23
	 */
    public static String getRecordType(Id pId, String sObjectType)
    {
        system.debug('------- getRecordType() RT Id: ' + pId + ' Object: ' + sObjectType);
        return [Select Id, Name, DeveloperName FROM RecordType Where SObjectType =: sObjectType AND Id =: pId].DeveloperName;
    }   
  
    
    public static boolean isBlank(String str) 
    {
        return str == null || str.trim() == null || str.trim().length() == 0;
    }    
    
}