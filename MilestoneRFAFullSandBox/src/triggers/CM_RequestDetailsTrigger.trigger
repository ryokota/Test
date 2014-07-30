/*    
 *  Trigger          : CM_RequestDetailsTrigger
 *  Author           : Pasonatquila Inc.
 *  Version History  : 1.0
 *  Creation         : 2014/5/22
 *  Assumptions      : N/A
 *  Description      : 
 *  Updated by Yoshinari from 2014/05/27                                    
 */
trigger CM_RequestDetailsTrigger on CM_RequestDetails__c (
    	before insert,
    	before update,
    	before delete
    ) {

    // trigger:Insert
    if (Trigger.isBefore && Trigger.isInsert) 
    {
		if( trigger.new != null && !(trigger.new.size() > 1) )
		{
			CM_RequestDetails__c target = Trigger.new[0];
			// exist record Map
			Map<id, CM_RequestDetails__c> existRequestDetailMap = new Map<id, CM_RequestDetails__c>();
			for (CM_RequestDetails__c rd : 
					[select id, recordTypeid 
						from CM_RequestDetails__c 
						where CM_RFA__c =: target.CM_RFA__c] )
			{
				// put existRequestDetailMap
				existRequestDetailMap.put(rd.recordTypeid, rd);
			}

	        for(CM_RequestDetails__c rfa_detail : trigger.new) 
	        {
	        	// duplicate error check
	        	if (existRequestDetailMap.containsKey(rfa_detail.recordTypeid)) {
	        		rfa_detail.addError(System.label.CM_Request_Details_Duplicate_Error);
	        	} else {
	        		// put existRequestDetailMap
	        		existRequestDetailMap.put(rfa_detail.recordTypeid, rfa_detail);
	        	}
	        }
    	}
    }
    
    // trigger:Update
    if(Trigger.isBefore && Trigger.isUpdate) 
    {
        for(CM_RequestDetails__c rfa_detail : trigger.new) 
        {
            // change recordType error
            if(rfa_detail.RecordTypeId != trigger.oldMap.get(rfa_detail.Id).RecordTypeId)
            {
            	// change recordType error message
                rfa_detail.addError(System.label.CM_Change_RecordType_Error);
            }
        }
    }       
    
    // trigger:delete
    if(Trigger.isBefore && Trigger.isDelete) 
    {
        for ( CM_RequestDetails__c rfa_detail: trigger.old) 
        {
            // Approved not be deleted 
            system.debug(LoggingLevel.DEBUG, '#status:' + rfa_detail.CM_RFA_stage__c);
            if (rfa_detail.CM_RFA_stage__c == RFAConstants.RFA_STATUS_APPROVED) 
            {
                // error message
                rfa_detail.addError(System.label.CM_Delete_Record_Error_Message);
            }
        }
    }
}