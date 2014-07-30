public with sharing class COA_Handler_Appendix_Helper_B8WithD {
	
	/*
		============ isBefore & isInsert ============ 
	*/

	
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
		============ isAfter & isInsert ============ 
	*/
	public static void setupApproverRoutesOfAppendix3_B8_with_TypeD(List<RFA__c> listNewRFAs) {	
		
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
			
			Map<String, String> mapAcronymAndGroupToMappingLevel = new Map<String, String>();
			
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
						
						CM_L1_1__c, CM_L1_2__c, CM_L1_Order__c, CM_L1_Mapping_Level__c, CM_L1_Mapping__c, CM_L1_Kizai__c,
						
						CM_L2_1__c, CM_L2_2__c, CM_L2_Order__c, CM_L2_Mapping_Level__c, CM_L2_Mapping__c, CM_L2_Kizai__c,
						
						CM_L3_1__c, CM_L3_2__c, CM_L3_Order__c, CM_L3_Mapping_Level__c, CM_L3_Mapping__c, CM_L3_Kizai__c,
						
						CM_L4_1__c, CM_L4_2__c, CM_L4_Order__c, CM_L4_Mapping_Level__c, CM_L4_Mapping__c, CM_L4_Kizai__c,
						
						CM_L5_1__c, CM_L5_2__c, CM_L5_3__c, CM_L5_4__c, CM_L5_5__c, 
						CM_L5_6__c, CM_L5_7__c, CM_L5_8__c, CM_L5_9__c, CM_L5_10__c, 
						CM_L5_Order__c, CM_L5_Mapping_Level__c, CM_L5_Mapping__c, CM_L5_Kizai__c,
						
						CM_L6_1__c, CM_L6_2__c, CM_L6_3__c, CM_L6_4__c, CM_L6_5__c, 
						CM_L6_6__c, CM_L6_7__c, CM_L6_8__c, CM_L6_9__c, CM_L6_10__c,
						CM_L6_Order__c,	CM_L6_Mapping_Level__c, CM_L6_Mapping__c, CM_L6_Kizai__c,	
																
						CM_L7_1__c, CM_L7_2__c, CM_L7_3__c, CM_L7_4__c, CM_L7_5__c, 
						CM_L7_6__c, CM_L7_7__c, CM_L7_8__c, CM_L7_9__c, CM_L7_10__c, 
						CM_L7_Order__c, CM_L7_Mapping_Level__c, CM_L7_Mapping__c, CM_L7_Kizai__c,
						
						CM_L8_1__c, CM_L8_2__c, CM_L8_3__c, CM_L8_4__c, CM_L8_5__c, 
						CM_L8_6__c, CM_L8_7__c, CM_L8_8__c, CM_L8_9__c, CM_L8_10__c,
						CM_L8_Order__c,	CM_L8_Mapping_Level__c, CM_L8_Mapping__c, CM_L8_Kizai__c,	
						
						CM_L9_1__c, CM_L9_2__c, CM_L9_3__c, CM_L9_4__c, CM_L9_5__c, 
						CM_L9_6__c, CM_L9_7__c, CM_L9_8__c, CM_L9_9__c, CM_L9_10__c,
						CM_L9_Order__c, CM_L9_Mapping_Level__c, CM_L9_Mapping__c, CM_L9_Kizai__c,	
												
						CM_L10_1__c, CM_L10_2__c, CM_L10_3__c, CM_L10_4__c, CM_L10_5__c, 
						CM_L10_6__c, CM_L10_7__c, CM_L10_8__c, CM_L10_9__c, CM_L10_10__c,
						CM_L10_Order__c, CM_L10_Mapping_Level__c, CM_L10_Mapping__c, CM_L10_Kizai__c,	
												
						CM_L11_1__c, CM_L11_2__c, CM_L11_3__c, CM_L11_4__c, CM_L11_5__c, 
						CM_L11_6__c, CM_L11_7__c, CM_L11_8__c, CM_L11_9__c, CM_L11_10__c,
						CM_L11_Order__c, CM_L11_Mapping_Level__c, CM_L11_Mapping__c, CM_L11_Kizai__c,	
																	
						CM_L12_1__c, CM_L12_2__c, CM_L12_3__c, CM_L12_4__c, CM_L12_5__c, 
						CM_L12_6__c, CM_L12_7__c, CM_L12_8__c, CM_L12_9__c, CM_L12_10__c,
						CM_L12_Order__c, CM_L12_Mapping_Level__c, CM_L12_Mapping__c, CM_L12_Kizai__c,
																		
						CM_L13_1__c, CM_L13_2__c, CM_L13_3__c, CM_L13_4__c, CM_L13_5__c, 
						CM_L13_6__c, CM_L13_7__c, CM_L13_8__c, CM_L13_9__c, CM_L13_10__c,
						CM_L13_Order__c, CM_L13_Mapping_Level__c, CM_L13_Mapping__c, CM_L13_Kizai__c,																										
						
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
					system.debug('-------- After Insert: COA rule Id: ' + coa.Id);
					
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
				
				
				
				system.debug('------ mapSelectedLevelsToApproversByAcronym: ' + mapSelectedLevelsToApproversByAcronym);	
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