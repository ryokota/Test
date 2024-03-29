/**
 * Class Name: RFA_AP09_Realignment
 * Author: Accenture
 * Date: 02-07-2012
 * Project Name: Coke-RFA
 * Requirement Description: This batch is used for realignment for security of Profit Center.
 *
 * updated by Jia Hu on 2013/11/01 
 * Previous Level removed
 **/
/*
	called from class RFA_VFC10_ProfitCenterRecalculation
*/ 
global class RFA_AP09_Realignment implements Database.Batchable<SObject>{
		
    // Variable
    global string query;
   
    public Static String errorString;
	    
    /**
     * Constructor
     */
    public RFA_AP09_Realignment (String query)
    {
    	system.debug('--------- public RFA_AP09_Realignment (String query): ' + query);
    	this.query = query;         
    }
    
    /**
     *  start method
     *  @param Database.BatchableContext
     *  @return Database.Querylocator
     */
    global Database.Querylocator start(Database.BatchableContext bc){
    	system.debug('----------- Database.Querylocator start(Database.BatchableContext bc): ' + bc);
        return DataBase.getQueryLocator(query);
    }
    
    /**
     *  execute method
     *  @param Database.BatchableContext
     *  @param List<SObject>
     */
    global void execute(Database.BatchableContext bC, List<sObject> profitCenterRecords){
				    	
      	Map<Id, Map<Id,String>> profitCenterMap = new Map<Id, Map<Id,String>>(); // RFAId,Profit Center,rfaLevel
      	Map<Id,Id> rfaSharingDeleteMap = new Map<Id,Id>(); // RfaId , ProfitCenterId
      	Set<id> profitCenterIds = new Set<Id>(); // used for storing list of Profit Center record IDs impacted
      	Map<Id,String> rfaLevelMap;//=new Map<Id,String>(); // used to store Profit Center ID, current RFA Level
      	Set<Id> rfaCompletedSet = new Set<Id>(); // used to store completed RFA Ids
      	List<ProfitCenter__c> profitCenterUpdateList = new List<ProfitCenter__c>(); // used to reset NeedRecalculation flag
      	RFA_AP02_Shareutil shareUtil = new RFA_AP02_Shareutil(); //Instantiate ShareUtil class
      
      	for(sObject s : profitCenterRecords)
      	{
      		system.debug('--------- for(sObject s : profitCenterRecords): ' + profitCenterRecords);
            ProfitCenter__c profitCenter = (ProfitCenter__c)s;
        	//profitCenter.NeedRecalculation__c=false;
            profitCenterIds.add(profitCenter.Id);
        	//profitCenterUpdateList.add(profitCenter);
      	}
      
      	//errorString=new List<String>();
        for(RFA__c rfaRecord: [
        	Select profitCenterNumber__c, id,
        	//Level__c, 
        	//PreviousLevel__c, 
        	Stage__c 
        	from RFA__c 
        	where profitCenterNumber__c IN: profitCenterIds 
        		and Stage__c != null //Level__c != null 
        		LIMIT : (limits.getLimitQueryRows() - limits.getQueryRows())
        	])
        {rfaLevelMap = new Map<Id,String>();
        
            // If RFA is not within a circulation stage, assign rfaLevelMap to Profit Center ID, previous RFA level
            if(
            	rfaRecord.Stage__c == RFAConstants.RFA_STATUS_ReturnToRequester
            	//RFAGlobalConstants.RETURN_TO_SENDER 
            	//rfaRecord.Level__c == RFAGlobalConstants.RETURN_TO_SENDER 
            	//|| rfaRecord.Level__c == RFAGlobalConstants.CAPITAL_MGMT_HOLD 
            	//|| rfaRecord.Level__c == RFAGlobalConstants.PENDING_BOARD_REVIEW
              )
            {
            	/*
            		updated by Jia Hu on 2013/11/07  remove PreviousLevel__c 
            	*/
            	//rfaLevelMap.put(rfaRecord.profitCenterNumber__c, rfaRecord.Level__c);
            	rfaLevelMap.put(rfaRecord.profitCenterNumber__c, rfaRecord.Stage__c);
            	
                    //if(rfaRecord.PreviousLevel__c == null || rfaRecord.PreviousLevel__c == '' )
                    //{   
                    //    if(errorString == null || errorString == '')
                    //        errorString=rfaRecord.Id;
                    //     else    
                    //        errorString=errorString +' ' +rfaRecord.Id;
                        
                    //}
                    //else 
                    //{
                    //    rfaLevelMap.put(rfaRecord.profitCenterNumber__c,rfaRecord.PreviousLevel__c);
                    //}            
            }
            else // assign rfaLevelMap to Profit Center ID, current RFA level
            {
                    //rfaLevelMap.put(rfaRecord.profitCenterNumber__c, rfaRecord.Level__c);
                    rfaLevelMap.put(rfaRecord.profitCenterNumber__c, rfaRecord.Stage__c);
            }
               
           if(!rfaLevelMap.IsEmpty()) 
           {
            	profitCenterMap.put(rfaRecord.Id, rfaLevelMap); 
            	// put (RFA ID, <RFA Profit Center ID, RFA Level>) in profitCenterMap
           		rfaSharingDeleteMap.put(rfaRecord.Id, rfaRecord.profitCenterNumber__c);
           }
            
            // GA - added for 2013 Q2 FR1.93 - Location Coordinator should have read only access on closed RFA
            // if RFA is in a completed stage, add to rfACompletedSet
            if (rfaRecord.Stage__c == RFAConstants.RFA_STATUS_APPROVED
            		//RFAGlobalConstants.RFA_STAGE_APPROVED 
            	|| rfaRecord.Stage__c == RFAConstants.RFA_STATUS_REJECTED
            		//RFAGlobalConstants.RFA_STAGE_REJECTED 
            	|| rfaRecord.Stage__c == RFAConstants.RFA_STATUS_CLOSED
            		//RFAGlobalConstants.RFA_STAGE_CLOSED
            	)
            	rfaCompletedSet.add(rfaRecord.id);
            
            System.debug(profitCenterMap + ']]]]]]]]]]]]]]]]]]]]]]]]');
        }
        
       // System.debug('errorString:::'+errorString.Size());
        if(!profitCenterMap.IsEmpty())
        {
        	system.debug('------------ before shareUtil.rfaProfitCenterUpdateDeleteOldProfitCenter: rfaSharingDeleteMap: ' + rfaSharingDeleteMap);
            shareUtil.rfaProfitCenterUpdateDeleteOldProfitCenter(rfaSharingDeleteMap);
            system.debug('------------ before shareUtil.profitCenterAtRfaCreateShare: profitCenterMap: ' + profitCenterMap);
            shareUtil.profitCenterAtRfaCreateShare(profitCenterMap);
        }
        
        // GA - added for 2013 Q2 FR1.93 - Location Coordinator should have read only access on closed RFA
        // call method to update Coordinator access on completed RFAs
        //if (!rfaCompletedSet.IsEmpty())
        	//can removed this ??
        //	shareUtil.ModifyLocationCoordinatorAccess(rfaCompletedSet);
        
        // Reset NeedRecalculation field flag on Profit Center to False
        for(Id profitCenterId:profitCenterIds) 
        {
            ProfitCenter__c profitCenter = new ProfitCenter__c(id=profitCenterId);
            profitCenter.NeedRecalculation__c = false;
            profitCenterUpdateList.add(profitCenter);
                
        }
        
        if(!profitCenterUpdateList.IsEmpty())
        {
            
            update profitCenterUpdateList;
        }
		        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

		//set the email properties
    	//String mailBody=String.valueof();
    	//RFA_CL132: RSAS_NA_LN_Support@coca-cola.com -> need to change to CCEJ's mail box
    	//Custom label that holds RSAS email address - 12-Oct-2012
    	//Updated by Jia Hu on 2014/03/07 add running email since only System Admin will use this function
    	mail.setToAddresses(new string[] {Label.RFA_CL132, Userinfo.getUserEmail() }); 
    	mail.setSenderDisplayName('Batch Job');
    	mail.setSubject('Recalculation Batch Job failed for RFA');
    	mail.setHtmlBody('RFA Ids are: ' + errorString);

		//SINGLE_EMAIL_LIMIT_EXCEEDED
		//!close this for the test!
	
		//send the email
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail } );
          
    }
   
    /**
     *  finish method
     *  @param Database.BatchableContext
     */
    global void finish(Database.BatchableContext BC){
           
    }
	     
}