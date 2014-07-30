public with sharing class RM_VFC_Quantitative_Benefit_Capital {
    
    //フラグ
    public boolean isNew { get; set; }
    
    //RFA Detail Document Attached Y/N and Payback Period (Years)
    public RFA__c rfa { get; set; }
    
    private static final string QUANTITATIVE='Quantitative';
    private static final string CAPEX_AND_CASH_SPEND='CapexAndCashSpend';
    
    //年度
    public List<String> headerYearQuantitative { get; set; }
    public List<String> headerYearCapex { get; set; }
    public String year { get; set; }
    public List<SelectOption> yearOption { get; set; }
    public Decimal investimentAmount {get; set; }
    public string changeLayout {get;set;}

    //Synergy Management History
    private List<RM_Milestone_Synergy_Management_History__c> synergyHistoriesQuantitative { get; set; }
    private List<RM_Milestone_Synergy_Management_History__c> synergyHistoriesCapex { get; set; }
    
    public quantitativeSynergyHistory quantitativeSynergyHistory   { get; set; }
    public capexAndCashSpendSynergyHistory capexAndCashSpendSynergyHistory { get; set; }
    
    private id rfaId { get; set; }  
    private string requestRecordType { get; set; }  
    
    public RM_VFC_Quantitative_Benefit_Capital(ApexPages.StandardController stdController) {
        system.debug('----------------------------コンストラクタが呼ばれました');
        //RFA情報を標準より取得
        this.rfaId = stdController.getId();
        
        //フラグ設定
        this.isNew = this.rfaId == null ? true : false;
        
        //初期化フラグ
        this.changeLayout = 'true';
        
        //初期化
        init(this.rfaId);
        
    }
    
    private void init(id rid) {
        
        //データ取得
        this.rfa = getRfa(rid);
        this.synergyHistoriesQuantitative = getSynergyHistories(rid,QUANTITATIVE);
        this.synergyHistoriesCapex = getSynergyHistories(rid,CAPEX_AND_CASH_SPEND);

        
        //年度設定
        Date d;
        this.yearOption = new List<SelectOption>();

        if (this.synergyHistoriesQuantitative.isEmpty() && 
            this.synergyHistoriesCapex.isEmpty()) {
          
            d = Date.today();
            year = String.valueOf(d.year());

        }else{
            
            if(this.synergyHistoriesQuantitative.isEmpty()) {

                d = Date.newInstance( this.synergyHistoriesCapex.get(0).CreatedDate.year(), 1, 1);
    
                year  = this.synergyHistoriesCapex.get(0).RM_Year__c;

            } else{
 
                d = Date.newInstance( this.synergyHistoriesQuantitative.get(0).CreatedDate.year(), 1, 1);
                year  = this.synergyHistoriesQuantitative.get(0).RM_Year__c;            
            }
            
        } 
        
        for (Integer i = 0; i < 5; i++) {
            yearOption.add(new SelectOption(String.valueOf(d.year() + i), String.valueOf(d.year()+ i)));
        }
        
        this.headerYearQuantitative =  getYearQuantitative(year);
        this.headerYearCapex = getYearCapex(year);
        this.quantitativeSynergyHistory = new quantitativeSynergyHistory(rid, this.synergyHistoriesQuantitative);
        this.capexAndCashSpendSynergyHistory = new capexAndCashSpendSynergyHistory(rid, this.synergyHistoriesCapex);
        
        system.debug('●●●●●this.capexAndCashSpendSynergyHistory.investTotal●●●●●' + this.capexAndCashSpendSynergyHistory.investTotal);
        system.debug('●●●●●this.rfa.RM_Investment_Amounts__c●●●●●' + this.rfa.RM_Investment_Amounts__c);
        
        //デフォルトで添付チェックをつける
        this.rfa.RM_Detail_Document_Attached_Y_N_1__c=true;

    }
    
    public void changeYear() {
        
        this.headerYearQuantitative =  getYearQuantitative(year);
        this.headerYearCapex =  getYearCapex(year);
        
    }

    public void saveSynergy() {
        //Quantitative予算情報入力エラーが発生した場合は、そのままの状態のまま終了
        if (quantitativeSynergyHistory.validation(this.year,this.rfa) == false){
        	//初期化フラグをOFFに設定
        	this.changeLayout = 'false';
        	return;
        }

        //CAPEXスケジュール予算情報入力エラーが発生した場合は、そのままの状態のまま終了        
        if(capexAndCashSpendSynergyHistory.validation(this.year,this.rfa.RM_Investment_Amounts__c) == false){
        	//初期化フラグをOFFに設定
        	this.changeLayout = 'false';
        	return;
        }
        
		//セーブポイント作成
		Savepoint sp = Database.setSavepoint();        
        
        //Quantitative予算情報入力エラーが発生した場合は、そのままの状態のまま終了
        if (quantitativeSynergyHistory.save() == false){
        	//初期化フラグをOFFに設定
        	this.changeLayout = 'false';
        	
        	//ロールバック実行
			Database.rollback(sp);
        	return;
        }

        //CAPEXスケジュール予算情報入力エラーが発生した場合は、そのままの状態のまま終了        
        if(capexAndCashSpendSynergyHistory.save() == false){
        	//初期化フラグをOFFに設定
        	this.changeLayout = 'false';
        	//ロールバック実行
			Database.rollback(sp);
        	return;
        }
        
        try{
        	
	        upsert this.rfa;
	        //初期化フラグ
	        this.changeLayout = 'true';            
	        init(this.rfaId);
        	
        }catch(DmlException ex){
            ApexPages.addMessages(ex);
        	//初期化フラグをOFFに設定
        	this.changeLayout = 'false';
        	//ロールバック実行
			Database.rollback(sp);
            return;
            
        }
    }
    
    public void editCancel() {

        //初期化フラグをONに設定
        this.changeLayout = 'true';
        system.debug('●this.changeLayout●' + this.changeLayout);
        init(this.rfaId);
        
    }
    
    private RFA__c getRfa(Id rid) {
        
        List<RFA__c> r = [select
                        Id,
                        RM_Detail_Document_Attached_Y_N_1__c,
                        RM_PaybackPeriodYears__c,
                        RM_Investment_Amounts__c,
                        RM_Remarks_Capex__c,
                        RM_Remarks_Quantitative__c,
                        RM_Request_Record_Type__c                        
                    from
                        RFA__c
                    where
                        Id = :rid];
        return r.isEmpty() ? new RFA__c() : r.get(0);
        
    }
    
    private List<RM_Milestone_Synergy_Management_History__c> getSynergyHistories(Id rfaId,string synergyString) {
        if(synergyString == QUANTITATIVE){

            return [select
                            Id,
                            //Seq_No__c,
                            RM_Year__c,
                            RM_Name__c,
                            RM_This_Year_Q1__c,
                            RM_This_Year_Q2__c,
                            RM_This_Year_Q3__c,
                            RM_This_Year_Q4__c,
                            RM_This_Year_Q1_Text__c,
                            RM_This_Year_Q2_Text__c,
                            RM_This_Year_Q3_Text__c,
                            RM_This_Year_Q4_Text__c,
                            RM_This_Year_Formula__c,
                            RM_This_Year__c,
                            RM_Next_Year__c,
                            RM_This_Year_Text__c,
                            RM_Next_Year_Text__c,
                            RM_The_Year_After_Next__c,
                            RM_The_Year_After_Next_Text__c,
                            RM_Total__c,
                            CreatedDate,
                            RM_Remarks__c,
                            RM_RFA__c
                        from
                            RM_Milestone_Synergy_Management_History__c
                        where
                            RM_RFA__c = :rfaId
                        and
                            RM_Asset_Name__c = null];
            
        }else if(synergyString == CAPEX_AND_CASH_SPEND){
            
            return [select
                            Id,
                            //Seq_No__c,
                            RM_Year__c,
                            RM_Name__c,
                            RM_Asset_Name__c,
                            RM_Asset_Category__c,
                            RM_Asset_Category_Detail__c,
                            //RM_Entity__c,
                            //RM_Detail__c,
                            RM_Acquisition_Method__c,
                            RM_Depreciation_Rule__c,
                            RM_Useful_Life__c,
                            RM_This_Year__c,
                            RM_Next_Year__c,
                            RM_The_Year_After_Next__c,
                            RM_Useful_Life_Text__c,
                            RM_This_Year_Text__c,
                            RM_Next_Year_Text__c,
                            RM_The_Year_After_Next_Text__c,
                            //RM_Total__c,
                            RM_Invest_Total__c,
                            CreatedDate,
                            RM_RFA__c
                        from
                            RM_Milestone_Synergy_Management_History__c
                        where
                            RM_RFA__c = :rfaId
                        and
                            RM_Asset_Name__c != null];
            
        }
        
        return null;

    }

    private List<String> getYearQuantitative(String thisYear) {
        
        List<String> year = new List<String>();
        Date d;
        if (thisYear == '' || thisYear == null) {
            d = Date.today();
        } else {
            d = Date.newInstance(Integer.valueOf(thisYear), 1, 1);
        }
        
        year.add(String.valueOf(d.addYears(1).year()));
        year.add(String.valueOf(d.addYears(2).year()));
        return year;
    }

    private List<String> getYearCapex(String thisYear) {
        
        List<String> year = new List<String>();
        Date d;
        if (thisYear == '' || thisYear == null) {
            d = Date.today();
        } else {
            d = Date.newInstance(Integer.valueOf(thisYear), 1, 1);
        }
        
        year.add(String.valueOf(d.year()));
        year.add(String.valueOf(d.addYears(1).year()));
        year.add(String.valueOf(d.addYears(2).year()));
        return year;
    }
    
    public class quantitativeSynergyHistory {
        
        public List<RM_Milestone_Synergy_Management_History__c> records { get; set; }
        public List<RM_Milestone_Synergy_Management_History__c> upsertRecordsQuantitative { get; set; }
        public List<RM_Milestone_Synergy_Management_History__c> deleteRecordsQuantitative { get; set; }
        public Decimal thisYearQ1       { get; set; }
        public Decimal thisYearQ2       { get; set; }
        public Decimal thisYearQ3       { get; set; }
        public Decimal thisYearQ4       { get; set; }
        public Decimal thisYear       { get; set; }
        public Decimal nextYear       { get; set; }
        public Decimal theYearAfterNext      { get; set; }
        public Decimal total          { get; set; }
        public Decimal Investment_Amounts { get; set; }
        
        
        public quantitativeSynergyHistory(Id rfaId, List<RM_Milestone_Synergy_Management_History__c> synergy) {
            
            this.records = new List<RM_Milestone_Synergy_Management_History__c>();
            
            for (RM_Milestone_Synergy_Management_History__c r : synergy) {

                    this.records.add(r);
                    
		                    r.RM_This_Year_Q1__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q1_Text__c));
		                    r.RM_This_Year_Q2__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q2_Text__c));
		                    r.RM_This_Year_Q3__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q3_Text__c));
		                    r.RM_This_Year_Q4__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q4_Text__c));
		                    r.RM_This_Year__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Text__c));
		                    r.RM_Next_Year__c = Integer.valueOf(nullConvertZeroText(r.RM_Next_Year_Text__c));
		                    r.RM_The_Year_After_Next__c = Integer.valueOf(nullConvertZeroText(r.RM_The_Year_After_Next_Text__c));

			                                
			                thisYearQ1 = thisYearQ1  == null  ? nullConvertZero(r.RM_This_Year_Q1__c) : thisYearQ1  + nullConvertZero(r.RM_This_Year_Q1__c);
			                thisYearQ2 = thisYearQ2  == null  ? nullConvertZero(r.RM_This_Year_Q2__c) : thisYearQ2  + nullConvertZero(r.RM_This_Year_Q2__c);
			                thisYearQ3 = thisYearQ3  == null  ? nullConvertZero(r.RM_This_Year_Q3__c) : thisYearQ3  + nullConvertZero(r.RM_This_Year_Q3__c);
			                thisYearQ4 = thisYearQ4  == null  ? nullConvertZero(r.RM_This_Year_Q4__c) : thisYearQ4  + nullConvertZero(r.RM_This_Year_Q4__c);
			                thisYear = thisYear  == null  ? nullConvertZero(r.RM_This_Year_Formula__c) : thisYear  + nullConvertZero(r.RM_This_Year_Formula__c);
			                nextYear = nextYear  == null  ? nullConvertZero(r.RM_Next_Year__c) : nextYear  + nullConvertZero(r.RM_Next_Year__c);
			                theYearAfterNext = theYearAfterNext == null  ? nullConvertZero(r.RM_The_Year_After_Next__c) : theYearAfterNext + nullConvertZero(r.RM_The_Year_After_Next__c);
			                total = total == null ? nullConvertZero(r.RM_Total__c) : total + nullConvertZero(r.RM_Total__c);


            }
            
            for(integer i=1; this.records.size()<5; i++){
                this.records.add(new RM_Milestone_Synergy_Management_History__c(RM_RFA__c = rfaId,
                																RM_This_Year_Q1__c = 0,
                																RM_This_Year_Q1_Text__c = '0',
                																RM_This_Year_Q2__c = 0,
                																RM_This_Year_Q2_Text__c = '0',
                																RM_This_Year_Q3__c = 0,
                																RM_This_Year_Q3_Text__c = '0',
                																RM_This_Year_Q4__c = 0,
                																RM_This_Year_Q4_Text__c = '0',
                																RM_Next_Year__c = 0,
                																RM_Next_Year_Text__c = '0',
                																RM_The_Year_After_Next__c = 0,
                																RM_The_Year_After_Next_Text__c = '0'));
            }           
        }

        public boolean validation(String year,RFA__c rfaCapex) {

	        decimal result;			
			thisYearQ1 = 0;
			thisYearQ2 = 0;
			thisYearQ3 = 0;
			thisYearQ4 = 0;
			thisYear = 0;
			nextYear = 0;
			theYearAfterNext = 0;
			total = 0;
			        	
        	this.upsertRecordsQuantitative = New List<RM_Milestone_Synergy_Management_History__c>();
        	this.deleteRecordsQuantitative = New List<RM_Milestone_Synergy_Management_History__c>();
        	
            //Investment_Amounts = [SELECT Id,RM_Investment_Amounts__c FROM RFA__c WHERE Id =:records[0].RM_RFA__c Limit 1].RM_Investment_Amounts__c;
			try{
	            for (RM_Milestone_Synergy_Management_History__c r : records) {
	                if (r.RM_Name__c != null){
							
							r.RM_Year__c = year;

		                    r.RM_This_Year_Q1__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q1_Text__c));
		                    r.RM_This_Year_Q2__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q2_Text__c));
		                    r.RM_This_Year_Q3__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q3_Text__c));
		                    r.RM_This_Year_Q4__c = Integer.valueOf(nullConvertZeroText(r.RM_This_Year_Q4_Text__c));
		                    r.RM_Next_Year__c = Integer.valueOf(nullConvertZeroText(r.RM_Next_Year_Text__c));
		                    r.RM_The_Year_After_Next__c = Integer.valueOf(nullConvertZeroText(r.RM_The_Year_After_Next_Text__c));
			                                
			                thisYearQ1 = thisYearQ1  == null  ? nullConvertZero(r.RM_This_Year_Q1__c) : thisYearQ1  + nullConvertZero(r.RM_This_Year_Q1__c);
			                thisYearQ2 = thisYearQ2  == null  ? nullConvertZero(r.RM_This_Year_Q2__c) : thisYearQ2  + nullConvertZero(r.RM_This_Year_Q2__c);
			                thisYearQ3 = thisYearQ3  == null  ? nullConvertZero(r.RM_This_Year_Q3__c) : thisYearQ3  + nullConvertZero(r.RM_This_Year_Q3__c);
			                thisYearQ4 = thisYearQ4  == null  ? nullConvertZero(r.RM_This_Year_Q4__c) : thisYearQ4  + nullConvertZero(r.RM_This_Year_Q4__c);
			                thisYear = thisYear  == null  ? nullConvertZero(r.RM_This_Year_Formula__c) : thisYear  + nullConvertZero(r.RM_This_Year_Formula__c);
			                nextYear = nextYear  == null  ? nullConvertZero(r.RM_Next_Year__c) : nextYear  + nullConvertZero(r.RM_Next_Year__c);
			                theYearAfterNext = theYearAfterNext == null  ? nullConvertZero(r.RM_The_Year_After_Next__c) : theYearAfterNext + nullConvertZero(r.RM_The_Year_After_Next__c);
			                total = total == null ? nullConvertZero(r.RM_Total__c) : total + nullConvertZero(r.RM_Total__c);

		                
		                this.upsertRecordsQuantitative.add(r);	
	                }else{
	                	if(r.id != null){
	                		this.deleteRecordsQuantitative.add(r);
	                	}
	                }
	            }

			}catch(Exception de){

				// エラー処理
		        ApexPages.addMessages(de);
		        return false;
			}
			

            //SMALLプロジェクト以外の場合は必須入力。SMALLプロジェクトも入力可能
            if(rfaCapex.RM_Request_Record_Type__c != 'Small' && upsertRecordsQuantitative.size() == 0){
                
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.RM_Small_Project_Error, 'Project Input Error'));
				return false;
            }
            
		    //InvestmentAmount ÷ (Total ÷ 3)Total(回収期間の計算方法)
		    if((nullConvertZero(thisYearQ1) + nullConvertZero(thisYearQ2) + nullConvertZero(thisYearQ3) + nullConvertZero(thisYearQ4)) != 0){
		        result = nullConvertZero(rfaCapex.RM_Investment_Amounts__c) / ((nullConvertZero(thisYearQ1) + 
		        																nullConvertZero(thisYearQ2) + 
		          																nullConvertZero(thisYearQ3) + 
		           																nullConvertZero(thisYearQ4) + 
		           																nullConvertZero(nextYear) + 
		           																nullConvertZero(theYearAfterNext)) / 3);
		           																
		        result = result.setScale(1,RoundingMode.HALF_UP);
		        
		        //回収期間が1000年以上かかる場合はエラー   																
		        if(String.ValueOf(result).trim().length() >= 7 ){
		        	
		        	ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '回収期間が10000年以上かかっています。:' + result, 'Project Input Error'));
		        	return false;
		        }
		            
		        rfaCapex.RM_PaybackPeriodYears__c = result.setScale(1,RoundingMode.HALF_UP);
		        	
		    }
            
            return true;
        	
        }
        
        public boolean save() {

            try{
                    
                upsert this.upsertRecordsQuantitative;
                
                if(!this.deleteRecordsQuantitative.isEmpty()){
                	delete this.deleteRecordsQuantitative;
                }
                
            }catch(DmlException ex){
                ApexPages.addMessages(ex);
				return false;
            }
		                system.debug('●thisYearQ1●' + thisYearQ1);
		                system.debug('●thisYearQ2●' + thisYearQ2);
		                system.debug('●thisYearQ3●' + thisYearQ3);
		                system.debug('●thisYearQ4●' + thisYearQ4);
            return true;
            
        }
    
        private string nullConvertZeroText(string NumData){
            if(NumData == null){
                return '0';
            }else{
                return NumData;
            }
        }
        
        private Decimal nullConvertZero(Decimal NumData){
            if(NumData == null){
                return 0;
            }else{
                return NumData;
            }
        }
        
    }
    
    public class capexAndCashSpendSynergyHistory {
        
        public List<RM_Milestone_Synergy_Management_History__c> records { get; set; }
        public List<RM_Milestone_Synergy_Management_History__c> upsertRecordsCapex { get; set; }
        public List<RM_Milestone_Synergy_Management_History__c> deleteRecordsCapex { get; set; }
        public Decimal thisYear       { get; set; }
        public Decimal nextYear       { get; set; }
        public Decimal theYearAfterNext      { get; set; }
        public Decimal investTotal      { get; set; }
        
        public capexAndCashSpendSynergyHistory(Id rfaId, List<RM_Milestone_Synergy_Management_History__c> synergy) {
            
            this.records = new List<RM_Milestone_Synergy_Management_History__c>();
            
            for (RM_Milestone_Synergy_Management_History__c r : synergy) {
                           
                    this.records.add(r);
                    thisYear  = thisYear  == null  ? nullConvertZero(r.RM_This_Year__c) : thisYear  + nullConvertZero(r.RM_This_Year__c);
                    nextYear  = nextYear  == null  ? nullConvertZero(r.RM_Next_Year__c) : nextYear  + nullConvertZero(r.RM_Next_Year__c);
                    theYearAfterNext = theYearAfterNext == null  ? nullConvertZero(r.RM_The_Year_After_Next__c) : theYearAfterNext + nullConvertZero(r.RM_The_Year_After_Next__c);
                    investTotal  = investTotal  == null  ? nullConvertZero(r.RM_Invest_Total__c) : investTotal  + nullConvertZero(r.RM_Invest_Total__c);
            }
            
            for(integer i=1; this.records.size()<5; i++){
                this.records.add(new RM_Milestone_Synergy_Management_History__c(RM_RFA__c = rfaId,
                																RM_This_Year__c = 0,
                																RM_This_Year_Text__c ='0',
                																RM_Next_Year__c = 0,
                																RM_Next_Year_Text__c = '0',
                																RM_The_Year_After_Next__c = 0,
                																RM_The_Year_After_Next_Text__c = '0'));
            }           
            
        }
        
        public boolean validation(String year,Decimal investmentMounts) {  
            
            thisYear=0;
            nextYear=0;
            theYearAfterNext=0;
            investTotal=0;
                    	
        	this.upsertRecordsCapex = New List<RM_Milestone_Synergy_Management_History__c>();      
        	this.deleteRecordsCapex = New List<RM_Milestone_Synergy_Management_History__c>();      
        	try{
	            for (RM_Milestone_Synergy_Management_History__c r : records) {
	            	//system.debug('●r●:' + r.thisYear);
	                if (r.RM_Asset_Name__c != null){
	                    r.RM_This_Year__c = integer.ValueOf(nullConvertZeroText(r.RM_This_Year_Text__c));
	                    r.RM_Next_Year__c = integer.ValueOf(nullConvertZeroText(r.RM_Next_Year_Text__c));
	                    r.RM_The_Year_After_Next__c = integer.ValueOf(nullConvertZeroText(r.RM_The_Year_After_Next_Text__c));
	                	r.RM_Useful_Life__c = integer.ValueOf(nullConvertZeroText(r.RM_Useful_Life_Text__c));
	                	
		 	            thisYear = thisYear  == null  ? nullConvertZero(r.RM_This_Year__c) : thisYear  + nullConvertZero(r.RM_This_Year__c);
			            nextYear = nextYear  == null  ? nullConvertZero(r.RM_Next_Year__c) : nextYear  + nullConvertZero(r.RM_Next_Year__c);
			            theYearAfterNext = theYearAfterNext == null  ? nullConvertZero(r.RM_The_Year_After_Next__c) : theYearAfterNext + nullConvertZero(r.RM_The_Year_After_Next__c);
			            investTotal = investTotal  == null  ? nullConvertZero(r.RM_Invest_Total__c) : investTotal  + nullConvertZero(r.RM_Invest_Total__c);
	                	
	                	//資産名称が入力されている場合は資産分類、資産分類詳細、取得方法、取得方法（購入/リース）、耐用年数、金額は必須入力
	                	if(r.RM_Asset_Category__c == null || r.RM_Asset_Category_Detail__c == null 
	                		|| r.RM_Acquisition_Method__c == null || r.RM_Depreciation_Rule__c == null 
	                		|| r.RM_Useful_Life_Text__c == null || r.RM_This_Year_Text__c == null 
	                		|| r.RM_Next_Year_Text__c == null ||  r.RM_The_Year_After_Next_Text__c == null){
	                			
	                			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.RM_CapitalValidationError, 'CapitalValidationError'));
								return false;
	                	} else {
	                	
		                    r.RM_Year__c = year;
		                    this.upsertRecordsCapex.add(r);
	                	}
		
	                }else{
	                	if(r.Id != null){
	                		this.upsertRecordsCapex.add(r);
	                	}
	                }
            	}
            
				//Investment_Amountsの金額とtotalの金額が合わない場合はエラーとする
			    if(investmentMounts != nullConvertZero(thisYear)
			      					 + nullConvertZero(nextYear)
			                         + nullConvertZero(theYearAfterNext)){
			            
			        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.RM_Imvestment_AmountsError, 'Investment Amounts'));
					return false;
			    	
			    }
			
			}catch(Exception de){
				// エラー処理
		        ApexPages.addMessages(de);
		        return false;
			}
            
            return true;
            
        }
        
        public boolean save() {    
            
	        try{
	            system.debug('●upsertRecordsCapex●:' + upsertRecordsCapex);
	            if(this.upsertRecordsCapex.size() != 0){
	                upsert this.upsertRecordsCapex;
	                if(!this.deleteRecordsCapex.isEmpty()){
	                	delete this.deleteRecordsCapex;
	                }
		        }
	
	        }catch(DmlException ex){
	            ApexPages.addMessages(ex);
				return false;
	        }

		    return true;
        }
    
        private Decimal nullConvertZero(Decimal NumData){
            if(NumData == null){
                return 0;
            }else{
                return NumData;
            }
        }
        
        private string nullConvertZeroText(string NumData){
            if(NumData == null){
                return '0';
            }else{
                return NumData;
            }
        }

    }
}