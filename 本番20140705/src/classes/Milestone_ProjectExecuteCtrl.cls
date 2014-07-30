/**
*	このクラスはProject Execute画面制御するクラスである。
*	Target Object　：　Project, Milestone, 予算管理である。
*
*/

public class Milestone_ProjectExecuteCtrl {
	//View＆Updateに使用する変数
	public Milestone1_Project__c projectObj{get;set;}
	public List<Milestone_Synergy_Management__c> procurementObjs {get;set;}
	public List<Milestone_Synergy_Management__c> synergyObjs {get;set;}
	public List<Milestone_Synergy_Management__c> budgetObjs {get;set;}
	public Milestone1_Milestone__c tempMilestone {get;set;}
	
	//パラメータで受け取ったProjectID
	public String projectId {get;set;}
	//予算管理の総計変数を定義
	//Synergy Managementセッション
	public Decimal Total_Day1_Plan {get;set;}
	public Decimal Total_New_Plan  {get;set;}
	public Decimal Total_ABP  {get;set;}
	public Decimal Total_RE {get;set;}
	public Decimal Total_Actual {get;set;}
	//Investment/Budgetセッション
	public Decimal Total_Capex  {get;set;}
	public Decimal Total_Depreciation  {get;set;}
	public Decimal Total_Other_OPEX  {get;set;}
	//Only Procurement Synergy
	//public Decimal Total_New_Plan_before_Risk_Opex {get;set;}			2014/6/3 削除
	public Decimal Total_POV_Plan_ABP_Opex  {get;set;}
	public Decimal Total_POV_RE_Opex {get;set;}
	public Decimal Total_RE_upper_Pr_Opex {get;set;}				//2014/6/3新規追加
	public Decimal Total_RE_lower_Pr_Opex {get;set;}				//2014/6/3新規追加
	public Decimal Total_POV_Actual_Opex {get;set;}
	//public Decimal Total_New_Plan_before_Risk_Pr_Capex {get;set;}			2014/6/3 削除
	public Decimal Total_POV_Plan_ABP_Capex  {get;set;}
	public Decimal Total_POV_RE_Capex {get;set;}
	public Decimal Total_RE_upper_Pr_Capex {get;set;}				//2014/6/3新規追加
	public Decimal Total_RE_lower_Pr_Capex {get;set;}				//2014/6/3新規追加
	public Decimal Total_POV_Actual_Capex  {get;set;}
	//予算管理情報をPDFに出力するかしないかのフラグ
	public boolean pdf_flag {get;set;}
	
	
	
	//コンストラクタ
	public Milestone_ProjectExecuteCtrl(){
		//Project詳細画面から受け取るProjectId
		projectId = ApexPages.currentPage().getParameters().get('projectId');
		system.debug('Project Id : '+projectId);
		//各Object初期化
		projectObj = new Milestone1_Project__c();
		synergyObjs = new List<Milestone_Synergy_Management__c>();
		tempMilestone = new Milestone1_Milestone__c();
		pdf_flag = false;
		//初期データロード
		init();
	}
	
	//初期データロードメソッド
	public void init(){
		pdf_flag = false;
		//合計変数を初期化
		doTotalResetAmount();
		
		//Project Data取得後、設定
		List<Milestone1_Project__c> resultProject = [SELECT Id,
															Name,
															Project_No__c,
															RM_Approval_Status__c,
															Kickoff__c,
															Deadline__c,
															Function__c,
															Project_Sponsor__c,
															Project_Leader__c,
															Status__c,
															Project_Status__c,
															Project_Status_View__c,
															RM_Key_Events_From_This_Week__c,
															RM_Key_Events_For_Next_Week__c,
															RM_Issues_For_Escalation_Recovery_plan__c,
															RM_Sponsor_discussion__c,
															RM_Leader_discussion__c,
															RM_Team_Member_discussion__c,
															RM_Commercial_Check__c,
															RM_Commercial_Select__c,
															RM_SCM_Check__c,
															RM_SCM_Select__c,
															RM_Procurement_Check__c,
															RM_Procurement_Select__c,
															RM_HR_Check__c,
															RM_HR_Select__c,
															RM_Finance_Check__c,
															RM_Finance_Select__c,
															RM_IS_Check__c,
															RM_IS_Select__c,
															RM_Legal_Check__c,
															RM_Legal_Select__c,
															RM_PAC_Check__c,
															RM_PAC_Select__c,
															RM_BI_Check__c,
															RM_BI_Select__c
													FROM Milestone1_Project__c
													WHERE Id=:projectId
													];
		if(resultProject != null && resultProject.size() > 0) projectObj = resultProject.get(0);
		//予算管理を取得して設定
		//Only Procurement Synergyデータ
		procurementObjs = [SELECT Id, Name,
								//New_Plan_before_Risk_Opex__c,			2014/6/3 削除
								POV_Plan_ABP_Opex__c,
								POV_RE_Opex__c,
								RM_RE_upper_Pr_Opex__c,				//2014/6/3新規追加
								RM_RE_lower_Pr_Opex__c,				//2014/6/3新規追加
								POV_Actual_Opex__c,
								//New_Plan_before_Risk_Pr_Capex__c,			2014/6/3 削除
								POV_Plan_ABP_Capex__c,
								POV_RE_Capex__c,
								RM_RE_upper_Pr_Capex__c,				//2014/6/3新規追加
								RM_RE_lower_Pr_Capex__c,				//2014/6/3新規追加
								POV_Actual_Capex__c 
					   FROM Milestone_Synergy_Management__c 
					   WHERE Project__c =:projectId
					   ORDER BY Name];
		//Synergy Managementデータ
		synergyObjs = [SELECT Id, Name,
								Day1_Plan__c,
								New_Plan__c,
								ABP__c,
								RE__c,
								Actual__c 
					   FROM Milestone_Synergy_Management__c 
					   WHERE Project__c =:projectId
					   ORDER BY Name];
		//Investment/Budgetデータ
		budgetObjs = [SELECT Id, Name,
								Capex__c,
								Depreciation__c,
								Other_OPEX__c 
					   FROM Milestone_Synergy_Management__c 
					   WHERE Project__c =:projectId
					   ORDER BY Name];
		//それぞれの合計を取得する。
		for(Milestone_Synergy_Management__c sObj1 : procurementObjs){
			//合計値を設定
			this.getTotalCalc1(sObj1);
		}
		for(Milestone_Synergy_Management__c sObj2 : synergyObjs){
			//合計値を設定
			this.getTotalCalc2(sObj2);
		}
		for(Milestone_Synergy_Management__c sObj3 : budgetObjs){
			//合計値を設定
			this.getTotalCalc3(sObj3);
		}
		
	}
	//Only Procurement Synergy合計するメソッド
	private void getTotalCalc1(Milestone_Synergy_Management__c msm){
		system.debug('*****************Start getTotalCal1');
		//Only Procurement Synergy
		//Total_New_Plan_before_Risk_Opex += msm.New_Plan_before_Risk_Opex__c;			2014/6/3 削除
		Total_POV_Plan_ABP_Opex += nullConvertZero(msm.POV_Plan_ABP_Opex__c);
		Total_POV_RE_Opex += nullConvertZero(msm.POV_RE_Opex__c);
		Total_RE_upper_Pr_Opex += nullConvertZero(msm.RM_RE_upper_Pr_Opex__c);				//2014/6/3新規追加
		Total_RE_lower_Pr_Opex += nullConvertZero(msm.RM_RE_lower_Pr_Opex__c);				//2014/6/3新規追加
		Total_POV_Actual_Opex += nullConvertZero(msm.POV_Actual_Opex__c);
		
		//Total_New_Plan_before_Risk_Pr_Capex += msm.New_Plan_before_Risk_Pr_Capex__c;			2014/6/3 削除
		Total_POV_Plan_ABP_Capex += nullConvertZero(msm.POV_Plan_ABP_Capex__c);
		Total_POV_RE_Capex += nullConvertZero(msm.POV_RE_Capex__c);
		Total_RE_upper_Pr_Capex += nullConvertZero(msm.RM_RE_upper_Pr_Capex__c);				//2014/6/3新規追加
		Total_RE_lower_Pr_Capex += nullConvertZero(msm.RM_RE_lower_Pr_Capex__c);				//2014/6/3新規追加
		Total_POV_Actual_Capex += nullConvertZero(msm.POV_Actual_Capex__c);
		system.debug('*****************End getTotalCal1');
	}
	//Synergy Management合計するメソッド
	private void getTotalCalc2(Milestone_Synergy_Management__c msm){
		system.debug('*****************Start getTotalCal2');
		//Synergy Managementセッション
		Total_Day1_Plan += nullConvertZero(msm.Day1_Plan__c);
		Total_New_Plan += nullConvertZero(msm.New_Plan__c);
		Total_ABP += nullConvertZero(msm.ABP__c);
		Total_RE += nullConvertZero(msm.RE__c);
		Total_Actual += nullConvertZero(msm.Actual__c);
		system.debug('*****************End getTotalCal2');
	}
	//Investment/Budget合計するメソッド
	private void getTotalCalc3(Milestone_Synergy_Management__c msm){
		system.debug('*****************Start getTotalCal3');
		//Investment/Budgetセッション
		Total_Capex += nullConvertZero(msm.Capex__c);
		Total_Depreciation += nullConvertZero(msm.Depreciation__c);
		Total_Other_OPEX += nullConvertZero(msm.Other_OPEX__c);
		system.debug('*****************End getTotalCal3');
	}
	
	//全ての合計金額を初期化する
	private void doTotalResetAmount(){
		//Total_New_Plan_before_Risk_Opex = 0;			2014/6/3 削除
		Total_POV_Plan_ABP_Opex = 0;
		Total_POV_RE_Opex = 0;
		Total_RE_upper_Pr_Opex = 0;				//2014/6/3新規追加
		Total_RE_lower_Pr_Opex = 0;				//2014/6/3新規追加
		Total_POV_Actual_Opex = 0;
		//Total_New_Plan_before_Risk_Pr_Capex = 0;			2014/6/3 削除
		Total_POV_Plan_ABP_Capex = 0;
		Total_POV_RE_Capex = 0;
		Total_RE_upper_Pr_Capex = 0;				//2014/6/3新規追加
		Total_RE_lower_Pr_Capex = 0;				//2014/6/3新規追加
		Total_POV_Actual_Capex = 0;
		
		Total_Day1_Plan = 0;
		Total_New_Plan = 0;
		Total_ABP = 0;
		Total_RE = 0;
		Total_Actual = 0;
		//Investment/Budgetセッション
		Total_Capex = 0;
		Total_Depreciation = 0;
		Total_Other_OPEX = 0;
	}
	
	public Pagereference back(){
		return new Pagereference('/' + projectId);
	}
	
	//Project及び予算管理データを保存するイベント
	public Pagereference save(){
		try{
			update projectObj;
			if(procurementObjs.size() > 0) update procurementObjs;
			if(synergyObjs.size() > 0) update synergyObjs;
			if(budgetObjs.size() > 0) update budgetObjs;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, system.label.RM_Saved));
			//初期データ呼出す
			init();
		}catch(Exception e){
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, system.label.RM_Save_Error));
		}
        return null; 
	}
	
	//PDFファイルを作成し、Project関連リストである「メモ＆添付ファイル」に添付するイベント
	public Pagereference PDFHistory(){
		//PDFページを呼び出す
		Pagereference pdf = Page.Milestone_ProjectExecutePDF;
        //PDFページにパラメータ設定
        pdf.getParameters().put('projectId',projectId);
        pdf.getParameters().put('pdf_flag',String.valueOf(pdf_flag));
        try{
        	//Local Timeを取得
        	Datetime nowTime = system.now();
        	//Datetime result = Datetime.newInstance(nowTime.date(),nowTime.time());
        	Datetime resultTime = nowTime.addHours(9);
        	//添付ファイル生成し、挿入処理を行う。
	        Attachment attach = new Attachment();
	        Blob body = pdf.getContent();
	        attach.Body = body;
	        attach.Name = 'Project_Update_Backup' + resultTime + '.pdf';
	        attach.IsPrivate = false;
	        attach.ParentId = projectId;
	        insert attach;
	        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Info, system.label.RM_PDF_Saved));
        }catch(Exception e){
        	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Error, system.label.RM_Save_Error));
        }
        
		return null;
	}
	
	//数値のnullを0に変える処理
    private Decimal nullConvertZero(Decimal NumData){
        if(NumData == null){
            return 0;
        }else{
            return NumData;
        }
    }
	
}