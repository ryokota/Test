public with sharing class RM_VFC_Project_CloseOutCtrl {
	//RFA情報
	public RFA__c  rfa { get; set; }
	//ユーザー名
	public String  userName { get; set; }
	
	public Id projectId { get; set; }
	public Id rfaId { get; set; }
	//遷移先のURL取得
	private String retUrl { get; set; }
	//予算管理情報
	public RM_Milestone_Synergy_Management_History__c  msmh { get; set; }
	//画面出力する予算管理リスト
	public List<RM_Milestone_Synergy_Management_History__c> msmhList{ get; set; }
	//コンストラクタ（初期処理）
	public RM_VFC_Project_CloseOutCtrl(ApexPages.StandardController stdController) {
		//RFA情報を標準より取得
		this.rfa = (RFA__c)stdController.getRecord();
		system.debug('●rfa.Id●' + rfa.Id);

		//this.rfa=rfa.clone(false,true);
		//レコードタイプを取得
		this.rfa.recordTypeid = ApexPages.currentPage().getParameters().get('RecordType');
		//遷移先URLを設定
		this.retUrl = ApexPages.currentPage().getParameters().get('retURL');
		//this.rfa.OwnerId = userInfo.getUserId();
		
		//ユーザー名を設定
		this.userName = userInfo.getName();
		
		//this.rfa.RM_Related_Project__c = ApexPages.currentPage().getParameters().get('Related_Project');
		//予算管理情報を取得
		msmhList = New List<RM_Milestone_Synergy_Management_History__c>();
		
		//
		if(rfa.Id!=null){
		
		string SOQL = 'SELECT RM_Name__c,'
			    + '   RM_Function__c,'
			    + '   RM_This_Year_Q1__c,'
			    + '   RM_This_Year_Q2__c,'
			    + '   RM_This_Year_Q3__c,'
			    + '   RM_This_Year_Q4__c,'
			    + '   RM_This_Year__c,'
			    + '   RM_Next_Year_Q1__c,'
			    + '   RM_Next_Year_Q2__c,'
			    + '   RM_Next_Year_Q3__c,'
			    + '   RM_Next_Year_Q4__c,'
			    + '   RM_Next_Year__c,'
			    + '   RM_The_Year_After_Next__c,'
			    + '   RM_Three_Years_Later__c,'
			    + '   RM_Four_Years_Later__c,'
			    + '   RM_Total__c,'
			    + '   RM_RFA__c,'
			    + '   RM_Milestone_Synergy_Management_No__c'
			    + ' FROM RM_Milestone_Synergy_Management_History__c';

			SOQL += ' WHERE RM_RFA__c = \'' + rfa.Id + '\''	;
			
			msmhList = Database.query(SOQL);
		}
		
		for(integer i=1; msmhList.size()<=10; i++){
			AddColumnCharter();			
		}

			
					 system.debug('●msmhList●' + msmhList.size());
		
		for(RM_Milestone_Synergy_Management_History__c msmhData:msmhList){
			RM_Milestone_Synergy_Management_History__c  msmh = new RM_Milestone_Synergy_Management_History__c();
			msmh.Id=msmhData.Id;
			msmh.RM_Name__c = msmhData.RM_Name__c;
			msmh.RM_Function__c = msmhData.RM_Function__c;
			msmh.RM_This_Year_Q1__c = msmhData.RM_This_Year_Q1__c;
			msmh.RM_This_Year_Q2__c = msmhData.RM_This_Year_Q2__c;
			msmh.RM_This_Year_Q3__c = msmhData.RM_This_Year_Q3__c;
			msmh.RM_This_Year_Q4__c = msmhData.RM_This_Year_Q4__c;
			//msmh.RM_This_Year__c = msmhData.RM_This_Year__c;
			msmh.RM_Next_Year_Q1__c = msmhData.RM_Next_Year_Q1__c;
			msmh.RM_Next_Year_Q2__c = msmhData.RM_Next_Year_Q2__c;
			msmh.RM_Next_Year_Q3__c = msmhData.RM_Next_Year_Q3__c;
			msmh.RM_Next_Year_Q4__c = msmhData.RM_Next_Year_Q4__c;
			//msmh.RM_Next_Year__c = msmhData.RM_Next_Year__c;
			msmh.RM_The_Year_After_Next__c = msmhData.RM_The_Year_After_Next__c;
			msmh.RM_Three_Years_Later__c = msmhData.RM_Three_Years_Later__c;
			msmh.RM_Four_Years_Later__c = msmhData.RM_Four_Years_Later__c;
			//msmh.RM_Total__c = msmhData.RM_Total__c;
			msmh.RM_RFA__c = msmhData.RM_RFA__c;
			
			//msmhList.add(msmh);
		}
		
		

	}
	
	//Charter保存処理
	public pagereference SaveCharter(){
		upsert rfa;
				
		upsert msmhList;
		return new pagereference('/' + rfa.Id);
	}
	
	/*
	public pagereference SaveNewCharter(){
		
		upsert rfa;
				
		upsert msmhList;
		return null;
	}*/
	
	public pagereference AddColumnCharter(){
		
		RM_Milestone_Synergy_Management_History__c msmhNew= new RM_Milestone_Synergy_Management_History__c();
		msmhNew.RM_RFA__c = rfa.Id;
		msmhList.add(msmhNew);
		return null;
	}
	
	public pagereference DeleteColumnCharter(){
		
		msmhList.remove(msmhList.size()-1);
		return null;
	}
	
	public PageReference isRfa() {
		
		PageReference ref;

		if (isRfa(this.rfa.recordTypeid)) {
			ref = getRfaVf(this.rfa.recordTypeid);
		} else {
			ref = new PageReference('/a0T/e');
			ref.getParameters().put('nooverride',     '1');
		}
		
		system.debug('●ref●:' + ref);

		String currentPage = ApexPages.currentPage().getUrl().substring(0, ApexPages.currentPage().getUrl().indexOf('?'));
		String url = ref.getUrl();
		
		system.debug(currentPage + ':::' + url);
		
		if (currentPage == url) {
			return null;
		}
		
		ref.getParameters().put('RecordType', this.rfa.recordTypeid);
		ref.getParameters().put('retURL',     this.retUrl);
		ref.setRedirect(true);
		return ref;
	}
	
	private boolean isRfa(id rid) {
		
		RecordType r = [select Id, DeveloperName from RecordType where id = :rid];
		system.debug(r.DeveloperName);
		if (r.DeveloperName == 'h_01_Project_Initiate') {
			return true;
		} else if (r.DeveloperName == 'h_02_Project_Charter') {
			return true;
		} else if (r.DeveloperName == 'h_03_Project_Close_Out') {
			return true;
		}
		
		return false;
		
	}
	
	private pageReference getRfaVf(id rid) {
		
		RecordType r = [select Id, DeveloperName from RecordType where id = :rid];
		
		if (r.DeveloperName == 'h_01_Project_Initiate') {
			return Page.RM_VFC_Project_Initiate;
		}
		if (r.DeveloperName == 'h_02_Project_Charter') {
			return Page.RM_VFC_Project_Charter;
			//return true;
		}
		if (r.DeveloperName == 'h_03_Project_Close_Out') {
			return Page.RM_VFC_Project_CloseOut;
			//return null;
		}
		
		return null;
		
	}
	
	public void getProjectData() {
		//マッピングしてください！
		Milestone1_Project__c project = [select
												RM_Project_No__c,
												Id,
												Name,
												//Stage__c,
												Kickoff__c,
												Deadline__c,        
												Function__c,
												Project_Sponsor__c,
												Project_Leader__c,       
												RM_Background_Current_Issue__c,
												Description__c,
												RM_Estimated_Benefit_Overview__c,        
												RM_Commercial_Check__c,    
												Commercial_Cross_Func__c,    
												RM_SCM_Check__c,    
												SCM_Cross_Func__c,    
												RM_Procurement_Check__c,    
												Procurement_Cross_Func__c,    
												RM_HR_Check__c,    
												HR_Cross_Func__c,    
												RM_Finance_Check__c,    
												Finance_Cross_Func__c,    
												RM_IS_Check__c,    
												IT_Cross_Func__c,    
												RM_Legal_Check__c,    
												Legal_Cross_Func__c,    
												RM_PAC_Check__c,
												PAC_Cross_Func__c,    
												RM_BI_Check__c,
												BI_Cross_Func__c,
												Category_Big_Title_NO__c,
												Category_Big_Title__c,
												Priority__c,
												CCPP_Status__c,
												Individual_or_with_ATK__c,
												Opex_or_CAPEX__c,
												Reduction_or_Avoidance__c,
												//RM_Detail_Document_Attached_Y_N_1__c,
												RM_Details_of_Solution__c,
												//RM_Detail_Document_Attached_Y_N_2__c,
												RM_Communication_Change__c,
												LastModifiedById,
												CreatedById,
												RM_PaybackPeriodYears__c
												//RM_Detail_Document_Attached_Y_N_3__c
											from
												Milestone1_Project__c
											where
												ID = :this.projectId]; 
		
		this.rfa.RM_Start_Date__c = project.Kickoff__c;
		this.rfa.RM_End_Date__c = project.Deadline__c;
		//this.rfa.RM_Project_No__c = project.RM_Project_No__c;
		this.rfa.RequestTitle__c = project.Name;
		//this.rfa.Stage__c = project.Stage__c;
		this.rfa.RM_Owner_Function_L2__c = project.Function__c;
		this.rfa.RM_Sponsor__c = project.Project_Sponsor__c;
		this.rfa.RM_Project_Lead_From_Owner_Function__c = project.Project_Leader__c;    
		this.rfa.RM_Background_Current_Issue__c = project.RM_Background_Current_Issue__c;
		this.rfa.RM_Project_Objectives__c = project.Description__c;
		this.rfa.RM_Estimated_Benefit_Overview__c = project.RM_Estimated_Benefit_Overview__c;      
		this.rfa.RM_Commercial_Check__c = project.RM_Commercial_Check__c;    
		this.rfa.RM_Commercial_Select__c = project.Commercial_Cross_Func__c;
		this.rfa.RM_SCM_Check__c = project.RM_SCM_Check__c;
		this.rfa.RM_SCM_Select__c = project.SCM_Cross_Func__c;
		this.rfa.RM_Procurement_Check__c = project.RM_Procurement_Check__c;
		this.rfa.RM_Procurement_Select__c = project.Procurement_Cross_Func__c;    
		this.rfa.RM_HR_Check__c = project.RM_HR_Check__c;
		this.rfa.RM_HR_Select__c = project.HR_Cross_Func__c;
		this.rfa.RM_Finance_Check__c = project.RM_Finance_Check__c;
		this.rfa.RM_Finance_Select__c = project.Finance_Cross_Func__c;
		this.rfa.RM_IS_Check__c = project.RM_IS_Check__c;
		this.rfa.RM_IS_Select__c = project.IT_Cross_Func__c;
		this.rfa.RM_Legal_Check__c = project.RM_Legal_Check__c;
		this.rfa.RM_Legal_Select__c = project.Legal_Cross_Func__c;
		this.rfa.RM_PAC_Check__c = project.RM_PAC_Check__c;
		this.rfa.RM_PAC_Select__c = project.PAC_Cross_Func__c;    
		this.rfa.RM_BI_Check__c = project.RM_BI_Check__c;
		this.rfa.RM_BI_Select__c = project.BI_Cross_Func__c;
		this.rfa.RM_Category_No__c = project.Category_Big_Title_NO__c;
		this.rfa.RM_Category_Title__c = project.Category_Big_Title__c;
		this.rfa.RM_Priority_Level__c = project.Priority__c;
		this.rfa.RM_CCPP_Status__c = project.CCPP_Status__c;
		this.rfa.RM_Individual_or_With_ATK__c = project.Individual_or_with_ATK__c;
		this.rfa.RM_Opex_or_CAPEX__c = project.Opex_or_CAPEX__c;
		this.rfa.RM_ABP_Incl_or_Not_incl__c = project.Reduction_or_Avoidance__c;
		//this.rfa.RM_Detail_Document_Attached_Y_N_1__c = project.RM_Detail_Document_Attached_Y_N_1__c;
		this.rfa.RM_Details_of_Solution__c = project.RM_Details_of_Solution__c;
		//this.rfa.RM_Detail_Document_Attached_Y_N_2__c = project.RM_Detail_Document_Attached_Y_N_2__c;
		this.rfa.RM_Communication_Change__c = project.RM_Communication_Change__c;
		//this.rfa.LastModifiedById = project.LastModifiedById;
		//this.rfa.CreatedById = project.CreatedById;
		this.rfa.RM_PaybackPeriodYears__c = project.RM_PaybackPeriodYears__c;
		//this.rfa.RM_Detail_Document_Attached_Y_N_3__c = project.RM_Detail_Document_Attached_Y_N_3__c;

	}
}