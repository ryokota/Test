public with sharing class RFA_TriggerHandler_Helper_FinancialReqt {



	/*
		============ isBefore & isInsert ============ 
	*/

	
	
	/*
		============ isAfter & isInsert ============ 
	*/


	
	/*
		============ isBefore & isUpdate ============ 
	*/
		
	public static void checkValidation(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		//copied from RFA_RFATrigger.trigger line 325
		try{ 
			for(RFA__c rfa : listNewRFAs) {
                        if(rfa.Stage__c != 
                        	RFAConstants.RFA_STATUS_CLOSED
                        ) {
                        	Set<String> errorSet = RFA_AP05_RFATrigger.validateRFA(rfa, mapOldRFAs.get(rfa.Id));
                        	
                        	if(!errorSet.isEmpty()) {
                        		//added by Jia Hu on 2014/01/07
                        		//processing error message
                        		integer index = 1;
                        		for(String str : errorSet) {
                        			//Trigger.new[0].addError( index + '. ' + str );
                        			Trigger.new[0].addError( str );
                        			index++;
                        		}
                        		
                        		
                        		throw new RFA_AP19_RFAValidationException(errorSet);                        		                       		
                        	}
                        }   				
			}
			
		} catch (RFA_AP19_RFAValidationException validationEx){
			system.debug('validationEx.getMessage()+++ ' + validationEx.getMessage());
		}
		
	}
	
	/*
	//copied from RFA_RFATrigger.trigger line 275
	public static void sendEmails(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		for(RFA__c rfa : listNewRFAs) {
			if(				
                (rfa.Stage__c == RFAConstants.RFA_STATUS_CLOSED
                    || rfa.Stage__c == RFAConstants.RFA_STATUS_APPROVED
                    || rfa.Stage__c == RFAConstants.RFA_STATUS_REJECTED
                ) 
                && 
               	mapOldRFAs.get(rfa.Id).Stage__c != rfa.Stage__c)
        	{
        		
                        system.debug('--------- In RFA Trigger: Stage: ' + rfa.Stage__c);
                        
                        if(RFA_AP05_RFATrigger.emailAtComplete) {
                        	
                        if(rfa.Stage__c == RFAConstants.RFA_STATUS_APPROVED) {
                        	//need to update to Static Method!
							//inst.sendEmail_CompleteMemo(rfa);
							
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        } else if(rfa.Stage__c == RFAConstants.RFA_STATUS_REJECTED) {
                        	//need to update to Static Method!
							//inst.sendEmail_CompleteMemo(rfa); 
							
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        } else if(rfa.Stage__c == RFAConstants.RFA_STATUS_CLOSED) {
                        	
							if(mapOldRFAs.get(rfa.Id).Stage__c == RFAConstants.RFA_STATUS_DRAFT) {
								//To: Requester, PPOC
								//need to update to Static Method!
                        		//inst.sendEmail_CloseRFA(rfa, true);
							} else if(mapOldRFAs.get(rfa.Id).Stage__c == RFAConstants.RFA_STATUS_ReturnToRequester) {
								//To: Requester, PPOC, Info Copy Only, Approver & Agent
								//need to update to Static Method!
								//inst.sendEmail_CloseRFA(rfa, false);
							}
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        }                         
                        }   	
                        		
			}//enf of if();		
		}//end of for(RFAs);		
	}
	*/
	
	
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