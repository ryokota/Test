/*
	without sharing is needed, 
	since when the last approver approved RFA, at the same time, related Project need to be updated,
	since the last approver don't have the permission to access Project, it need System permission to do this.
	put it into another independent class in future.
*/
public without sharing class RFA_TriggerHandler_Helper_ProjectRequest {

	/*
		============ isBefore & isInsert ============ 
	*/
	public static void processMilestoneRFAsInBeforeInsert(List<RFA__c> listNewRFAs) {
		
		List<RFA__c> listProjectInitiateRFAs = new List<RFA__c>();		
		List<RFA__c> listProjectCharterRFAs = new List<RFA__c>();		
		List<RFA__c> listProjectCloseOutRFAs = new List<RFA__c>();				
		
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST)) {
				
				listProjectInitiateRFAs.add(rfa);
				
			} else if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)) {
				
				listProjectCharterRFAs.add(rfa);
				
			} else if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)) {
				
				listProjectCloseOutRFAs.add(rfa); 				
			}		
		}//end of for(RFAs);
		
		if(listProjectInitiateRFAs != null && listProjectInitiateRFAs.size() > 0) {
			confirmProjectInitiateStatus(listProjectInitiateRFAs);
		}	
		
		if(listProjectCharterRFAs != null && listProjectCharterRFAs.size() > 0) {
			confirmProjectCharterStatus(listProjectCharterRFAs);
		}
		
		if(listProjectCloseOutRFAs != null && listProjectCloseOutRFAs.size() > 0) {
			confirmProjectCloseOutStatus(listProjectCloseOutRFAs);
		}				
	}	
	
	//In Project Initiate request, the related Project can't be in Initiate承認済み, Charter承認済み, CloseOut承認済み,
	//should be in a clean status
	private static void confirmProjectInitiateStatus(List<RFA__c> listNewRFAs) {
		Map<RFA__c, Id> mapRFAToRelatedProjectId = new Map<RFA__c, Id>();
		
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RM_Related_Project__c != null) {
				mapRFAToRelatedProjectId.put(rfa, rfa.RM_Related_Project__c);
			}
		}
		
		if(mapRFAToRelatedProjectId != null 
			&& mapRFAToRelatedProjectId.keySet() != null 
			&& mapRFAToRelatedProjectId.keySet().Size() > 0
			&& mapRFAToRelatedProjectId.values() != null
			&& mapRFAToRelatedProjectId.values().Size() > 0
		) {
			for(Milestone1_Project__c project : [
				Select Id, RM_Approval_Status__c 
				from Milestone1_Project__c 
				where Id IN: mapRFAToRelatedProjectId.values()
				]
			) {
				if(project.RM_Approval_Status__c != null) {
					for(RFA__c rfa : mapRFAToRelatedProjectId.keySet()) {
						if(mapRFAToRelatedProjectId.get(rfa) == project.Id) {
							rfa.addError('Approval Status in related Project is not right !');
						}
					}
				}
			}
		}		
	}
	//can only be  Initiate承認済み not Charter承認済み or CloseOut承認済み,
	private static void confirmProjectCharterStatus(List<RFA__c> listNewRFAs) {
		Map<RFA__c, Id> mapRFAToRelatedProjectId = new Map<RFA__c, Id>();
		
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RM_Related_Project__c != null) {
				mapRFAToRelatedProjectId.put(rfa, rfa.RM_Related_Project__c);
			}
		}
		
		if(mapRFAToRelatedProjectId != null 
			&& mapRFAToRelatedProjectId.keySet() != null 
			&& mapRFAToRelatedProjectId.keySet().Size() > 0
			&& mapRFAToRelatedProjectId.values() != null
			&& mapRFAToRelatedProjectId.values().Size() > 0
		) {
			for(Milestone1_Project__c project : [
				Select Id, RM_Approval_Status__c 
				from Milestone1_Project__c 
				where Id IN: mapRFAToRelatedProjectId.values()
				]
			) {
				if(project.RM_Approval_Status__c != RFA_Utility_Configure.RM_Initiate_Approved) {
					for(RFA__c rfa : mapRFAToRelatedProjectId.keySet()) {
						if(mapRFAToRelatedProjectId.get(rfa) == project.Id) {
							rfa.addError('Approval Status in related Project is not right !');
						}
					}
				}
			}
		}		
	}	
	
	private static void confirmProjectCloseOutStatus(List<RFA__c> listNewRFAs) {
		Map<RFA__c, Id> mapRFAToRelatedProjectId = new Map<RFA__c, Id>();
		
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RM_Related_Project__c != null) {
				mapRFAToRelatedProjectId.put(rfa, rfa.RM_Related_Project__c);
			}
		}
		
		if(mapRFAToRelatedProjectId != null 
			&& mapRFAToRelatedProjectId.keySet() != null 
			&& mapRFAToRelatedProjectId.keySet().Size() > 0
			&& mapRFAToRelatedProjectId.values() != null
			&& mapRFAToRelatedProjectId.values().Size() > 0
		) {
			for(Milestone1_Project__c project : [
				Select Id, RM_Approval_Status__c 
				from Milestone1_Project__c 
				where Id IN: mapRFAToRelatedProjectId.values()
				]
			) {
				if(project.RM_Approval_Status__c != RFA_Utility_Configure.RM_Charter_Approved) {
					for(RFA__c rfa : mapRFAToRelatedProjectId.keySet()) {
						if(mapRFAToRelatedProjectId.get(rfa) == project.Id) {
							rfa.addError('Approval Status in related Project is not right !');
						}
					}
				}
			}
		}		
	}		
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void processMilestoneRFAsInAfterInsert(List<RFA__c> listNewRFAs) {
		/*
		for(RFA__c rfa : listNewRFAs) {
			if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST)) {
				
			} else if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)) {
				
			} else if(rfa.RecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)) {
				if(rfa.Related_RFA_1__c != null) {
					copyApproversFromRelatedRFA(rfa);
				}
				
			}
		
		}//end of for(RFAs);	
		*/		
	}
	
	public static void copyApproversFromRelatedRFA(RFA__c rfa) {
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();
		
		for(RFAUserRole__c rfaApprover : [
			Select Id, RecordTypeId, UserName__c, ApprovalOrder__c 
				from RFAUserRole__c 
				where RFA__c =: rfa.Id 
				and RecordTypeId =: Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
			]
		) {
			RFAUserRole__c approver = new RFAUserRole__c();
			approver.RecordTypeId = rfaApprover.RecordTypeId;
			approver.RFA__c = rfa.Id;
			approver.ApprovalOrder__c = rfaApprover.ApprovalOrder__c;
			approver.userName__c =  rfaApprover.UserName__c;
			
			listNewRFAApprovers.add(approver);
		}
		
		if(listNewRFAApprovers != null && listNewRFAApprovers.size() > 0) {
			insert listNewRFAApprovers;
		}
		
	}

	
	/*
		============ isBefore & isUpdate ============ 
	*/

	
	
	/*
		============ isAfter & isUpdate ============ 
	*/
	public static void processMilestoneRFAsInAfterUpdate(		
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {		
		
		Email_Handler_RFA inst = new Email_Handler_RFA();
		
		
		/*
			In h. 02. Project Charter Reques request, if
			Detail Document Attached Y/N or
			Detail Document Attached Y/N or
			Detail Document Attached Y/N is checked, 
			there should be some attachment attached.
		*/
		for(RFA__c rfa : listNewRFAs) {
			//Project Charter and Close Out need to check Attachment Status!
			if(
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_DRAFT
				&& ( 
					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)
 					||
 					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)	
				   )											
				)	
				||
				(
				rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION 
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_ReturnToRequester
				&& ( 
					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)
 					||
 					rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)	
				   )	
				)									
			) {
				if(rfa.RM_Detail_Document_Attached_Y_N_1__c == true 
					|| rfa.RM_Detail_Document_Attached_Y_N_2__c == true
					|| rfa.RM_Detail_Document_Attached_Y_N_3__c == true
				) {
					List<Attachment> listAttachments = [Select Id from Attachment where ParentId =: rfa.Id];

					if(listAttachments == null || (listAttachments != null && listAttachments.size() == 0)) {
						//throw new RFA_AP19_RFAValidationException('No attachments !');

						//throw new Utility_Helper_Exception('No attachments !');

						rfa.addError(
							Label.RM_Attached_File
							//'No attachments !'
						);	

					}
				}
			}//end of if(attachment check);
			
			if(rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION																
			) {
				if(rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST)) {
				
					//Send Email to Team Members when RFA is approved
					inst.sendEmail_TeamMembers_AfterInitiate(rfa);	
					
				} else if(rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)) {
							
					//Send Email to Team Members when RFA is approved
					inst.sendEmail_TeamMembers_AfterCharter(rfa);						
				}				
				
			}									
		}//end of for(RFAs);
		
		updateRelatedProjectStatus(listNewRFAs, mapOldRFAs);
		
	}	
	
	
	//Need to develop
	/*
	public static void checkAttachmentStatus(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {	
								
	}
	*/
	
	/*
		Field Label	Approval Status
		Field Name	RM_Approval_Status
		API Name	RM_Approval_Status__c
	*/
	public static void updateRelatedProjectStatus(
		List<RFA__c> listNewRFAs, 
		Map<Id, RFA__c> mapOldRFAs
	) {
		for(RFA__c rfa : listNewRFAs) {		
			if(rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION
				&& rfa.RM_Related_Project__c != null
				&& rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST)
				) {	
					
				Milestone1_Project__c project = [
					Select Id, RM_Approval_Status__c from Milestone1_Project__c where Id =: rfa.RM_Related_Project__c
				];
				project.RM_Approval_Status__c = RFA_Utility_Configure.RM_Initiate_Approved; //'Initiate承認済み';
				update project;
				
			} else if(rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION
				&& rfa.RM_Related_Project__c != null
				&& rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)
			) {	

				Milestone1_Project__c project = [
					Select Id, RM_Approval_Status__c from Milestone1_Project__c where Id =: rfa.RM_Related_Project__c
				];
				project.RM_Approval_Status__c = RFA_Utility_Configure.RM_Charter_Approved; //'Chater承認済み';
				update project;
				
			} else if(rfa.Stage__c == RFA_Utility_Constants.RFA_STATUS_APPROVED
				&& mapOldRFAs.get(rfa.Id).Stage__c == RFA_Utility_Constants.RFA_STATUS_CIRCULATION
				&& rfa.RM_Related_Project__c != null
				&& rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)
			) {	
				Milestone1_Project__c project = [
					Select Id, RM_Approval_Status__c from Milestone1_Project__c where Id =: rfa.RM_Related_Project__c
				];
				project.RM_Approval_Status__c = RFA_Utility_Configure.RM_Close_Approved; //'CloseOut承認済み';
				update project;				
			}
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