trigger RM_CaptialBudgetRequestTrigger on RFA__c (after insert) {
            system.debug('●●●●●●●●●●');
            system.debug('●Trigger.new●' + Trigger.new);
    for(RFA__c rfa : Trigger.new) {
        system.debug('●rfa.Record_Type__c●' + rfa.Record_Type__c);
        if(rfa.Record_Type__c == RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST){
            
            List<RM_Milestone_Synergy_Management_History__c> oldMsmhList = new List<RM_Milestone_Synergy_Management_History__c>();
            List<RM_Milestone_Synergy_Management_History__c> newMsmhList = new List<RM_Milestone_Synergy_Management_History__c>();
            for (RM_Milestone_Synergy_Management_History__c r:[SELECT 
                            Id,
                            RM_Year__c,
                            RM_Name__c,
                            RM_Asset_Name__c,
                            RM_Asset_Category__c,
                            RM_Asset_Category_Detail__c,
                            RM_Entity__c,
                            RM_Detail__c,
                            RM_Acquisition_Method__c,
                            RM_Depreciation_Rule__c,
                            RM_Useful_Life__c,
                            RM_This_Year__c,
                            RM_Next_Year__c,
                            RM_The_Year_After_Next__c,
                            RM_Invest_Total__c,
                            CreatedDate,
                            RM_RFA__c,
                            RM_This_Year_Q1__c,
                            RM_This_Year_Q2__c,
                            RM_This_Year_Q3__c,
                            RM_This_Year_Q4__c,
                            RM_This_Year_Formula__c,
                            RM_Total__c,
                            RM_Remarks__c
                        from
                            RM_Milestone_Synergy_Management_History__c
                        where
                            RM_RFA__c = :rfa.Related_RFA_1__c]){
                                r.RM_RFA__c = rfa.Id;
                                newMsmhList.add(r);
                                
                            }
            
            //newMsmhList = oldMsmhList.clone();
            system.debug('●oldMsmhList●:' + oldMsmhList);
            system.debug('●newMsmhList●:' + newMsmhList);
            insert newMsmhList;
    
        }
    }
}