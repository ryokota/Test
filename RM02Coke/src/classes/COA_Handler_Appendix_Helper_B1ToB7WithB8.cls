public with sharing class COA_Handler_Appendix_Helper_B1ToB7WithB8 {
	
	/*
		============ isBefore & isInsert ============ 
	*/
	public static void setupFinalApproverOfAppendix3B1ToB7WithB8(List<RFA__c> listNewRFAs) {
		system.debug('-------- setupFinalApproverOfAppendix3B1ToB7: ' + listNewRFAs);
		
		for(RFA__c rfa : listNewRFAs) {
			//mutipule COA rules since in one RFA user can select different categories

			//One To One mapping, example, 01. Contract unit price => Category A
			Map<String, String> mapSelectedSubToSubSubCategory_B1ToB7 = new Map<String, String>();
			
			//  example, 01. Contract unit price => CEO, CFO, ...
			Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet_B1ToB7 = new Map<String, Set<String>>();
			//  example, 01. Contract unit price => Shiten cho / Gr.5
			Map<String, String> mapSelectedSubCategoryToFinalGroup_B1ToB7 = new Map<String, String>();
			
			//Final Approvers for each Category, may be one to many
			// example, 01. Contract unit price => Users
			Map<String, List<User>> mapSelectedSubToFinalApproversByAcronym_B1ToB7 = new Map<String, List<User>>();
			
			Map<String, List<User>> mapSelectedSubToFinalApproversByGroup_B1ToB7 = new Map<String, List<User>>();
			
			Set<String> setAcronymOfFinalApprovers_B1ToB7 = new Set<String>();				
						
			//B.8.
			Map<String, String> mapSelectedSubToSubSubCategory_B8 = new Map<String, String>();
			Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet_B8 = new Map<String, Set<String>>();
			Map<String, String> mapSelectedSubCategoryToFinalGroup_B8 = new Map<String, String>();
			Map<String, List<User>> mapSelectedSubToFinalApproversByAcronym_B8 = new Map<String, List<User>>();			
			Map<String, List<User>> mapSelectedSubToFinalApproversByGroup_B8 = new Map<String, List<User>>();					
			Set<String> setAcronymOfFinalApprovers_B8 = new Set<String>();	
			
			Set<String> setAcronymOfFinalApprovers = new Set<String>();						
			String strFinalApproverLevel = null;
			String strFinalApproverCategoryB1ToB7 = null; //CM_Sub_Category__c			
			String strFinalApproverCategoryB8 = null; //CM_Sub_Category_B8__c
			
			// ====== Step 1 ======			
			mapSelectedSubToSubSubCategory_B1ToB7 
				= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubAndSubSubCategory(rfa);
			system.debug('------- mapSelectedSubToSubSubCategory_B1ToB7: ' + mapSelectedSubToSubSubCategory_B1ToB7);
			
			mapSelectedSubToSubSubCategory_B8 
				= COA_Handler_Appendix_Helper_B8.getSelectedSubAndSubSubCategory(rfa);
			system.debug('------- mapSelectedSubToSubSubCategory_B8: ' + mapSelectedSubToSubSubCategory_B8);			

			// ====== Step 2 ======	
			if(mapSelectedSubToSubSubCategory_B1ToB7 != null 
				&& mapSelectedSubToSubSubCategory_B1ToB7.keySet() != null 
				&& mapSelectedSubToSubSubCategory_B1ToB7.values() != null
				&& mapSelectedSubToSubSubCategory_B1ToB7.keySet().size() > 0
				&& mapSelectedSubToSubSubCategory_B1ToB7.values().size() > 0
			) {
				for(COA__c coa : 
					[					
						Select Id, 
						CM_Category__c, CM_PrimaryCOASubCategory__c, CM_Sub_Category__c, CM_Sub_sub_Category__c,	
						
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
								RFA_Utility_Constants.COA_RTAPIName_Appendix3_B1ToB7
								)
							and 
							CM_PrimaryCOASubCategory__c =: rfa.CM_PrimaryCOASubCategory__c
							and
							CM_Sub_Category__c IN: mapSelectedSubToSubSubCategory_B1ToB7.keySet()
							and
							CM_Sub_sub_Category__c IN: mapSelectedSubToSubSubCategory_B1ToB7.values()
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
					mapSelectedSubCategoryToFinalAcronymSet_B1ToB7 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubCategoryWithFinalAcronyms(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalAcronymSet_B1ToB7
						);
					system.debug('------ mapSelectedSubCategoryToFinalAcronymSet_B1ToB7: ' 
						+ mapSelectedSubCategoryToFinalAcronymSet_B1ToB7);
						
					mapSelectedSubCategoryToFinalGroup_B1ToB7 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubCategoryWithFinalGroup(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalGroup_B1ToB7
						);			
					//{01. Contract unit price=Gr.5}				
					system.debug('------ mapSelectedSubCategoryToFinalGroup_B1ToB7: ' 
						+ mapSelectedSubCategoryToFinalGroup_B1ToB7);
										
				}//end of for(COAs);
			
				User runningUser = [Select Id, Name, Username, COA_Acronym__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where Id =: Userinfo.getUserId()
				];
				
				//Group Approvers
				if(mapSelectedSubCategoryToFinalGroup_B1ToB7 != null 
					&& mapSelectedSubCategoryToFinalGroup_B1ToB7.keySet() != null
					&& mapSelectedSubCategoryToFinalGroup_B1ToB7.keySet().size() > 0
				) {
					mapSelectedSubToFinalApproversByGroup_B1ToB7 
						= COA_Handler_Appendix_Helper_B1ToB7.getFinalApproverByGroup(
							//rfa, 
							mapSelectedSubCategoryToFinalGroup_B1ToB7, 
							mapSelectedSubToFinalApproversByGroup_B1ToB7, 
							runningUser
						);
				}
				system.debug('--------- mapSelectedSubToFinalApproversByGroup_B1ToB7: ' + mapSelectedSubToFinalApproversByGroup_B1ToB7);		


				
				// ====== Step 3 ======					
				if(mapSelectedSubCategoryToFinalAcronymSet_B1ToB7 != null 
					&& mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.keySet() != null
					&& mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.keySet().size() > 0
				) {
					for(String key : mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.keySet()) {
						
						mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, null);
						
						for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.get(key)) {
							setAcronymOfFinalApprovers_B1ToB7.add(Acronym);
						}
					}
				}		
				
				// ====== Step 4 ======	
				//add user mapping here!  need mapping checkbox and user's function
				if(setAcronymOfFinalApprovers_B1ToB7 != null && setAcronymOfFinalApprovers_B1ToB7.size() > 0) {
					//query all the users with selected Acronym
					for(User u : [
						Select Id, Name, Username, 
						COA_Acronym__c, COA_Group__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where COA_Acronym__c IN: setAcronymOfFinalApprovers_B1ToB7
						]
					) {	
						for(String key : mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.keySet()) {
							for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet_B1ToB7.get(key)) {
								if(Acronym == u.COA_Acronym__c) {
									//need to mapping, dynamically get mapping list
									
									if(COA_Utility_Constants.setAcronymToMapingToL3.contains(Acronym)) {
										//mapping to L3
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, new List<User>{u});
											}
										}
											
									} else if(COA_Utility_Constants.setAcronymToMapingToL4.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, new List<User>{u});
											}
										}
										
									}  else if(COA_Utility_Constants.setAcronymToMapingToL5.contains(Acronym)) {
										//mapping to L5
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, new List<User>{u});
											}
										}
										
									}  else if(COA_Utility_Constants.setAcronymToMapingToL6.contains(Acronym)) {
										//mapping to L6
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
											&& u.L6_Function_E__c == runningUser.L6_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, new List<User>{u});
											}
										}
										
									} else {//do not need mapping
										if(mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key) != null) {
											mapSelectedSubToFinalApproversByAcronym_B1ToB7.get(key).add(u);
										} else {
											mapSelectedSubToFinalApproversByAcronym_B1ToB7.put(key, new List<User>{u});
										}
									}//mapping
									
								}//same user

							}//
						}											
					}//for(Users);
				}//end of if();				
				system.debug('--------- mapSelectedSubToFinalApproversByAcronym_B1ToB7: ' + mapSelectedSubToFinalApproversByAcronym_B1ToB7);
		

				// ====== Step 5 ======	
				if(mapSelectedSubToFinalApproversByAcronym_B1ToB7 != null 
					|| mapSelectedSubToFinalApproversByGroup_B1ToB7 != null
					//&& mapSelectedSubToFinalApproversByAcronym_B1ToB7.keySet() != null 
					//&& mapSelectedSubToFinalApproversByAcronym_B1ToB7.values() != null
					//&& mapSelectedSubToFinalApproversByAcronym_B1ToB7.keySet().size() > 0
					//&& mapSelectedSubToFinalApproversByAcronym_B1ToB7.values().size() > 0
				) {
					COA_Handler_Appendix_Helper.setupFinalApproverForEachCategory(
						rfa, 
						mapSelectedSubToFinalApproversByAcronym_B1ToB7, 
						mapSelectedSubToFinalApproversByGroup_B1ToB7,
						strFinalApproverCategoryB1ToB7
					); 
				}								
									
			}//end of if(B.1.ToB.7.);		
						
			
			if(mapSelectedSubToSubSubCategory_B8 != null 
				&& mapSelectedSubToSubSubCategory_B8.keySet() != null 
				&& mapSelectedSubToSubSubCategory_B8.values() != null
				&& mapSelectedSubToSubSubCategory_B8.keySet().size() > 0
				&& mapSelectedSubToSubSubCategory_B8.values().size() > 0
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
							CM_Sub_Category_B8__c IN: mapSelectedSubToSubSubCategory_B8.keySet()
							and
							CM_Sub_sub_Category_B8__c IN: mapSelectedSubToSubSubCategory_B8.values()
					]
				) {
					system.debug('-------- COA rule: ' + coa);
					
					//Get the Final Approver's Category B8 based on Levels, such as, a. Non-standard Equipment,...
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
					mapSelectedSubCategoryToFinalAcronymSet_B8 
						= COA_Handler_Appendix_Helper_B8.getSelectedSubCategoryWithFinalAcronyms(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalAcronymSet_B8
						);
					system.debug('------ mapSelectedSubCategoryToFinalAcronymSet_B8: ' 
						+ mapSelectedSubCategoryToFinalAcronymSet_B8);
						
					mapSelectedSubCategoryToFinalGroup_B8 
						= COA_Handler_Appendix_Helper_B1ToB7.getSelectedSubCategoryWithFinalGroup(
							rfa, 
							coa, 
							mapSelectedSubCategoryToFinalGroup_B8
						);			
					//{01. Contract unit price=Gr.5}				
					system.debug('------ mapSelectedSubCategoryToFinalGroup_B8: ' 
						+ mapSelectedSubCategoryToFinalGroup_B8);
										
				}//end of for(COAs);
				
				User runningUser = [Select Id, Name, Username, COA_Acronym__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where Id =: Userinfo.getUserId()
				];
				
				//Group Approvers
				if(mapSelectedSubCategoryToFinalGroup_B8 != null 
					&& mapSelectedSubCategoryToFinalGroup_B8.keySet() != null
					&& mapSelectedSubCategoryToFinalGroup_B8.keySet().size() > 0
				) {
					mapSelectedSubToFinalApproversByGroup_B8 
						= COA_Handler_Appendix_Helper_B1ToB7.getFinalApproverByGroup(
							//rfa, 
							mapSelectedSubCategoryToFinalGroup_B8, 
							mapSelectedSubToFinalApproversByGroup_B8, 
							runningUser
						);
				}
				
				system.debug('--------- mapSelectedSubToFinalApproversByGroup_B8: ' + mapSelectedSubToFinalApproversByGroup_B8);
				
				// ====== Step 3 ======					
				if(mapSelectedSubCategoryToFinalAcronymSet_B8 != null 
					&& mapSelectedSubCategoryToFinalAcronymSet_B8.keySet() != null
					&& mapSelectedSubCategoryToFinalAcronymSet_B8.keySet().size() > 0
				) {
					for(String key : mapSelectedSubCategoryToFinalAcronymSet_B8.keySet()) {
						
						mapSelectedSubToFinalApproversByAcronym_B8.put(key, null);
						
						for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet_B8.get(key)) {
							setAcronymOfFinalApprovers_B8.add(Acronym);
						}
					}
				}
				
				// ====== Step 4 ======	
				//add user mapping here!  need mapping checkbox and user's function
				if(setAcronymOfFinalApprovers_B8 != null && setAcronymOfFinalApprovers_B8.size() > 0) {
					//query all the users with selected Acronym
					for(User u : [
						Select Id, Name, Username, 
						COA_Acronym__c, COA_Group__c,
						L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
						L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
						from User 
						where COA_Acronym__c IN: setAcronymOfFinalApprovers_B8
						]
					) {	
						for(String key : mapSelectedSubCategoryToFinalAcronymSet_B8.keySet()) {
							for(String Acronym : mapSelectedSubCategoryToFinalAcronymSet_B8.get(key)) {
								if(Acronym == u.COA_Acronym__c) {
									
									//need to mapping, dynamically get mapping list
									if(COA_Utility_Constants.setAcronymToMapingToL3.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B8.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B8.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B8.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL4.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B8.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B8.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B8.put(key, new List<User>{u});
											}
										}
									} else if(COA_Utility_Constants.setAcronymToMapingToL5.contains(Acronym)) {
										//mapping to L4
										if(u.L2_Function_E__c == runningUser.L2_Function_E__c
											&& u.L3_Function_E__c == runningUser.L3_Function_E__c
											&& u.L4_Function_E__c == runningUser.L4_Function_E__c
											&& u.L5_Function_E__c == runningUser.L5_Function_E__c
										) {
											
											if(mapSelectedSubToFinalApproversByAcronym_B8.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B8.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B8.put(key, new List<User>{u});
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
											
											if(mapSelectedSubToFinalApproversByAcronym_B8.get(key) != null) {
												mapSelectedSubToFinalApproversByAcronym_B8.get(key).add(u);
											} else {
												mapSelectedSubToFinalApproversByAcronym_B8.put(key, new List<User>{u});
											}
										}									
									} else {//do not need mapping
										if(mapSelectedSubToFinalApproversByAcronym_B8.get(key) != null) {
											mapSelectedSubToFinalApproversByAcronym_B8.get(key).add(u);
										} else {
											mapSelectedSubToFinalApproversByAcronym_B8.put(key, new List<User>{u});
										}
									}//mapping
									
								}//same user

							}//
						}											
					}//for(Users);
				}//end of if();
				
				system.debug('--------- mapSelectedSubToFinalApproversByAcronym_B8: ' + mapSelectedSubToFinalApproversByAcronym_B8);
				
				// ====== Step 5 ======	
				if(mapSelectedSubToFinalApproversByAcronym_B8 != null 
					|| mapSelectedSubToFinalApproversByGroup_B8 != null
					//&& mapSelectedSubToFinalApproversByAcronym_B8.keySet() != null 
					//&& mapSelectedSubToFinalApproversByAcronym_B8.values() != null
					//&& mapSelectedSubToFinalApproversByAcronym_B8.keySet().size() > 0
					//&& mapSelectedSubToFinalApproversByAcronym_B8.values().size() > 0
				) {
					COA_Handler_Appendix_Helper_B8.setupFinalApproverForEachCategory(
						rfa, 
						mapSelectedSubToFinalApproversByAcronym_B8, 
						mapSelectedSubToFinalApproversByGroup_B8,
						strFinalApproverCategoryB8
					); 
				}						
			}//end of if();					
			
									
						
		}//end of for(RFAs);
		
	}//end of setupFinalApproverOfAppendix3B1ToB7WithB8(RFAs);		
	
	
	/*
		============ isAfter & isInsert ============ 
	*/	
	public static void setupApproverRoutesOfAppendix3B1ToB7WithB8(List<RFA__c> listNewRFAs) {	
		
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
		
	}//setupApproverRoutesOfAppendix3B1ToB7WithB8(RFAs);













	
	
	
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