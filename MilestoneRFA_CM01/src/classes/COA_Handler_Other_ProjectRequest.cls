/*
	Called by RFA Trigger isAfter & isInsert
*/
public with sharing class COA_Handler_Other_ProjectRequest {
	
	static boolean hasProjectMemberCopiedInCharter = false;
		
	/*
		============ isBefore & isInsert ============ 
	*/	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void addApproversOfProjectReqtOnAfterInsert(List<RFA__c> listNewRFAs) {

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
			addApproversOfProjectInitiateRequests(listProjectInitiateRFAs);
		}	
		
		if(listProjectCharterRFAs != null && listProjectCharterRFAs.size() > 0) {
			addApproversOfProjectCharterRequests(listProjectCharterRFAs);
		}
		
		if(listProjectCloseOutRFAs != null && listProjectCloseOutRFAs.size() > 0) {
			addApproversOfProjectCloseOutRequests(listProjectCloseOutRFAs);
		}								
	}	
	
	public static void addApproversOfProjectInitiateRequests(List<RFA__c> listNewRFAs) {
		
		//Approvers
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();
		
		//Project Initiate Request need to add new project members
		List<RM_Project_Member__c> listNewRFAProjectMembers = new List<RM_Project_Member__c>();
		
		//Integer appprover_order = 1;
		
		for(RFA__c rfa : listNewRFAs) {
			
			Integer appprover_order = 1;
			
			//should be located in Class level for tracking! new in each New RFA
			Set<Id> setExistingApprovers = new Set<Id>();
			//Requester will not be the Approver
			setExistingApprovers.add(rfa.CreatedById);
			
			User me = [Select Id, Username, ManagerId, 
				CokeOne_Manager__c, CokeOne_Resource__c,
				COA_Group__c, COA_Acronym__c, L_level__c,
				L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, Location_E__c
				from User 
				where Id =: Userinfo.getUserId() and IsActive =: true
			];	
			
			//should make sure Manager is Active
			if(me != null 
				&& me.ManagerId != null 
				&& !setExistingApprovers.contains(me.ManagerId)
				&& Utility.isActive(me.ManagerId)
			) {	
				//add Requester's Manager	
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = me.ManagerId;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);
				appprover_order++;		
				setExistingApprovers.add(me.ManagerId);
			}		
				
			//add Requester's Function's Leader
			//depends on the HR data: L2_Function_E__c
			if(me != null && me.L2_Function_E__c != null) {
				User MyL2FunctionLeader = [
					Select Id from User 
					where COA_Acronym__c =: RFA_Utility_Configure.Gr1FunctionToAcronym.get(me.L2_Function_E__c) 
						and IsActive = true
					order by CreatedDate DESC	
					limit 1
				];
				system.debug('-------- MyL2FunctionLeader: ' + MyL2FunctionLeader);
				
				if(MyL2FunctionLeader != null && !setExistingApprovers.contains(MyL2FunctionLeader.Id)) {
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = MyL2FunctionLeader.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = appprover_order;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
					listNewRFAApprovers.add(approver);
					appprover_order++;	
					setExistingApprovers.add(MyL2FunctionLeader.Id);
				}
			}
			
			//RFA Approvers	of L3 Functions
			List<RFAUserRole__c> listNewRFAApproversOfL3 = getApproversOfSupportFunctionL3s(
				rfa, 
				//listNewRFAApprovers, 
				me.L2_Function_E__c, 
				appprover_order,
				setExistingApprovers
			);	
			
			if(listNewRFAApproversOfL3 != null && listNewRFAApproversOfL3.size() > 0) {
				appprover_order++;
				listNewRFAApprovers.addAll(listNewRFAApproversOfL3);
			}
			
			//RFA Approvers	of L2 Functions
			List<RFAUserRole__c> listNewRFAApproversOfL2 = getApproversOfSupportFunctionL2s(
				rfa, 
				//listNewRFAApprovers, 
				me.L2_Function_E__c, 
				appprover_order,
				setExistingApprovers
			);	
			
			if(listNewRFAApproversOfL2 != null && listNewRFAApproversOfL2.size() > 0) {
				appprover_order++;
				listNewRFAApprovers.addAll(listNewRFAApproversOfL2);
			}			
				
			//---------- add RFA Project Members ---------- 
			if(rfa.RM_Related_Project__c == null) {
				listNewRFAProjectMembers = getRFAProjectMembersFromSupportFunctions(rfa, listNewRFAProjectMembers);					
					
			} else {
				for(Milestone_Permission__c projectMember : [
					Select Id, RM_Function__c, RM_Sub_Function__c, UserName__c, ProjectRole__c, RM_Expected_Roles__c
					from Milestone_Permission__c 
					where Project__c =: rfa.RM_Related_Project__c
					]
				) {
					RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
					rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
					rfaProjectMember.RM_Function__c = projectMember.RM_Function__c;
					rfaProjectMember.RM_Sub_Function__c = projectMember.RM_Sub_Function__c;
					rfaProjectMember.RM_Project_Role__c = projectMember.ProjectRole__c;
					rfaProjectMember.RM_Name__c = projectMember.UserName__c;
					rfaProjectMember.RM_Expected_Roles__c = projectMember.RM_Expected_Roles__c;
												
					listNewRFAProjectMembers.add(rfaProjectMember);
				}
			}											

		}//end of for(RFAs);
		
		system.debug('-------- listNewRFAApprovers: ' + listNewRFAApprovers);
		if(listNewRFAApprovers != null && listNewRFAApprovers.size() > 0) {
			insert listNewRFAApprovers;
		}	
		
		system.debug('-------- listNewRFAProjectMembers: ' + listNewRFAProjectMembers);
		if(listNewRFAProjectMembers != null && listNewRFAProjectMembers.size() > 0) {
			insert listNewRFAProjectMembers;
		}				
	}		
				
	public static void addApproversOfProjectCharterRequests(List<RFA__c> listNewRFAs) {		
		
		//Approvers
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();
		
		//Project Initiate Request need to add new project members
		List<RM_Project_Member__c> listNewRFAProjectMembers = new List<RM_Project_Member__c>();
		
		List<RM_Milestone_History__c> listNewRFAMilestones = new List<RM_Milestone_History__c>();
		
		//Integer appprover_order = 1;
		
		for(RFA__c rfa : listNewRFAs) {
			
			Integer appprover_order = 1;
			
			Set<Id> setExistingApprovers = new Set<Id>();
			//Requester will not be the Approver
			setExistingApprovers.add(rfa.CreatedById);
						
			User CBIO = null;
			User CFO = null;
			User CEO = null;
			if(rfa.RM_Project_Classification__c == 'A') {
				CBIO = [
					Select Id from User 
					where COA_Acronym__c =: 'CBIO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];
				if(CBIO != null) {
					setExistingApprovers.add(CBIO.Id);
				}
				CFO = [
					Select Id from User 
					where COA_Acronym__c =: 'CFO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];
				if(CFO != null) {
					setExistingApprovers.add(CFO.Id);
				}				
				CEO = [
					Select Id from User 
					where COA_Acronym__c =: 'CEO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];
				if(CEO != null) {
					setExistingApprovers.add(CEO.Id);
				}				
			} else if(rfa.RM_Project_Classification__c == 'B') {
				CBIO = [
					Select Id from User 
					where COA_Acronym__c =: 'CBIO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];
				if(CBIO != null) {
					setExistingApprovers.add(CBIO.Id);
				}				
				CFO = [
					Select Id from User 
					where COA_Acronym__c =: 'CFO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];
				if(CFO != null) {
					setExistingApprovers.add(CFO.Id);
				}						
			} else if(rfa.RM_Project_Classification__c == 'C') {
				CBIO = [
					Select Id from User 
					where COA_Acronym__c =: 'CBIO' and IsActive = true
					order by CreatedDate Desc
					limit 1
				];	
				if(CBIO != null) {
					setExistingApprovers.add(CBIO.Id);
				}							
			}					
			
			User me = [Select Id, Username, ManagerId, 
				CokeOne_Manager__c, CokeOne_Resource__c,
				COA_Group__c, COA_Acronym__c, L_level__c,
				L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, Location_E__c
				from User 
				where Id =: Userinfo.getUserId() and IsActive =: true
			];	
			
			//should make sure Manager is Active
			if(me != null 
				&& me.ManagerId != null 
				&& !setExistingApprovers.contains(me.ManagerId)
				&& Utility.isActive(me.ManagerId)
			) {	
				//add Requester's Manager	
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = me.ManagerId;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);
				appprover_order++;		
				setExistingApprovers.add(me.ManagerId);
			}		
				
			//add Requester's Function's Leader
			if(me != null && me.L2_Function_E__c != null) {
				User MyL2FunctionLeader = [
					Select Id from User 
					where COA_Acronym__c =: RFA_Utility_Configure.Gr1FunctionToAcronym.get(me.L2_Function_E__c) 
						and IsActive = true
					order by CreatedDate DESC	
					limit 1
				];
				system.debug('-------- MyL2FunctionLeader: ' + MyL2FunctionLeader);
				
				if(MyL2FunctionLeader != null && !setExistingApprovers.contains(MyL2FunctionLeader.Id)) {
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = MyL2FunctionLeader.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = appprover_order;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
					listNewRFAApprovers.add(approver);
					appprover_order++;	
					setExistingApprovers.add(MyL2FunctionLeader.Id);
				}
			}
			

						
			//RFA Approvers	of L3 Functions
			List<RFAUserRole__c> listNewRFAApproversOfL3 = getApproversOfSupportFunctionL3s(
				rfa, 
				//listNewRFAApprovers, 
				me.L2_Function_E__c, 
				appprover_order,
				setExistingApprovers
			);	
			
			if(listNewRFAApproversOfL3 != null && listNewRFAApproversOfL3.size() > 0) {
				appprover_order++;
				listNewRFAApprovers.addAll(listNewRFAApproversOfL3);
			}
			
			//RFA Approvers	of L2 Functions
			List<RFAUserRole__c> listNewRFAApproversOfL2 = getApproversOfSupportFunctionL2s(
				rfa, 
				//listNewRFAApprovers, 
				me.L2_Function_E__c, 
				appprover_order,
				setExistingApprovers
			);	
			
			if(listNewRFAApproversOfL2 != null && listNewRFAApproversOfL2.size() > 0) {
				appprover_order++;
				listNewRFAApprovers.addAll(listNewRFAApproversOfL2);
			}	
			
			if(rfa.RM_Project_Classification__c == 'A' && CBIO != null && CFO != null && CEO != null) {
				
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = CBIO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;		
				
				approver = new RFAUserRole__c();
				approver.UserName__c = CFO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;		
				
				approver = new RFAUserRole__c();
				approver.UserName__c = CEO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;	
																	
			} else if(rfa.RM_Project_Classification__c == 'B' && CBIO != null && CFO != null) {	
				
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = CBIO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;		

				approver = new RFAUserRole__c();
				approver.UserName__c = CFO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;		
															
			} else if(rfa.RM_Project_Classification__c == 'C' && CBIO != null) {
					
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = CBIO.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = appprover_order;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
				listNewRFAApprovers.add(approver);	
				appprover_order++;			
									
			}
			
			//---------- add RFA Project Members ---------- 
			if(rfa.RM_Related_Project__c == null) {
				listNewRFAProjectMembers = getRFAProjectMembersFromSupportFunctions(rfa, listNewRFAProjectMembers);					
					
			} else {
				for(Milestone_Permission__c projectMember : [
					Select Id, RM_Function__c, RM_Sub_Function__c, UserName__c, ProjectRole__c 
					from Milestone_Permission__c 
					where Project__c =: rfa.RM_Related_Project__c
					]
				) {
					RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
					rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
					rfaProjectMember.RM_Function__c = projectMember.RM_Function__c;
					rfaProjectMember.RM_Sub_Function__c = projectMember.RM_Sub_Function__c;
					rfaProjectMember.RM_Project_Role__c = projectMember.ProjectRole__c;
					rfaProjectMember.RM_Name__c = projectMember.UserName__c;
												
					listNewRFAProjectMembers.add(rfaProjectMember);
				}
			}	
			
			//---------- add RFA Project Milestones ---------- 
			if(rfa.RM_Related_Project__c != null) {
				listNewRFAMilestones = copyMilestonesToRFA(rfa, listNewRFAMilestones);
			}										

		}//end of for(RFAs);
		
		system.debug('-------- listNewRFAApprovers: ' + listNewRFAApprovers);
		if(listNewRFAApprovers != null && listNewRFAApprovers.size() > 0) {
			insert listNewRFAApprovers;
		}	
		
		system.debug('-------- listNewRFAProjectMembers: ' + listNewRFAProjectMembers);
		if(listNewRFAProjectMembers != null && listNewRFAProjectMembers.size() > 0) {
			insert listNewRFAProjectMembers;
		}				
		
		if(listNewRFAMilestones != null && listNewRFAMilestones.size() > 0) {
			insert listNewRFAMilestones;
		}	
	}	
				
	public static void addApproversOfProjectCloseOutRequests(List<RFA__c> listNewRFAs) {
		
		//Approvers
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();
		
		//Project Initiate Request need to add new project members
		List<RM_Project_Member__c> listNewRFAProjectMembers = new List<RM_Project_Member__c>();
		
		for(RFA__c rfa : listNewRFAs) {	
							
			//add Approvers from related RFA
			if(rfa.Related_RFA_1__c != null) {
				listNewRFAApprovers = copyApproversFromRelatedRFA(rfa, listNewRFAApprovers);
			}
			
			system.debug('----- Close-out: listNewRFAApprovers: ' + listNewRFAApprovers);
								
			//add RFA Project Members
			if(rfa.RM_Related_Project__c != null) {

				for(Milestone_Permission__c projectMember : [
					Select Id, RM_Function__c, RM_Sub_Function__c, UserName__c from Milestone_Permission__c 
					where Project__c =: rfa.RM_Related_Project__c
					]
				) {
					RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
					rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
					rfaProjectMember.RM_Function__c = projectMember.RM_Function__c;
					rfaProjectMember.RM_Sub_Function__c = projectMember.RM_Sub_Function__c;
					rfaProjectMember.RM_Name__c = projectMember.UserName__c;
												
					listNewRFAProjectMembers.add(rfaProjectMember);
				}
			}	

		}//end of for(RFAs); 
			
		if(listNewRFAApprovers != null && listNewRFAApprovers.size() > 0) {
			insert listNewRFAApprovers;
		}
		
		system.debug('-------- listNewRFAProjectMembers in Close-out: ' + listNewRFAProjectMembers);
		if(listNewRFAProjectMembers != null && listNewRFAProjectMembers.size() > 0) {
			insert listNewRFAProjectMembers;
			system.debug('-------- after insert listNewRFAProjectMembers: ' + listNewRFAProjectMembers);
		}							
		
	}
	
	//retrive Approvers from related RFA
	//Project Close-Out RFA request
	public static List<RFAUserRole__c> copyApproversFromRelatedRFA(RFA__c rfa, List<RFAUserRole__c> listNewRFAApprovers) {
		
		for(RFAUserRole__c rfaApprover : [
			Select Id, RecordTypeId, UserName__c, ApprovalOrder__c 
				from RFAUserRole__c 
				where RFA__c =: rfa.Related_RFA_1__c 
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

		return listNewRFAApprovers;
	}	
	

	/*
		Support Function (L2) & Sub Function (L3)
		Multiple L2s and multiple L3s
		L3s can be selected without L2s
	*/
	public static List<RFAUserRole__c> getApproversOfSupportFunctionL3s(
		RFA__c rfa, 
		//List<RFAUserRole__c> listNewRFAApprovers, 
		String strMyFunctionL2En, 
		Integer appprover_order,
		Set<Id> setExistingApprovers
	) {
		
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();
		
		Set<String> setSelectedEnFunctionL2s = new Set<String>();
		Set<String> setSelectedEFunctionL3s = new Set<String>();
		
		if(rfa.RM_Commercial_Select__c != null) {
			setSelectedEnFunctionL2s.add('Commercial');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_Commercial_Select__c));
		}
		
		if(rfa.RM_SCM_Select__c != null) {	
			setSelectedEnFunctionL2s.add('Supply Chain');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_SCM_Select__c));			
		}	
		
		if(rfa.RM_Procurement_Select__c != null) {
			setSelectedEnFunctionL2s.add('Procurement');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_Procurement_Select__c));		
		}		
		
		if(rfa.RM_HR_Select__c != null) {
			setSelectedEnFunctionL2s.add('HR');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_HR_Select__c));				
		}
		
		if(rfa.RM_Finance_Select__c != null) {
			setSelectedEnFunctionL2s.add('Finance');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_Finance_Select__c));				
		}
		//Use IS instead of IT
		if(rfa.RM_IS_Select__c != null) {
			setSelectedEnFunctionL2s.add('IS');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_IS_Select__c));				
		}
		
		if(rfa.RM_Legal_Select__c != null) {
			setSelectedEnFunctionL2s.add('Legal');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_Legal_Select__c));				
		}
		
		if(rfa.RM_PAC_Select__c != null) {
			setSelectedEnFunctionL2s.add('PAC');
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_PAC_Select__c));				
		}
		
		if(rfa.RM_BI_Select__c != null) {
			setSelectedEnFunctionL2s.add('Business Integration'); // not BI   'Business Integration' -> L2_Function_E__c
			setSelectedEFunctionL3s.addAll(Utility_Helper_String.getMultiSelectPicklistValuesInSet(rfa.RM_BI_Select__c));				
		}
		
		system.debug('----- setSelectedEnFunctionL2s: ' + setSelectedEnFunctionL2s);
		system.debug('----- setSelectedEFunctionL3s: ' + setSelectedEFunctionL3s);
		
		//Boolean hasL3Approver = false;
		
		if(setSelectedEnFunctionL2s != null 
			&& setSelectedEFunctionL3s != null
			&& setSelectedEnFunctionL2s.size() > 0
			&& setSelectedEFunctionL3s.size() > 0
		) {
			for(User u : [
				Select Id from User 
				where L2_Function_E__c IN: setSelectedEnFunctionL2s 
					AND L3_Function_E__c IN: setSelectedEFunctionL3s 
					AND L4_Function_E__c = null 
					AND IsActive = true
					]
			) {
				if(!setExistingApprovers.contains(u.Id)) {
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = appprover_order;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
					listNewRFAApprovers.add(approver);
					setExistingApprovers.add(u.Id);
					
					//hasL3Approver = true;
				}
			}
		}		
		/*
		if(hasL3Approver) {
			appprover_order++;
		}
		*/
		return listNewRFAApprovers;
	}

	public static List<RFAUserRole__c> getApproversOfSupportFunctionL2s(
		RFA__c rfa, 
		//List<RFAUserRole__c> listNewRFAApprovers, 
		String strMyFunctionL2En, 
		Integer appprover_order,
		Set<Id> setExistingApprovers
	) {				
		
		List<RFAUserRole__c> listNewRFAApprovers = new List<RFAUserRole__c>();		
				
		Set<String> setSelectedFunctionL2Acronyms = getSelectedFunctionL2s(rfa, strMyFunctionL2En);		
		system.debug('----- setSelectedFunctionL2Acronyms: ' + setSelectedFunctionL2Acronyms);
		
		if(setSelectedFunctionL2Acronyms != null && setSelectedFunctionL2Acronyms.size() > 0) {
			for(User u : [
				Select Id from User 
				where COA_Acronym__c IN: setSelectedFunctionL2Acronyms 
					AND L2_Function_E__c != null
					AND L3_Function_E__c = null
					AND L4_Function_E__c = null 
					AND IsActive = true
					]
			) {
				if(!setExistingApprovers.contains(u.Id)) {
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = appprover_order;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Project;
				
					listNewRFAApprovers.add(approver);
					setExistingApprovers.add(u.Id);
				}
			}			
		}				
		return listNewRFAApprovers;	
	}
	
	private static Set<String> getSelectedFunctionL2s(
		RFA__c rfa, 
		String strMyFunctionL2En
	) {
		Set<String> setSelectedFunctionL2Acronyms = new Set<String>();
		
		if(rfa.RM_Commercial_Check__c == true && strMyFunctionL2En != 'Commercial' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('Commercial'));
		}
		
		if(rfa.RM_SCM_Check__c == true && strMyFunctionL2En != 'Supply Chain' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('Supply Chain'));
		}	
		
		if(rfa.RM_Procurement_Check__c == true && strMyFunctionL2En != 'Procurement' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('Procurement'));
		}
		 
		if(rfa.RM_HR_Check__c == true && strMyFunctionL2En != 'HR' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('HR'));
		}				
		     		
		if(rfa.RM_Finance_Check__c == true && strMyFunctionL2En != 'Finance' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('Finance'));
		}	
		
		if(rfa.RM_IS_Check__c == true && strMyFunctionL2En != 'IT' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('IT'));
		}
		
		if(rfa.RM_Legal_Check__c == true && strMyFunctionL2En != 'Legal' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('Legal'));
		}		
		  
		if(rfa.RM_PAC_Check__c == true && strMyFunctionL2En != 'PAC' ) {
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('PAC'));
		}
		
		if(rfa.RM_BI_Check__c == true && strMyFunctionL2En != 'BI' ) {//BI -> Acronym
			setSelectedFunctionL2Acronyms.add(RFA_Utility_Configure.Gr1FunctionToAcronym.get('BI'));
		}					
				
		return setSelectedFunctionL2Acronyms;
	}		
	
	/*
		set up the Project Members based on Support Function (L2) & Sub Function (L3) 
		when no Related Project	is linked		
	*/
	public static List<RM_Project_Member__c> getRFAProjectMembersFromSupportFunctions(
		RFA__c rfa, 
		List<RM_Project_Member__c> listNewRFAProjectMembers
	) {
		if(rfa.RM_Commercial_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'Commercial';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_Commercial_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_Commercial_Select__c)) {
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'Commercial';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}	

		if(rfa.RM_SCM_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'Supply Chain';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_SCM_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_SCM_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'Supply Chain';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}	

		if(rfa.RM_Procurement_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'Procurement';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_Procurement_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_Procurement_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'Procurement';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}	

		if(rfa.RM_HR_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'HR';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_HR_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_HR_Select__c)) {
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'HR';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}			

		if(rfa.RM_Finance_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'Finance';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_Finance_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_Finance_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'Finance';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}			

		if(rfa.RM_IS_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'IT';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_IS_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_IS_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'IT';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}				

		if(rfa.RM_PAC_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'PAC';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_PAC_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_PAC_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'PAC';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}			

		if(rfa.RM_BI_Check__c == true) {
			RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
			rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
			rfaProjectMember.RM_Function__c = 'BI';
			listNewRFAProjectMembers.add(rfaProjectMember);
		}
		if(rfa.RM_BI_Select__c != null) {
			for(String strL3Function : Utility_Helper_String.getMultiSelectPicklistValues(rfa.RM_BI_Select__c)) {			
				RM_Project_Member__c rfaProjectMember = new RM_Project_Member__c();
				rfaProjectMember.RM_RFA_Approved__c = rfa.Id;
				rfaProjectMember.RM_Function__c = 'BI';
				rfaProjectMember.RM_Sub_Function__c = strL3Function;
				listNewRFAProjectMembers.add(rfaProjectMember);
			}
		}				
		
		return listNewRFAProjectMembers;	
	}
	
	//Copy Milestone for Project Charter RFA request
	public static List<RM_Milestone_History__c> copyMilestonesToRFA(RFA__c rfa, List<RM_Milestone_History__c> listNewRFAMilestones) {
		//List<RM_Milestone_History__c> listNewRFAMilestones = new List<RM_Milestone_History__c>();
		
		for(Milestone1_Milestone__c milestone : [
			Select Id, Name, Milestone_No__c, RM_Function__c, Kickoff__c, Deadline__c
			from Milestone1_Milestone__c 
			where Project__c =: rfa.RM_Related_Project__c
			]
		) {
			RM_Milestone_History__c rfaMilestone = new RM_Milestone_History__c();
			rfaMilestone.RM_Related_RFA__c = rfa.Id;			
			rfaMilestone.RM_Milestone_No__c = milestone.Milestone_No__c;
			rfaMilestone.RM_Function__c = milestone.RM_Function__c;
			rfaMilestone.RM_Milestone_Title__c = milestone.Name;
			rfaMilestone.RM_Start_Date__c = milestone.Kickoff__c;
			rfaMilestone.RM_End_Date__c = milestone.Deadline__c;
			
			listNewRFAMilestones.add(rfaMilestone);
		}
		
		return listNewRFAMilestones;
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