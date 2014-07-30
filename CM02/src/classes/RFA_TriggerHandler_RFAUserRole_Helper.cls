/*
	Created by Jia Hu on 2014/05/22
*/
public with sharing class RFA_TriggerHandler_RFAUserRole_Helper {


	
	/*
		============ isBefore & isInsert ============ 
	*/
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void sendEmailToReadOnlyAfterApplys(List<RFAUserRole__c> listNewReadOnlyAfterApplys) {
		system.debug('------ RFA_TriggerHandler_RFAUserRole_Helper.sendEmailToReadOnlyAfterApplys(List<RFAUserRole__c> listNewReadOnlyAfterApplys) ');
		Email_Handler_RFA inst = new Email_Handler_RFA();
		inst.sendEmail_ReadOnlyAfterApply(listNewReadOnlyAfterApplys);				
		
	}
	
	public static void processPPOCInAfterInsert(List<RFAUserRole__c> listNewPPOCs) {
		for(RFAUserRole__c ppoc : listNewPPOCs) {
			Email_Handler_RFA inst = new Email_Handler_RFA();
			inst.sendEmail_PPOC(ppoc);		
		}
	}

	public static void processApproversInAfterInsert(List<RFAUserRole__c> listNewApprovers) {
		
		processApproversByRFAStages(listNewApprovers);
		
		processApproversByRecordTypesInAfterInsert(listNewApprovers);
	}
	
	private static void processApproversByRFAStages(List<RFAUserRole__c> listNewApprovers) {
		
		//Draft or Return to Requester
		List<RFAUserRole__c> listApproversInDraft = new List<RFAUserRole__c>();	
		//Circulation
		List<RFAUserRole__c> listApproversInCirculation = new List<RFAUserRole__c>();	
		//Approved, Rejected, Closed
		List<RFAUserRole__c> listApproversInFinished = new List<RFAUserRole__c>();	
		
		for(RFAUserRole__c approver : listNewApprovers) {
			
			if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT 
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
			) {
				listApproversInDraft.add(approver);
			} else if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
			) {
				listApproversInCirculation.add(approver);
			} else if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED 
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_REJECTED
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_CLOSED 
			) {
				listApproversInFinished.add(approver);
			}						
		}//end of for(Approvers);	
		
		if(listApproversInDraft != null && listApproversInDraft.size() > 0) {
			checkPermissionOfPPOCs(listApproversInDraft);	
		}
			
		if(listApproversInCirculation != null && listApproversInCirculation.size() > 0) {
			checkPermissionOfSysAdmin(listApproversInFinished);					
		}
			
		if(listApproversInFinished != null && listApproversInFinished.size() > 0) {
			checkPermissionOfSysAdmin(listApproversInFinished);	
		}		
				
	}
	
	//Only System Admin can add approvers
	private static void checkPermissionOfSysAdmin(List<RFAUserRole__c> listNewApprovers) {
		if(!Utility.isSystemAdmin()) {
			for(RFAUserRole__c approver : listNewApprovers) {			
				approver.addError('Approver can not be added/deleted !');
			}
		}
	}

	//Only PPOC or System Admin can add approvers
	private static void checkPermissionOfPPOCs(List<RFAUserRole__c> listNewApprovers) {
		
		Map<Id, List<RFAUserRole__c>> mapRFAIdToApprovers = new Map<Id, List<RFAUserRole__c>>();
		
		if(!Utility.isSystemAdmin()) {
		
			//get the distinct RFA
			for(RFAUserRole__c approver : listNewApprovers) {
			
				if(mapRFAIdToApprovers.containsKey(approver.RFA__c)) {
					mapRFAIdToApprovers.get(approver.RFA__c).add(approver);
				} else {
					mapRFAIdToApprovers.put(approver.RFA__c, new RFAUserRole__c[]{approver});
				}
			}
		
			if(mapRFAIdToApprovers != null 
				&& mapRFAIdToApprovers.keySet() != null 
				&& mapRFAIdToApprovers.keySet().size() > 0
			) {
				for(Id rfaId : mapRFAIdToApprovers.keySet()) {
					if(!checkIfUserIsPPOCs(rfaId, Userinfo.getUserId())) {
						mapRFAIdToApprovers.get(rfaId)[0].addError('Approver can not be added/deleted !');
					}
				}
			}
		
		}		
	}	
	
	private static Boolean checkIfUserIsPPOCs(Id rfaId, Id runningUId) {
		for(RFAUserRole__c ppoc : [
			Select Id, UserName__c from RFAUserRole__c 
			where RFA__c =: rfaId and RecordTypeId =: 
				Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_PPOC)
			]
		) {
			if(runningUId == ppoc.UserName__c) {
				return true;
			}
		}
		
		RFA__c rfa = [Select Id, CreatedById from RFA__c where Id =: rfaId];
		if(rfa != null && rfa.CreatedById == runningUId) {
			return true;
		}
		
		return false;
	}
	

	private static void processApproversByRecordTypesInAfterInsert(List<RFAUserRole__c> listNewApprovers) {
		
		List<RFAUserRole__c> listFinancialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCommercialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listMilestoneApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCapitalBudgetInitiateApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listPaperlessApprovers = new List<RFAUserRole__c>();		

		for(RFAUserRole__c approver : listNewApprovers) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listFinancialApprovers.add(approver);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCommercialApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(approver.RFA_RecordTypeId__c)) {
												
				listMilestoneApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCapitalBudgetInitiateApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listPaperlessApprovers.add(approver);
			}		
			
		}//end of for(Approvers);
				
		if(listFinancialApprovers != null && listFinancialApprovers.size() > 0) {

		}
		
		if(listCommercialApprovers != null && listCommercialApprovers.size() > 0) {
			
		}
		
		if(listMilestoneApprovers != null && listMilestoneApprovers.size() > 0) {
			
		}
		
		if(listCapitalBudgetInitiateApprovers != null && listCapitalBudgetInitiateApprovers.size() > 0) {
			
		}
		
		if(listPaperlessApprovers != null && listPaperlessApprovers.size() > 0) {

		}					
	}
	
	/*
		============ isBefore & isUpdate ============ 
	*/

	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public static void processApproversInAfterUpdate(
		List<RFAUserRole__c> listNewApprovers, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		
		checkApproverOrderChanges(listNewApprovers, mapOldRFAUserRoles);
		
		checkPermissionOfUpdates(listNewApprovers, mapOldRFAUserRoles);
		
		processApproversByRecordTypesInAfterUpdate(listNewApprovers, mapOldRFAUserRoles);
		
	}	
	
	public static void processPPOCsInAfterUpdate(
		List<RFAUserRole__c> listNewPPOCs, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		List<RFAUserRole__c> listNewPPOCs_UserChanged = new List<RFAUserRole__c>();
		
		for(RFAUserRole__c ppoc : listNewPPOCs) {
			if(ppoc.UserName__c != mapOldRFAUserRoles.get(ppoc.Id).UserName__c) {
				listNewPPOCs_UserChanged.add(ppoc);
			}
		}
		
		if(listNewPPOCs_UserChanged != null && listNewPPOCs_UserChanged.size() > 0) {
			for(RFAUserRole__c ppoc : listNewPPOCs_UserChanged) {
				Email_Handler_RFA inst = new Email_Handler_RFA();
				inst.sendEmail_PPOC(ppoc);
			}
		}
		
	}	
	
	/*
		added by Jia Hu on 2014/05/19
		check the Approval Order change on RFAUserRole__c object
		
		The problem is RFAStage__c field on RFAUserRole__c object is a Forumla field (TEXT(RFA__r.Stage__c)) 
		to get the stage from RFA__c object directly. 
		However, in RFA_VFP03_ApprovalRouting page, it will update RFA stage first from Draft -> Circulation,
		then update Approval Order of each Approvers, 
		therefore, it can't decide if the user is updating the Approval Order in Circulation 
		using the Status on RFA__c or RFAUserRole__c objects.
	*/
	private static void checkApproverOrderChanges(
		List<RFAUserRole__c> listNewRFAUserRoles, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		system.debug('------ checkApproverOrderChanges() !');
		for(RFAUserRole__c rfaUserRole : listNewRFAUserRoles) {
			if(rfaUserRole.ApprovalOrder__c != mapOldRFAUserRoles.get(rfaUserRole.Id).ApprovalOrder__c) {
				
				system.debug('------- current RFAStage: ' + rfaUserRole.RFAStage__c);
				system.debug('------- old RFAStage: ' + mapOldRFAUserRoles.get(rfaUserRole.Id).RFAStage__c);
				
				//Approval Order changes from VF page or not
				PageReference pageRef =  ApexPages.currentPage();
				system.debug('------- PageReference: ' + pageRef);
				/*
					all the cases that Approval Order can be changed
					1. RFA stage = Draft
					2. RFA stage = Return to Requester
					3. Using VF page: RFA_VFP03_ApprovalRouting to update the status
				*/
				if(rfaUserRole.RFAStage__c == RFAConstants.RFA_STATUS_DRAFT
					||
					rfaUserRole.RFAStage__c == RFAConstants.RFA_STATUS_ReturnToRequester
					/*||
					(//Only System Admin can change the Approval Order if allowed
						Utility.isSystemAdmin()
						&&
						Label.RFA_ApproverOrder_Changed_by_System_Admin == '1'
					)*/
					||
					(
						rfaUserRole.RFAStage__c == RFAConstants.RFA_STATUS_CIRCULATION	
						&&
						pageRef != null 
						&& pageRef.getUrl().subString(0, 31) == '/apex/RFA_VFP03_ApprovalRouting'
					)
				) {
					system.debug('------- Approval Order can be changed when Draft, Send to Requester, or from RFA_VFP03_ApprovalRouting page');					
				} else {
					rfaUserRole.addError('Can not change Approval Order !');
				}
				
				/*
				if(strURL != null) {
				Map<String, String> mapStrings = ApexPages.currentPage().getParameters();
				system.debug('------ map strings: ' + mapStrings);								
				for(String str : mapStrings.keySet()) {
					system.debug('------ Key: ' + str + '  value: ' + mapStrings.get(str) );
				}
				}*/
				
			}
		}
	}	
	
	private static void checkPermissionOfUpdates(
		List<RFAUserRole__c> listNewApprovers, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		if(!Utility.isSystemAdmin()) {
			List<RFAUserRole__c> listApproversForCheck = new List<RFAUserRole__c>();
			
			//check 3 fields changes from Standard interface
			for(RFAUserRole__c approver : listNewApprovers) {
				if(approver.UserName__c != mapOldRFAUserRoles.get(approver.Id).UserName__c) {
					listApproversForCheck.add(approver);
				}
				if(approver.ApprovalOrder__c != mapOldRFAUserRoles.get(approver.Id).ApprovalOrder__c) {
					listApproversForCheck.add(approver);
				}	
				if(approver.DoNotSendEmail__c != mapOldRFAUserRoles.get(approver.Id).DoNotSendEmail__c) {
					listApproversForCheck.add(approver);
				}							
			}
			
			if(listApproversForCheck != null && listApproversForCheck.size() > 0) {
				checkPermissionOfPPOCsForUpdate(listApproversForCheck);
			}
			
		}
	
	}	
	
	private static void checkPermissionOfPPOCsForUpdate(List<RFAUserRole__c> listNewApprovers) {
		
		Map<Id, List<RFAUserRole__c>> mapRFAIdToApprovers = new Map<Id, List<RFAUserRole__c>>();
		
		//if(!Utility.isSystemAdmin()) {
		
			//get the distinct RFA
			for(RFAUserRole__c approver : listNewApprovers) {
			
				if(mapRFAIdToApprovers.containsKey(approver.RFA__c)) {
					mapRFAIdToApprovers.get(approver.RFA__c).add(approver);
				} else {
					mapRFAIdToApprovers.put(approver.RFA__c, new RFAUserRole__c[]{approver});
				}
			}
		
			if(mapRFAIdToApprovers != null 
				&& mapRFAIdToApprovers.keySet() != null 
				&& mapRFAIdToApprovers.keySet().size() > 0
			) {
				for(Id rfaId : mapRFAIdToApprovers.keySet()) {
					if(!checkIfUserIsPPOCs(rfaId, Userinfo.getUserId())) {
						mapRFAIdToApprovers.get(rfaId)[0].addError('Approver can not be updated !');
					}
				}
			}
		
		//}		
	}		
	
	
	
	private static void processApproversByRecordTypesInAfterUpdate(
		List<RFAUserRole__c> listNewApprovers, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		
		List<RFAUserRole__c> listFinancialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCommercialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listMilestoneApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCapitalBudgetInitiateApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listPaperlessApprovers = new List<RFAUserRole__c>();		

		for(RFAUserRole__c approver : listNewApprovers) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listFinancialApprovers.add(approver);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCommercialApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(approver.RFA_RecordTypeId__c)) {
												
				listMilestoneApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCapitalBudgetInitiateApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listPaperlessApprovers.add(approver);
			}		
			
		}//end of for(Approvers);
				
		if(listFinancialApprovers != null && listFinancialApprovers.size() > 0) {

		}
		
		if(listCommercialApprovers != null && listCommercialApprovers.size() > 0) {
			
		}
		
		if(listMilestoneApprovers != null && listMilestoneApprovers.size() > 0) {
			
		}
		
		if(listCapitalBudgetInitiateApprovers != null && listCapitalBudgetInitiateApprovers.size() > 0) {
			
		}
		
		if(listPaperlessApprovers != null && listPaperlessApprovers.size() > 0) {
			
			RFA_TriggerHandler_RFAUserRole_SealReqt.checkFinalApproverOrderInAfterUpdate(
				listPaperlessApprovers, 
				mapOldRFAUserRoles
			);			
		}							
	}
	
	
	/*
		============ isBefore & isDelete ============ 
	*/


	
	
	/*
		============ isAfter & isDelete ============ 
	*/
	public static void processApproversInAfterDelete(List<RFAUserRole__c> listOldApprovers) {
		
		processApproversByRFAStagesInAfterDelete(listOldApprovers);
		
		processApproversByRecordTypesInAfterDelete(listOldApprovers);
		
	}
	
	private static void processApproversByRFAStagesInAfterDelete(List<RFAUserRole__c> listOldApprovers) {
		
		//Draft or Return to Requester
		List<RFAUserRole__c> listApproversInDraft = new List<RFAUserRole__c>();	
		//Circulation
		List<RFAUserRole__c> listApproversInCirculation = new List<RFAUserRole__c>();	
		//Approved, Rejected, Closed
		List<RFAUserRole__c> listApproversInFinished = new List<RFAUserRole__c>();	
		
		for(RFAUserRole__c approver : listOldApprovers) {
			
			if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT 
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
			) {
				listApproversInDraft.add(approver);
			} else if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
			) {
				listApproversInCirculation.add(approver);
			} else if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED 
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_REJECTED
				|| approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_CLOSED 
			) {
				listApproversInFinished.add(approver);
			}						
		}//end of for(Approvers);	
		
		if(listApproversInDraft != null && listApproversInDraft.size() > 0) {
			//use General method
			checkPermissionOfPPOCs(listApproversInDraft);	
		}
			
		if(listApproversInCirculation != null && listApproversInCirculation.size() > 0) {
			//use General method
			checkPermissionOfSysAdmin(listApproversInFinished);					
		}
			
		if(listApproversInFinished != null && listApproversInFinished.size() > 0) {
			//use General method
			checkPermissionOfSysAdmin(listApproversInFinished);	
		}		
				
	}	
	
	
	
	private static void processApproversByRecordTypesInAfterDelete(List<RFAUserRole__c> listOldApprovers) {
		
		List<RFAUserRole__c> listFinancialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCommercialApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listMilestoneApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listCapitalBudgetInitiateApprovers = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listPaperlessApprovers = new List<RFAUserRole__c>();		

		for(RFAUserRole__c approver : listOldApprovers) {
				
			if(Utility_Helper_RecordType.ifFinancialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listFinancialApprovers.add(approver);
								
			} else if(Utility_Helper_RecordType.ifCommercialReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCommercialApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifMilestoneReqtByRTId(approver.RFA_RecordTypeId__c)) {
												
				listMilestoneApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifCapitalBudgetInitiateReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listCapitalBudgetInitiateApprovers.add(approver);
				
			} else if(Utility_Helper_RecordType.ifSealReqtByRTId(approver.RFA_RecordTypeId__c)) {
				
				listPaperlessApprovers.add(approver);
			}		
			
		}//end of for(Approvers);
				
		if(listFinancialApprovers != null && listFinancialApprovers.size() > 0) {

		}
		
		if(listCommercialApprovers != null && listCommercialApprovers.size() > 0) {
			
		}
		
		if(listMilestoneApprovers != null && listMilestoneApprovers.size() > 0) {
			
		}
		
		if(listCapitalBudgetInitiateApprovers != null && listCapitalBudgetInitiateApprovers.size() > 0) {
			
		}
		
		if(listPaperlessApprovers != null && listPaperlessApprovers.size() > 0) {
			checkDeletedApproversOfSealRequest(listPaperlessApprovers);
		}					
	}	
	
	
	
	
	//only System Admin can delete Paperless fixed Approvers
	private static void checkDeletedApproversOfSealRequest(List<RFAUserRole__c> listOldRFAUserRoles) {
		if(!Utility.isSystemAdmin()) {
			for(RFAUserRole__c rfaUserRole : listOldRFAUserRoles) {
				if(//rfaUserRole.RecordTypeId == 
					rfaUserRole.Approver_Source__c == RFA_Utility_Constants.Approver_Source_Seal  //'Seal'
				) {
					rfaUserRole.addError(
						Label.Seal_Trigger_Info_Delete_Seal_Admin
						//'Can not delete Seal Admin !'
					);
				}
			}
		}
	}


	/*
		============ isAfter & isUnDelete ============ 
	*/	
	
}