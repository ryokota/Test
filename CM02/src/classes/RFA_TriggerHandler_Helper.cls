/*
	Created by Jia Hu on 2014/05/21
	1. common actions for all Record Types in different Trigger actions
	2. process based on different Record Types
	3. in each Record Type, divided into different Status, such as circulation, approved,...
*/
public without sharing class RFA_TriggerHandler_Helper {
	
	static ProfitCenter__c sobjProfitCenter {
		get {
			if(sobjProfitCenter == null) {
				sobjProfitCenter = [
					Select Id, Name, ProfitCenterName__c from ProfitCenter__c 
					where ProfitCenterName__c =: RFA_Utility_Constants.ProfitCenter_Name_CCEJ 
					order by CreatedDate Desc
					limit 1
				];
			}
			return sobjProfitCenter;
			} 
		set;
	}
		
	static Financial_Constant__c sobjTaxRate {
		get {
			if(sobjTaxRate == null) {
				sobjTaxRate = [
					Select Id, Name from Financial_Constant__c 
					where isActive__c = true 
                    		And RecordTypeId =: 
                    			Utility_Helper_RecordType.getRecordTypeIdByAPIName(
                    				RFA_Utility_Constants.sObj_FinancialConstant_APIName,
                    				RFA_Utility_Constants.FinancialConstant_RT_TaxRate
                    			) 
					order by CreatedDate Desc
					limit 1
				];
			}
			return sobjTaxRate;
			} 
		set;
	}	
	
	static Financial_Constant__c sobjWACC {
		get {
			if(sobjWACC == null) {
				sobjWACC = [
					Select Id, Name from Financial_Constant__c 
					where isActive__c = true 
                    		And RecordTypeId =: 
                    			Utility_Helper_RecordType.getRecordTypeIdByAPIName(
                    				RFA_Utility_Constants.sObj_FinancialConstant_APIName,
                    				RFA_Utility_Constants.FinancialConstant_RT_WACC
                    			) 
					order by CreatedDate Desc
					limit 1
				];
			}
			return sobjWACC;
			} 
		set;
	}	
	
	public static Financial_Constant__c sobjConsumptionTax {
		get {
			if(sobjConsumptionTax == null) {
				sobjConsumptionTax = [
					Select Id, Name from Financial_Constant__c 
					where isActive__c = true 
                    		And RecordTypeId =: 
                    			Utility_Helper_RecordType.getRecordTypeIdByAPIName(
                    				RFA_Utility_Constants.sObj_FinancialConstant_APIName,
                    				RFA_Utility_Constants.FinancialConstant_RT_ConsumptionTax
                    			) 
					order by CreatedDate Desc
					limit 1
				];
			}
			return sobjConsumptionTax;
			} 
		set;
	}		
		

	/*
		============ isBefore & isInsert ============ 
	*/
	public static void processRFAsOnBeforeInsertByRecordTypes(List<RFA__c> listNewRFAs) {
		
		List<RFA__c> listFinancialRFAs = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs = new List<RFA__c>();
		List<RFA__c> listMilestoneRFAs = new List<RFA__c>();
		List<RFA__c> listCapitalBudgetInitiateRFAs = new List<RFA__c>();
		List<RFA__c> listPaperlessRFAs = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(rfa.RecordTypeId)) {
				
				listFinancialRFAs.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(rfa.RecordTypeId)) {
												
				listMilestoneRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(rfa.RecordTypeId)) {
				
				listCapitalBudgetInitiateRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(rfa.RecordTypeId)) {
				
				listPaperlessRFAs.add(rfa);
			}		
			
		}//end of for(RFAs);
				
		if(listFinancialRFAs != null && listFinancialRFAs.size() > 0) {
			//Need to check BOD field if the COA rules need BOD based on the RFA input			
			COA_Handler_Matrix.addRFAApproversFromCOA(listFinancialRFAs, true);
		}
		
		if(listCommercialRFAs != null && listCommercialRFAs.size() > 0) {
			system.debug('------- Before & Insert listCommercialRFAs: ' + listCommercialRFAs);
			RFA_TriggerHandler_Helper_CommercialReqt.setDefaultCostCenter(listCommercialRFAs);
			
			COA_Handler_For_RFATrigger.processCommercialCOAsInBeforeInsertTrigger(listCommercialRFAs);
		}
		
		if(listMilestoneRFAs != null && listMilestoneRFAs.size() > 0) {
			//need to confirm the Related Project Status
			RFA_TriggerHandler_Helper_ProjectRequest.processMilestoneRFAsInBeforeInsert(listMilestoneRFAs);
		}
		
		if(listCapitalBudgetInitiateRFAs != null && listCapitalBudgetInitiateRFAs.size() > 0) {
			RFA_TriggerHandler_Helper_CapitalBudget.processRFAsInBeforeInsertTrigger(listCapitalBudgetInitiateRFAs);
		}
		
		if(listPaperlessRFAs != null && listPaperlessRFAs.size() > 0) {
			RFA_TriggerHandler_Helper_SealRequest.checkSealCompleteCheckInBeforeInsert(listPaperlessRFAs);
		}			
	}	
	
		
		
	//set up the related records for all record types !
	public static void setLookups(List<RFA__c> listNewRFAs) {
		for(RFA__c rfa : listNewRFAs) {
			rfa.ProfitCenterNumber__c = sobjProfitCenter.Id;
			rfa.FC_TaxRate__c = sobjTaxRate.Id;
			rfa.FC_WACC__c = sobjWACC.Id;
		}
		
	}
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void processRFAsOnAfterInsertByRecordTypes(List<RFA__c> listNewRFAs) {
		
		List<RFA__c> listFinancialRFAs = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs = new List<RFA__c>();
		List<RFA__c> listMilestoneRFAs = new List<RFA__c>();
		List<RFA__c> listCapitalBudgetInitiateRFAs = new List<RFA__c>();
		List<RFA__c> listPaperlessRFAs = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(rfa.RecordTypeId)) {
				
				listFinancialRFAs.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(rfa.RecordTypeId)) {
												
				listMilestoneRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(rfa.RecordTypeId)) {
				
				listCapitalBudgetInitiateRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(rfa.RecordTypeId)) {
				
				listPaperlessRFAs.add(rfa);
			}		
			
		}//end of for(RFAs);
				
		if(listFinancialRFAs != null && listFinancialRFAs.size() > 0) {
			//add Approvers to RFAs based on the COA Matrix rules
			COA_Handler_Matrix.addRFAApproversFromCOA(listFinancialRFAs, false);			
		}
		
		if(listCommercialRFAs != null && listCommercialRFAs.size() > 0) {
			system.debug('------- After & Insert listCommercialRFAs: ' + listCommercialRFAs);
			COA_Handler_For_RFATrigger.processCommercialCOAsInAfterInsertTrigger(listCommercialRFAs);
			
			// add by yoshinari 2014-05-26
			RFA_TriggerHandler_Helper_CommercialReqt.processCommercialRFAsInAfterInsert(listCommercialRFAs);
		}
		
		if(listMilestoneRFAs != null && listMilestoneRFAs.size() > 0) {
			
			COA_Handler_Other_ProjectRequest.addApproversOfProjectReqtOnAfterInsert(listMilestoneRFAs);
			
			RFA_TriggerHandler_Helper_ProjectRequest.processMilestoneRFAsInAfterInsert(listMilestoneRFAs);
		}
		
		if(listCapitalBudgetInitiateRFAs != null && listCapitalBudgetInitiateRFAs.size() > 0) {
			
			COA_Handler_Other_CapitalBudgetRequest.addApproversOfCapitalBudgetReqtOnAfterInsert(listCapitalBudgetInitiateRFAs);
			RFA_TriggerHandler_Helper_CapitalBudget.processCapitalBudgetInitiateRFAsInAfterInsertTrigger(listCapitalBudgetInitiateRFAs);
		}		
		
		if(listPaperlessRFAs != null && listPaperlessRFAs.size() > 0) {
			COA_Handler_Other_SealRequest.addApproversForNewRFAs(listPaperlessRFAs);
		}			
	}	


	
	/*
		============ isBefore & isUpdate ============ 
	*/	
	
	public static void checkChangeRecordType(List<RFA__c> listNewRFAs, Map<Id, RFA__c> mapOldRFAs) {
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RecordTypeId != mapOldRFAs.get(rfa.Id).RecordTypeId) {
				rfa.addError('レコードタイプ変更できないです! / Can\'t change Record Type!');
			}
		}		
	}
	
	public static void setCompletionDate(
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
        		rfa.CompletionDate__c = System.now();			
			}		
		}
	}
	
	
	public static void processRFAsOnBeforeUpdateByRecordTypes(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		
		List<RFA__c> listFinancialRFAs = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs = new List<RFA__c>();
		List<RFA__c> listMilestoneRFAs = new List<RFA__c>();
		List<RFA__c> listCapitalBudgetInitiateRFAs = new List<RFA__c>();
		List<RFA__c> listPaperlessRFAs = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(rfa.RecordTypeId)) {
				
				listFinancialRFAs.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(rfa.RecordTypeId)) {
												
				listMilestoneRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(rfa.RecordTypeId)) {
				
				listCapitalBudgetInitiateRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(rfa.RecordTypeId)) {
				
				listPaperlessRFAs.add(rfa);
			}		
			
		}//end of for(RFAs);
				
		if(listFinancialRFAs != null && listFinancialRFAs.size() > 0) {
			system.debug('-------- Before & Update: listFinancialRFAs' + listFinancialRFAs);
			//Customized Validation Check
			RFA_TriggerHandler_Helper_FinancialReqt.checkValidation(listNewRFAs, mapOldRFAs);
			
		}
		
		if(listCommercialRFAs != null && listCommercialRFAs.size() > 0) {
			
		}
		
		if(listMilestoneRFAs != null && listMilestoneRFAs.size() > 0) {
			
		}
		
		if(listCapitalBudgetInitiateRFAs != null && listCapitalBudgetInitiateRFAs.size() > 0) {
			
		}		
		
		if(listPaperlessRFAs != null && listPaperlessRFAs.size() > 0) {

		}			
	}	
	
	
	//copied from RFA_RFATrigger.trigger line 275
	public void sendEmails(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		Email_Handler_RFA inst = new Email_Handler_RFA();
		
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
							inst.sendEmail_CompleteMemo(rfa);
							
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        } else if(rfa.Stage__c == RFAConstants.RFA_STATUS_REJECTED) {
                        	//need to update to Static Method!
							inst.sendEmail_CompleteMemo(rfa); 
							
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        } else if(rfa.Stage__c == RFAConstants.RFA_STATUS_CLOSED) {
                        	
							if(mapOldRFAs.get(rfa.Id).Stage__c == RFAConstants.RFA_STATUS_DRAFT) {
								//To: Requester, PPOC
								//need to update to Static Method!
                        		inst.sendEmail_CloseRFA(rfa, true);
							} else if(mapOldRFAs.get(rfa.Id).Stage__c == RFAConstants.RFA_STATUS_ReturnToRequester) {
								//To: Requester, PPOC, Info Copy Only, Approver & Agent
								//need to update to Static Method!
								inst.sendEmail_CloseRFA(rfa, false);
							}
							RFA_AP05_RFATrigger.emailAtComplete = false;
                        }                         
                        }   	
                        		
			}//enf of if();		
		}//end of for(RFAs);		
	}	
	
	
	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	/* divide into different Record Types */
	public static void processRFAsOnAfterUpdateByRecordTypes(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		
		List<RFA__c> listFinancialRFAs = new List<RFA__c>();
		List<RFA__c> listCommercialRFAs = new List<RFA__c>();
		List<RFA__c> listMilestoneRFAs = new List<RFA__c>();
		List<RFA__c> listCapitalBudgetInitiateRFAs = new List<RFA__c>();
		List<RFA__c> listPaperlessRFAs = new List<RFA__c>();
		
		for(RFA__c rfa : listNewRFAs) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(rfa.RecordTypeId)) {
				
				listFinancialRFAs.add(rfa);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(rfa.RecordTypeId)) {
				
				listCommercialRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(rfa.RecordTypeId)) {
												
				listMilestoneRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(rfa.RecordTypeId)) {
				
				listCapitalBudgetInitiateRFAs.add(rfa);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(rfa.RecordTypeId)) {
				
				listPaperlessRFAs.add(rfa);
			}		
			
		}//end of for(RFAs);
		
		
		if(listFinancialRFAs != null && listFinancialRFAs.size() > 0) {
		}
		
		if(listCommercialRFAs != null && listCommercialRFAs.size() > 0) {
			RFA_TriggerHandler_Helper_CommercialReqt.processCommercialRFAsInAfterUpdate(listNewRFAs, mapOldRFAs);
		
		}
		
		if(listMilestoneRFAs != null && listMilestoneRFAs.size() > 0) {
			RFA_TriggerHandler_Helper_ProjectRequest.processMilestoneRFAsInAfterUpdate(listNewRFAs, mapOldRFAs); 
		}
		
		if(listCapitalBudgetInitiateRFAs != null && listCapitalBudgetInitiateRFAs.size() > 0) {
			RFA_TriggerHandler_Helper_CapitalBudget.processCapitalBudgetInitiateRFAsInAfterUpdate(listCapitalBudgetInitiateRFAs, mapOldRFAs);
		}		
		
		if(listPaperlessRFAs != null && listPaperlessRFAs.size() > 0) {
			
			RFA_TriggerHandler_Helper_SealRequest.processInAfterUpdateOfSealRequests(listNewRFAs, mapOldRFAs);
			
			//add Edit Permission for Seal Admins when RFA is Approved
			//RFA_TriggerHandler_Helper_SealRequest.addEditPermissionForSealAdmins(listNewRFAs, mapOldRFAs);
		}			
	}
	
	
	/*
		============ isBefore & isDelete ============ 
	*/
	
	public static void checkDeleteRFAs(List<RFA__c> listOldRFAs) {
		for(RFA__c rfa : listOldRFAs) {
			if(LABEL.RFA_Delete_Flag == '0') {
				rfa.addError('レコードは削除できないです! / You can\'t delete this record!');
			} else if(LABEL.RFA_Delete_Flag == '1') {
				if( !Utility.isSystemAdmin()
				) {
					rfa.addError('レコードは削除できないです! / You can\'t delete this record! ');
				}
			}
		}		
	}	
	
	/*
	public static void checkDeleteRFAs(List<RFA__c> listOldRFAs) {
		for(RFA__c rfa : listOldRFAs) {
			if(LABEL.RFA_Delete_Flag == '0') {
				rfa.addError('レコードは削除できないです! / You can\'t delete this record!');
			} else if(LABEL.RFA_Delete_Flag == '1') {
				String strProfileName = [Select Id, Name from Profile where Id =: UserInfo.getProfileId()].Name;
				system.debug('------ Profile Name: ' + strProfileName);
				if( !(strProfileName == RFA_Utility_Constants.SysAdminProfile
						//'System Administrator' 
						|| 
						strProfileName == RFA_Utility_Constants.SysAdminJPProfile
						//'システム管理者'
						) ) {
					rfa.addError('レコードは削除できないです! / You can\'t delete this record! ');
				}
			}
		}		
	}
	*/

	
	
	/*
		============ isAfter & isDelete ============ 
	*/



	/*
		============ isAfter & isUnDelete ============ 
	*/	



}