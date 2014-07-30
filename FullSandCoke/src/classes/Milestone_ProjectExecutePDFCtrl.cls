/*
*	Project Backup及びPDFレポートを制御するクラスである。
*	Target Object : Project, Milestone,Project Team Member, 予算管理である
*/
public class Milestone_ProjectExecutePDFCtrl {
	//PDF表示変数宣言
	public String memberNames {get;set;}
	public Date createByPdf {get;set;}
	public String bgColor {get;set;}
	public String projectId {get;set;}
	public Boolean yosan_nonDisplay_flag {get;set;}
	public Boolean milestone_nondisplay_flag {get;set;}
	//Milestone一覧の最大件数
	public final Integer FIRST_MILESTONE_MAX_CNT = 11;
	public final Integer MILESTONE_MAX_CNT = 29;
	public Integer milestoneTotalPage {get;set;}
	//データ格納変数
	public Milestone1_Project__c projectObj{get;set;}
	public List<Milestone_Permission__c> teamMembers {get;set;}
	public List<Milestone1_Milestone__c> milestones {get;set;}
	public List<Milestone_Synergy_Management__c> Procurements {get;set;}
	public List<Milestone_Synergy_Management__c> synergys {get;set;}
	public List<Milestone_Synergy_Management__c> budgets {get;set;}
	
	//Milestoneのページを分けるため、使う
	public List<List<Milestone1_Milestone__c>> milestoneList {get;set;}
	
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
	
	//コンストラクタ
	public Milestone_ProjectExecutePDFCtrl(){
		//全画面から受け取るパラメータ
		projectId = ApexPages.currentPage().getParameters().get('projectId');
		yosan_nonDisplay_flag = Boolean.valueOf(ApexPages.currentPage().getParameters().get('pdf_flag'));
		system.debug('***********************test status : ' + yosan_nonDisplay_flag);
		
		//宣言したオブジェクトを生成する。
		projectObj = new Milestone1_Project__c();
		teamMembers = new List<Milestone_Permission__c>();
		milestones = new List<Milestone1_Milestone__c>();
		Procurements = new List<Milestone_Synergy_Management__c>();
		synergys = new List<Milestone_Synergy_Management__c>();
		budgets  = new List<Milestone_Synergy_Management__c>();
		milestoneList = new List<List<Milestone1_Milestone__c>>();
		//PDF作成日を取得して置く
		createByPdf = system.today();
		init();
	}
	
	//PDFデータ編集
	public void init(){
		doTotalResetAmount();
		getResultData();
		
		//PDFの各フィールド編集
		bgColor = this.getBgColor(projectObj.Project_Status__c);
		memberNames = this.getTeamUsersName(teamMembers);
		memberNames = this.cutTextValue(memberNames, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.Name = this.cutTextValue(projectObj.Name, 80).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Key_Events_From_This_Week__c = this.cutTextValue(projectObj.RM_Key_Events_From_This_Week__c, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Key_Events_For_Next_Week__c = this.cutTextValue(projectObj.RM_Key_Events_For_Next_Week__c, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Issues_For_Escalation_Recovery_plan__c = this.cutTextValue(projectObj.RM_Issues_For_Escalation_Recovery_plan__c, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Sponsor_discussion__c = this.cutTextValue(projectObj.RM_Sponsor_discussion__c, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Leader_discussion__c = this.cutTextValue(projectObj.RM_Leader_discussion__c, 500).replaceAll('(\\W)','$1<wbr/>');
		projectObj.RM_Team_Member_discussion__c = this.cutTextValue(projectObj.RM_Team_Member_discussion__c, 500).replaceAll('(\\W)','$1<wbr/>');
		
		//MilestoneのTotalページを取得
		milestoneTotalPage = pageCount(milestones.size(), FIRST_MILESTONE_MAX_CNT);
		if(milestones.size() > FIRST_MILESTONE_MAX_CNT){
			milestoneTotalPage = pageCount(milestones.size() - FIRST_MILESTONE_MAX_CNT, MILESTONE_MAX_CNT) + 1;
		}
		if(milestonetotalPage == 0){
			milestone_nondisplay_flag = true;
		} else {
			milestone_nondisplay_flag = false;
			//Milestoneのページを制御する
			boolean milestonePageflg= true;
			List<Milestone1_Milestone__c> tempList = new List<Milestone1_Milestone__c>();
			for(Milestone1_Milestone__c milestone : milestones){
				milestone.Name = milestone.Name.replaceAll('(\\W)','$1<wbr/>');
				tempList.add(milestone);
				//最初１１件
				
				//後28件
				if(FIRST_MILESTONE_MAX_CNT == tempList.size() && milestonePageflg){
					milestonePageflg = false;
					milestoneList.add(tempList);
					tempList = new List<Milestone1_Milestone__c>();
					
				} else if(MILESTONE_MAX_CNT == tempList.size() && !milestonePageflg){
					milestoneList.add(tempList);
					tempList = new List<Milestone1_Milestone__c>();
				}
			}
			if(tempList.size() > 0) milestoneList.add(tempList);
		}
		
		/*
		boolean milestoneflg= false;
		for(Milestone1_Milestone__c milestone : milestones){
			milestone.Name = milestone.Name.replaceAll('(\\W)','$1<wbr/>');
			if(MILESTONE_MAX_CNT == tempList.size()){
				milestoneList.add(tempList);
				tempList = new List<Milestone1_Milestone__c>();
			}
			tempList.add(milestone);
		}
		*/
		
		system.debug('****************************totalPage : ' + milestoneTotalPage);
		//milestoneのデータが存在しない場合、ヘッダーのみ表示する。
		//if(milestoneTotalPage == 0){
		//	milestoneList.add(new List<Milestone1_Milestone__c>());
		//}
	}
	
	//初期データ取得
	public void getResultData(){
		//プロジェクトのデータを取得
		List<Milestone1_Project__c> resultProject = [SELECT Id,
															Name,
															Function__c,
															Project_Status__c,
															Project_Sponsor__r.Name,
															Project_Leader__r.Name,
															RM_Key_Events_From_This_Week__c,
															RM_Key_Events_For_Next_Week__c,
															RM_Issues_For_Escalation_Recovery_plan__c,
															RM_Sponsor_discussion__c,
															RM_Leader_discussion__c,
															RM_Team_Member_discussion__c,
															(Select UserName__r.Name From Milestone_Permission__r), 
															(Select Name, Kickoff__c,Deadline__c, RM_Adjustment_Date__c, RM_Actual_Date__c From Project_Milestones__r ORDER BY Name) 
													FROM Milestone1_Project__c
													WHERE Id=:projectId];
		if(resultProject != null && resultProject.size() > 0) {
			//Project情報取得
			projectObj = resultProject.get(0);
			//Project Team Member取得
			teamMembers = resultProject.get(0).Milestone_Permission__r;
			//Milestone取得
			milestones = resultProject.get(0).Project_Milestones__r;
			//予算管理取得
			Procurements = [SELECT Id, Name,
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
			synergys = [SELECT Id, Name,
								Day1_Plan__c,
								New_Plan__c,
								ABP__c,
								RE__c,
								Actual__c 
					   FROM Milestone_Synergy_Management__c 
					   WHERE Project__c =:projectId
					   ORDER BY Name];
			budgets = [SELECT Id, Name,
								Capex__c,
								Depreciation__c,
								Other_OPEX__c 
					   FROM Milestone_Synergy_Management__c 
					   WHERE Project__c =:projectId
					   ORDER BY Name];
			//PDFのFormatのため、予算管理データが存在しない場合、０を設定
			if(Procurements.size() == 0 && synergys.size() == 0 && budgets.size() == 0) {
				for(integer i=1; i<13; i++){
					Milestone_Synergy_Management__c tempObj= new Milestone_Synergy_Management__c();
					tempObj.Name = '' + i;
					if(i < 10) tempObj.Name = '0' + i;
					//tempObj.New_Plan_before_Risk_Opex__c = 0;			2014/6/3 削除
					tempObj.POV_Plan_ABP_Opex__c = 0;
					tempObj.POV_RE_Opex__c = 0;
					tempObj.RM_RE_upper_Pr_Opex__c = 0;				//2014/6/3新規追加
					tempObj.RM_RE_lower_Pr_Opex__c = 0;				//2014/6/3新規追加
					tempObj.POV_Actual_Opex__c = 0;
					//tempObj.New_Plan_before_Risk_Pr_Capex__c = 0;			2014/6/3 削除
					tempObj.POV_Plan_ABP_Capex__c = 0;
					tempObj.POV_RE_Capex__c = 0;
					tempObj.RM_RE_upper_Pr_Capex__c = 0;				//2014/6/3新規追加
					tempObj.RM_RE_lower_Pr_Capex__c = 0;				//2014/6/3新規追加
					tempObj.POV_Actual_Capex__c = 0;
					tempObj.Day1_Plan__c = 0;
					tempObj.New_Plan__c = 0;
					tempObj.ABP__c = 0;
					tempObj.RE__c = 0;
					tempObj.Actual__c = 0; 
					tempObj.Capex__c = 0;
					tempObj.Depreciation__c = 0;
					tempObj.Other_OPEX__c = 0;
					Procurements.add(tempObj);
					synergys.add(tempObj);
					budgets.add(tempObj);
				}
			}
			//それぞれの合計を取得する。
			for(Milestone_Synergy_Management__c sObj1 : Procurements){
				//合計値を設定
				this.getTotalCalc1(sObj1);
			}
			for(Milestone_Synergy_Management__c sObj2 : synergys){
				//合計値を設定
				this.getTotalCalc2(sObj2);
			}
			for(Milestone_Synergy_Management__c sObj3 : budgets){
				//合計値を設定
				this.getTotalCalc3(sObj3);
			}
			
		}
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
	//ユーザごとにコンマ区切りをつける
	private String getTeamUsersName(List<Milestone_Permission__c> pram){
		String result = '';
		for(Milestone_Permission__c m : pram){
			result += m.UserName__r.Name + ',';
		}
		if(result.length()>0){
			result = result.substring(0, result.lastIndexOf(','));
		}
		return result;
	}
	
	//指定した最大文字列長さまでの文字列を編集して返す
	//val:対象文字列、cnt:指定長さ
	private String cutTextValue(String val, Integer len) {
    	String reVal = '';
    	if (val != null && val.length() != 0) {
    		if (val.length() > len) {
    			reVal = val.substring(0, len) + '...';
    		} else {
    			reVal = val;
    		}
    	}
    	return reVal;
    }
    
	//Milestoneのサイズを計算して総ページを求める
	private Integer pageCount(Integer size, Integer MaxCnt){
		Integer cnt = size / MaxCnt;
		if(math.mod(size, MaxCnt) != 0){
			cnt++;
		}
		return cnt;
	}
	//Project Statusの背景色を設定
	private String getBgColor(String status){
		String bgColor = '#BBBBBB';
		if(status == 'Green'){
			bgColor='#00AA00';
		} else if(status == 'Yellow'){
			bgColor='#FFB400';
		} else if(status == 'Red'){
			bgColor='#d60016';
		}
		return bgColor;
	}
	
	//nullを0に変える処理
    private Decimal nullConvertZero(Decimal NumData){
        if(NumData == null){
            return 0;
        }else{
            return NumData;
        }
    }
	
}