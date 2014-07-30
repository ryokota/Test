public with sharing class RM_VFC_FinancialValidationCtrl {
	
	//フラグ
	public boolean isNew { get; set; }
	
	//RFA Detail Document Attached Y/N and Payback Period (Years)
	public RFA__c rfa { get; set; }
	
	//年度
	public List<String> headerYear { get; set; }
	public String year { get; set; }
	public List<SelectOption> yearOption { get; set; }

	//Synergy Management History
	public synergyHistories savingSynergyHistory   { get; set; }
	public synergyHistories spendingSynergyHistory { get; set; }
	
	private id rfaId { get; set; }
	private List<RM_Milestone_Synergy_Management_History__c> synergyHistories { get; set; }
	
	public RM_VFC_FinancialValidationCtrl(ApexPages.StandardController stdController) {
		
		this.rfaId = stdController.getId();
		
		//フラグ設定
		this.isNew = this.rfaId == null ? true : false;
		
		//初期化
		init(this.rfaId);
		
	}
	
	private void init(id rid) {
		
		//データ取得
		this.rfa = getRfa(rid);
		this.synergyHistories = getSynergyHistories(rid);
		
		//年度設定
		Date d;
		this.yearOption = new List<SelectOption>();
		
		if (this.synergyHistories.isEmpty()) {
			d = Date.today();
			this.year = String.valueOf(d.year());
		} else {
			d = Date.newInstance(this.synergyHistories.get(0).CreatedDate.year(), 1, 1);
			this.year = this.synergyHistories.get(0).RM_Year__c;
		}
		
		for (Integer i = 0; i < 5; i++) {
			yearOption.add(new SelectOption(String.valueOf(d.year() + i), String.valueOf(d.year()+ i)));
		}
		
		this.headerYear =  getYear(year);
		
		this.savingSynergyHistory = new synergyHistories(rid, this.synergyHistories, 'Saving');
		this.spendingSynergyHistory = new synergyHistories(rid, this.synergyHistories, 'Spending');
	}
	
	public void changeYear() {
		
		this.headerYear =  getYear(this.year);
		
	}
	
	public void saveSynergy() {
		
		savingSynergyHistory.save(this.year);
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
						RM_Year__c,
						RM_Name__c,
						RM_Saving_or_Spending__c,
						RM_This_Year__c,
						RM_Next_Year__c,
						RM_The_Year_After_Next__c,
						RM_Three_Years_Later__c,
						RM_Four_Years_Later__c,
						RM_This_Year_Formula__c,
						RM_Total__c,
						CreatedDate
					from
						RM_Milestone_Synergy_Management_History__c
					where
						RM_RFA__c = :rfaId
					order by
						Seq_No__c asc];
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
		
		year.add(String.valueOf(d.year()));
		year.add(String.valueOf(d.addYears(1).year()));
		year.add(String.valueOf(d.addYears(2).year()));
		year.add(String.valueOf(d.addYears(3).year()));
		year.add(String.valueOf(d.addYears(4).year()));
		return year;
	}
	public class synergyHistories {
		
		public List<RM_Milestone_Synergy_Management_History__c> records { get; set; }
		
		public Decimal thisYear       { get; set; }
		public Decimal nextYear       { get; set; }
		public Decimal afterNext      { get; set; }
		public Decimal threeYearLater { get; set; }
		public Decimal fourYearLater  { get; set; }
		public Decimal total          { get; set; }
		
		public synergyHistories(Id rfaId, List<RM_Milestone_Synergy_Management_History__c> synergy, String synergyType) {
			
			this.records = new List<RM_Milestone_Synergy_Management_History__c>();
			
			for (RM_Milestone_Synergy_Management_History__c r : synergy) {
				
				if (r.RM_Saving_or_Spending__c == synergyType) {
					
					this.records.add(r);
					thisYear  = thisYear  == null  ? r.RM_This_Year__c : thisYear  - r.RM_This_Year__c;
					nextYear  = nextYear  == null  ? r.RM_Next_Year__c : nextYear  - r.RM_Next_Year__c;
					afterNext = afterNext == null  ? r.RM_The_Year_After_Next__c : afterNext - r.RM_The_Year_After_Next__c;
					threeYearLater = threeYearLater == null  ? r.RM_Three_Years_Later__c : threeYearLater - r.RM_Three_Years_Later__c;
					fourYearLater  = fourYearLater  == null  ? r.RM_Four_Years_Later__c  : fourYearLater  - r.RM_Four_Years_Later__c;
					total = total == null ? r.RM_Total__c : total - r.RM_Total__c;
				}
			}
			
			
			if (this.records.isEmpty()) {
				
				this.records.add(new RM_Milestone_Synergy_Management_History__c(RM_RFA__c = rfaId,
																				RM_Saving_or_Spending__c = synergyType,
																				RM_Name__c ='Plan',
																				Seq_No__c = synergyType == 'Saving' ? 1 : 3));
				this.records.add(new RM_Milestone_Synergy_Management_History__c(RM_RFA__c = rfaId,
																				RM_Saving_or_Spending__c=synergyType,
																				RM_Name__c='Actual',
																				Seq_No__c = synergyType == 'Saving' ? 2 : 4));
				
				this.thisYear = null;
				this.nextYear = null;
				this.afterNext = null;
				this.threeYearLater = null;
				this.fourYearLater = null;
				this.total = null;
				
			}
		}
		
		public void save(String year) {
			
			for (RM_Milestone_Synergy_Management_History__c r : records) {
				r.RM_Year__c = year;
			}
			upsert this.records;
			
		}
		
	}
}