public with sharing class COA_Handler_Appendix_Helper_B8 {
	
	/*
		============ isBefore & isInsert ============ 
	*/
	public static void setupFinalApproverOfAppendix3B8(List<RFA__c> listNewRFAs) {
		system.debug('-------- setupFinalApproverOfAppendix3B1ToB7: ' + listNewRFAs);
		
		for(RFA__c rfa : listNewRFAs) {
			//mutipule COA rules since in one RFA user can select different categories

			//One To One mapping, example, 01. Contract unit price => Category A
			Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();
			
			//  example, 01. Contract unit price => CEO, CFO, ...
			Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet = new Map<String, Set<String>>();
			//  example, 01. Contract unit price => Shiten cho / Gr.5
			Map<String, String> mapSelectedSubCategoryToFinalGroup = new Map<String, String>();
			
			//Final Approvers for each Category, may be one to many
			// example, 01. Contract unit price => Users
			Map<String, List<User>> mapSelectedSubToFinalApproversByAcronym = new Map<String, List<User>>();
			
			Map<String, List<User>> mapSelectedSubToFinalApproversByGroup = new Map<String, List<User>>();
			
			Set<String> setAcronymOfFinalApprovers = new Set<String>();						
			String strFinalApproverLevel = null;
			String strFinalApproverCategoryB8 = null; //CM_Sub_Category_B8__c
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory 
				= COA_Handler_Appendix_Helper_B8.getSelectedSubAndSubSubCategory(rfa);
			system.debug('------- mapSelectedSubToSubSubCategory: ' + mapSelectedSubToSubSubCategory);

			// ====== Step 2 ======	
			if(mapSelectedSubToSubSubCategory != null 
				&& mapSelectedSubToSubSubCategory.keySet() != null 
				&& mapSelectedSubToSubSubCategory.values() != null
				&& mapSelectedSubToSubSubCategory.keySet().size() > 0
				&& mapSelectedSubToSubSubCategory.values().size() > 0
			) {
				for(COA__c coa : 
					[					
						Select Id, 
						CM_Category__c, CM_PrimaryCOASubCategory__c, CM_Sub_Category__c, CM_Sub_sub_Category__c,	
						CM_Sub_Category_B8__c, CM_Sub_sub_Category_B8__c,
						
						CM_L1_1__c, CM_L1_2__c, CM_L1_Order__c, CM_L1_Mapping__c, CM_L1_Kizai__c,
						CM_L2_1__c, CM_L2_2__c, CM_L2_Order__c, CM_L2_Mapping__c, CM_L2_Kizai__c,
						CM_L3_1__c, CM_L3_2__c, CM_L3_Order__c, CM_L3_Mapping__c, CM_L3_Kizai__c,
						CM_L4_1__c, CM_L4_2__c, CM_L4_Order__c, CM_L4_Mapping__c, CM_L4_Kizai__c,
						CM_L5_1__c, CM_L5_2__c, CM_L5_3__c, CM_L5_4__c, CM_L5_5__c, 
						CM_L5_6__c, CM_L5_7__c, CM_L5_8__c, CM_L5_9__c, CM_L5_10__c, 
						CM_L5_Order__c, CM_L5_Mapping__c, CM_L5_Kizai__c,
						CM_L6_1__c, CM_L6_2__c, CM_L6_3__c, CM_L6_4__c, CM_L6_5__c, 
						CM_L6_6__c, CM_L6_7__c, CM_L6_8__c, CM_L6_9__c, CM_L6_10__c,
						CM_L6_Order__c,	CM_L6_Mapping__c, CM_L6_Kizai__c,											
						CM_L7_1__c, CM_L7_2__c, CM_L7_3__c, CM_L7_4__c, CM_L7_5__c, 
						CM_L7_6__c, CM_L7_7__c, CM_L7_8__c, CM_L7_9__c, CM_L7_10__c, 
						CM_L7_Order__c, CM_L7_Mapping__c, CM_L7_Kizai__c,
						CM_L8_1__c, CM_L8_2__c, CM_L8_3__c, CM_L8_4__c, CM_L8_5__c, 
						CM_L8_6__c, CM_L8_7__c, CM_L8_8__c, CM_L8_9__c, CM_L8_10__c,
						CM_L8_Order__c,	CM_L8_Mapping__c, CM_L8_Kizai__c,	
						CM_L9_1__c, CM_L9_2__c, CM_L9_3__c, CM_L9_4__c, CM_L9_5__c, 
						CM_L9_6__c, CM_L9_7__c, CM_L9_8__c, CM_L9_9__c, CM_L9_10__c,
						CM_L9_Order__c, CM_L9_Mapping__c, CM_L9_Kizai__c,							
						CM_L10_1__c, CM_L10_2__c, CM_L10_3__c, CM_L10_4__c, CM_L10_5__c, 
						CM_L10_6__c, CM_L10_7__c, CM_L10_8__c, CM_L10_9__c, CM_L10_10__c,
						CM_L10_Order__c, CM_L10_Mapping__c,	CM_L10_Kizai__c,							
						CM_L11_1__c, CM_L11_2__c, CM_L11_3__c, CM_L11_4__c, CM_L11_5__c, 
						CM_L11_6__c, CM_L11_7__c, CM_L11_8__c, CM_L11_9__c, CM_L11_10__c,
						CM_L11_Order__c, CM_L11_Mapping__c,	CM_L11_Kizai__c,												
						CM_L12_1__c, CM_L12_2__c, CM_L12_3__c, CM_L12_4__c, CM_L12_5__c, 
						CM_L12_6__c, CM_L12_7__c, CM_L12_8__c, CM_L12_9__c, CM_L12_10__c,
						CM_L12_Order__c, CM_L12_Mapping__c,	CM_L12_Kizai__c,												
						CM_L13_1__c, CM_L13_2__c, CM_L13_3__c, CM_L13_4__c, CM_L13_5__c, 
						CM_L13_6__c, CM_L13_7__c, CM_L13_8__c, CM_L13_9__c, CM_L13_10__c,
						CM_L13_Order__c, CM_L13_Mapping__c,	CM_L13_Kizai__c,																										
						
						CM_Approver_Final_Level__c, CM_Approver_Steps__c, CM_Approver_Random_Order__c
						from COA__c 
						where 
							RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
								RFA_Utility_Constants.COA_RTAPIName_Appendix3_B1ToB7WithB8
								)
							and 
							CM_PrimaryCOASubCategory__c =: rfa.CM_PrimaryCOASubCategory__c
							and
							CM_Sub_Category_B8__c IN: mapSelectedSubToSubSubCategory.keySet()
							and
							CM_Sub_sub_Category_B8__c IN: mapSelectedSubToSubSubCategory.values()
					]
				) {
					system.debug('-------- COA rule: ' + coa.Id);
					
					//Get the Final Approver's Category based on Levels, such as, a. Non-standard Equipment,...
					if(strFinalApproverLevel == null) {
						strFinalApproverLevel = coa.CM_Approver_Final_Level__c;
						strFinalApproverCategoryB8 = coa.CM_Sub_Category_B8__c;
					} else {
						if(Utility_Helper_String.ifNewLevelHigherThanOldLevel(coa.CM_Approver_Final_Level__c, strFinalApproverLevel)) {
							strFinalApproverLevel = coa.CM_Approver_Final_Level__c;
							strFinalApproverCategoryB8 = coa.CM_Sub_Category_B8__c;							
						}
					}					
					
					//Don't need to consider Approver Random Order in Before Insert
					//Since we only need to know the Final Approver here, not the whole route
					mapSelectedSubCategoryToFinalAcronymSet 
						= COA_Handler_Appendix_Helper_B8.getSelectedSubCategoryWithFinalAcronyms(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalAcronymSet
						);
					system.debug('------ mapSelectedSubCategoryToFinalAcronymSet: ' 
						+ mapSelectedSubCategoryToFinalAcronymSet);
						
					mapSelectedSubCategoryToFinalGroup 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubCategoryWithFinalGroup(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalGroup
						);			
					//{01. Contract unit price=Gr.5}				
					system.debug('------ mapSelectedSubCategoryToFinalGroup: ' 
						+ mapSelectedSubCategoryToFinalGroup);
										
				}//end of for(COAs);
				
				User runningUser = [Select Id, Name, Username, COA_Acronym__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where Id =: Userinfo.getUserId()
				];
				
				//Group Approvers
				if(mapSelectedSubCategoryToFinalGroup != null 
					&& mapSelectedSubCategoryToFinalGroup.keySet() != null
					&& mapSelectedSubCategoryToFinalGroup.keySet().size() > 0
				) {
					mapSelectedSubToFinalApproversByGroup 
						= COA_Handler_Appendix_Helper_B1ToB7.getFinalApproverByGroup(
							//rfa, 
							mapSelectedSubCategoryToFinalGroup, 
							mapSelectedSubToFinalApproversByGroup, 
							runningUser
						);
				}
				
				system.debug('--------- mapSelectedSubToFinalApproversByGroup: ' + mapSelectedSubToFinalApproversByGroup);
				
				// ====== Step 3 ======					
				if(mapSelectedSubCategoryToFinalAcronymSet != null 
					&& mapSelectedSubCategoryToFinalAcronymSet.keySet() != null
					&& mapSelectedSubCategoryToFinalAcronymSet.keySet().size() > 0
				) {
					for(String key : mapSelectedSubCategoryToFinalAcronymSet.keySet()) {
						
						mapSelectedSubToFinalApproversByAcronym.put(key, null);
						
						for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet.get(key)) {
							setAcronymOfFinalApprovers.add(Acronym);
						}
					}
				}
				
				// ====== Step 4 ======	
				//add user mapping here!  need mapping checkbox and user's function
				if(setAcronymOfFinalApprovers != null && setAcronymOfFinalApprovers.size() > 0) {
					//query all the users with selected Acronym
					for(User u : [
						Select Id, Name, Username, 
						COA_Acronym__c, COA_Group__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where COA_Acronym__c IN: setAcronymOfFinalApprovers
						]
					) {	
						for(String key : mapSelectedSubCategoryToFinalAcronymSet.keySet()) {
							for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet.get(key)) {
								if(Acronym == u.COA_Acronym__c) {
									//need to mapping, dynamically get mapping list
																		
									if(COA_Utility_Constants.setAcronymToMapingToL3.contains(Acronym)) {
										//mapping to L3
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL4.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL5.contains(Acronym)) {
										//mapping to L5
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym.put(key, new List<User>{u});
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
											
											if(mapSelectedSubToFinalApproversByAcronym.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym.put(key, new List<User>{u});
											}
										}

									} else {//do not need mapping
										if(mapSelectedSubToFinalApproversByAcronym.get(key) != null) {
											mapSelectedSubToFinalApproversByAcronym.get(key).add(u);
										} else {
											mapSelectedSubToFinalApproversByAcronym.put(key, new List<User>{u});
										}
									}//mapping
									
								}//same user

							}//
						}											
					}//for(Users);
				}//end of if();
				
				system.debug('--------- mapSelectedSubToFinalApproversByAcronym: ' + mapSelectedSubToFinalApproversByAcronym);
				
				// ====== Step 5 ======	
				if(mapSelectedSubToFinalApproversByAcronym != null 
					|| mapSelectedSubToFinalApproversByGroup != null
					//&& mapSelectedSubToFinalApproversByAcronym.keySet() != null 
					//&& mapSelectedSubToFinalApproversByAcronym.values() != null
					//&& mapSelectedSubToFinalApproversByAcronym.keySet().size() > 0
					//&& mapSelectedSubToFinalApproversByAcronym.values().size() > 0
				) {
					COA_Handler_Appendix_Helper_B8.setupFinalApproverForEachCategory(
						rfa, 
						mapSelectedSubToFinalApproversByAcronym, 
						mapSelectedSubToFinalApproversByGroup,
						strFinalApproverCategoryB8
					); 
				}						
			}//end of if();									
		}//end of for(RFAs);
	}//end of setupFinalApproverOfAppendix3B1ToB7(RFAs);		
	
	
	public static Map<String, String> getSelectedSubAndSubSubCategory(RFA__c rfa) {
		
		Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();

		if(rfa.CM_Non_standard_Equipment__c != null) {
			mapSelectedSubToSubSubCategory.put('a. Non-standard Equipment', rfa.CM_Non_standard_Equipment__c);
		}
				
		if(rfa.CM_Vending_Equipment_parts__c != null) {
			mapSelectedSubToSubSubCategory.put('b. Vending Equipment parts', rfa.CM_Vending_Equipment_parts__c);
		}		
								
		if(rfa.CM_Incidental_work__c != null) {
			mapSelectedSubToSubSubCategory.put('c. Incidental work', rfa.CM_Incidental_work__c);
		}
			
		if(rfa.CM_Vending_Equipment_Lease__c != null) {
			mapSelectedSubToSubSubCategory.put('d. Vending Equipment Lease', rfa.CM_Vending_Equipment_Lease__c);
		}
			
		if(rfa.CM_Equipment_retirement__c != null) {
			mapSelectedSubToSubSubCategory.put('e. Equipment retirement', rfa.CM_Equipment_retirement__c);
		}
									
		return mapSelectedSubToSubSubCategory;
	}//end of getSelectedSubAndSubSubCategory();		
	
	
	
	public static Map<String, Set<String>> getSelectedSubCategoryWithFinalAcronyms(
		RFA__c rfa,
		COA__c coa, 
		Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet
	) {
		if(coa.CM_Sub_Category_B8__c == 'a. Non-standard Equipment'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Non_standard_Equipment__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevelOfB8(coa, mapSelectedSubCategoryToFinalAcronymSet);			
		}
			
		if(coa.CM_Sub_Category_B8__c == 'b. Vending Equipment parts'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Vending_Equipment_parts__c
		) {		
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevelOfB8(coa, mapSelectedSubCategoryToFinalAcronymSet);		
		}
											
		if(coa.CM_Sub_Category_B8__c == 'c. Incidental work'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Incidental_work__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevelOfB8(coa, mapSelectedSubCategoryToFinalAcronymSet);																							
		}								
			
		if(coa.CM_Sub_Category_B8__c == 'd. Vending Equipment Lease'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Vending_Equipment_Lease__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevelOfB8(coa, mapSelectedSubCategoryToFinalAcronymSet);			
		}								
				
		if(coa.CM_Sub_Category_B8__c == 'e. Equipment retirement'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Equipment_retirement__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevelOfB8(coa, mapSelectedSubCategoryToFinalAcronymSet);					
		}								
											
		return mapSelectedSubCategoryToFinalAcronymSet;
	}//end of getSelectedSubCategoryWithFinalAcronyms();	

	//Loop all fields to retrieve each Approver's Acronym or Group
	//two formats are available: CEO or Gr.5
	//only retrive Acronym
	private static Map<String, Set<String>> getFinalAcronymsByLevelOfB8(
		COA__c coa, 
		Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet
	) {
		if(coa.CM_Approver_Final_Level__c == 'L1') {
			if(coa.CM_L1_Kizai__c != null && !coa.CM_L1_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L1_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L1_Kizai__c});
				}
			}	
			if(coa.CM_L1_1__c != null && !coa.CM_L1_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L1_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L1_1__c});
				}
			}			
			if(coa.CM_L1_2__c != null && !coa.CM_L1_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L1_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L1_2__c});
				}
			}									
		}
		
		if(coa.CM_Approver_Final_Level__c == 'L2') {
			if(coa.CM_L2_Kizai__c != null && !coa.CM_L2_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L2_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L2_Kizai__c});
				}
			}	
			if(coa.CM_L2_1__c != null && !coa.CM_L2_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L2_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L2_1__c});
				}
			}			
			if(coa.CM_L2_2__c != null && !coa.CM_L2_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L2_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L2_2__c});
				}
			}									
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L3') {
			if(coa.CM_L3_Kizai__c != null && !coa.CM_L3_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L3_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L3_Kizai__c});
				}
			}
			if(coa.CM_L3_1__c != null && !coa.CM_L3_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L3_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L3_1__c});
				}
			}			
			if(coa.CM_L3_2__c != null && !coa.CM_L3_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L3_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L3_2__c});
				}
			}										
		}			

		if(coa.CM_Approver_Final_Level__c == 'L4') {
			if(coa.CM_L4_Kizai__c != null && !coa.CM_L4_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L4_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L4_Kizai__c});
				}
			}
			if(coa.CM_L4_1__c != null && !coa.CM_L4_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L4_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L4_1__c});
				}
			}			
			if(coa.CM_L4_2__c != null && !coa.CM_L4_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L4_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L4_2__c});
				}
			}										
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L5') {
			if(coa.CM_L5_Kizai__c != null && !coa.CM_L5_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_Kizai__c});
				}
			}	
			if(coa.CM_L5_1__c != null && !coa.CM_L5_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_1__c});
				}
			}			
			if(coa.CM_L5_2__c != null && !coa.CM_L5_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_2__c});
				}
			}
			if(coa.CM_L5_3__c != null && !coa.CM_L5_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_3__c});
				}
			}			
			if(coa.CM_L5_4__c != null && !coa.CM_L5_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_4__c});
				}
			}			
			if(coa.CM_L5_5__c != null && !coa.CM_L5_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_5__c});
				}
			}		
			if(coa.CM_L5_6__c != null && !coa.CM_L5_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_6__c});
				}
			}			
			if(coa.CM_L5_7__c != null && !coa.CM_L5_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_7__c});
				}
			}
			if(coa.CM_L5_8__c != null && !coa.CM_L5_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_8__c});
				}
			}			
			if(coa.CM_L5_9__c != null && !coa.CM_L5_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_9__c});
				}
			}			
			if(coa.CM_L5_10__c != null && !coa.CM_L5_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L5_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L5_10__c});
				}
			}																							
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L6') {
			if(coa.CM_L6_Kizai__c != null && !coa.CM_L6_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_Kizai__c});
				}
			}		

			if(coa.CM_L6_1__c != null && !coa.CM_L6_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_1__c});
				}
			}			
			if(coa.CM_L6_2__c != null && !coa.CM_L6_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_2__c});
				}
			}
			if(coa.CM_L6_3__c != null && !coa.CM_L6_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_3__c});
				}
			}			
			if(coa.CM_L6_4__c != null && !coa.CM_L6_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_4__c});
				}
			}			
			if(coa.CM_L6_5__c != null && !coa.CM_L6_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_5__c});
				}
			}		
			if(coa.CM_L6_6__c != null && !coa.CM_L6_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_6__c});
				}
			}			
			if(coa.CM_L6_7__c != null && !coa.CM_L6_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_7__c});
				}
			}
			if(coa.CM_L6_8__c != null && !coa.CM_L6_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_8__c});
				}
			}			
			if(coa.CM_L6_9__c != null && !coa.CM_L6_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_9__c});
				}
			}			
			if(coa.CM_L6_10__c != null && !coa.CM_L6_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L6_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L6_10__c});
				}
			}																																						
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L7') {
			if(coa.CM_L7_Kizai__c != null && !coa.CM_L7_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_Kizai__c});
				}
			}	
			if(coa.CM_L7_1__c != null && !coa.CM_L7_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_1__c});
				}
			}			
			if(coa.CM_L7_2__c != null && !coa.CM_L7_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_2__c});
				}
			}
			if(coa.CM_L7_3__c != null && !coa.CM_L7_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_3__c});
				}
			}			
			if(coa.CM_L7_4__c != null && !coa.CM_L7_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_4__c});
				}
			}			
			if(coa.CM_L7_5__c != null && !coa.CM_L7_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_5__c});
				}
			}		
			if(coa.CM_L7_6__c != null && !coa.CM_L7_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_6__c});
				}
			}			
			if(coa.CM_L7_7__c != null && !coa.CM_L7_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_7__c});
				}
			}
			if(coa.CM_L7_8__c != null && !coa.CM_L7_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_8__c});
				}
			}			
			if(coa.CM_L7_9__c != null && !coa.CM_L7_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_9__c});
				}
			}			
			if(coa.CM_L7_10__c != null && !coa.CM_L7_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L7_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L7_10__c});
				}
			}																							
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L8') {
			if(coa.CM_L8_Kizai__c != null && !coa.CM_L8_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_Kizai__c});
				}
			}	
			if(coa.CM_L8_1__c != null && !coa.CM_L8_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_1__c});
				}
			}			
			if(coa.CM_L8_2__c != null && !coa.CM_L8_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_2__c});
				}
			}
			if(coa.CM_L8_3__c != null && !coa.CM_L8_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_3__c});
				}
			}			
			if(coa.CM_L8_4__c != null && !coa.CM_L8_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_4__c});
				}
			}			
			if(coa.CM_L8_5__c != null && !coa.CM_L8_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_5__c});
				}
			}		
			if(coa.CM_L8_6__c != null && !coa.CM_L8_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_6__c});
				}
			}			
			if(coa.CM_L8_7__c != null && !coa.CM_L8_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_7__c});
				}
			}
			if(coa.CM_L8_8__c != null && !coa.CM_L8_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_8__c});
				}
			}			
			if(coa.CM_L8_9__c != null && !coa.CM_L8_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_9__c});
				}
			}			
			if(coa.CM_L8_10__c != null && !coa.CM_L8_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L8_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L8_10__c});
				}
			}																								
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L9') {
			if(coa.CM_L9_Kizai__c != null && !coa.CM_L9_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_Kizai__c});
				}
			}	
			if(coa.CM_L9_1__c != null && !coa.CM_L9_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_1__c});
				}
			}			
			if(coa.CM_L9_2__c != null && !coa.CM_L9_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_2__c});
				}
			}
			if(coa.CM_L9_3__c != null && !coa.CM_L9_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_3__c});
				}
			}			
			if(coa.CM_L9_4__c != null && !coa.CM_L9_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_4__c});
				}
			}			
			if(coa.CM_L9_5__c != null && !coa.CM_L9_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_5__c});
				}
			}		
			if(coa.CM_L9_6__c != null && !coa.CM_L9_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_6__c});
				}
			}			
			if(coa.CM_L9_7__c != null && !coa.CM_L9_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_7__c});
				}
			}
			if(coa.CM_L9_8__c != null && !coa.CM_L9_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_8__c});
				}
			}			
			if(coa.CM_L9_9__c != null && !coa.CM_L9_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_9__c});
				}
			}			
			if(coa.CM_L9_10__c != null && !coa.CM_L9_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L9_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L9_10__c});
				}
			}																								
		}			

		if(coa.CM_Approver_Final_Level__c == 'L10') {
			if(coa.CM_L10_Kizai__c != null && !coa.CM_L10_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_Kizai__c});
				}
			}	
			if(coa.CM_L10_1__c != null && !coa.CM_L10_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_1__c});
				}
			}			
			if(coa.CM_L10_2__c != null && !coa.CM_L10_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_2__c});
				}
			}
			if(coa.CM_L10_3__c != null && !coa.CM_L10_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_3__c});
				}
			}			
			if(coa.CM_L10_4__c != null && !coa.CM_L10_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_4__c});
				}
			}			
			if(coa.CM_L10_5__c != null && !coa.CM_L10_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_5__c});
				}
			}		
			if(coa.CM_L10_6__c != null && !coa.CM_L10_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_6__c});
				}
			}			
			if(coa.CM_L10_7__c != null && !coa.CM_L10_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_7__c});
				}
			}
			if(coa.CM_L10_8__c != null && !coa.CM_L10_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_8__c});
				}
			}			
			if(coa.CM_L10_9__c != null && !coa.CM_L10_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_9__c});
				}
			}			
			if(coa.CM_L10_10__c != null && !coa.CM_L10_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L10_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L10_10__c});
				}
			}																								
		}	
		
		if(coa.CM_Approver_Final_Level__c == 'L11') {
			if(coa.CM_L11_Kizai__c != null && !coa.CM_L11_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_Kizai__c});
				}
			}	
			if(coa.CM_L11_1__c != null && !coa.CM_L11_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_1__c});
				}
			}			
			if(coa.CM_L11_2__c != null && !coa.CM_L11_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_2__c});
				}
			}
			if(coa.CM_L11_3__c != null && !coa.CM_L11_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_3__c});
				}
			}			
			if(coa.CM_L11_4__c != null && !coa.CM_L11_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_4__c});
				}
			}			
			if(coa.CM_L11_5__c != null && !coa.CM_L11_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_5__c});
				}
			}		
			if(coa.CM_L11_6__c != null && !coa.CM_L11_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_6__c});
				}
			}			
			if(coa.CM_L11_7__c != null && !coa.CM_L11_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_7__c});
				}
			}
			if(coa.CM_L11_8__c != null && !coa.CM_L11_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_8__c});
				}
			}			
			if(coa.CM_L11_9__c != null && !coa.CM_L11_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_9__c});
				}
			}			
			if(coa.CM_L11_10__c != null && !coa.CM_L11_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L11_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L11_10__c});
				}
			}																							
		}			
				
		if(coa.CM_Approver_Final_Level__c == 'L12') {
			if(coa.CM_L12_Kizai__c != null && !coa.CM_L12_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_Kizai__c});
				}
			}	
			if(coa.CM_L12_1__c != null && !coa.CM_L12_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_1__c});
				}
			}			
			if(coa.CM_L12_2__c != null && !coa.CM_L12_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_2__c});
				}
			}
			if(coa.CM_L12_3__c != null && !coa.CM_L12_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_3__c});
				}
			}			
			if(coa.CM_L12_4__c != null && !coa.CM_L12_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_4__c});
				}
			}			
			if(coa.CM_L12_5__c != null && !coa.CM_L12_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_5__c});
				}
			}		
			if(coa.CM_L12_6__c != null && !coa.CM_L12_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_6__c});
				}
			}			
			if(coa.CM_L12_7__c != null && !coa.CM_L12_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_7__c});
				}
			}
			if(coa.CM_L12_8__c != null && !coa.CM_L12_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_8__c});
				}
			}			
			if(coa.CM_L12_9__c != null && !coa.CM_L12_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_9__c});
				}
			}			
			if(coa.CM_L12_10__c != null && !coa.CM_L12_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L12_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L12_10__c});
				}
			}																							
		}			

		if(coa.CM_Approver_Final_Level__c == 'L13') {
			if(coa.CM_L13_Kizai__c != null && !coa.CM_L13_Kizai__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_Kizai__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_Kizai__c});
				}
			}	
			if(coa.CM_L13_1__c != null && !coa.CM_L13_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_1__c});
				}
			}			
			if(coa.CM_L13_2__c != null && !coa.CM_L13_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_2__c});
				}
			}
			if(coa.CM_L13_3__c != null && !coa.CM_L13_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_3__c});
				}
			}			
			if(coa.CM_L13_4__c != null && !coa.CM_L13_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_4__c});
				}
			}			
			if(coa.CM_L13_5__c != null && !coa.CM_L13_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_5__c});
				}
			}		
			if(coa.CM_L13_6__c != null && !coa.CM_L13_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_6__c});
				}
			}			
			if(coa.CM_L13_7__c != null && !coa.CM_L13_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_7__c});
				}
			}
			if(coa.CM_L13_8__c != null && !coa.CM_L13_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_8__c});
				}
			}			
			if(coa.CM_L13_9__c != null && !coa.CM_L13_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_9__c});
				}
			}			
			if(coa.CM_L13_10__c != null && !coa.CM_L13_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category_B8__c).add(coa.CM_L13_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category_B8__c, new Set<String>{coa.CM_L13_10__c});
				}
			}																						
		}				
		return mapSelectedSubCategoryToFinalAcronymSet;
	}//end of getFinalAcronymsByLevel();	
	
		
	//only one Final Group, i.e., Gr.5 working as Final Approvers
	public static Map<String, String> getSelectedSubCategoryWithFinalGroup(
		RFA__c rfa,
		COA__c coa, 
		Map<String, String> mapSelectedSubCategoryToFinalGroup
	) {
		if(coa.CM_Sub_Category_B8__c == 'a. Non-standard Equipment'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Non_standard_Equipment__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevelOfB8(coa, mapSelectedSubCategoryToFinalGroup);			
		}
			
		if(coa.CM_Sub_Category_B8__c == 'b. Vending Equipment parts'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Vending_Equipment_parts__c
		) {		
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevelOfB8(coa, mapSelectedSubCategoryToFinalGroup);		
		}
											
		if(coa.CM_Sub_Category_B8__c == 'c. Incidental work'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_FS_selling_price__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevelOfB8(coa, mapSelectedSubCategoryToFinalGroup);																							
		}								
			
		if(coa.CM_Sub_Category_B8__c == 'd. Vending Equipment Lease'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Incidental_work__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevelOfB8(coa, mapSelectedSubCategoryToFinalGroup);			
		}								
				
		if(coa.CM_Sub_Category_B8__c == 'e. Equipment retirement'
			&& coa.CM_Sub_sub_Category_B8__c == rfa.CM_Equipment_retirement__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevelOfB8(coa, mapSelectedSubCategoryToFinalGroup);					
		}								
					
		return mapSelectedSubCategoryToFinalGroup;
	}//getSelectedSubCategoryWithFinalGroup();	
	
	//Loop all fields to retrieve each Approver's Acronym or Group
	//two formats are available: CEO or Gr.5
	//only retrive Gr., only one Gr. in one Level !  CM_L1_1__c will win CM_L1_2__c
	private static Map<String, String> getFinalGroupByLevelOfB8(
		COA__c coa, 
		Map<String, String> mapSelectedSubCategoryToFinalGroup
	) {
		if(coa.CM_Approver_Final_Level__c == 'L1') {
			if(coa.CM_L1_Kizai__c != null && coa.CM_L1_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L1_Kizai__c);
			}	
			
			if(coa.CM_L1_1__c != null && coa.CM_L1_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L1_1__c);
			} else if(coa.CM_L1_2__c != null && coa.CM_L1_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L1_2__c);
			}						
		}
		
		if(coa.CM_Approver_Final_Level__c == 'L2') {
			if(coa.CM_L2_Kizai__c != null && coa.CM_L2_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L2_Kizai__c);
			}		
			if(coa.CM_L2_1__c != null && coa.CM_L2_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L2_1__c);
			} else if(coa.CM_L2_2__c != null && coa.CM_L2_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L2_2__c);
			}						
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L3') {
			if(coa.CM_L3_Kizai__c != null && coa.CM_L3_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L3_Kizai__c);
			}	
			if(coa.CM_L3_1__c != null && coa.CM_L3_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L3_1__c);
			} else if(coa.CM_L3_2__c != null && coa.CM_L3_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L3_2__c);
			}						
		}			

		if(coa.CM_Approver_Final_Level__c == 'L4') {
			if(coa.CM_L4_Kizai__c != null && coa.CM_L4_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L4_Kizai__c);
			}	
			if(coa.CM_L4_1__c != null && coa.CM_L4_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L4_1__c);
			} else if(coa.CM_L4_2__c != null && coa.CM_L4_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L4_2__c);
			}							
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L5') {
			if(coa.CM_L5_Kizai__c != null && coa.CM_L5_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_Kizai__c);
			} 	
			if(coa.CM_L5_1__c != null && coa.CM_L5_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_1__c);
			} else if(coa.CM_L5_2__c != null && coa.CM_L5_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_2__c);
			} else if(coa.CM_L5_3__c != null && coa.CM_L5_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_3__c);
			} else if(coa.CM_L5_4__c != null && coa.CM_L5_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_4__c);
			} else if(coa.CM_L5_5__c != null && coa.CM_L5_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_5__c);
			} else if(coa.CM_L5_6__c != null && coa.CM_L5_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_6__c);
			} else if(coa.CM_L5_7__c != null && coa.CM_L5_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_7__c);
			} else if(coa.CM_L5_8__c != null && coa.CM_L5_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_8__c);
			} else if(coa.CM_L5_9__c != null && coa.CM_L5_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_9__c);
			} else if(coa.CM_L5_10__c != null && coa.CM_L5_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L5_10__c);
			}																		
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L6') {
			if(coa.CM_L6_Kizai__c != null && coa.CM_L6_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_Kizai__c);
			}		
			if(coa.CM_L6_1__c != null && coa.CM_L6_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_1__c);
			} else if(coa.CM_L6_2__c != null && coa.CM_L6_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_2__c);
			} else if(coa.CM_L6_3__c != null && coa.CM_L6_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_3__c);
			} else if(coa.CM_L6_4__c != null && coa.CM_L6_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_4__c);
			} else if(coa.CM_L6_5__c != null && coa.CM_L6_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_5__c);
			} else if(coa.CM_L6_6__c != null && coa.CM_L6_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_6__c);
			} else if(coa.CM_L6_7__c != null && coa.CM_L6_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_7__c);
			} else if(coa.CM_L6_8__c != null && coa.CM_L6_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_8__c);
			} else if(coa.CM_L6_9__c != null && coa.CM_L6_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_9__c);
			} else if(coa.CM_L6_10__c != null && coa.CM_L6_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L6_10__c);
			}																	
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L7') {
			if(coa.CM_L7_Kizai__c != null && coa.CM_L7_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_Kizai__c);
			} 	
			if(coa.CM_L7_1__c != null && coa.CM_L7_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_1__c);
			} else if(coa.CM_L7_2__c != null && coa.CM_L7_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_2__c);
			} else if(coa.CM_L7_3__c != null && coa.CM_L7_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_3__c);
			} else if(coa.CM_L7_4__c != null && coa.CM_L7_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_4__c);
			} else if(coa.CM_L7_5__c != null && coa.CM_L7_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_5__c);
			} else if(coa.CM_L7_6__c != null && coa.CM_L7_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_6__c);
			} else if(coa.CM_L7_7__c != null && coa.CM_L7_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_7__c);
			} else if(coa.CM_L7_8__c != null && coa.CM_L7_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_8__c);
			} else if(coa.CM_L7_9__c != null && coa.CM_L7_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_9__c);
			} else if(coa.CM_L7_10__c != null && coa.CM_L7_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L7_10__c);
			}																	
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L8') {
			if(coa.CM_L8_Kizai__c != null && coa.CM_L8_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_Kizai__c);
			}	
			if(coa.CM_L8_1__c != null && coa.CM_L8_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_1__c);
			} else if(coa.CM_L8_2__c != null && coa.CM_L8_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_2__c);
			} else if(coa.CM_L8_3__c != null && coa.CM_L8_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_3__c);
			} else if(coa.CM_L8_4__c != null && coa.CM_L8_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_4__c);
			} else if(coa.CM_L8_5__c != null && coa.CM_L8_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_5__c);
			} else if(coa.CM_L8_6__c != null && coa.CM_L8_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_6__c);
			} else if(coa.CM_L8_7__c != null && coa.CM_L8_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_7__c);
			} else if(coa.CM_L8_8__c != null && coa.CM_L8_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_8__c);
			} else if(coa.CM_L8_9__c != null && coa.CM_L8_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_8__c);
			} else if(coa.CM_L8_10__c != null && coa.CM_L8_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L8_10__c);
			}																		
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L9') {
			if(coa.CM_L9_Kizai__c != null && coa.CM_L9_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_Kizai__c);
			}		
			if(coa.CM_L9_1__c != null && coa.CM_L9_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_1__c);
			} else if(coa.CM_L9_2__c != null && coa.CM_L9_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_2__c);
			} else if(coa.CM_L9_3__c != null && coa.CM_L9_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_3__c);
			} else if(coa.CM_L9_4__c != null && coa.CM_L9_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_4__c);
			} else if(coa.CM_L9_5__c != null && coa.CM_L9_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_5__c);
			} else if(coa.CM_L9_6__c != null && coa.CM_L9_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_6__c);
			} else if(coa.CM_L9_7__c != null && coa.CM_L9_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_7__c);
			} else if(coa.CM_L9_8__c != null && coa.CM_L9_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_8__c);
			} else if(coa.CM_L9_9__c != null && coa.CM_L9_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_9__c);
			} else if(coa.CM_L9_10__c != null && coa.CM_L9_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L9_10__c);
			}																		
		}						

		if(coa.CM_Approver_Final_Level__c == 'L10') {
			if(coa.CM_L10_Kizai__c != null && coa.CM_L10_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_Kizai__c);
			} 		
			if(coa.CM_L10_1__c != null && coa.CM_L10_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_1__c);
			} else if(coa.CM_L10_2__c != null && coa.CM_L10_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_2__c);
			} else if(coa.CM_L10_3__c != null && coa.CM_L10_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_3__c);
			} else if(coa.CM_L10_4__c != null && coa.CM_L10_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_4__c);
			} else if(coa.CM_L10_5__c != null && coa.CM_L10_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_5__c);
			} else if(coa.CM_L10_6__c != null && coa.CM_L10_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_6__c);
			} else if(coa.CM_L10_7__c != null && coa.CM_L10_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_7__c);
			} else if(coa.CM_L10_8__c != null && coa.CM_L10_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_8__c);
			} else if(coa.CM_L10_9__c != null && coa.CM_L10_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_9__c);
			} else if(coa.CM_L10_10__c != null && coa.CM_L10_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L10_10__c);
			}																	
		}	
		
		if(coa.CM_Approver_Final_Level__c == 'L11') {
			if(coa.CM_L11_Kizai__c != null && coa.CM_L11_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_Kizai__c);
			}	
			if(coa.CM_L11_1__c != null && coa.CM_L11_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_1__c);
			} else if(coa.CM_L11_2__c != null && coa.CM_L11_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_2__c);
			} else if(coa.CM_L11_3__c != null && coa.CM_L11_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_3__c);
			} else if(coa.CM_L11_4__c != null && coa.CM_L11_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_4__c);
			} else if(coa.CM_L11_5__c != null && coa.CM_L11_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_5__c);
			} else if(coa.CM_L11_6__c != null && coa.CM_L11_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_6__c);
			} else if(coa.CM_L11_7__c != null && coa.CM_L11_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_7__c);
			} else if(coa.CM_L11_8__c != null && coa.CM_L11_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_8__c);
			} else if(coa.CM_L11_9__c != null && coa.CM_L11_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_9__c);
			} else if(coa.CM_L11_10__c != null && coa.CM_L11_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L11_10__c);
			}																		
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L12') {
			if(coa.CM_L12_Kizai__c != null && coa.CM_L12_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_Kizai__c);
			} 		
			if(coa.CM_L12_1__c != null && coa.CM_L12_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_1__c);
			} else if(coa.CM_L12_2__c != null && coa.CM_L12_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_2__c);
			} else if(coa.CM_L12_3__c != null && coa.CM_L12_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_3__c);
			} else if(coa.CM_L12_4__c != null && coa.CM_L12_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_4__c);
			} else if(coa.CM_L12_5__c != null && coa.CM_L12_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_5__c);
			} else if(coa.CM_L12_6__c != null && coa.CM_L12_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_6__c);
			} else if(coa.CM_L12_7__c != null && coa.CM_L12_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_7__c);
			} else if(coa.CM_L12_8__c != null && coa.CM_L12_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_8__c);
			} else if(coa.CM_L12_9__c != null && coa.CM_L12_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_9__c);
			} else if(coa.CM_L12_10__c != null && coa.CM_L12_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L12_10__c);
			}																		
		}		

		if(coa.CM_Approver_Final_Level__c == 'L13') {
			if(coa.CM_L13_Kizai__c != null && coa.CM_L13_Kizai__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_Kizai__c);
			} 
			if(coa.CM_L13_1__c != null && coa.CM_L13_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_1__c);
			} else if(coa.CM_L13_2__c != null && coa.CM_L13_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_2__c);
			} else if(coa.CM_L13_3__c != null && coa.CM_L13_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_3__c);
			} else if(coa.CM_L13_4__c != null && coa.CM_L13_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_4__c);
			} else if(coa.CM_L13_5__c != null && coa.CM_L13_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_5__c);
			} else if(coa.CM_L13_6__c != null && coa.CM_L13_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_6__c);
			} else if(coa.CM_L13_7__c != null && coa.CM_L13_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_7__c);
			} else if(coa.CM_L13_8__c != null && coa.CM_L13_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_8__c);
			} else if(coa.CM_L13_9__c != null && coa.CM_L13_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_9__c);
			} else if(coa.CM_L13_10__c != null && coa.CM_L13_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category_B8__c, coa.CM_L13_10__c);
			}																		
		}				
		return mapSelectedSubCategoryToFinalGroup;
	}//end of getFinalGroupByLevel();	
	
	
	
	/*
		Set up the Final Approver in Before Insert on the interface
		Acronym or Gr. can not be in the same Category of B.8.
		Link to each specific Final Approver field, such as, a. Final Approver, ... e. Final Approver
	*/		
	//have to consdier parallel in B8
	public static void setupFinalApproverForEachCategory(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedSubToFinalApproversByAcronym,
		Map<String, List<User>> mapSelectedSubToFinalApproversByGroup,
		String strFinalApproverCategoryB8
	) {
		system.debug('-------- setupFinalApproverForEachCategory(): From Acronym: ' + mapSelectedSubToFinalApproversByAcronym 
			+ ' From Group: ' + mapSelectedSubToFinalApproversByGroup);
		List<User> listFinalApprovers = null;
				
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('a. Non-standard Equipment')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('a. Non-standard Equipment') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('a. Non-standard Equipment').size() > 0 
			) {				
				
				String strAcronym1 = null;
				Set<String> setAcronym1 = null;
				String strName1 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('a. Non-standard Equipment')) {
					
					if(strAcronym1 == null) {
						strAcronym1 = u.COA_Acronym__c;
						setAcronym1 = new Set<String>();
						setAcronym1.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym1.contains(u.COA_Acronym__c)) {
							strAcronym1 = strAcronym1 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName1 == null) {
						strName1 = u.Name;
					} else {
						strName1 = strName1 + ', ' + u.Name;
					}
				}
				
				if(strAcronym1 != null && strName1 != null) {
					rfa.CM_Non_standard_Equipment_FA_ACR__c = strAcronym1;
					rfa.CM_Non_standard_Equipment_FA_Name__c = strName1;
				}
				
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);								
				//listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('a. Non-standard Equipment');
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('a. Non-standard Equipment')) {
			if(mapSelectedSubToFinalApproversByGroup.get('a. Non-standard Equipment') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('a. Non-standard Equipment').size() > 0 
			) {				
				system.debug('------ Group: a. Non-standard Equipment: Approvers: ' 
					+ mapSelectedSubToFinalApproversByGroup.get('a. Non-standard Equipment'));
					
				String strAcronym1 = null;
				Set<String> setAcronym1 = null;
				String strName1 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('a. Non-standard Equipment')) {
					
					if(strAcronym1 == null) {
						strAcronym1 = u.COA_Acronym__c;
						setAcronym1 = new Set<String>();
						setAcronym1.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym1.contains(u.COA_Acronym__c)) {
							strAcronym1 = strAcronym1 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName1 == null) {
						strName1 = u.Name;
					} else {
						String previous = strName1;
						strName1 = strName1 + ', ' + u.Name;
						if(strName1.length() >= 255) {
							strName1 = previous;
						}
					}
				}
				
				system.debug('----- Group 01 / strName1: ' + strName1 + ' strAcronym1: ' + strAcronym1);
				//Sales in Group 5 may not have Acronym!!
				if(strAcronym1 != null || strName1 != null) {
					rfa.CM_Non_standard_Equipment_FA_ACR__c = strAcronym1;
					rfa.CM_Non_standard_Equipment_FA_Name__c = strName1;
				}
				system.debug('--------- Group 01 after input acr: ' + rfa.CM_Contract_unit_price_FA_ACR__c );
				system.debug('--------- Group 01 after input name:' + rfa.CM_Contract_unit_price_FA_Name__c );				
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);				
				/*		
				listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price');
				system.debug('------ Group 01: listFinalApprovers: ' + listFinalApprovers);
				*/
			}
		}	
				
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('b. Vending Equipment parts')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts').size() > 0 
			) {		
				String strAcronym2 = null;
				Set<String> setAcronym2 = null;
				String strName2 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts')) {
					
					if(strAcronym2 == null) {
						strAcronym2 = u.COA_Acronym__c;
						setAcronym2 = new Set<String>();
						setAcronym2.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym2.contains(u.COA_Acronym__c)) {
							strAcronym2 = strAcronym2 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName2 == null) {
						strName2 = u.Name;
					} else {
						strName2 = strName2 + ', ' + u.Name;
					}

				}
				if(strAcronym2 != null && strName2 != null) {
					rfa.CM_Vending_Equipment_parts_FA_ACR__c = strAcronym2;
					rfa.CM_Vending_Equipment_parts_FA_Name__c = strName2;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);											
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('b. Vending Equipment parts');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('b. Vending Equipment parts')) {
			if(mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts').size() > 0 
			) {		
				String strAcronym2 = null;
				Set<String> setAcronym2 = null;
				String strName2 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts')) {
					
					if(strAcronym2 == null) {
						strAcronym2 = u.COA_Acronym__c;
						setAcronym2 = new Set<String>();
						setAcronym2.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym2.contains(u.COA_Acronym__c)) {
							strAcronym2 = strAcronym2 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName2 == null) {
						strName2 = u.Name;
					} else {
						strName2 = strName2 + ', ' + u.Name;
					}

				}
				if(strAcronym2 != null && strName2 != null) {
					rfa.CM_Vending_Equipment_parts_FA_ACR__c = strAcronym2;
					rfa.CM_Vending_Equipment_parts_FA_Name__c = strName2;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('b. Vending Equipment parts');
				}//end of if(Final Approver);
				*/
			}
		}				
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('c. Incidental work')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work').size() > 0 
			) {		
				String strAcronym3 = null;
				Set<String> setAcronym3 = null;
				String strName3 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work')) {
					
					if(strAcronym3 == null) {
						strAcronym3 = u.COA_Acronym__c;
						setAcronym3 = new Set<String>();
						setAcronym3.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym3.contains(u.COA_Acronym__c)) {
							strAcronym3 = strAcronym3 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName3 == null) {
						strName3 = u.Name;
					} else {
						strName3 = strName3 + ', ' + u.Name;
					}

				}
				if(strAcronym3 != null && strName3 != null) {
					rfa.CM_Incidental_work_FA_ACR__c = strAcronym3;
					rfa.CM_Incidental_work_FA_Name__c = strName3;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);					
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('c. Incidental work');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('c. Incidental work')) {
			if(mapSelectedSubToFinalApproversByGroup.get('c. Incidental work') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('c. Incidental work').size() > 0 
			) {		
				String strAcronym3 = null;
				Set<String> setAcronym3 = null;
				String strName3 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('c. Incidental work')) {
					
					if(strAcronym3 == null) {
						strAcronym3 = u.COA_Acronym__c;
						setAcronym3 = new Set<String>();
						setAcronym3.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym3.contains(u.COA_Acronym__c)) {
							strAcronym3 = strAcronym3 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName3 == null) {
						strName3 = u.Name;
					} else {
						strName3 = strName3 + ', ' + u.Name;
					}

				}
				if(strAcronym3 != null && strName3 != null) {
					rfa.CM_Incidental_work_FA_ACR__c = strAcronym3;
					rfa.CM_Incidental_work_FA_Name__c = strName3;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('c. Incidental work');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('c. Incidental work')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('c. Incidental work');
				}//end of if(Final Approver);
				*/
			}
		}				
			
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('d. Vending Equipment Lease')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease').size() > 0 
			) {		
				String strAcronym4 = null;
				Set<String> setAcronym4 = null;
				String strName4 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease')) {
					
					if(strAcronym4 == null) {
						strAcronym4 = u.COA_Acronym__c;
						setAcronym4 = new Set<String>();
						setAcronym4.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym4.contains(u.COA_Acronym__c)) {
							strAcronym4 = strAcronym4 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName4 == null) {
						strName4 = u.Name;
					} else {
						strName4 = strName4 + ', ' + u.Name;
					}

				}
				if(strAcronym4 != null && strName4 != null) {
					rfa.CM_Vending_Equipment_Lease_FA_ACR__c = strAcronym4;
					rfa.CM_Vending_Equipment_Lease_FA_Name__c = strName4;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);					
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('d. Vending Equipment Lease');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('d. Vending Equipment Lease')) {
			if(mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease').size() > 0 
			) {		
				String strAcronym4 = null;
				Set<String> setAcronym4 = null;
				String strName4 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease')) {
					
					if(strAcronym4 == null) {
						strAcronym4 = u.COA_Acronym__c;
						setAcronym4 = new Set<String>();
						setAcronym4.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym4.contains(u.COA_Acronym__c)) {
							strAcronym4 = strAcronym4 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName4 == null) {
						strName4 = u.Name;
					} else {
						strName4 = strName4 + ', ' + u.Name;
					}

				}
				if(strAcronym4 != null && strName4 != null) {
					rfa.CM_Vending_Equipment_Lease_FA_ACR__c = strAcronym4;
					rfa.CM_Vending_Equipment_Lease_FA_Name__c = strName4;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('d. Vending Equipment Lease');
				}//end of if(Final Approver);
				*/
			}
		}					
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('e. Equipment retirement')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement').size() > 0 
			) {		
				String strAcronym5 = null;
				Set<String> setAcronym5 = null;
				String strName5 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement')) {
					
					if(strAcronym5 == null) {
						strAcronym5 = u.COA_Acronym__c;
						setAcronym5 = new Set<String>();
						setAcronym5.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym5.contains(u.COA_Acronym__c)) {
							strAcronym5 = strAcronym5 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName5 == null) {
						strName5 = u.Name;
					} else {
						strName5 = strName5 + ', ' + u.Name;
					}

				}
				if(strAcronym5 != null && strName5 != null) {
					rfa.CM_Equipment_retirement_FA_ACR__c = strAcronym5;
					rfa.CM_Equipment_retirement_FA_Name__c = strName5;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);					
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('e. Equipment retirement');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('e. Equipment retirement')) {
			if(mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement').size() > 0 
			) {		
				String strAcronym5 = null;
				Set<String> setAcronym5 = null;
				String strName5 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement')) {
					
					if(strAcronym5 == null) {
						strAcronym5 = u.COA_Acronym__c;
						setAcronym5 = new Set<String>();
						setAcronym5.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym5.contains(u.COA_Acronym__c)) {
							strAcronym5 = strAcronym5 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName5 == null) {
						strName5 = u.Name;
					} else {
						strName5 = strName5 + ', ' + u.Name;
					}

				}
				if(strAcronym5 != null && strName5 != null) {
					rfa.CM_Equipment_retirement_FA_ACR__c = strAcronym5;
					rfa.CM_Equipment_retirement_FA_Name__c = strName5;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB8)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB8);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);					
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('e. Equipment retirement');
				}//end of if(Final Approver);
				*/
			}
		}															
		
		system.debug('--------- listFinalApprovers almost finished: ' + listFinalApprovers );		
		
		String strFinalApproverAcronym = null;
		Set<String> setFinalApproverAcronym = null;
		String strFinalApproverName = null;
		
		if(listFinalApprovers != null && listFinalApprovers.size() > 0) {
			for(User u : listFinalApprovers) {
				if(strFinalApproverAcronym == null) {
					strFinalApproverAcronym = u.COA_Acronym__c;
					setFinalApproverAcronym = new Set<String>();
					setFinalApproverAcronym.add(u.COA_Acronym__c);
				} else {
					if(!setFinalApproverAcronym.contains(u.COA_Acronym__c)) {
						strFinalApproverAcronym = strFinalApproverAcronym + ', ' + u.COA_Acronym__c;
					}
				}
					
				if(strFinalApproverName == null) {
					strFinalApproverName = u.Name;
				} else {
					String previous = strFinalApproverName;
					strFinalApproverName = strFinalApproverName + ', ' + u.Name;
					if(strFinalApproverName.length() >= 255) {
						strFinalApproverName = previous;
					}					
				}				
			}			
		}	
		
		//Final Approvers from Group may not have Acronym! 	
		if(strFinalApproverAcronym != null || strFinalApproverName != null) {
			rfa.CM_FinalApprovalBy_ACR__c = strFinalApproverAcronym;
			rfa.CM_FinalApprovalBy_Name__c = strFinalApproverName;			
		}
				
	}//end of setupFinalApproverForEachCategory();
	
		
	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/
	public static void setupApproverRoutesOfAppendix3B8(List<RFA__c> listNewRFAs) {	
		
		for(RFA__c rfa : listNewRFAs) {
			//One To One mapping, example, 01. Contract unit price => Category A
			Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();

			//  example, L1/L2/..L13 => CEO, CFO, ...
			Map<String, Set<String>> mapSelectedLevelsToAcronymSet = new Map<String, Set<String>>();	
			//  example, L1/L2/..L13 => User 1, User 2, ...			
			Map<String, List<User>> mapSelectedLevelsToApproversByAcronym = new Map<String, List<User>>();
			
			Map<String, String> mapSelectedLevelsToGroup = new Map<String, String>();
			Map<String, List<User>> mapSelectedLevelsToApproversByGroup = new Map<String, List<User>>();					

			//get all Acronym for query Users, need to consider Gr.5 or special case, mapping needed
			Set<String> setAcronymOfAllApprovers = new Set<String>();
			
			//If only one Category is selected, have to follow the order even it is random
			Boolean onlyOneB8Category = containOnlyOneCategoryOfB8(rfa);
			Boolean ifRandomOrder = false;	
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory 
				= COA_Handler_Appendix_Helper_B8.getSelectedSubAndSubSubCategory(rfa);
			system.debug('------- mapSelectedSubToSubSubCategory: ' + mapSelectedSubToSubSubCategory);

			// ====== Step 2 ======	
			if(mapSelectedSubToSubSubCategory != null 
				&& mapSelectedSubToSubSubCategory.keySet() != null 
				&& mapSelectedSubToSubSubCategory.values() != null
				&& mapSelectedSubToSubSubCategory.keySet().size() > 0
				&& mapSelectedSubToSubSubCategory.values().size() > 0
			) {
				for(COA__c coa : 
					[					
						Select Id, 
						CM_Category__c, CM_PrimaryCOASubCategory__c, CM_Sub_Category__c, CM_Sub_sub_Category__c,	
						CM_Sub_Category_B8__c, CM_Sub_sub_Category_B8__c,
						
						CM_L1_1__c, CM_L1_2__c, CM_L1_Order__c, CM_L1_Mapping__c, CM_L1_Kizai__c,
						CM_L2_1__c, CM_L2_2__c, CM_L2_Order__c, CM_L2_Mapping__c, CM_L2_Kizai__c,
						CM_L3_1__c, CM_L3_2__c, CM_L3_Order__c, CM_L3_Mapping__c, CM_L3_Kizai__c,
						CM_L4_1__c, CM_L4_2__c, CM_L4_Order__c, CM_L4_Mapping__c, CM_L4_Kizai__c,
						CM_L5_1__c, CM_L5_2__c, CM_L5_3__c, CM_L5_4__c, CM_L5_5__c, 
						CM_L5_6__c, CM_L5_7__c, CM_L5_8__c, CM_L5_9__c, CM_L5_10__c, 
						CM_L5_Order__c, CM_L5_Mapping__c, CM_L5_Kizai__c,
						CM_L6_1__c, CM_L6_2__c, CM_L6_3__c, CM_L6_4__c, CM_L6_5__c, 
						CM_L6_6__c, CM_L6_7__c, CM_L6_8__c, CM_L6_9__c, CM_L6_10__c,
						CM_L6_Order__c,	CM_L6_Mapping__c, CM_L6_Kizai__c,											
						CM_L7_1__c, CM_L7_2__c, CM_L7_3__c, CM_L7_4__c, CM_L7_5__c, 
						CM_L7_6__c, CM_L7_7__c, CM_L7_8__c, CM_L7_9__c, CM_L7_10__c, 
						CM_L7_Order__c, CM_L7_Mapping__c, CM_L7_Kizai__c,
						CM_L8_1__c, CM_L8_2__c, CM_L8_3__c, CM_L8_4__c, CM_L8_5__c, 
						CM_L8_6__c, CM_L8_7__c, CM_L8_8__c, CM_L8_9__c, CM_L8_10__c,
						CM_L8_Order__c,	CM_L8_Mapping__c, CM_L8_Kizai__c,	
						CM_L9_1__c, CM_L9_2__c, CM_L9_3__c, CM_L9_4__c, CM_L9_5__c, 
						CM_L9_6__c, CM_L9_7__c, CM_L9_8__c, CM_L9_9__c, CM_L9_10__c,
						CM_L9_Order__c, CM_L9_Mapping__c, CM_L9_Kizai__c,							
						CM_L10_1__c, CM_L10_2__c, CM_L10_3__c, CM_L10_4__c, CM_L10_5__c, 
						CM_L10_6__c, CM_L10_7__c, CM_L10_8__c, CM_L10_9__c, CM_L10_10__c,
						CM_L10_Order__c, CM_L10_Mapping__c,	CM_L10_Kizai__c,							
						CM_L11_1__c, CM_L11_2__c, CM_L11_3__c, CM_L11_4__c, CM_L11_5__c, 
						CM_L11_6__c, CM_L11_7__c, CM_L11_8__c, CM_L11_9__c, CM_L11_10__c,
						CM_L11_Order__c, CM_L11_Mapping__c,	CM_L11_Kizai__c,												
						CM_L12_1__c, CM_L12_2__c, CM_L12_3__c, CM_L12_4__c, CM_L12_5__c, 
						CM_L12_6__c, CM_L12_7__c, CM_L12_8__c, CM_L12_9__c, CM_L12_10__c,
						CM_L12_Order__c, CM_L12_Mapping__c,	CM_L12_Kizai__c,												
						CM_L13_1__c, CM_L13_2__c, CM_L13_3__c, CM_L13_4__c, CM_L13_5__c, 
						CM_L13_6__c, CM_L13_7__c, CM_L13_8__c, CM_L13_9__c, CM_L13_10__c,
						CM_L13_Order__c, CM_L13_Mapping__c,	CM_L13_Kizai__c,																										
						
						CM_Approver_Final_Level__c, CM_Approver_Steps__c, CM_Approver_Random_Order__c
						from COA__c 
						where 
							RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
								RFA_Utility_Constants.COA_RTAPIName_Appendix3_B1ToB7WithB8
								)
							and 
							CM_PrimaryCOASubCategory__c =: rfa.CM_PrimaryCOASubCategory__c
							and
							CM_Sub_Category_B8__c IN: mapSelectedSubToSubSubCategory.keySet()
							and
							CM_Sub_sub_Category_B8__c IN: mapSelectedSubToSubSubCategory.values()
					]
				) {
					system.debug('-------- COA rule: ' + coa);
					
					// ====== Step 2.1 ======	
					if(onlyOneB8Category && coa.CM_Approver_Random_Order__c) {
						ifRandomOrder = true;
						
						
					} else {
						//  example, L1/L2/..L13 => CEO, CFO, ...
						mapSelectedLevelsToAcronymSet 
							= COA_Handler_Appendix_Helper_B8.getSelectedLevelsWithAcronyms(
								coa, 
								mapSelectedLevelsToAcronymSet
							);
						system.debug('------ mapSelectedLevelsToAcronymSet: ' + mapSelectedLevelsToAcronymSet);			
					
						// ====== Step 2.2 ======	
						mapSelectedLevelsToGroup 
							= COA_Handler_Appendix_Helper_B8.getSelectedLevelsWithGroup(
								coa, 
								mapSelectedLevelsToGroup
							);		
						system.debug('------ mapSelectedLevelsToGroup: ' + mapSelectedLevelsToGroup);	
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
										//mapping to L4
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
										//mapping to L4
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
										//mapping to L4
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
									}
									*/
								}
							}
						}							
				
					}//end of for(Users);
				}//end of if();
				
				
				system.debug('------ mapSelectedLevelsToApproversByAcronym: ' + mapSelectedLevelsToApproversByAcronym);	
				COA_Handler_Appendix_Helper_Utility.insertApproversByLevels(
					rfa, 
					mapSelectedLevelsToApproversByAcronym, 
					mapSelectedLevelsToApproversByGroup
				);	
				
				
		
			}//end of if();
			
						
		}//end of for(RFAs);
		
	}//setupApproverRoutesOfAppendix3B8(RFAs);	
	
	private static Boolean containOnlyOneCategoryOfB8(RFA__c rfa) {
		Integer count = 0;
		if(rfa.CM_Non_standard_Equipment__c != null) {
			count++;
		}	 
		if(rfa.CM_Vending_Equipment_parts__c != null) {
			count++;
		}	
		if(rfa.CM_Incidental_work__c != null) {
			count++;
		}	
		if(rfa.CM_Vending_Equipment_Lease__c != null) {
			count++;
		}	
		if(rfa.CM_Equipment_retirement__c != null){
			count++;
		}		
		
		if(count == 1) {
			return true;
		}
		return false;
	}		
	
	
	//loop all the approvers' fields to pick up the available Acronym
	public static Map<String, Set<String>> getSelectedLevelsWithAcronyms(
		COA__c coa, 
		Map<String, Set<String>> mapSelectedLevelsToAcronymSet
	) {
		if(coa.CM_L1_Kizai__c != null && !coa.CM_L1_Kizai__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L1') != null) {
				mapSelectedLevelsToAcronymSet.get('L1').add(coa.CM_L1_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L1', new Set<String>{coa.CM_L1_Kizai__c});
			}
		}			
		if(coa.CM_L1_1__c != null && !coa.CM_L1_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L1') != null) {
				mapSelectedLevelsToAcronymSet.get('L1').add(coa.CM_L1_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L1', new Set<String>{coa.CM_L1_1__c});
			}
		}			
		if(coa.CM_L1_2__c != null && !coa.CM_L1_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L1') != null) {
				mapSelectedLevelsToAcronymSet.get('L1').add(coa.CM_L1_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L1', new Set<String>{coa.CM_L1_2__c});
			}
		}	
							
		if(coa.CM_L2_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L2') != null) {
				mapSelectedLevelsToAcronymSet.get('L2').add(coa.CM_L2_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L2', new Set<String>{coa.CM_L2_Kizai__c});
			}
		}			
		if(coa.CM_L2_1__c != null && !coa.CM_L2_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L2') != null) {
				mapSelectedLevelsToAcronymSet.get('L2').add(coa.CM_L2_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L2', new Set<String>{coa.CM_L2_1__c});
			}
		}			
		if(coa.CM_L2_2__c != null && !coa.CM_L2_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L2') != null) {
				mapSelectedLevelsToAcronymSet.get('L2').add(coa.CM_L2_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L2', new Set<String>{coa.CM_L2_2__c});
			}
		}	
					
		if(coa.CM_L3_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_Kizai__c});
			}
		}	
		if(coa.CM_L3_1__c != null && !coa.CM_L3_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_1__c});
			}
		}			
		if(coa.CM_L3_2__c != null && !coa.CM_L3_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_2__c});
			}
		}					
		
		if(coa.CM_L4_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L4') != null) {
				mapSelectedLevelsToAcronymSet.get('L4').add(coa.CM_L4_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L4', new Set<String>{coa.CM_L4_Kizai__c});
			}
		}
		if(coa.CM_L4_1__c != null && !coa.CM_L4_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L4') != null) {
				mapSelectedLevelsToAcronymSet.get('L4').add(coa.CM_L4_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L4', new Set<String>{coa.CM_L4_1__c});
			}
		}			
		if(coa.CM_L4_2__c != null && !coa.CM_L4_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L4') != null) {
				mapSelectedLevelsToAcronymSet.get('L4').add(coa.CM_L4_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L4', new Set<String>{coa.CM_L4_2__c});
			}
		}									
	
		if(coa.CM_L5_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_Kizai__c});
			}
		}	
		if(coa.CM_L5_1__c != null && !coa.CM_L5_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_1__c});
			}
		}			
		if(coa.CM_L5_2__c != null && !coa.CM_L5_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_2__c});
			}
		}	
		if(coa.CM_L5_3__c != null && !coa.CM_L5_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_3__c});
			}
		}				
		if(coa.CM_L5_4__c != null && !coa.CM_L5_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_4__c});
			}
		}			
		if(coa.CM_L5_5__c != null && !coa.CM_L5_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_5__c});
			}
		}			
		if(coa.CM_L5_6__c != null && !coa.CM_L5_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_6__c});
			}
		}				
		if(coa.CM_L5_7__c != null && !coa.CM_L5_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_7__c});
			}
		}	
		if(coa.CM_L5_8__c != null && !coa.CM_L5_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_8__c});
			}
		}			
		if(coa.CM_L5_9__c != null && !coa.CM_L5_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_9__c});
			}
		}			
		if(coa.CM_L5_10__c != null && !coa.CM_L5_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_10__c});
			}
		}							
															
		if(coa.CM_L6_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_Kizai__c});
			}
		}		
		if(coa.CM_L6_1__c != null && !coa.CM_L6_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_1__c});
			}
		}			
		if(coa.CM_L6_2__c != null && !coa.CM_L6_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_2__c});
			}
		}	
		if(coa.CM_L6_3__c != null && !coa.CM_L6_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_3__c});
			}
		}				
		if(coa.CM_L6_4__c != null && !coa.CM_L6_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_4__c});
			}
		}			
		if(coa.CM_L6_5__c != null && !coa.CM_L6_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_5__c});
			}
		}			
		if(coa.CM_L6_6__c != null && !coa.CM_L6_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_6__c});
			}
		}			
		if(coa.CM_L6_7__c != null && !coa.CM_L6_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_7__c});
			}
		}	
		if(coa.CM_L6_8__c != null && !coa.CM_L6_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_8__c});
			}
		}			
		if(coa.CM_L6_9__c != null && !coa.CM_L6_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_9__c});
			}
		}				
		if(coa.CM_L6_10__c != null && !coa.CM_L6_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_10__c});
			}
		}							
			
		if(coa.CM_L7_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_Kizai__c});
			}
		}	
		if(coa.CM_L7_1__c != null && !coa.CM_L7_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_1__c});
			}
		}			
		if(coa.CM_L7_2__c != null && !coa.CM_L7_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_2__c});
			}
		}	
		if(coa.CM_L7_3__c != null && !coa.CM_L7_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_3__c});
			}
		}				
		if(coa.CM_L7_4__c != null && !coa.CM_L7_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_4__c});
			}
		}			
		if(coa.CM_L7_5__c != null && !coa.CM_L7_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_5__c});
			}
		}		
		if(coa.CM_L7_6__c != null && !coa.CM_L7_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_6__c});
			}
		}			
		if(coa.CM_L7_7__c != null && !coa.CM_L7_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_7__c});
			}
		}	
		if(coa.CM_L7_8__c != null && !coa.CM_L7_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_8__c});
			}
		}			
		if(coa.CM_L7_9__c != null && !coa.CM_L7_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_9__c});
			}
		}			
		if(coa.CM_L7_10__c != null && !coa.CM_L7_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_10__c});
			}
		}																					

		if(coa.CM_L8_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_Kizai__c});
			}
		}	
		if(coa.CM_L8_1__c != null && !coa.CM_L8_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_1__c});
			}
		}			
		if(coa.CM_L8_2__c != null && !coa.CM_L8_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_2__c});
			}
		}	
		if(coa.CM_L8_3__c != null && !coa.CM_L8_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_3__c});
			}
		}			
		if(coa.CM_L8_4__c != null && !coa.CM_L8_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_4__c});
			}
		}				
		if(coa.CM_L8_5__c != null && !coa.CM_L8_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_5__c});
			}
		}		
		if(coa.CM_L8_6__c != null && !coa.CM_L8_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_6__c});
			}
		}			
		if(coa.CM_L8_7__c != null && !coa.CM_L8_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_7__c});
			}
		}	
		if(coa.CM_L8_8__c != null && !coa.CM_L8_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_8__c});
			}
		}			
		if(coa.CM_L8_9__c != null && !coa.CM_L8_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_9__c});
			}
		}				
		if(coa.CM_L8_10__c != null && !coa.CM_L8_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_10__c});
			}
		}																							

		if(coa.CM_L9_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_Kizai__c});
			}
		}				
		if(coa.CM_L9_1__c != null && !coa.CM_L9_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_1__c});
			}
		}				
		if(coa.CM_L9_2__c != null && !coa.CM_L9_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_2__c});
			}
		}
		if(coa.CM_L9_3__c != null && !coa.CM_L9_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_3__c});
			}
		}		
		if(coa.CM_L9_4__c != null && !coa.CM_L9_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_4__c});
			}
		}			
		if(coa.CM_L9_5__c != null && !coa.CM_L9_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_5__c});
			}
		}	
		if(coa.CM_L9_6__c != null && !coa.CM_L9_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_6__c});
			}
		}			
		if(coa.CM_L9_7__c != null && !coa.CM_L9_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_7__c});
			}
		}
		if(coa.CM_L9_8__c != null && !coa.CM_L9_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_8__c});
			}
		}		
		if(coa.CM_L9_9__c != null && !coa.CM_L9_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_9__c});
			}
		}		
		if(coa.CM_L9_10__c != null && !coa.CM_L9_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_10__c});
			}
		}			
																	
		if(coa.CM_L10_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_Kizai__c});
			}
		}
		if(coa.CM_L10_1__c != null && !coa.CM_L10_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_1__c});
			}
		}		
		if(coa.CM_L10_2__c != null && !coa.CM_L10_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_2__c});
			}
		}	
		if(coa.CM_L10_3__c != null && !coa.CM_L10_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_3__c});
			}
		}			
		if(coa.CM_L10_4__c != null && !coa.CM_L10_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_4__c});
			}
		}			
		if(coa.CM_L10_5__c != null && !coa.CM_L10_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_5__c});
			}
		}			
		if(coa.CM_L10_6__c != null && !coa.CM_L10_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_6__c});
			}
		}			
		if(coa.CM_L10_7__c != null && !coa.CM_L10_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_7__c});
			}
		}	
		if(coa.CM_L10_8__c != null && !coa.CM_L10_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_8__c});
			}
		}				
		if(coa.CM_L10_9__c != null && !coa.CM_L10_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_9__c});
			}
		}				
		if(coa.CM_L10_10__c != null && !coa.CM_L10_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_10__c});
			}
		}																						

		if(coa.CM_L11_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_Kizai__c});
			}
		}		
		if(coa.CM_L11_1__c != null && !coa.CM_L11_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_1__c});
			}
		}			
		if(coa.CM_L11_2__c != null && !coa.CM_L11_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_2__c});
			}
		}		
		if(coa.CM_L11_3__c != null && !coa.CM_L11_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_3__c});
			}
		}					
		if(coa.CM_L11_4__c != null && !coa.CM_L11_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_4__c});
			}
		}				
		if(coa.CM_L11_5__c != null && !coa.CM_L11_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_5__c});
			}
		}			
		if(coa.CM_L11_6__c != null && !coa.CM_L11_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_6__c});
			}
		}					
		if(coa.CM_L11_7__c != null && !coa.CM_L11_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_7__c});
			}
		}		
		if(coa.CM_L11_8__c != null && !coa.CM_L11_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_8__c});
			}
		}				
		if(coa.CM_L11_9__c != null && !coa.CM_L11_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_9__c});
			}
		}					
		if(coa.CM_L11_10__c != null && !coa.CM_L11_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_10__c});
			}
		}							
																
		if(coa.CM_L12_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_Kizai__c});
			}
		}		
		if(coa.CM_L12_1__c != null && !coa.CM_L12_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_1__c});
			}
		}				
		if(coa.CM_L12_2__c != null && !coa.CM_L12_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_2__c});
			}
		}	
		if(coa.CM_L12_3__c != null && !coa.CM_L12_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_3__c});
			}
		}				
		if(coa.CM_L12_4__c != null && !coa.CM_L12_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_4__c});
			}
		}				
		if(coa.CM_L12_5__c != null && !coa.CM_L12_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_5__c});
			}
		}		
		if(coa.CM_L12_6__c != null && !coa.CM_L12_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_6__c});
			}
		}			
		if(coa.CM_L12_7__c != null && !coa.CM_L12_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_7__c});
			}
		}	
		if(coa.CM_L12_8__c != null && !coa.CM_L12_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_8__c});
			}
		}				
		if(coa.CM_L12_9__c != null && !coa.CM_L12_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_9__c});
			}
		}			
		if(coa.CM_L12_10__c != null && !coa.CM_L12_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_10__c});
			}
		}																				

		if(coa.CM_L13_Kizai__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_Kizai__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_Kizai__c});
			}
		}	
		if(coa.CM_L13_1__c != null && !coa.CM_L13_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_1__c});
			}
		}			
		if(coa.CM_L13_2__c != null && !coa.CM_L13_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_2__c});
			}
		}	
		if(coa.CM_L13_3__c != null && !coa.CM_L13_3__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_3__c});
			}
		}			
		if(coa.CM_L13_4__c != null && !coa.CM_L13_4__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_4__c});
			}
		}				
		if(coa.CM_L13_5__c != null && !coa.CM_L13_5__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_5__c});
			}
		}			
		if(coa.CM_L13_6__c != null && !coa.CM_L13_6__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_6__c});
			}
		}			
		if(coa.CM_L13_7__c != null && !coa.CM_L13_7__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_7__c});
			}
		}	
		if(coa.CM_L13_8__c != null && !coa.CM_L13_8__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_8__c});
			}
		}			
		if(coa.CM_L13_9__c != null && !coa.CM_L13_9__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_9__c});
			}
		}			
		if(coa.CM_L13_10__c != null && !coa.CM_L13_10__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_10__c});
			}
		}							
																			
		return mapSelectedLevelsToAcronymSet;
	}//end of getSelectedLevelsWithAcronyms();
		
	
	
	public static Map<String, String> getSelectedLevelsWithGroup(
		COA__c coa, 
		Map<String, String> mapSelectedLevelsToGroup
	) {
		if(coa.CM_L1_Kizai__c != null && coa.CM_L1_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L1', coa.CM_L1_Kizai__c);
		}
		if(coa.CM_L1_1__c != null && coa.CM_L1_1__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L1', coa.CM_L1_1__c);
		} else if(coa.CM_L1_2__c != null && coa.CM_L1_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L1', coa.CM_L1_2__c);		
		}		
		
		if(coa.CM_L2_Kizai__c != null && coa.CM_L2_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L2', coa.CM_L2_Kizai__c);
		}
		if(coa.CM_L2_1__c != null && coa.CM_L2_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L2', coa.CM_L2_1__c);
		} else if(coa.CM_L2_2__c != null && coa.CM_L2_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L2', coa.CM_L2_2__c);
		}			
		
		if(coa.CM_L3_Kizai__c != null && coa.CM_L3_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L3', coa.CM_L3_Kizai__c);
		}	
		if(coa.CM_L3_1__c != null && coa.CM_L3_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L3', coa.CM_L3_1__c);
		} else if(coa.CM_L3_2__c != null && coa.CM_L3_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L3', coa.CM_L3_2__c);
		}			
		
		if(coa.CM_L4_Kizai__c != null && coa.CM_L4_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L4', coa.CM_L4_Kizai__c);
		}
		if(coa.CM_L4_1__c != null && coa.CM_L4_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L4', coa.CM_L4_1__c);
		} else if(coa.CM_L4_2__c != null && coa.CM_L4_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L4', coa.CM_L4_2__c);
		}			
		
		if(coa.CM_L5_Kizai__c != null && coa.CM_L5_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_Kizai__c);
		}
		if(coa.CM_L5_1__c != null && coa.CM_L5_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_1__c);
		} else if(coa.CM_L5_2__c != null && coa.CM_L5_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_2__c);
		} else if(coa.CM_L5_3__c != null && coa.CM_L5_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_3__c);
		} else if(coa.CM_L5_4__c != null && coa.CM_L5_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_4__c);
		} else if(coa.CM_L5_5__c != null && coa.CM_L5_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_5__c);
		} else if(coa.CM_L5_6__c != null && coa.CM_L5_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_6__c);
		} else if(coa.CM_L5_7__c != null && coa.CM_L5_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_7__c);
		} else if(coa.CM_L5_8__c != null && coa.CM_L5_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_8__c);
		} else if(coa.CM_L5_9__c != null && coa.CM_L5_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_9__c);
		} else if(coa.CM_L5_10__c != null && coa.CM_L5_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L5', coa.CM_L5_10__c);
		}			
				
		if(coa.CM_L6_Kizai__c != null && coa.CM_L6_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_Kizai__c);
		}
		if(coa.CM_L6_1__c != null && coa.CM_L6_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_1__c);
		} else if(coa.CM_L6_2__c != null && coa.CM_L6_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_2__c);
		} else if(coa.CM_L6_3__c != null && coa.CM_L6_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_3__c);
		} else if(coa.CM_L6_4__c != null && coa.CM_L6_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_4__c);
		} else if(coa.CM_L6_5__c != null && coa.CM_L6_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_5__c);
		} else if(coa.CM_L6_6__c != null && coa.CM_L6_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_6__c);
		} else if(coa.CM_L6_7__c != null && coa.CM_L6_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_7__c);
		} else if(coa.CM_L6_8__c != null && coa.CM_L6_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_8__c);
		} else if(coa.CM_L6_9__c != null && coa.CM_L6_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_9__c);
		} else if(coa.CM_L6_10__c != null && coa.CM_L6_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L6', coa.CM_L6_10__c);
		}			
			
		if(coa.CM_L7_Kizai__c != null && coa.CM_L7_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_Kizai__c);
		}	
		if(coa.CM_L7_1__c != null && coa.CM_L7_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_1__c);
		} else if(coa.CM_L7_2__c != null && coa.CM_L7_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_2__c);
		} else if(coa.CM_L7_3__c != null && coa.CM_L7_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_3__c);
		} else if(coa.CM_L7_4__c != null && coa.CM_L7_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_4__c);
		} else if(coa.CM_L7_5__c != null && coa.CM_L7_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_5__c);
		} else if(coa.CM_L7_6__c != null && coa.CM_L7_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_6__c);
		} else if(coa.CM_L7_7__c != null && coa.CM_L7_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_7__c);
		} else if(coa.CM_L7_8__c != null && coa.CM_L7_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_8__c);
		} else if(coa.CM_L7_9__c != null && coa.CM_L7_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_9__c);
		} else if(coa.CM_L7_10__c != null && coa.CM_L7_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L7', coa.CM_L7_10__c);
		}				
			
		if(coa.CM_L8_Kizai__c != null && coa.CM_L8_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_Kizai__c);
		}	
		if(coa.CM_L8_1__c != null && coa.CM_L8_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_1__c);
		} else if(coa.CM_L8_2__c != null && coa.CM_L8_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_2__c);
		} else if(coa.CM_L8_3__c != null && coa.CM_L8_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_3__c);
		} else if(coa.CM_L8_4__c != null && coa.CM_L8_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_4__c);
		} else if(coa.CM_L8_5__c != null && coa.CM_L8_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_5__c);
		} else if(coa.CM_L8_6__c != null && coa.CM_L8_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_6__c);
		} else if(coa.CM_L8_7__c != null && coa.CM_L8_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_7__c);
		} else if(coa.CM_L8_8__c != null && coa.CM_L8_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_8__c);
		} else if(coa.CM_L8_9__c != null && coa.CM_L8_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_9__c);
		} else if(coa.CM_L8_10__c != null && coa.CM_L8_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L8', coa.CM_L8_10__c);
		}				
			
		if(coa.CM_L9_Kizai__c != null && coa.CM_L9_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_Kizai__c);
		}	
		if(coa.CM_L9_1__c != null && coa.CM_L9_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_1__c);
		} else if(coa.CM_L9_2__c != null && coa.CM_L9_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_2__c);
		} else if(coa.CM_L9_3__c != null && coa.CM_L9_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_3__c);
		} else if(coa.CM_L9_4__c != null && coa.CM_L9_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_4__c);
		} else if(coa.CM_L9_5__c != null && coa.CM_L9_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_5__c);
		} else if(coa.CM_L9_6__c != null && coa.CM_L9_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_6__c);
		} else if(coa.CM_L9_7__c != null && coa.CM_L9_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_7__c);
		} else if(coa.CM_L9_8__c != null && coa.CM_L9_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_8__c);
		} else if(coa.CM_L9_9__c != null && coa.CM_L9_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_9__c);
		} else if(coa.CM_L9_10__c != null && coa.CM_L9_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L9', coa.CM_L9_10__c);
		}					
			
		if(coa.CM_L10_Kizai__c != null && coa.CM_L10_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_Kizai__c);
		}	
		if(coa.CM_L10_1__c != null && coa.CM_L10_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_1__c);
		} else if(coa.CM_L10_2__c != null && coa.CM_L10_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_2__c);
		} else if(coa.CM_L10_3__c != null && coa.CM_L10_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_3__c);
		} else if(coa.CM_L10_4__c != null && coa.CM_L10_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_4__c);
		} else if(coa.CM_L10_5__c != null && coa.CM_L10_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_5__c);
		} else if(coa.CM_L10_6__c != null && coa.CM_L10_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_6__c);
		} else if(coa.CM_L10_7__c != null && coa.CM_L10_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_7__c);
		} else if(coa.CM_L10_8__c != null && coa.CM_L10_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_8__c);
		} else if(coa.CM_L10_9__c != null && coa.CM_L10_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_9__c);
		} else if(coa.CM_L10_10__c != null && coa.CM_L10_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L10', coa.CM_L10_10__c);
		}				
		
		if(coa.CM_L11_Kizai__c != null && coa.CM_L11_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_Kizai__c);
		}	
		if(coa.CM_L11_1__c != null && coa.CM_L11_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_1__c);
		} else if(coa.CM_L11_2__c != null && coa.CM_L11_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_2__c);
		} else if(coa.CM_L11_3__c != null && coa.CM_L11_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_3__c);
		} else if(coa.CM_L11_4__c != null && coa.CM_L11_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_4__c);
		} else if(coa.CM_L11_5__c != null && coa.CM_L11_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_5__c);
		} else if(coa.CM_L11_6__c != null && coa.CM_L11_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_6__c);
		} else if(coa.CM_L11_7__c != null && coa.CM_L11_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_7__c);
		} else if(coa.CM_L11_8__c != null && coa.CM_L11_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_8__c);
		} else if(coa.CM_L11_9__c != null && coa.CM_L11_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_9__c);
		} else if(coa.CM_L11_10__c != null && coa.CM_L11_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L11', coa.CM_L11_10__c);
		}				
		
		if(coa.CM_L12_Kizai__c != null && coa.CM_L12_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_Kizai__c);
		}	
		if(coa.CM_L12_1__c != null && coa.CM_L12_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_1__c);
		} else if(coa.CM_L12_2__c != null && coa.CM_L12_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_2__c);
		} else if(coa.CM_L12_3__c != null && coa.CM_L12_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_3__c);
		} else if(coa.CM_L12_4__c != null && coa.CM_L12_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_4__c);
		} else if(coa.CM_L12_5__c != null && coa.CM_L12_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_5__c);
		} else if(coa.CM_L12_6__c != null && coa.CM_L12_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_6__c);
		} else if(coa.CM_L12_7__c != null && coa.CM_L12_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_7__c);
		} else if(coa.CM_L12_8__c != null && coa.CM_L12_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_8__c);
		} else if(coa.CM_L12_9__c != null && coa.CM_L12_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_9__c);
		} else if(coa.CM_L12_10__c != null && coa.CM_L12_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L12', coa.CM_L12_10__c);
		}				
		
		if(coa.CM_L13_Kizai__c != null && coa.CM_L13_Kizai__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_Kizai__c);
		}	
		if(coa.CM_L13_1__c != null && coa.CM_L13_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_1__c);
		} else if(coa.CM_L13_2__c != null && coa.CM_L13_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_2__c);
		} else if(coa.CM_L13_3__c != null && coa.CM_L13_3__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_3__c);
		} else if(coa.CM_L13_4__c != null && coa.CM_L13_4__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_4__c);
		} else if(coa.CM_L13_5__c != null && coa.CM_L13_5__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_5__c);
		} else if(coa.CM_L13_6__c != null && coa.CM_L13_6__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_6__c);
		} else if(coa.CM_L13_7__c != null && coa.CM_L13_7__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_7__c);
		} else if(coa.CM_L13_8__c != null && coa.CM_L13_8__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_8__c);
		} else if(coa.CM_L13_9__c != null && coa.CM_L13_9__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_9__c);
		} else if(coa.CM_L13_10__c != null && coa.CM_L13_10__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L13', coa.CM_L13_10__c);
		}						
																					
		return mapSelectedLevelsToGroup;
	}//end of getSelectedLevelsWithGroup();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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