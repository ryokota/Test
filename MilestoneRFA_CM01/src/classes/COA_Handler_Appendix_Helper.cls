/*
	In the before & insert trigger, it will decide Final Approvers for each Category
	In the after & insert trigger, it will decide Approvers of each Level, from L13 to L1
	the direction two processes is different
	
	challenges in one COA rule are:
	1. random order
	2. user mapping
	
	challenges in same Category are:
	1. combine multipule COA rules
	
	challenges in different Categories are:
	1. combine COA rules in different Categories, determine Approval Route	

*/
public with sharing class COA_Handler_Appendix_Helper {


	/*
		============ isBefore & isInsert ============ 
	*/
	/*
		for Appendix 3 B.1 - B.7, setting up the Final Approver for each category in the interface
	*/
	public static void setupFinalApproverOfAppendix3B1ToB7(List<RFA__c> listNewRFAs) {
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
			String strFinalApproverCategoryB1ToB7 = null; //CM_Sub_Category__c
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory 
				= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubAndSubSubCategory(rfa);
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
					system.debug('-------- COA rule: ' + coa);
					
					//Get the Final Approver's Category based on Levels, such as, 01. Contract unit price,...
					if(strFinalApproverLevel == null) {
						strFinalApproverLevel = coa.CM_Approver_Final_Level__c;
						strFinalApproverCategoryB1ToB7 = coa.CM_Sub_Category__c;
					} else {
						if(Utility_Helper_String.ifNewLevelHigherThanOldLevel(coa.CM_Approver_Final_Level__c, strFinalApproverLevel)) {
							strFinalApproverLevel = coa.CM_Approver_Final_Level__c;
							strFinalApproverCategoryB1ToB7 = coa.CM_Sub_Category__c;							
						}
					}
					
					//Don't need to consider Approver Random Order in Before Insert
					//Since we only need to know the Final Approver here, not the whole route
					mapSelectedSubCategoryToFinalAcronymSet 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubCategoryWithFinalAcronyms(
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
				
				if(mapSelectedSubToFinalApproversByAcronym != null 
					|| mapSelectedSubToFinalApproversByGroup != null
					//&& mapSelectedSubToFinalApproversByAcronym.keySet() != null 
					//&& mapSelectedSubToFinalApproversByAcronym.values() != null
					//&& mapSelectedSubToFinalApproversByAcronym.keySet().size() > 0
					//&& mapSelectedSubToFinalApproversByAcronym.values().size() > 0
				) {
					COA_Handler_Appendix_Helper.setupFinalApproverForEachCategory(
						rfa, 
						mapSelectedSubToFinalApproversByAcronym, 
						mapSelectedSubToFinalApproversByGroup,
						strFinalApproverCategoryB1ToB7
					); 
				}						
			}//end of if();									
		}//end of for(RFAs);
	}//end of setupFinalApproverOfAppendix3B1ToB7(RFAs);	


	
	/*
		Set up the Final Approver in Before Insert on the interface
		Acronym or Gr. can not be in the same Category of B.1 - B.7.
		Link to each specific Final Approver field, such as, 01. Final Approver, ... 10. Final Approver
	*/		
	public static void setupFinalApproverForEachCategory(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedSubToFinalApproversByAcronym,
		Map<String, List<User>> mapSelectedSubToFinalApproversByGroup,
		String strFinalApproverCategoryB1ToB7
	) {
		system.debug('-------- setupFinalApproverForEachCategory(): From Acronym: ' + mapSelectedSubToFinalApproversByAcronym 
			+ ' From Group: ' + mapSelectedSubToFinalApproversByGroup + '  strFinalApproverCategoryB1ToB7: ' + strFinalApproverCategoryB1ToB7);
		List<User> listFinalApprovers = null;
				
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('01. Contract unit price')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('01. Contract unit price') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('01. Contract unit price').size() > 0 
			) {				
				
				String strAcronym1 = null;
				Set<String> setAcronym1 = null;
				String strName1 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('01. Contract unit price')) {
					
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
					rfa.CM_Contract_unit_price_FA_ACR__c = strAcronym1;
					rfa.CM_Contract_unit_price_FA_Name__c = strName1;
				}
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				system.debug('---------- listFinalApprovers: ' + listFinalApprovers);		
				//listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('01. Contract unit price');
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('01. Contract unit price')) {
			if(mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price').size() > 0 
			) {				
				system.debug('------ Group: 01. Contract unit price: Approvers: ' 
					+ mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price'));
					
				String strAcronym1 = null;
				Set<String> setAcronym1 = null;
				String strName1 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price')) {
					
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
					rfa.CM_Contract_unit_price_FA_ACR__c = strAcronym1;
					rfa.CM_Contract_unit_price_FA_Name__c = strName1;
				}
				system.debug('--------- Group 01 after input acr: ' + rfa.CM_Contract_unit_price_FA_ACR__c );
				system.debug('--------- Group 01 after input name:' + rfa.CM_Contract_unit_price_FA_Name__c );				
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}				
						
				//listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('01. Contract unit price');
				//system.debug('------ Group 01: listFinalApprovers: ' + listFinalApprovers);
			}
		}	
				
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('02. Special price / Promotion discount')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount').size() > 0 
			) {		
				String strAcronym2 = null;
				Set<String> setAcronym2 = null;
				String strName2 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount')) {
					
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
					rfa.CM_SpecialPricePromotionDiscount_FA_ACR__c = strAcronym2;
					rfa.CM_SpecialPricePromotionDiscount_FA_Name__c = strName2;
				}	
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}
				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('02. Special price / Promotion discount');
				}//end of if(Final Approver);
				*/
				
				
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('02. Special price / Promotion discount')) {
			if(mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount').size() > 0 
			) {		
				String strAcronym2 = null;
				Set<String> setAcronym2 = null;
				String strName2 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount')) {
					
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
					rfa.CM_SpecialPricePromotionDiscount_FA_ACR__c = strAcronym2;
					rfa.CM_SpecialPricePromotionDiscount_FA_Name__c = strName2;
				}								
						
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}					
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('02. Special price / Promotion discount');
				}//end of if(Final Approver);
				*/
			}
		}				
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('03. FS selling price')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price').size() > 0 
			) {		
				String strAcronym3 = null;
				Set<String> setAcronym3 = null;
				String strName3 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price')) {
					
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
					rfa.CM_FS_selling_price_FA_ACR__c = strAcronym3;
					rfa.CM_FS_selling_price_FA_Name__c = strName3;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('03. FS selling price');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('03. FS selling price')) {
			if(mapSelectedSubToFinalApproversByGroup.get('03. FS selling price') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('03. FS selling price').size() > 0 
			) {		
				String strAcronym3 = null;
				Set<String> setAcronym3 = null;
				String strName3 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('03. FS selling price')) {
					
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
					rfa.CM_FS_selling_price_FA_ACR__c = strAcronym3;
					rfa.CM_FS_selling_price_FA_Name__c = strName3;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}			
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('03. FS selling price');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('03. FS selling price')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('03. FS selling price');
				}//end of if(Final Approver);
				*/
			}
		}				
			
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('04. FS commission (Variable)')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)').size() > 0 
			) {		
				String strAcronym4 = null;
				Set<String> setAcronym4 = null;
				String strName4 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)')) {
					
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
					rfa.CM_FS_Commission_Variable_FA_ACR__c = strAcronym4;
					rfa.CM_FS_Commission_Variable_FA_Name__c = strName4;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('04. FS commission (Variable)');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('04. FS commission (Variable)')) {
			if(mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)').size() > 0 
			) {		
				String strAcronym4 = null;
				Set<String> setAcronym4 = null;
				String strName4 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)')) {
					
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
					rfa.CM_FS_Commission_Variable_FA_ACR__c = strAcronym4;
					rfa.CM_FS_Commission_Variable_FA_Name__c = strName4;
				}								

				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('04. FS commission (Variable)');
				}//end of if(Final Approver);
				*/
			}
		}					
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('05. FS commission (Fixed)')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)').size() > 0 
			) {		
				String strAcronym5 = null;
				Set<String> setAcronym5 = null;
				String strName5 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)')) {
					
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
					rfa.CM_FS_Commission_Fixed_FA_ACR__c = strAcronym5;
					rfa.CM_FS_Commission_Fixed_FA_Name__c = strName5;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('05. FS commission (Fixed)');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('05. FS commission (Fixed)')) {
			if(mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)').size() > 0 
			) {		
				String strAcronym5 = null;
				Set<String> setAcronym5 = null;
				String strName5 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)')) {
					
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
					rfa.CM_FS_Commission_Fixed_FA_ACR__c = strAcronym5;
					rfa.CM_FS_Commission_Fixed_FA_Name__c = strName5;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}			
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('05. FS commission (Fixed)');
				}//end of if(Final Approver);
				*/
			}
		}															

		if(mapSelectedSubToFinalApproversByAcronym.containsKey('06. Key money / Rebate / Spot / Other')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other').size() > 0 
			) {		
				String strAcronym6 = null;
				Set<String> setAcronym6 = null;
				String strName6 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other')) {
					
					if(strAcronym6 == null) {
						strAcronym6 = u.COA_Acronym__c;
						setAcronym6 = new Set<String>();
						setAcronym6.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym6.contains(u.COA_Acronym__c)) {
							strAcronym6 = strAcronym6 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName6 == null) {
						strName6 = u.Name;
					} else {
						strName6 = strName6 + ', ' + u.Name;
					}

				}
				if(strAcronym6 != null && strName6 != null) {
					rfa.CM_KeyMoney_Rebate_Sport_Other_FA_ACR__c = strAcronym6;
					rfa.CM_KeyMoney_Rebate_Sport_Other_FA_Name__c = strName6;
				}								

				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('06. Key money / Rebate / Spot / Other');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('06. Key money / Rebate / Spot / Other')) {
			if(mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other').size() > 0 
			) {		
				String strAcronym6 = null;
				Set<String> setAcronym6 = null;
				String strName6 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other')) {
					
					if(strAcronym6 == null) {
						strAcronym6 = u.COA_Acronym__c;
						setAcronym6 = new Set<String>();
						setAcronym6.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym6.contains(u.COA_Acronym__c)) {
							strAcronym6 = strAcronym6 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName6 == null) {
						strName6 = u.Name;
					} else {
						strName6 = strName6 + ', ' + u.Name;
					}

				}
				if(strAcronym6 != null && strName6 != null) {
					rfa.CM_KeyMoney_Rebate_Sport_Other_FA_ACR__c = strAcronym6;
					rfa.CM_KeyMoney_Rebate_Sport_Other_FA_Name__c = strName6;
				}								

				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('06. Key money / Rebate / Spot / Other');
				}//end of if(Final Approver);
				*/
			}
		}										
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('07. Only in the case of Rebate')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate').size() > 0 
			) {		
				String strAcronym7 = null;
				Set<String> setAcronym7 = null;
				String strName7 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate')) {
					
					if(strAcronym7 == null) {
						strAcronym7 = u.COA_Acronym__c;
						setAcronym7 = new Set<String>();
						setAcronym7.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym7.contains(u.COA_Acronym__c)) {
							strAcronym7 = strAcronym7 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName7 == null) {
						strName7 = u.Name;
					} else {
						strName7 = strName7 + ', ' + u.Name;
					}

				}
				if(strAcronym7 != null && strName7 != null) {
					rfa.CM_Only_in_the_case_of_Rebate_FA_ACR__c = strAcronym7;
					rfa.CM_Only_in_the_case_of_Rebate_FA_Name__c = strName7;
				}								

				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('07. Only in the case of Rebate');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('07. Only in the case of Rebate')) {
			if(mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate').size() > 0 
			) {		
				String strAcronym7 = null;
				Set<String> setAcronym7 = null;
				String strName7 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate')) {
					
					if(strAcronym7 == null) {
						strAcronym7 = u.COA_Acronym__c;
						setAcronym7 = new Set<String>();
						setAcronym7.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym7.contains(u.COA_Acronym__c)) {
							strAcronym7 = strAcronym7 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName7 == null) {
						strName7 = u.Name;
					} else {
						strName7 = strName7 + ', ' + u.Name;
					}

				}
				if(strAcronym7 != null && strName7 != null) {
					rfa.CM_Only_in_the_case_of_Rebate_FA_ACR__c = strAcronym7;
					rfa.CM_Only_in_the_case_of_Rebate_FA_Name__c = strName7;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}			
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('07. Only in the case of Rebate');
				}//end of if(Final Approver);
				*/
			}
		}										

		if(mapSelectedSubToFinalApproversByAcronym.containsKey('08. Other support')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('08. Other support') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('08. Other support').size() > 0 
			) {		
				String strAcronym8 = null;
				Set<String> setAcronym8 = null;
				String strName8 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('08. Other support')) {
					
					if(strAcronym8 == null) {
						strAcronym8 = u.COA_Acronym__c;
						setAcronym8 = new Set<String>();
						setAcronym8.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym8.contains(u.COA_Acronym__c)) {
							strAcronym8 = strAcronym8 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName8 == null) {
						strName8 = u.Name;
					} else {
						strName8 = strName8 + ', ' + u.Name;
					}

				}
				if(strAcronym8 != null && strName8 != null) {
					rfa.CM_Other_support_FA_ACR__c = strAcronym8;
					rfa.CM_Other_support_FA_Name__c = strName8;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('08. Other support');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('08. Other support')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('08. Other support');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('08. Other support')) {
			if(mapSelectedSubToFinalApproversByGroup.get('08. Other support') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('08. Other support').size() > 0 
			) {		
				String strAcronym8 = null;
				Set<String> setAcronym8 = null;
				String strName8 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('08. Other support')) {
					
					if(strAcronym8 == null) {
						strAcronym8 = u.COA_Acronym__c;
						setAcronym8 = new Set<String>();
						setAcronym8.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym8.contains(u.COA_Acronym__c)) {
							strAcronym8 = strAcronym8 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName8 == null) {
						strName8 = u.Name;
					} else {
						strName8 = strName8 + ', ' + u.Name;
					}

				}
				if(strAcronym8 != null && strName8 != null) {
					rfa.CM_Other_support_FA_ACR__c = strAcronym8;
					rfa.CM_Other_support_FA_Name__c = strName8;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('08. Other support');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('08. Other support')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('08. Other support');
				}//end of if(Final Approver);
				*/
			}
		}												
		
		if(mapSelectedSubToFinalApproversByAcronym.containsKey('09. Promotion / Other expense')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense').size() > 0 
			) {		
				String strAcronym9 = null;
				Set<String> setAcronym9 = null;
				String strName9 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense')) {
					
					if(strAcronym9 == null) {
						strAcronym9 = u.COA_Acronym__c;
						setAcronym9 = new Set<String>();
						setAcronym9.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym9.contains(u.COA_Acronym__c)) {
							strAcronym9 = strAcronym9 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName9 == null) {
						strName9 = u.Name;
					} else {
						strName9 = strName9 + ', ' + u.Name;
					}

				}
				if(strAcronym9 != null && strName9 != null) {
					rfa.CM_Promotion_OtherExpense_FA_ACR__c = strAcronym9;
					rfa.CM_Promotion_OtherExpense_FA_Name__c = strName9;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('09. Promotion / Other expense');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('09. Promotion / Other expense')) {
			if(mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense').size() > 0 
			) {		
				String strAcronym9 = null;
				Set<String> setAcronym9 = null;
				String strName9 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense')) {
					
					if(strAcronym9 == null) {
						strAcronym9 = u.COA_Acronym__c;
						setAcronym9 = new Set<String>();
						setAcronym9.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym9.contains(u.COA_Acronym__c)) {
							strAcronym9 = strAcronym9 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName9 == null) {
						strName9 = u.Name;
					} else {
						strName9 = strName9 + ', ' + u.Name;
					}

				}
				if(strAcronym9 != null && strName9 != null) {
					rfa.CM_Promotion_OtherExpense_FA_ACR__c = strAcronym9;
					rfa.CM_Promotion_OtherExpense_FA_Name__c = strName9;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}			
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('09. Promotion / Other expense');
				}//end of if(Final Approver);
				*/
			}
		}																			

		if(mapSelectedSubToFinalApproversByAcronym.containsKey('10. Promotion (Cooperation / Sampling)')) {
			if(mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)') != null 
				&& mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)').size() > 0 
			) {		
				String strAcronym10 = null;
				Set<String> setAcronym10 = null;
				String strName10 = null;
				
				for(User u : mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)')) {
					
					if(strAcronym10 == null) {
						strAcronym10 = u.COA_Acronym__c;
						setAcronym10 = new Set<String>();
						setAcronym10.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym10.contains(u.COA_Acronym__c)) {
							strAcronym10 = strAcronym10 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName10 == null) {
						strName10 = u.Name;
					} else {
						strName10 = strName10 + ', ' + u.Name;
					}

				}
				if(strAcronym10 != null && strName10 != null) {
					rfa.CM_Promotion_CooperationSampling_FA_ACR__c = strAcronym10;
					rfa.CM_Promotion_CooperationSampling_FA_Name__c = strName10;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByAcronym.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByAcronym.get('10. Promotion (Cooperation / Sampling)');
				}//end of if(Final Approver);
				*/
			}
		} else if(mapSelectedSubToFinalApproversByGroup.containsKey('10. Promotion (Cooperation / Sampling)')) {
			if(mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)') != null 
				&& mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)').size() > 0 
			) {		
				String strAcronym10 = null;
				Set<String> setAcronym10 = null;
				String strName10 = null;
				
				for(User u : mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)')) {
					
					if(strAcronym10 == null) {
						strAcronym10 = u.COA_Acronym__c;
						setAcronym10 = new Set<String>();
						setAcronym10.add(u.COA_Acronym__c);
					} else {
						if(!setAcronym10.contains(u.COA_Acronym__c)) {
							strAcronym10 = strAcronym10 + ', ' + u.COA_Acronym__c;
						}
					}
					
					if(strName10 == null) {
						strName10 = u.Name;
					} else {
						strName10 = strName10 + ', ' + u.Name;
					}

				}
				if(strAcronym10 != null && strName10 != null) {
					rfa.CM_Promotion_CooperationSampling_FA_ACR__c = strAcronym10;
					rfa.CM_Promotion_CooperationSampling_FA_Name__c = strName10;
				}								
				
				//Final Approvers
				if(mapSelectedSubToFinalApproversByGroup.containsKey(strFinalApproverCategoryB1ToB7)) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get(strFinalApproverCategoryB1ToB7);						
				}				
				/*		
				if(listFinalApprovers == null) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)');
				} else if(
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(listFinalApprovers[0].COA_Acronym__c)
					<
					COA_Utility_Constants.mapCOAAppendix3B2_ApproverToLevel.get(mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)')[0].COA_Acronym__c)
				) {
					listFinalApprovers = mapSelectedSubToFinalApproversByGroup.get('10. Promotion (Cooperation / Sampling)');
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
	//This method will set up the Approver Lists based on different routes, and conditions
	public static void setupApproverRoutesOfAppendix3B1ToB7(List<RFA__c> listNewRFAs) {	
		
		for(RFA__c rfa : listNewRFAs) {
			//One To One mapping, example, 01. Contract unit price => Category A
			Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();
			system.debug('------- mapSelectedSubToSubSubCategory: ' + mapSelectedSubToSubSubCategory);

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
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory 
				= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubAndSubSubCategory(rfa);
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
					system.debug('-------- COA rule: ' + coa);
					
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
		
	}//setupApproverRoutesOfAppendix3B1ToB7(RFAs);
	
			
	private static Boolean containOnlyOneCategoryOfB1ToB7(RFA__c rfa) {
		Integer count = 0;
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