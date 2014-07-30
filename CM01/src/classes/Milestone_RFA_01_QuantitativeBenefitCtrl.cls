public with sharing class Milestone_RFA_01_QuantitativeBenefitCtrl {
	
	public RFA__c rfa { get; set; }
	
	public List<String> headerYear { get; set; }
	public String year { get; set; }
	public List<SelectOption> yearOption { get; set; }
	public List<SelectOption> nameOption { get; set; }
	public String thisYear { get; set; }

	public synergyHistories spendingSynergyHistory { get; set; }
	
	private id rfaId { get; set; }
	
	private List<RM_Milestone_Synergy_Management_History__c> synergyHistories { get; set; }
	
	public Milestone_RFA_01_QuantitativeBenefitCtrl(ApexPages.StandardController stdController) {
		
		this.rfaId = stdController.getId();

		init(this.rfaId);
		
	}
	
	private void init(id rid) {
		
		this.rfa = getRfa(rid);
		this.synergyHistories = getSynergyHistories(rid);
		
		system.debug('予算管理レコードを取得this.synergyHistories:' + this.synergyHistories);
		
		//年度設定
		Date d;
		this.yearOption = new List<SelectOption>();


		if (this.synergyHistories.isEmpty()) {
			
			d = Date.today();
			year = String.valueOf(d.year());
		} else {

			d = Date.newInstance(this.synergyHistories.get(0).CreatedDate.year(), 1, 1);
			year = this.synergyHistories.get(0).RM_Year__c;
		}
		//NameOption
		this.nameOption = new List<SelectOption>();
		this.nameOption.add(new SelectOption('Spending CAPEX','Spending CAPEX'));
		this.nameOption.add(new SelectOption('Spending OPEX','Spending OPEX'));
		this.nameOption.add(new SelectOption('Saving CAPEX','Saving CAPEX'));
		this.nameOption.add(new SelectOption('Saving OPEX','Saving OPEX'));

		for (Integer i = 0; i < 5; i++) {
			yearOption.add(new SelectOption(String.valueOf(d.year() + i), String.valueOf(d.year()+ i)));
		}
		
		this.headerYear =  getYear(year);
		
		this.spendingSynergyHistory = new synergyHistories(rid, this.synergyHistories);
	}
	
	public void changeYear() {
		
		this.headerYear =  getYear(year);
		
	}
	
	public void saveSynergy() {
		
		spendingSynergyHistory.save(this.year);
		
		upsert this.rfa;
		
		init(this.rfaId);
		
	}
	
	public void editCancel() {
		
		init(this.rfaId);
		
	}
	
	private RFA__c getRfa(Id rid) {
		
		List<RFA__c> r = [select
						Id,
						RM_Detail_Document_Attached_Y_N_3__c,
						RM_PaybackPeriodYears__c
					from
						RFA__c
					where
						Id = :rid];
		return r.isEmpty() ? new RFA__c() : r.get(0);
		
	}
	
	private List<RM_Milestone_Synergy_Management_History__c> getSynergyHistories(Id rfaId) {
		
		return [select
						Id,
						Seq_No__c,
						RM_Function__c,
						RM_Year__c,
						RM_Name__c,
						RM_Saving_or_Spending__c,
						RM_This_Year_Q1__c,
						RM_This_Year_Q2__c,
						RM_This_Year_Q3__c,
						RM_This_Year_Q4__c,
						RM_This_Year_Formula__c,
						RM_Next_Year_Q1__c,
						RM_Next_Year_Q2__c,
						RM_Next_Year_Q3__c,
						RM_Next_Year_Q4__c,
						RM_Next_Year_Formula__c,
						RM_The_Year_After_Next__c,
						RM_Three_Years_Later__c,
						RM_Four_Years_Later__c,
						RM_Total__c,
						CreatedDate,
						RM_RFA__c
					from
						RM_Milestone_Synergy_Management_History__c
					where
						RM_RFA__c = :rfaId
						];
	}

	private List<String> getYear() {

		return getYear('');

	}
	
	private List<String> getYear(String thisYear) {
		
		List<String> year = new List<String>();
		Date d;

		if (thisYear == '' || thisYear == null) {
			d = Date.today();
		} else {
			d = Date.newInstance(Integer.valueOf(thisYear), 1, 1);
		}

		this.thisYear = String.valueOf(d.year());
		year.add(String.valueOf(d.addYears(1).year()));
		year.add(String.valueOf(d.addYears(2).year()));
		year.add(String.valueOf(d.addYears(3).year()));
		year.add(String.valueOf(d.addYears(4).year()));
		
		return year;
	}
	
	
	public class synergyHistories {
		
		public List<RM_Milestone_Synergy_Management_History__c> records { get; set; }
		
		public Decimal thisYearQ1       { get; set; }
		public Decimal thisYearQ2       { get; set; }
		public Decimal thisYearQ3       { get; set; }
		public Decimal thisYearQ4       { get; set; }
		public Decimal thisYearTotal    { get; set; }
		public Decimal nextYearQ1       { get; set; }
		public Decimal nextYearQ2       { get; set; }
		public Decimal nextYearQ3       { get; set; }
		public Decimal nextYearQ4       { get; set; }
		public Decimal nextYearTotal    { get; set; }		
		public Decimal theYearAfterNext { get; set; }
		public Decimal threeYearsLater  { get; set; }
		public Decimal fourYearsLater   { get; set; }
		public Decimal total            { get; set; }
		
		public synergyHistories(Id rfaId, List<RM_Milestone_Synergy_Management_History__c> synergy) {
						
		this.records = new List<RM_Milestone_Synergy_Management_History__c>();
			
			for (RM_Milestone_Synergy_Management_History__c r : synergy) {
				
					this.records.add(r);
					thisYearQ1  = thisYearQ1  == null  ? nullConvertZero(r.RM_This_Year_Q1__c) : thisYearQ1  + nullConvertZero(r.RM_This_Year_Q1__c);
					thisYearQ2  = thisYearQ2  == null  ? nullConvertZero(r.RM_This_Year_Q2__c) : thisYearQ2  + nullConvertZero(r.RM_This_Year_Q2__c);
					thisYearQ3  = thisYearQ3  == null  ? nullConvertZero(r.RM_This_Year_Q3__c) : thisYearQ3  + nullConvertZero(r.RM_This_Year_Q3__c);
					thisYearQ4  = thisYearQ4  == null  ? nullConvertZero(r.RM_This_Year_Q4__c) : thisYearQ4  + nullConvertZero(r.RM_This_Year_Q4__c);
					thisYearTotal  = thisYearTotal  == null  ? nullConvertZero(r.RM_This_Year_Formula__c) : thisYearTotal  + nullConvertZero(r.RM_This_Year_Formula__c);
					nextYearQ1  = nextYearQ1  == null  ? nullConvertZero(r.RM_Next_Year_Q1__c) : nextYearQ1  + nullConvertZero(r.RM_Next_Year_Q1__c);
					nextYearQ2  = nextYearQ2  == null  ? nullConvertZero(r.RM_Next_Year_Q2__c) : nextYearQ2  + nullConvertZero(r.RM_Next_Year_Q2__c);
					nextYearQ3  = nextYearQ3  == null  ? nullConvertZero(r.RM_Next_Year_Q3__c) : nextYearQ3  + nullConvertZero(r.RM_Next_Year_Q3__c);
					nextYearQ4  = nextYearQ4  == null  ? nullConvertZero(r.RM_Next_Year_Q4__c) : nextYearQ4  + nullConvertZero(r.RM_Next_Year_Q4__c);
					nextYearTotal  = nextYearTotal  == null  ? nullConvertZero(r.RM_Next_Year_Formula__c) : nextYearTotal  + nullConvertZero(r.RM_Next_Year_Formula__c);
					theYearAfterNext  = theYearAfterNext  == null  ? nullConvertZero(r.RM_The_Year_After_Next__c) : theYearAfterNext  + nullConvertZero(r.RM_The_Year_After_Next__c);
					threeYearsLater = threeYearsLater == null  ? nullConvertZero(r.RM_Three_Years_Later__c) : threeYearsLater + nullConvertZero(r.RM_Three_Years_Later__c);
					fourYearsLater  = fourYearsLater  == null  ? nullConvertZero(r.RM_Four_Years_Later__c)  : fourYearsLater  + nullConvertZero(r.RM_Four_Years_Later__c);
					total = total == null ? nullConvertZero(r.RM_Total__c) : total + nullConvertZero(r.RM_Total__c);

			}
			
			if (this.records.isEmpty()) {

				this.thisYearQ1 = null;
				this.thisYearQ2 = null;
				this.thisYearQ3 = null;
				this.thisYearQ4 = null;
				this.nextYearTotal = null;
				this.nextYearQ1 = null;
				this.nextYearQ2 = null;
				this.nextYearQ3 = null;
				this.nextYearQ4 = null;
				this.nextYearTotal = null;
				this.theYearAfterNext = null;
				this.threeYearsLater = null;
				this.fourYearsLater = null;
				this.total = null;
				
			}

			for(integer i=1; this.records.size()<10; i++){
				this.records.add(new RM_Milestone_Synergy_Management_History__c(RM_RFA__c = rfaId));
			}
		}
		
		public void save(String year) {
			
			for (RM_Milestone_Synergy_Management_History__c r : records) {
				r.RM_Year__c = year;
			}
			upsert this.records;
			
		}
		
		private Decimal nullConvertZero(Decimal NumData){
			if(NumData == null){
				return 0;
			}else{
				return NumData;
			}
		}
		
	}
}