/*
	Singular Label	RFA Approver/User	
	Plural Label	RFA Approvers/Users	
	Object Name	RFAUserRole	
	API Name	RFAUserRole__c	
*/
public with sharing class RFA_TriggerHandler_RFAUserRole {

	/*
		============ isBefore & isInsert ============ 
	*/
		

	/*
		============ isAfter & isInsert ============ 
	*/	
	public void processRFAUserRolesInAfterInsertTrigger(List<RFAUserRole__c> listNewRFAUserRoles) {
		
		List<RFAUserRole__c> listNewApprovers = new List<RFAUserRole__c>();
		//Primary Point of Contact
		List<RFAUserRole__c> listNewPPOCs = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listNewReadOnlys = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listNewReadOnlyAfterApplys = new List<RFAUserRole__c>();		
		
		for(RFAUserRole__c rfaUserRole : listNewRFAUserRoles) {
			
			if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
				
			) {
				
				listNewApprovers.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_PPOC)			
			) {
				
				listNewPPOCs.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly)				
			) {
				
				listNewReadOnlys.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnlyAfterApply)					
			) {
				
				listNewReadOnlyAfterApplys.add(rfaUserRole);
		
			}
			
		}
		
		if(listNewApprovers != null && listNewApprovers.size() > 0) {
			RFA_TriggerHandler_RFAUserRole_Helper.processApproversInAfterInsert(listNewApprovers);
		}
		
		if(listNewPPOCs != null && listNewPPOCs.size() > 0) {
			RFA_TriggerHandler_RFAUserRole_Helper.processPPOCInAfterInsert(listNewPPOCs);
		}
		
		if(listNewReadOnlys != null && listNewReadOnlys.size() > 0) {
			
		}
		
		if(listNewReadOnlyAfterApplys != null && listNewReadOnlyAfterApplys.size() > 0) {
			RFA_TriggerHandler_RFAUserRole_Helper.sendEmailToReadOnlyAfterApplys(listNewReadOnlyAfterApplys);
		}										
	}

	/*
		============ isBefore & isUpdate ============ 
	*/
	
	
			
	/*
		============ isAfter & isUpdate ============ 
	*/
	public void processRFAUserRolesInAfterUpdateTrigger(
		List<RFAUserRole__c> listNewRFAUserRoles, 
		Map<Id, RFAUserRole__c> mapOldRFAUserRoles
	) {
		
		List<RFAUserRole__c> listNewApprovers = new List<RFAUserRole__c>();
		//Primary Point of Contact
		List<RFAUserRole__c> listNewPPOCs = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listNewReadOnlys = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listNewReadOnlyAfterApplys = new List<RFAUserRole__c>();		
		
		for(RFAUserRole__c rfaUserRole : listNewRFAUserRoles) {
			
			if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
				
			) {
				
				listNewApprovers.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_PPOC)			
			) {
				
				listNewPPOCs.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly)				
			) {
				
				listNewReadOnlys.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnlyAfterApply)					
			) {
				
				listNewReadOnlyAfterApplys.add(rfaUserRole);
		
			}
			
		}
		
		if(listNewApprovers != null && listNewApprovers.size() > 0) {
			
			//RFA_TriggerHandler_RFAUserRole_Helper.processApproversByRecordTypesInAfterUpdate(listNewApprovers, mapOldRFAUserRoles);
			RFA_TriggerHandler_RFAUserRole_Helper.processApproversInAfterUpdate(listNewApprovers, mapOldRFAUserRoles);			
			
		}
		
		if(listNewPPOCs != null && listNewPPOCs.size() > 0) {
			RFA_TriggerHandler_RFAUserRole_Helper.processPPOCsInAfterUpdate(listNewPPOCs, mapOldRFAUserRoles);
		}
		
		if(listNewReadOnlys != null && listNewReadOnlys.size() > 0) {
			
		}
		
		if(listNewReadOnlyAfterApplys != null && listNewReadOnlyAfterApplys.size() > 0) {

		}										
	}


	/*
		============ isBefore & isDelete ============ 
	*/


	
	
	/*
		============ isAfter & isDelete ============ 
	*/
	public void processRFAUserRolesInAfterDeleteTrigger(List<RFAUserRole__c> listOldRFAUserRoles) {

		//RFA_TriggerHandler_RFAUserRole_Helper.checkDeletedRFAUserRoles(listOldRFAUserRoles);
		
		List<RFAUserRole__c> listOldApprovers = new List<RFAUserRole__c>();
		//Primary Point of Contact
		List<RFAUserRole__c> listOldPPOCs = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listOldReadOnlys = new List<RFAUserRole__c>();
		List<RFAUserRole__c> listOldReadOnlyAfterApplys = new List<RFAUserRole__c>();		
		
		for(RFAUserRole__c rfaUserRole : listOldRFAUserRoles) {
			
			if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
				
			) {
				
				listOldApprovers.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_PPOC)			
			) {
				
				listOldPPOCs.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly)				
			) {
				
				listOldReadOnlys.add(rfaUserRole);
				
			} else if(
				rfaUserRole.RecordTypeId == 
					Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnlyAfterApply)					
			) {
				
				listOldReadOnlyAfterApplys.add(rfaUserRole);
		
			}			
		}
		
		if(listOldApprovers != null && listOldApprovers.size() > 0) {
			RFA_TriggerHandler_RFAUserRole_Helper.processApproversInAfterDelete(listOldApprovers);
		}
		
		if(listOldPPOCs != null && listOldPPOCs.size() > 0) {
			
		}
		
		if(listOldReadOnlys != null && listOldReadOnlys.size() > 0) {
			
		}
		
		if(listOldReadOnlyAfterApplys != null && listOldReadOnlyAfterApplys.size() > 0) {

		}							
	}





	/*
		============ isAfter & isUnDelete ============ 
	*/	




}