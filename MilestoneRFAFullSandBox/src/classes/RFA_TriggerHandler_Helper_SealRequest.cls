public without sharing class RFA_TriggerHandler_Helper_SealRequest {
			
	/*
		============ isBefore & isInsert ============ 
	*/
	//Seal Complete Check
	public static void checkSealCompleteCheckInBeforeInsert(List<RFA__c> listNewRFAs) {
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.Seal_Complete_Check__c == true) {
				rfa.addError(
					Label.Seal_Trigger_Info_Insert_Check_Error
					//'\'Seal Complete Check\' is only for Seal Admins !'
				);
			}
		}
	}
	
	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/


	
	/*
		============ isBefore & isUpdate ============ 
	*/
	//Seal Complete Check
	//need to check when user update it!
	public static void checkSealCompleteCheckInBeforeInsert(List<RFA__c> listNewRFAs, Map<Id, RFA__c> mapOldRFAs) {
		for(RFA__c rfa : listNewRFAs) {
			if( //RFA Status = Approved
				rfa.Seal_Complete_Check__c != mapOldRFAs.get(rfa.Id).Seal_Complete_Check__c
				&&
				rfa.Seal_Complete_Check__c == true 
				&&
				mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED  
			) {
				
			} else {
				rfa.addError(
					Label.Seal_Trigger_Info_Insert_Check_Error
					//'\'Seal Complete Check\' is only for Seal Admins !'
				);
			}
		}
	}
	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public static void processInAfterUpdateOfSealRequests(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		List<RFA__c> listNewApprovedRFAs = new List<RFA__c>();
		Set<Id> setFinishedApprovedRFAIds = new Set<Id>();
		
		Map<String, Schema.SObjectField> mapRFAsObjFields = Schema.SObjectType.RFA__c.fields.getMap();
		
		for(RFA__c rfa : listNewRFAs) {
			
			if(
				rfa.Stage__c != mapOldRFAs.get(rfa.id).Stage__c
				&&
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED 
				&& 
				mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION
			) {
				listNewApprovedRFAs.add(rfa);
			}	
			
			if(
				rfa.Seal_Complete_Check__c != mapOldRFAs.get(rfa.id).Seal_Complete_Check__c
				&&
				rfa.Seal_Complete_Check__c == true
				&&
				mapOldRFAs.get(rfa.id).Seal_Complete_Check__c == false
				&&
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED 
				&& 
				mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED
			) {
				setFinishedApprovedRFAIds.add(rfa.Id);
			}		
			
			//lock the field updates for Seal Admins when RFA is approved
			//can only check 'Seal Complete Check', 'Seal Complete Date' is updated by Workflow
			if(mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED				
				//&& is not admin
			) {
				for(String strFieldName : mapRFAsObjFields.keySet()) {
					if(
						strfieldName.endsWith('__c') 
						&& strFieldName != 'Seal_Complete_Check__c' 
						&& strFieldName != 'Seal_Complete_Date__c'
						//&& strFieldName != 'LastModifiedById'
						//&& strFieldName != 'LastModifiedByDate'
						//LastViewedDate LastReferencedDate LastActivityDate
					) {
						if(rfa.get(strFieldName) != mapOldRFAs.get(rfa.Id).get(strFieldName)) {
							rfa.addError(
								Label.Seal_Trigger_Info_Update_Check_Error
								//'Can not update this field !'
							);
						}
					}
				}
				
			}	
			
			/*
				Only System Admin and Seal Admin can check Seal Complete Check field
			*/
			if(
				rfa.Seal_Complete_Check__c != mapOldRFAs.get(rfa.id).Seal_Complete_Check__c
				//&& not only Check the field, but can't change the Check status
				//rfa.Seal_Complete_Check__c == true
				&&
				mapOldRFAs.get(rfa.id).Seal_Complete_Check__c == false
				&& (! (Utility.isSystemAdmin() || (Utility_Helper_Group.isGroupMemberByUId(RFA_Utility_Constants.PublicGroupName_SealAdminTeam, Userinfo.getUserId())) ))			
			) {
				rfa.addError(
					Label.Seal_Trigger_Info_Update_Check_Error
					//'Can not check Seal Complete Check field !'
				);
			}
			
			//
			if(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& 
				(
					mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT 
					|| 
					mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
				)			
			) {
				/*
				List<RFAUserRole__c> listFinalApprovers = [
					Select Id, UserName__c, UserName__r.Name, ApprovalOrder__c from RFAUserRole__c 
					where RFA__c =: rfa.Id 
						and RecordTypeId =: Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
					order by ApprovalOrder__c desc limit 2
				];
				
				system.debug('----- Final Approvers: ' + listFinalApprovers);								
				system.debug('----- 0: ' + listFinalApprovers[0].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[0].UserName__r.Name);
				system.debug('----- 1: ' + listFinalApprovers[1].ApprovalOrder__c 
					+ ' Name: ' + listFinalApprovers[1].UserName__r.Name);	
				*/				
			}
			

			
		}
		
		if(listNewApprovedRFAs != null && listNewApprovedRFAs.size() > 0) {
			addEditPermissionForSealAdmins(listNewApprovedRFAs);
		}	
		
		if(setFinishedApprovedRFAIds != null && setFinishedApprovedRFAIds.size() >0) {
			removeEditPermissionForSealAdmins(setFinishedApprovedRFAIds);
		}
		
		
		
	}	
	
	
	
	
	//add Edit Permission for Seal Admins for finishing the Checkbox 'Seal Complete Check' when the RFA is approved
	public static void addEditPermissionForSealAdmins(List<RFA__c> listNewRFAs) {
		List<RFA__Share> listNewRFAShares = new List<RFA__Share>();
		
		Set<Id> setGroupMemberIds = Utility_Helper_Group.getGroupMemberUserIds(
			Utility_Helper_Group.getPuglicGroupId(
				RFA_Utility_Constants.PublicGroupName_SealAdminTeam
			)
		);
		
		for(RFA__c rfa : listNewRFAs) {
			if(setGroupMemberIds != null && setGroupMemberIds.size() > 0) {
				for(Id uid : setGroupMemberIds) {
					RFA__Share rfaShare = new RFA__Share();
            		rfaShare.UserOrGroupId = uid;
            		rfaShare.ParentId = rfa.Id;		
            		rfaShare.RowCause = Schema.RFA__Share.RowCause.Seal_Admin__c;
            		rfaShare.AccessLevel = 'Edit';  
                
            		listNewRFAShares.add(rfaShare);	
				}
			}
			/*
			RFA__Share rfaShare = new RFA__Share();
            rfaShare.UserOrGroupId = '005N0000000tPNB';
            rfaShare.ParentId = rfa.Id;		
            rfaShare.RowCause = Schema.RFA__Share.RowCause.Seal_Admin__c;
            rfaShare.AccessLevel = 'Edit';  
                
            listNewRFAShares.add(rfaShare);	
                
			rfaShare = new RFA__Share();
            rfaShare.UserOrGroupId = '00510000001rhvi';
            rfaShare.ParentId = rfa.Id;		
            rfaShare.RowCause = Schema.RFA__Share.RowCause.Seal_Admin__c;
            rfaShare.AccessLevel = 'Edit';     
            */             
                
            //listNewRFAShares.add(rfaShare);					
		}
		
		if(listNewRFAShares != null && listNewRFAShares.size() > 0) {
			insert listNewRFAShares;
		}		
	}	
	
	/*
		remove the Edit permission for Seal Admins when the 'Seal Complete Check' is checked
	*/
	public static void removeEditPermissionForSealAdmins(Set<Id> setFinishedApprovedRFAIds) {
		
		Set<Id> setGroupMemberIds = Utility_Helper_Group.getGroupMemberUserIds(
			Utility_Helper_Group.getPuglicGroupId(
				RFA_Utility_Constants.PublicGroupName_SealAdminTeam
			)
		);
		
		List<RFA__Share> listOldRFAShares = [
			Select Id from RFA__Share 
			where ParentId 
			IN : setFinishedApprovedRFAIds 
			and AccessLevel = 'Edit'
			and
			//(UserOrGroupId = '005N0000000tPNB' or UserOrGroupId = '00510000001rhvi')
			UserOrGroupId IN: setGroupMemberIds
			and RowCause =: Schema.RFA__Share.RowCause.Seal_Admin__c
		];		
		
		if(listOldRFAShares != null && listOldRFAShares.size() > 0) {
			delete listOldRFAShares;
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