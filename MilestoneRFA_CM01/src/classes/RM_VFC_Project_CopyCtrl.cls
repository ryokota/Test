global with sharing class RM_VFC_Project_CopyCtrl {
	
	public String selectedProjectRecorType  { get; set; }
	public List<SelectOption> projectRecordTypeOption { get; set; }
	
	public String projectInitiateId { get; set; }
	public String projectCharterId { get; set; }
	public String projectCloseOutId { get; set; }
	
	public String generalId { get; set; }
	public String capitalProjectId { get; set; }
	public String mediumProjectId { get; set; }
	public String smallProjectId { get; set; }
	public String capitalBudgetId { get; set; }
	
	public String salesforceHost { get; set; }
	
	public RM_VFC_Project_CopyCtrl(ApexPages.StandardController stdController) {
		
		this.salesforceHost =  URL.getSalesforceBaseUrl().toExternalForm().replace('visual.','sales').replace('c.cs','cs');
		this.salesforceHost += '/' + RFA__c.sObjectType.getDescribe().getKeyPrefix() + '/e?retUrl=/' + stdController.getId();
		
		Milestone1_Project__c project = [select
												Id,
												RM_Approval_Status__c
											from
												Milestone1_Project__c
											where
												Id = :stdController.getId()];
												
		List<RecordType> rType = [select
											Id,
											Name,
											DeveloperName
										from
											RecordType
										where
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_General_PROJECT_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_CAPITAL_PROJECT_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_Medium_PROJECT_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_SMALL_PROJECT_REQUEST or
											 DeveloperName = :RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST];
		
		Map<String, String> rMap = new Map<String, String>();
		for (RecordType r : rType) {
			rMap.put(r.DeveloperName, r.Id);
		}
		
		this.projectInitiateId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST);
		this.projectCharterId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST);
		this.projectCloseOutId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
		
		this.generalId 			= rMap.get(RFA_Utility_Constants.RECORDTYPE_General_PROJECT_REQUEST);
		this.capitalProjectId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_CAPITAL_PROJECT_REQUEST);
		this.mediumProjectId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_Medium_PROJECT_REQUEST);
		this.smallProjectId		= rMap.get(RFA_Utility_Constants.RECORDTYPE_SMALL_PROJECT_REQUEST);
		this.capitalBudgetId	= rMap.get(RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST);
		
		//レコードタイプ選択リスト値 作成
		this.projectRecordTypeOption = new List<SelectOption>();
		if (project.RM_Approval_Status__c == null) {
			projectRecordTypeOption.add(new SelectOption(System.Label.RFA_RecordType_Project_Initiate,
															System.Label.RFA_RecordType_Project_Initiate));
		}
		if (project.RM_Approval_Status__c == RFA_Utility_Constants.ApprovalSetp_InitiateApproved) {
			projectRecordTypeOption.add(new SelectOption(System.Label.RFA_RecordType_Project_Charter,
															System.Label.RFA_RecordType_Project_Charter));
		}
		if (project.RM_Approval_Status__c == RFA_Utility_Constants.ApprovalSetp_CharterApproved) {
			projectRecordTypeOption.add(new SelectOption(System.Label.RFA_RecordType_Project_CloseOut,
															System.Label.RFA_RecordType_Project_CloseOut));
		}
		if (project.RM_Approval_Status__c == RFA_Utility_Constants.ApprovalSetp_CloseOutApproved) {
			projectRecordTypeOption.add(new SelectOption('',
															System.Label.RM_None_PickList));
		}
	}
}