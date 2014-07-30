/*
	h. 04. Capital Budget Initiate Request	RM.04.Capital Budget Initial Request
*/
public without sharing class COA_Handler_Other_CapitalBudgetRequest {


	
	/*
		============ isBefore & isInsert ============ 
	*/

	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void addApproversOfCapitalBudgetReqtOnAfterInsert(List<RFA__c> listNewRFAs) {
		
		//List<RFAUserRole__c> listNewRFAUserRoles = new List<RFAUserRole__c>();
		
		//Project Initiate Request need to add new project members
		//List<RM_Project_Member__c> listNewRFAProjectMembers = new List<RM_Project_Member__c>();
		
		Integer appprover_order = 1;
		
		for(RFA__c rfa : listNewRFAs) {
														
			//Capital Budget Initiate Request
			if(rfa.RecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST)							
			) {
				
				Set<Id> setExistingApproverIds = new Set<Id>();
				setExistingApproverIds.add(rfa.CreatedById);
				
				//First time, need L3 level
				if(rfa.RM_L3_Approved__c == false) {
					User me = [Select Id, Username, ManagerId, 
						COA_Group__c, COA_Acronym__c, L_level__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, Location_E__c
						from User where Id =: Userinfo.getUserId() and isActive = true
						];		
					//L3 in my function	
					
					List<RFAUserRole__c> listNewCapitalApprovers = new List<RFAUserRole__c>();
					Integer app_order = 1;
					for(User u : [
						Select Id from User 
						where L2_Function_E__c =: me.L2_Function_E__c 
							and L3_Function_E__c =: me.L3_Function_E__c
							and L4_Function_E__c = null
							and Id !=: Userinfo.getUserId()
							and isActive = true
						]
					) {
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = app_order;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
							approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
						listNewCapitalApprovers.add(approver);	
						app_order++;	
					}	
					
					if(listNewCapitalApprovers != null && listNewCapitalApprovers.size() > 0) {
						insert listNewCapitalApprovers;
					}
					
										
				} else if(rfa.RM_L3_Approved__c == true) {//Second Time, need L2 of requester's own function
					//L3 in my function	
					List<RFAUserRole__c> listNewCapitalApprovers = new List<RFAUserRole__c>();
					Integer app_order = 1;					
					
					User CFO = null;
					//User CEO = null;
					
					if(rfa.RM_Request_Record_Type__c == 'Medium') {
						//Requested by 真庭 大輔 (Daisuke Maniwa) on 2014/06/19
						//CFO = [Select Id from User where COA_Acronym__c = 'CFO' and isActive = true limit 1];
						//setExistingApproverIds.add(CFO.Id);						
																		
					} else if(rfa.RM_Request_Record_Type__c == 'Capital') {
						CFO = [Select Id from User where COA_Acronym__c = 'CFO' and isActive = true limit 1];
						setExistingApproverIds.add(CFO.Id);
						
						//CEO = [Select Id from User where COA_Acronym__c = 'CEO' and isActive = true limit 1];
						//setExistingApproverIds.add(CEO.Id);												
					}
					
					User me = [Select Id, Username, ManagerId, 
						COA_Group__c, COA_Acronym__c, L_level__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, Location_E__c
						from User where Id =: Userinfo.getUserId() and isActive = true
						];		
										
					if(me != null && me.L2_Function_E__c != null) {
						User MyL2FunctionLeader = [
							Select Id from User 
							where COA_Acronym__c =: RFA_Utility_Configure.Gr1FunctionToAcronym.get(me.L2_Function_E__c) 
								and IsActive = true
							order by CreatedDate DESC	
							limit 1
						];
						system.debug('-------- MyL2FunctionLeader: ' + MyL2FunctionLeader);
				
						if(MyL2FunctionLeader != null && !setExistingApproverIds.contains(MyL2FunctionLeader.Id)) {
							RFAUserRole__c approver = new RFAUserRole__c();
							approver.UserName__c = MyL2FunctionLeader.Id;
							approver.RFA__c = rfa.Id;
							approver.ApprovalOrder__c = app_order;
							approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
								RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
							approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
							listNewCapitalApprovers.add(approver);
							app_order++;	
							setExistingApproverIds.add(MyL2FunctionLeader.Id);
						}
					}
					
					if(rfa.RM_Request_Record_Type__c == 'Medium' //&& CFO != null
					) {
						/*
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = CFO.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = app_order;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
							approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
						listNewCapitalApprovers.add(approver);	
						app_order++;							
						*/												
					} else if(
						rfa.RM_Request_Record_Type__c == 'Capital' && CFO != null //&& CEO != null
					) {

						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = CFO.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = app_order;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
							approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
						listNewCapitalApprovers.add(approver);	
						app_order++;	
						/*
						approver = new RFAUserRole__c();
						approver.UserName__c = CEO.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = app_order;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
							approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
						listNewCapitalApprovers.add(approver);	
						app_order++; */												
					}									
			
					//add Approvers in the L3 review to Info Copy Only in L2 RFA
					if(rfa.Related_RFA_1__c != null) {
						for(RFAUserRole__c oldApprover : [
							Select Id, UserName__c 
								from RFAUserRole__c 
								where RFA__c =: rfa.Related_RFA_1__c 
								and IsActive__c = true
								and RecordTypeId =: Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
									RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver)
							]
						) {
							
							if(!setExistingApproverIds.contains(oldApprover.UserName__c)) {
								RFAUserRole__c readonly = new RFAUserRole__c();
								readonly.UserName__c = oldApprover.UserName__c;
								readonly.RFA__c = rfa.Id;
								readonly.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
									RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly);
								readonly.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
								listNewCapitalApprovers.add(readonly);	
							}							
						}
					}
									
					if(listNewCapitalApprovers != null && listNewCapitalApprovers.size() > 0) {
						insert listNewCapitalApprovers;
					}					
										
				}
				
			}
							
		}
		
		//if(listNewRFAUserRoles != null && listNewRFAUserRoles.size() > 0) {
		//	insert listNewRFAUserRoles;
		//}
		
	}

	
	/*
		============ isBefore & isUpdate ============ 
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