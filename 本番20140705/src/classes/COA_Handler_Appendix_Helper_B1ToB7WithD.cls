/*

*/
public with sharing class COA_Handler_Appendix_Helper_B1ToB7WithD {


	/*
		============ isBefore & isInsert ============ 
	*/

	
	/*
		============ isAfter & isInsert ============ 
	*/
	//This method will set up the Approver Lists based on different routes, and conditions
	public static void setupApproverRoutesOfAppendix3_B1ToB7_With_TypeD(List<RFA__c> listNewRFAs) {	
		
		for(RFA__c rfa : listNewRFAs) {
			//One To One mapping, example, 01. Contract unit price => Category A
			Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();
			system.debug('------- After Insert: mapSelectedSubToSubSubCategory: ' + mapSelectedSubToSubSubCategory);

			//  example, L1/L2/..L13 => CEO, CFO, ...
			Map<String, Set<String>> mapSelectedLevelsToAcronymSet = new Map<String, Set<String>>();	
			//  example, L1/L2/..L13 => User 1, User 2, ...			
			Map<String, List<User>> mapSelectedLevelsToApproversByAcronym = new Map<String, List<User>>();
			
			Map<String, String> mapSelectedLevelsToGroup = new Map<String, String>();
			Map<String, List<User>> mapSelectedLevelsToApproversByGroup = new Map<String, List<User>>();					

			//get all Acronym for query Users, need to consider Gr.5 or special case, mapping needed
			Set<String> setAcronymOfAllApprovers = new Set<String>();
			
			//If only one Category is selected, have to follow the order even it is random
			Boolean onlyOneB1ToB7Category = containOnlyOneCategoryOfB1ToB7(rfa);	
			Boolean ifRandomOrder = false;		
			system.debug('----- After Insert: onlyOneB1ToB7Category: ' + onlyOneB1ToB7Category);
			
			Map<String, String> mapAcronymAndGroupToMappingLevel = new Map<String, String>();
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory 
				= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubAndSubSubCategory(rfa);
			system.debug('------- After Insert: mapSelectedSubToSubSubCategory: ' + mapSelectedSubToSubSubCategory);			
			
			
			// ====== Step 2 ======	
			if(mapSelectedSubToSubSubCategory != null 
				&& mapSelectedSubToSubSubCategory.keySet() != null 
				&& mapSelectedSubToSubSubCategory.values() != null
				&& mapSelectedSubToSubSubCategory.keySet().size() > 0
				&& mapSelectedSubToSubSubCategory.values().size() > 0
			) {
				
				for(COA__c coa : [				
					Select Id, 
						CM_Category__c, CM_PrimaryCOASubCategory__c, CM_Sub_Category__c, CM_Sub_sub_Category__c,	
						
						CM_L1_1__c, CM_L1_2__c, CM_L1_Order__c, CM_L1_Mapping_Level__c, CM_L1_Mapping__c,
						
						CM_L2_1__c, CM_L2_2__c, CM_L2_Order__c, CM_L2_Mapping_Level__c, CM_L2_Mapping__c,
						
						CM_L3_1__c, CM_L3_2__c, CM_L3_Order__c, CM_L3_Mapping_Level__c, CM_L3_Mapping__c,
						
						CM_L4_1__c, CM_L4_2__c, CM_L4_Order__c, CM_L4_Mapping_Level__c, CM_L4_Mapping__c,
						
						CM_L5_1__c, CM_L5_2__c, CM_L5_3__c, CM_L5_4__c, CM_L5_5__c, 
						CM_L5_6__c, CM_L5_7__c, CM_L5_8__c, CM_L5_9__c, CM_L5_10__c, 
						CM_L5_Order__c, CM_L5_Mapping_Level__c, CM_L5_Mapping__c,
						
						CM_L6_1__c, CM_L6_2__c, CM_L6_3__c, CM_L6_4__c, CM_L6_5__c, 
						CM_L6_6__c, CM_L6_7__c, CM_L6_8__c, CM_L6_9__c, CM_L6_10__c,
						CM_L6_Order__c,	CM_L6_Mapping_Level__c, CM_L6_Mapping__c,	
																
						CM_L7_1__c, CM_L7_2__c, CM_L7_3__c, CM_L7_4__c, CM_L7_5__c, 
						CM_L7_6__c, CM_L7_7__c, CM_L7_8__c, CM_L7_9__c, CM_L7_10__c, 
						CM_L7_Order__c, CM_L7_Mapping_Level__c, CM_L7_Mapping__c,
						
						CM_L8_1__c, CM_L8_2__c, CM_L8_3__c, CM_L8_4__c, CM_L8_5__c, 
						CM_L8_6__c, CM_L8_7__c, CM_L8_8__c, CM_L8_9__c, CM_L8_10__c,
						CM_L8_Order__c,	CM_L8_Mapping_Level__c, CM_L8_Mapping__c,	
						
						CM_L9_1__c, CM_L9_2__c, CM_L9_3__c, CM_L9_4__c, CM_L9_5__c, 
						CM_L9_6__c, CM_L9_7__c, CM_L9_8__c, CM_L9_9__c, CM_L9_10__c,
						CM_L9_Order__c, CM_L9_Mapping_Level__c, CM_L9_Mapping__c,		
											
						CM_L10_1__c, CM_L10_2__c, CM_L10_3__c, CM_L10_4__c, CM_L10_5__c, 
						CM_L10_6__c, CM_L10_7__c, CM_L10_8__c, CM_L10_9__c, CM_L10_10__c,
						CM_L10_Order__c, CM_L10_Mapping_Level__c, CM_L10_Mapping__c,		
												
						CM_L11_1__c, CM_L11_2__c, CM_L11_3__c, CM_L11_4__c, CM_L11_5__c, 
						CM_L11_6__c, CM_L11_7__c, CM_L11_8__c, CM_L11_9__c, CM_L11_10__c,
						CM_L11_Order__c, CM_L11_Mapping_Level__c, CM_L11_Mapping__c,	
																		
						CM_L12_1__c, CM_L12_2__c, CM_L12_3__c, CM_L12_4__c, CM_L12_5__c, 
						CM_L12_6__c, CM_L12_7__c, CM_L12_8__c, CM_L12_9__c, CM_L12_10__c,
						CM_L12_Order__c, CM_L12_Mapping_Level__c, CM_L12_Mapping__c,	
																		
						CM_L13_1__c, CM_L13_2__c, CM_L13_3__c, CM_L13_4__c, CM_L13_5__c, 
						CM_L13_6__c, CM_L13_7__c, CM_L13_8__c, CM_L13_9__c, CM_L13_10__c,
						CM_L13_Order__c, CM_L13_Mapping_Level__c, CM_L13_Mapping__c,														
						
						CM_Approver_Final_Level__c, CM_Approver_Steps__c, CM_Approver_Random_Order__c
						from COA__c 
						where 
							RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
								RFA_Utility_Constants.COA_RTAPIName_Appendix3_B1ToB7
								)
							and 
							CM_PrimaryCOASubCategory__c =: rfa.CM_PrimaryCOASubCategory__c
							and
							CM_Sub_Category__c IN: mapSelectedSubToSubSubCategory.keySet()
							and
							CM_Sub_sub_Category__c IN: mapSelectedSubToSubSubCategory.values()
					]
				) {
					system.debug('-------- After Insert: COA rule Id : ' + coa.Id);
					
					// ====== Step 2.1 ======	
					//Only one COA rule, have to follow the Random Order
					if(onlyOneB1ToB7Category && coa.CM_Approver_Random_Order__c) {
						ifRandomOrder = true;
						
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
					
						//  example, L1/L2/..L13 => CEO, CFO, ...
						mapSelectedLevelsToAcronymSet 
							= COA_Handler_Appendix_Helper_B1ToB7.getSelectedLevelsWithAcronyms(
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
						system.debug('------ mapSelectedLevelsToGroup: ' + mapSelectedLevelsToGroup);	
					}		
					
					mapAcronymAndGroupToMappingLevel = COA_Handler_Appendix_Helper_Utility.getAcronymAndGroupToMappingLevel(
						coa, 
						mapAcronymAndGroupToMappingLevel
					);	
					system.debug('------ mapAcronymAndGroupToMappingLevel: ' + mapAcronymAndGroupToMappingLevel);															
					
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
							runningUser,
							mapAcronymAndGroupToMappingLevel
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
									
									if(mapAcronymAndGroupToMappingLevel.containsKey(Acronym) && mapAcronymAndGroupToMappingLevel.get(Acronym) == 'Function3') {
									//if(COA_Utility_Constants.setAcronymToMapingToL3.contains(Acronym)) {
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
									} else if(mapAcronymAndGroupToMappingLevel.containsKey(Acronym) && mapAcronymAndGroupToMappingLevel.get(Acronym) == 'Function4') {
									//} else if(COA_Utility_Constants.setAcronymToMapingToL4.contains(Acronym)) {
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
									} else if(mapAcronymAndGroupToMappingLevel.containsKey(Acronym) && mapAcronymAndGroupToMappingLevel.get(Acronym) == 'Function5') {
									//} else if(COA_Utility_Constants.setAcronymToMapingToL5.contains(Acronym)) {
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
									} else if(mapAcronymAndGroupToMappingLevel.containsKey(Acronym) && mapAcronymAndGroupToMappingLevel.get(Acronym) == 'Function6') {
									//} else if(COA_Utility_Constants.setAcronymToMapingToL6.contains(Acronym)) {
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
									} else if(mapAcronymAndGroupToMappingLevel.containsKey(Acronym) && mapAcronymAndGroupToMappingLevel.get(Acronym) == 'Function7') {
									//} else if(COA_Utility_Constants.setAcronymToMapingToL6.contains(Acronym)) {
										//mapping to L6
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
											&& u.L6_Function_E__c == runningUser.L6_Function_E__c
											&& u.L7_Function_E__c == runningUser.L7_Function_E__c
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
									
								}
							}
						}							
				
					}//end of for(Users);
				}//end of if();
				
				
				/*
					Type D
				*/
				system.debug('----- Type D after insert');
				COA_Handler_Appendix_Helper_D.processAppendix3TypeDInAfterInsert(rfa);
				system.debug('------- COA_Handler_Appendix_Helper_D.listApprovers: ' + COA_Handler_Appendix_Helper_D.listApprovers);
				system.debug('------- COA_Handler_Appendix_Helper_D.listELTApprovers: ' + COA_Handler_Appendix_Helper_D.listELTApprovers);
				system.debug('------- COA_Handler_Appendix_Helper_D.listInfoCopyUsers: ' + COA_Handler_Appendix_Helper_D.listInfoCopyUsers);
				
				
				system.debug('------ mapSelectedLevelsToApproversByAcronym: ' 
					+ mapSelectedLevelsToApproversByAcronym);	
				COA_Handler_Appendix_Helper_Utility.insertApproversByLevels_B1ToB7OrB8WithTypeD(
					rfa, 
					mapSelectedLevelsToApproversByAcronym, 
					mapSelectedLevelsToApproversByGroup,
					COA_Handler_Appendix_Helper_D.listApprovers,
					COA_Handler_Appendix_Helper_D.listELTApprovers,
					COA_Handler_Appendix_Helper_D.listInfoCopyUsers
				);	
				
				
		
			}//end of if();
			
						
		}//end of for(RFAs);
		
	}//setupApproverRoutesOfAppendix3B1ToB7(RFAs);
	
			
	private static Boolean containOnlyOneCategoryOfB1ToB7(RFA__c rfa) {
		Integer count = 0;
		
		if(rfa.CM_Contract_unit_price__c != null) {
			count++;
		}			
		if(rfa.CM_SpecialPricePromotionDiscount__c != null) {
			count++;
		}	 
		if(rfa.CM_FS_selling_price__c != null) {
			count++;
		}	
		if(rfa.CM_FS_Commission_Variable__c != null) {
			count++;
		}	
		if(rfa.CM_FS_Commission_Fixed__c != null) {
			count++;
		}	
		if(rfa.CM_KeyMoney_Rebate_Sport_Other__c != null){
			count++;
		}				
		if(rfa.CM_Only_in_the_case_of_Rebate__c != null) {
			count++;
		}	
		if(rfa.CM_Other_support__c != null) {
			count++;
		}	
		if(rfa.CM_Promotion_OtherExpense__c != null) {
			count++;
		}	
		if(rfa.CM_Promotion_CooperationSampling__c != null){
			count++;
		}			
				
		if(count == 1) {
			return true;
		}
		return false;
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