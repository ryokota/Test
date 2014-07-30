public with sharing class COA_Handler_Appendix_Helper_C {

	/*
		============ isBefore & isInsert ============ 
	*/
	

	/*
		============ isAfter & isInsert ============ 
	*/
	//In Type C, one RFA request only mapping to one COA rule
	public static void processAppendix3TypeCInAfterInsert(List<RFA__c> listNewRFAs) {
		system.debug('---------- processAppendix3TypeCInAfterInsert(List<RFA__c> listNewRFAs): ' + listNewRFAs);
		
		for(RFA__c rfa : listNewRFAs) {

			// ====== Step 1 ======		
			
			//  example, L1/L2/..L13 => CEO, CFO, ...
			Map<String, Set<String>> mapSelectedLevelsToAcronymSet = new Map<String, Set<String>>();	
			//  example, L1/L2/..L13 => User 1, User 2, ...			
			Map<String, List<User>> mapSelectedLevelsToApproversByAcronym = new Map<String, List<User>>();
			
			Map<String, String> mapSelectedLevelsToGroup = new Map<String, String>();			
			Map<String, List<User>> mapSelectedLevelsToApproversByGroup = new Map<String, List<User>>();			

			//get all Acronym for query Users, need to consider Gr.5 or special case, mapping needed
			Set<String> setAcronymOfAllApprovers = new Set<String>();
				
			// ====== Step 2 ======		
			if(rfa.CM_PrimaryCOACategory__c != null 
				&& rfa.CM_PrimaryCOASubCategory__c != null 
				&& rfa.CM_PrimaryCOASubCategory2__c != null
				&& rfa.CM_PrimaryCOASubCategory3__c != null
			) {
				for(COA__c coa : 
					[					
						Select Id, 
						CM_Primary_COA_Category_C1__c, CM_Primary_COA_Category_C2__c, 
						CM_Primary_COA_Category_C3__c, CM_Primary_COA_Category_C4__c,
						//CM_Category__c, CM_PrimaryCOASubCategory__c, CM_Sub_Category__c, CM_Sub_sub_Category__c,	
						
						CM_L1_1__c, CM_L1_2__c, CM_L1_Order__c, CM_L1_Mapping__c,
						CM_L2_1__c, CM_L2_2__c, CM_L2_Order__c, CM_L2_Mapping__c,
						CM_L3_1__c, CM_L3_2__c, CM_L3_Order__c, CM_L3_Mapping__c,
						CM_L4_1__c, CM_L4_2__c, CM_L4_Order__c, CM_L4_Mapping__c,
						CM_L5_1__c, CM_L5_2__c, CM_L5_3__c, CM_L5_4__c, CM_L5_5__c, 
						CM_L5_6__c, CM_L5_7__c, CM_L5_8__c, CM_L5_9__c, CM_L5_10__c, 
						CM_L5_Order__c, CM_L5_Mapping__c,
						CM_L6_1__c, CM_L6_2__c, CM_L6_3__c, CM_L6_4__c, CM_L6_5__c, 
						CM_L6_6__c, CM_L6_7__c, CM_L6_8__c, CM_L6_9__c, CM_L6_10__c,
						CM_L6_Order__c,	CM_L6_Mapping__c,											
						CM_L7_1__c, CM_L7_2__c, CM_L7_3__c, CM_L7_4__c, CM_L7_5__c, 
						CM_L7_6__c, CM_L7_7__c, CM_L7_8__c, CM_L7_9__c, CM_L7_10__c, 
						CM_L7_Order__c, CM_L7_Mapping__c,
						CM_L8_1__c, CM_L8_2__c, CM_L8_3__c, CM_L8_4__c, CM_L8_5__c, 
						CM_L8_6__c, CM_L8_7__c, CM_L8_8__c, CM_L8_9__c, CM_L8_10__c,
						CM_L8_Order__c,	CM_L8_Mapping__c,	
						CM_L9_1__c, CM_L9_2__c, CM_L9_3__c, CM_L9_4__c, CM_L9_5__c, 
						CM_L9_6__c, CM_L9_7__c, CM_L9_8__c, CM_L9_9__c, CM_L9_10__c,
						CM_L9_Order__c, CM_L9_Mapping__c,							
						CM_L10_1__c, CM_L10_2__c, CM_L10_3__c, CM_L10_4__c, CM_L10_5__c, 
						CM_L10_6__c, CM_L10_7__c, CM_L10_8__c, CM_L10_9__c, CM_L10_10__c,
						CM_L10_Order__c, CM_L10_Mapping__c,								
						CM_L11_1__c, CM_L11_2__c, CM_L11_3__c, CM_L11_4__c, CM_L11_5__c, 
						CM_L11_6__c, CM_L11_7__c, CM_L11_8__c, CM_L11_9__c, CM_L11_10__c,
						CM_L11_Order__c, CM_L11_Mapping__c,													
						CM_L12_1__c, CM_L12_2__c, CM_L12_3__c, CM_L12_4__c, CM_L12_5__c, 
						CM_L12_6__c, CM_L12_7__c, CM_L12_8__c, CM_L12_9__c, CM_L12_10__c,
						CM_L12_Order__c, CM_L12_Mapping__c,													
						CM_L13_1__c, CM_L13_2__c, CM_L13_3__c, CM_L13_4__c, CM_L13_5__c, 
						CM_L13_6__c, CM_L13_7__c, CM_L13_8__c, CM_L13_9__c, CM_L13_10__c,
						CM_L13_Order__c, CM_L13_Mapping__c,												
						
						CM_Approver_Final_Level__c, CM_Approver_Steps__c, CM_Approver_Random_Order__c
						from COA__c 
						where 
							RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
								RFA_Utility_Constants.COA_RTAPIName_Appendix3_C
								)
							and 
							CM_Primary_COA_Category_C1__c =: rfa.CM_PrimaryCOACategory__c
							and
							CM_Primary_COA_Category_C2__c =: rfa.CM_PrimaryCOASubCategory__c
							and
							CM_Primary_COA_Category_C3__c =: rfa.CM_PrimaryCOASubCategory2__c
							and
							CM_Primary_COA_Category_C4__c =: rfa.CM_PrimaryCOASubCategory3__c
						order by CreatedDate Desc
						limit 1
					]
				) {
					system.debug('-------- COA rule: ' + coa);
					
					if(coa.CM_Approver_Random_Order__c == true) {
						
						mapSelectedLevelsToAcronymSet 
							= COA_Handler_Appendix_Helper_B1ToB7.getSelectedLevelsWithAcronymsFromReversedOrder(
								coa, 
								mapSelectedLevelsToAcronymSet
							);
						system.debug('------ getSelectedLevelsWithAcronymsFromReversedOrder: ' + mapSelectedLevelsToAcronymSet);			
					
						// ====== Step 2.2 ======	
						mapSelectedLevelsToGroup 
							= COA_Handler_Appendix_Helper_Utility.getSelectedLevelsWithGroupFromReversedOrder(
								coa, 
								mapSelectedLevelsToGroup
							);		
						system.debug('------ getSelectedLevelsWithGroupFromReversedOrder: ' + mapSelectedLevelsToGroup);	
												
					} else {
					
						// ====== Step 2.1 ======		
						//  example, L1/L2/..L13 => CEO, CFO, ...
						mapSelectedLevelsToAcronymSet 
							= COA_Handler_Appendix_Helper_Utility.getSelectedLevelsWithAcronyms(
								coa, 
								mapSelectedLevelsToAcronymSet
							);
						system.debug('------ mapSelectedLevelsToAcronymSet: ' + mapSelectedLevelsToAcronymSet);		
					
						// ====== Step 2.2 ======		
						mapSelectedLevelsToGroup 
							= COA_Handler_Appendix_Helper_Utility.getSelectedLevelsWithGroup(
								coa, 
								mapSelectedLevelsToGroup
							);						
						system.debug('------ mapSelectedLevelsToGroup: ' 
							+ mapSelectedLevelsToGroup);	
					}							
					
				}//end of for(COAs)		
				
				// ====== Step 3 ======		
				User runningUser = [Select Id, Name, Username, COA_Acronym__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where Id =: Userinfo.getUserId()
				];
				
				// ====== Step 4 ======	
				if(mapSelectedLevelsToGroup != null 
					&& mapSelectedLevelsToGroup.keySet() != null
					&& mapSelectedLevelsToGroup.values() != null
					&& mapSelectedLevelsToGroup.keySet().size() > 0
					&& mapSelectedLevelsToGroup.values().size() > 0
				) {
					mapSelectedLevelsToApproversByGroup 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedLevelsToApproversByGroup(
							mapSelectedLevelsToGroup, 
							mapSelectedLevelsToApproversByGroup, 
							runningUser
						);
				}				
				
				// ====== Step 5 ======		
				if(mapSelectedLevelsToAcronymSet != null 
					&& mapSelectedLevelsToAcronymSet.keySet() != null
					&& mapSelectedLevelsToAcronymSet.keySet().size() > 0
				) {
					for(String key : mapSelectedLevelsToAcronymSet.keySet()) {
						
						mapSelectedLevelsToApproversByAcronym.put(key, null);
						
						//? should distinguish special rules here ? i.e., shitencho
						for(String Acronym : mapSelectedLevelsToAcronymSet.get(key)) {
							setAcronymOfAllApprovers.add(Acronym);
						}
					}
				}

				// ====== Step 6 ======	
				if(setAcronymOfAllApprovers != null && setAcronymOfAllApprovers.size() > 0) {
					//query all the users with selected Acronym
					for(User u : [
						Select Id, Name, Username, COA_Acronym__c, 
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where COA_Acronym__c IN: setAcronymOfAllApprovers
						]
					) {	
						for(String key : mapSelectedLevelsToAcronymSet.keySet()) {//key: L1/L2,.../L13
							for(String Acronym : mapSelectedLevelsToAcronymSet.get(key)) {
								if(Acronym == u.COA_Acronym__c) {
									
									if(COA_Utility_Constants.setAcronymToMapingToL3.contains(Acronym)) {
										//mapping to L3
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
										) {
											if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
												mapSelectedLevelsToApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL4.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
										) {
											if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
												mapSelectedLevelsToApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL5.contains(Acronym)) {
										//mapping to L5
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
										) {
											if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
												mapSelectedLevelsToApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL6.contains(Acronym)) {
										//mapping to L6
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
											&& u.L6_Function_E__c == runningUser.L6_Function_E__c
										) {
											if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
												mapSelectedLevelsToApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else {
									
										if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
											mapSelectedLevelsToApproversByAcronym.get(key).add(u);
										} else {
											mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
										}
									}									
									
									/*
									if(mapSelectedLevelsToApproversByAcronym.get(key) != null) {
										mapSelectedLevelsToApproversByAcronym.get(key).add(u);
									} else {
										mapSelectedLevelsToApproversByAcronym.put(key, new List<User>{u});
									}*/
									
								}
							}
						}							
				
					}//end of for(Users);
				}//end of if();
				
				// ====== Step 7 ======	
				system.debug('------ mapSelectedLevelsToApproversByAcronym: ' + mapSelectedLevelsToApproversByAcronym);	
				COA_Handler_Appendix_Helper_Utility.insertApproversByLevels(
					rfa, 
					mapSelectedLevelsToApproversByAcronym, 
					mapSelectedLevelsToApproversByGroup
				);	
		
			}//end of if();
			
						
		}//end of for(RFAs);
		
	}//
		

	
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