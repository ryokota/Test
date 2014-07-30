public with sharing class RFA_TriggerHandler_RFAUserRole_SealReqt {
	
	/*
		============ isBefore & isInsert ============ 
	*/

	
	
	/*
		============ isAfter & isInsert ============ 
	*/


	
	/*
		============ isBefore & isUpdate ============ 
	*/

	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public static void checkFinalApproverOrderInAfterUpdate(
		List<RFAUserRole__c> listPaperlessApprovers, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		//can not target stage change from Draft -> Circulation from RFAUserRole__c
		//make sure no null ApprovalOrder__c in approver list!
		for(RFAUserRole__c approver :  listPaperlessApprovers) {
			if(approver.RFAStage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& approver.ApprovalOrder__c != mapOldRFAUserRoles.get(approver.Id).ApprovalOrder__c
			) {
				List<RFAUserRole__c> listFinalApprovers = [
					Select Id, UserName__c, UserName__r.Name, ApprovalOrder__c, 
						RFA__r.Seal_Name_CCEJ_Company_Check__c, RFA__r.Seal_Name_CCEJ_Function_Check__c 
					from RFAUserRole__c 
					where RFA__c =: approver.RFA__c 
						and RecordTypeId =: Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
					order by ApprovalOrder__c desc limit 3
				];
				
				//Last two and last three may have the same order
				if(listFinalApprovers != null) {
					if(listFinalApprovers.size() == 0 || listFinalApprovers.size() == 1) {
						approver.addError(
							Label.Seal_Trigger_Info_Approver_Order_Error
						);						
					} else if(listFinalApprovers.size() == 2) {
						
						checkApproverOrder(approver, listFinalApprovers);
						
					} else if(listFinalApprovers.size() == 3) {
						
						if(listFinalApprovers[0].ApprovalOrder__c == listFinalApprovers[1].ApprovalOrder__c
							|| listFinalApprovers[0].ApprovalOrder__c == listFinalApprovers[2].ApprovalOrder__c
							|| listFinalApprovers[1].ApprovalOrder__c == listFinalApprovers[2].ApprovalOrder__c													
						) {
							approver.addError(
								Label.Seal_Trigger_Info_Approver_Order_Error
							);		
												
						} else if(listFinalApprovers[0].ApprovalOrder__c < listFinalApprovers[1].ApprovalOrder__c 
							&& listFinalApprovers[0].ApprovalOrder__c < listFinalApprovers[2].ApprovalOrder__c
						) {
							
							List<RFAUserRole__c> listFinalApproversNew = new List<RFAUserRole__c>();
							listFinalApproversNew.add(listFinalApprovers[1]);
							listFinalApproversNew.add(listFinalApprovers[2]);
							checkApproverOrder(approver, listFinalApproversNew);
							
						} else if(listFinalApprovers[1].ApprovalOrder__c < listFinalApprovers[0].ApprovalOrder__c 
							&& listFinalApprovers[1].ApprovalOrder__c < listFinalApprovers[2].ApprovalOrder__c
						) {
							List<RFAUserRole__c> listFinalApproversNew = new List<RFAUserRole__c>();
							listFinalApproversNew.add(listFinalApprovers[0]);
							listFinalApproversNew.add(listFinalApprovers[2]);
							checkApproverOrder(approver, listFinalApproversNew);
							
						} else if(listFinalApprovers[2].ApprovalOrder__c < listFinalApprovers[0].ApprovalOrder__c 
							&& listFinalApprovers[2].ApprovalOrder__c < listFinalApprovers[1].ApprovalOrder__c
						) {
							List<RFAUserRole__c> listFinalApproversNew = new List<RFAUserRole__c>();
							listFinalApproversNew.add(listFinalApprovers[0]);
							listFinalApproversNew.add(listFinalApprovers[1]);
							checkApproverOrder(approver, listFinalApproversNew);							
						}												
					}
					
				} else {
					approver.addError(
						Label.Seal_Trigger_Info_Approver_Order_Error
					);
				}
				/*
				system.debug('----- current Approvers order : ' + approver.ApprovalOrder__c + '  User: ' + approver.UserName__c);	
				system.debug('----- Final Approvers: ' + listFinalApprovers);								
				system.debug('----- a: ' + listFinalApprovers[0].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[0].UserName__r.Name);
				system.debug('----- b: ' + listFinalApprovers[1].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[1].UserName__r.Name);
				system.debug('----- c: ' + listFinalApprovers[0].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[0].RFA__r.Seal_Name_CCEJ_Company_Check__c);
				system.debug('----- d: ' + listFinalApprovers[1].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[1].RFA__r.Seal_Name_CCEJ_Function_Check__c);				
				*/												
			}//end of if();
		}//end of for(Approvers);		
	}
			
	private static void checkApproverOrder(RFAUserRole__c approver, List<RFAUserRole__c> listFinalApprovers) {
		if(listFinalApprovers != null && listFinalApprovers.size() == 2) {
								
			if(listFinalApprovers[0].RFA__r.Seal_Name_CCEJ_Company_Check__c == true 
				|| listFinalApprovers[0].RFA__r.Seal_Name_CCEJ_Function_Check__c == true
			) {
						
				if(listFinalApprovers[0].ApprovalOrder__c < listFinalApprovers[1].ApprovalOrder__c) {
					if(
						listFinalApprovers[0].UserName__c == Label.Seal_Second_To_Final_Approver_of_CCEJ_Company
							//RFA_Utility_Configure.idSealAdmin //'005N0000000tPNB' 
						&& 
						listFinalApprovers[1].UserName__c == Label.Seal_Final_Approver_of_CCEJ_Company
							//RFA_Utility_Configure.idKawamotoNaruhiko //'00510000001rhvJ'
					) {
								
						system.debug('-----e 1: ' + listFinalApprovers[0].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[0].UserName__r.Name);
						system.debug('-----e 2: ' + listFinalApprovers[1].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[1].UserName__r.Name);
								
					} else {
								
						system.debug('-----e 3: ' + listFinalApprovers[0].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[0].UserName__r.Name);
						system.debug('-----e 4: ' + listFinalApprovers[1].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[1].UserName__r.Name);
																
						approver.addError(
							Label.Seal_Trigger_Info_Approver_Order_Error
									//'Approval Order is not right 1 !'
						);								
					}							
				} else if(listFinalApprovers[0].ApprovalOrder__c > listFinalApprovers[1].ApprovalOrder__c) {
					if(
						listFinalApprovers[0].UserName__c == Label.Seal_Final_Approver_of_CCEJ_Company
							//RFA_Utility_Configure.idKawamotoNaruhiko //'00510000001rhvJ' 
						&& 
						listFinalApprovers[1].UserName__c == Label.Seal_Second_To_Final_Approver_of_CCEJ_Company
							//RFA_Utility_Configure.idSealAdmin //'005N0000000tPNB'
					) {
								
						system.debug('-----e 5: ' + listFinalApprovers[0].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[0].UserName__r.Name);
						system.debug('-----e 6: ' + listFinalApprovers[1].ApprovalOrder__c 
							+ ' Name: ' + listFinalApprovers[1].UserName__r.Name);								
								
					} else {
						system.debug('-----e 7: ');
						approver.addError(
							Label.Seal_Trigger_Info_Approver_Order_Error
									//'Approval Order is not right 1 !'
						);								
					}								
				} else if(listFinalApprovers[0].ApprovalOrder__c == listFinalApprovers[1].ApprovalOrder__c) {
					system.debug('-----e 8: ');
					approver.addError(
						Label.Seal_Trigger_Info_Approver_Order_Error
								//'Approval Order is not right 1 !'
					);
				}
						
			} else { //need to update !  List order
						
				if(listFinalApprovers[0].ApprovalOrder__c < listFinalApprovers[1].ApprovalOrder__c) {
					if(
						listFinalApprovers[0].UserName__c == Label.Seal_Second_To_Final_Approver_of_Sub_Company						
							//RFA_Utility_Configure.idSealAdmin //'005N0000000tPNB' 
						&& 
						listFinalApprovers[1].UserName__c == Label.Seal_Final_Approver_of_Sub_Company
							//RFA_Utility_Configure.idNakanoToshio //'00510000001rhvi'
					) {

					} else {
						system.debug('-----e 9: ');
						approver.addError(
							Label.Seal_Trigger_Info_Approver_Order_Error
									//'Approval Order is not right 2 !'
						);								
					}	
																				
				} else if(listFinalApprovers[0].ApprovalOrder__c > listFinalApprovers[1].ApprovalOrder__c) {
					if(
						listFinalApprovers[0].UserName__c == Label.Seal_Final_Approver_of_Sub_Company
							//RFA_Utility_Configure.idNakanoToshio //'00510000001rhvi' 
						&& 
						listFinalApprovers[1].UserName__c == Label.Seal_Second_To_Final_Approver_of_Sub_Company
							//RFA_Utility_Configure.idSealAdmin //'005N0000000tPNB'
					) {

					} else {
						system.debug('-----e 10: ');
						approver.addError(
							Label.Seal_Trigger_Info_Approver_Order_Error
							//'Approval Order is not right 2 !'
						);								
					}								
				} else if(listFinalApprovers[0].ApprovalOrder__c == listFinalApprovers[1].ApprovalOrder__c) {
					system.debug('-----e 11: ');
					approver.addError(
						Label.Seal_Trigger_Info_Approver_Order_Error
						//'Approval Order is not right 2 !'
					);
				}											
			}
					
		} else {
			system.debug('-----e 12: ');
			approver.addError(
				Label.Seal_Trigger_Info_Approver_Order_Error
				//'Approval Order is not right 0 !'
			);
		}		
	}

	
	
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