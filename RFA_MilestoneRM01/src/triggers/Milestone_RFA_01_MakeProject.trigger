trigger Milestone_RFA_01_MakeProject on Project_Application_RFA__c (before insert, before update) {
	Milestone1_Project__c mp = new Milestone1_Project__c();
	for(Project_Application_RFA__c par:trigger.new){
		mp.name = par.Name;
		
	}
	//Database.SaveResult[] srList = Database.insert(mp, false);
	
}