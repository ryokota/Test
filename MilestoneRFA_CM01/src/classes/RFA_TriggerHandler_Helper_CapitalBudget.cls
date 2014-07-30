public without sharing class RFA_TriggerHandler_Helper_CapitalBudget {


    /*
        ============ isBefore & isInsert ============ 
    */

    public static void processRFAsInBeforeInsertTrigger(List<RFA__c> listNewRFAs) {
            
        
    }
    
    
    /*
        ============ isAfter & isInsert ============ 
    */

    public static void processCapitalBudgetInitiateRFAsInAfterInsertTrigger(List<RFA__c> listNewRFAs) {
         system.debug('●rfa.listNewRFAs●' + listNewRFAs);
    for(RFA__c rfa :listNewRFAs) {
        system.debug('●rfa.Record_Type__c●' + rfa.Record_Type__c);
        if(rfa.Record_Type__c == '04. Capital Budget Initial Request' && rfa.RM_L3_Approved__c == true){
            
            //List<RM_Milestone_Synergy_Management_History__c> oldMsmhList = new List<RM_Milestone_Synergy_Management_History__c>();
            List<RM_Milestone_Synergy_Management_History__c> newMsmhList = new List<RM_Milestone_Synergy_Management_History__c>();
            for (RM_Milestone_Synergy_Management_History__c r:[SELECT 
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
                            
                            RM_Milestone_Synergy_Management_History__c newMsmh = new RM_Milestone_Synergy_Management_History__c();
                            
                            r.RM_RFA__c = rfa.Id;
                            newMsmh = r.clone();

                                newMsmhList.add(newMsmh);
                                
                            }
            
            system.debug('●newMsmhList●:' + newMsmhList);
            insert newMsmhList;
    

        }
    }
        
        
    }

    
    /*
        ============ isBefore & isUpdate ============ 
    */
	public static void processCapitalBudgetInitiateRFAsInAfterUpdate(		
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {		
		for(RFA__c rfa : listNewRFAs) {
			//Capital Budget Initiate Request need to check Attachment Status!
			if(
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT
				&& ( 
					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST)
				   )											
				)	
				||
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
				&& ( 
 					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST)	
				   )	
				)									
			) {
				
				//if(rfa.RM_Investment_Amounts__c != rfa.RM_Invest_Total__c) {
				//	rfa.addError('Investment Amounts not equals to Investment Total!');	
				//}
				
				//Invest. Total in Table (CAPEX and Cash Spend Schedule (Per \1,000 JPY)) should be same with Investment Amounts(Per \1,000 JPY)
				Decimal decInvestmentTotal = 0;
				for(RM_Milestone_Synergy_Management_History__c child : [
					Select Id, RM_Total__c, RM_Invest_Total__c 
					from RM_Milestone_Synergy_Management_History__c 
					where RM_RFA__c =: rfa.Id
					]
				) {
					system.debug('------- child.RM_Invest_Total__c: ' + child.RM_Invest_Total__c);
					//decInvestmentTotal = decInvestmentTotal + child.RM_Total__c;
					decInvestmentTotal = decInvestmentTotal + child.RM_Invest_Total__c;
				}

				if(rfa.RM_Investment_Amounts__c != decInvestmentTotal) {
					rfa.addError(
						Label.RM_Imvestment_AmountsError
						//'Investment Amounts not equals to Investment Total!'
					);	
				}				
				
				system.debug('------- rfa.RM_Investment_Amounts__c: ' + rfa.RM_Investment_Amounts__c);
				system.debug('------- decInvestmentTotal: ' + decInvestmentTotal);
				
				List<Attachment> listAttachments = [Select Id from Attachment where ParentId =: rfa.Id];

				if(listAttachments == null || (listAttachments != null && listAttachments.size() == 0)) {

					rfa.addError(
						Label.RM_Attached_File
						//'No attachments !'
						);	

				}				
								
			}//end of if();
			
		}//end of for(RFAs);		
		
		
		
		
	}
    
    
    /*
        ============ isAfter & isUpdate ============ 
    */

    
    
    /*
        ============ isBefore & isDelete ============ 
    */


    
    
    /*
        ============ isAfter & isDelete ============ 
    */



    /*
        ============ isAfter & isUnDelete ============ 
    */  



}