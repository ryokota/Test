public without sharing class COA_Handler_Appendix_Helper_B1ToB6 {
	
	
	/*
		============ isBefore & isInsert ============ 
	*/
	/*
		selected Sub Category in a RFA request
		One To One mapping, example, 01. Contract unit price => Category A
		depends on '01. Contract unit price', '02. Special price / Promotion discount' values
	*/
	public static Map<String, String> getSelectedSubAndSubSubCategory(RFA__c rfa) {
		
		Map<String, String> mapSelectedSubToSubSubCategory = new Map<String, String>();

		if(rfa.CM_Contract_unit_price__c != null) {
			mapSelectedSubToSubSubCategory.put('01. Contract unit price', rfa.CM_Contract_unit_price__c);
		}
				
		if(rfa.CM_SpecialPricePromotionDiscount__c != null) {
			mapSelectedSubToSubSubCategory.put('02. Special price / Promotion discount', rfa.CM_SpecialPricePromotionDiscount__c);
		}		
								
		if(rfa.CM_FS_selling_price__c != null) {
			mapSelectedSubToSubSubCategory.put('03. FS selling price', rfa.CM_FS_selling_price__c);
		}
			
		if(rfa.CM_FS_Commission_Variable__c != null) {
			mapSelectedSubToSubSubCategory.put('04. FS commission (Variable)', rfa.CM_FS_Commission_Variable__c);
		}
			
		if(rfa.CM_FS_Commission_Fixed__c != null) {
			mapSelectedSubToSubSubCategory.put('05. FS commission (Fixed)', rfa.CM_FS_Commission_Fixed__c);
		}
						
		if(rfa.CM_KeyMoney_Rebate_Sport_Other__c != null) {
			mapSelectedSubToSubSubCategory.put('06. Key money / Rebate / Spot / Other', rfa.CM_KeyMoney_Rebate_Sport_Other__c);
		}		
			
		if(rfa.CM_Only_in_the_case_of_Rebate__c != null) {
			mapSelectedSubToSubSubCategory.put('07. Only in the case of Rebate', rfa.CM_Only_in_the_case_of_Rebate__c);
		}				
			
		if(rfa.CM_Other_support__c != null) {
			mapSelectedSubToSubSubCategory.put('08. Other support', rfa.CM_Other_support__c);
		}	
			
		if(rfa.CM_Promotion_OtherExpense__c != null) {
			mapSelectedSubToSubSubCategory.put('09. Promotion / Other expense', rfa.CM_Promotion_OtherExpense__c);
		}					
			
		if(rfa.CM_Promotion_CooperationSampling__c != null) {
			mapSelectedSubToSubSubCategory.put('10. Promotion (Cooperation / Sampling)', rfa.CM_Promotion_CooperationSampling__c);
		}					
		return mapSelectedSubToSubSubCategory;
	}//end of getSelectedSubAndSubSubCategory();	


	public static Map<String, Set<String>> getSelectedSubCategoryWithFinalAcronyms(
		RFA__c rfa,
		COA__c coa, 
		Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet
	) {
		if(coa.CM_Sub_Category__c == '01. Contract unit price'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Contract_unit_price__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);			
		}
			
		if(coa.CM_Sub_Category__c == '02. Special price / Promotion discount'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_SpecialPricePromotionDiscount__c
		) {		
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);		
		}
											
		if(coa.CM_Sub_Category__c == '03. FS selling price'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_selling_price__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);																							
		}								
			
		if(coa.CM_Sub_Category__c == '04. FS commission (Variable)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_Commission_Variable__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);			
		}								
				
		if(coa.CM_Sub_Category__c == '05. FS commission (Fixed)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_Commission_Fixed__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);					
		}								
							
		if(coa.CM_Sub_Category__c == '06. Key money / Rebate / Spot / Other'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_KeyMoney_Rebate_Sport_Other__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);
		}								
						
		if(coa.CM_Sub_Category__c == '07. Only in the case of Rebate'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Only_in_the_case_of_Rebate__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);							
		}								
							
		if(coa.CM_Sub_Category__c == '08. Other support'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Other_support__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);								
		}								
			
		if(coa.CM_Sub_Category__c == '09. Promotion / Other expense'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Promotion_OtherExpense__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);						
		}														
			
		if(coa.CM_Sub_Category__c == '10. Promotion (Cooperation / Sampling)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Promotion_CooperationSampling__c
		) {
			mapSelectedSubCategoryToFinalAcronymSet = getFinalAcronymsByLevel(coa, mapSelectedSubCategoryToFinalAcronymSet);				
		}			
		
		return mapSelectedSubCategoryToFinalAcronymSet;
	}//end of getSelectedSubCategoryWithFinalAcronyms();	

	//Loop all fields to retrieve each Approver's Acronym or Group
	//two formats are available: CEO or Gr.5
	//only retrive Acronym
	private static Map<String, Set<String>> getFinalAcronymsByLevel(
		COA__c coa, 
		Map<String, Set<String>> mapSelectedSubCategoryToFinalAcronymSet
	) {
		if(coa.CM_Approver_Final_Level__c == 'L1') {
			if(coa.CM_L1_1__c != null && !coa.CM_L1_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L1_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L1_1__c});
				}
			}			
			if(coa.CM_L1_2__c != null && !coa.CM_L1_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L1_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L1_2__c});
				}
			}				
		}
		
		if(coa.CM_Approver_Final_Level__c == 'L2') {
			if(coa.CM_L2_1__c != null && !coa.CM_L2_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L2_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L2_1__c});
				}
			}			
			if(coa.CM_L2_2__c != null && !coa.CM_L2_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L2_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L2_2__c});
				}
			}				
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L3') {
			if(coa.CM_L3_1__c != null && !coa.CM_L3_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L3_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L3_1__c});
				}
			}			
			if(coa.CM_L3_2__c != null && !coa.CM_L3_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L3_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L3_2__c});
				}
			}				
		}			

		if(coa.CM_Approver_Final_Level__c == 'L4') {
			if(coa.CM_L4_1__c != null && !coa.CM_L4_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L4_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L4_1__c});
				}
			}			
			if(coa.CM_L4_2__c != null && !coa.CM_L4_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L4_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L4_2__c});
				}
			}				
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L5') {
			if(coa.CM_L5_1__c != null && !coa.CM_L5_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_1__c});
				}
			}			
			if(coa.CM_L5_2__c != null && !coa.CM_L5_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_2__c});
				}
			}
			if(coa.CM_L5_3__c != null && !coa.CM_L5_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_3__c});
				}
			}			
			if(coa.CM_L5_4__c != null && !coa.CM_L5_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_4__c});
				}
			}			
			if(coa.CM_L5_5__c != null && !coa.CM_L5_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_5__c});
				}
			}		
			if(coa.CM_L5_6__c != null && !coa.CM_L5_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_6__c});
				}
			}			
			if(coa.CM_L5_7__c != null && !coa.CM_L5_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_7__c});
				}
			}
			if(coa.CM_L5_8__c != null && !coa.CM_L5_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_8__c});
				}
			}			
			if(coa.CM_L5_9__c != null && !coa.CM_L5_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_9__c});
				}
			}			
			if(coa.CM_L5_10__c != null && !coa.CM_L5_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L5_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L5_10__c});
				}
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L6') {
			if(coa.CM_L6_1__c != null && !coa.CM_L6_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_1__c});
				}
			}			
			if(coa.CM_L6_2__c != null && !coa.CM_L6_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_2__c});
				}
			}
			if(coa.CM_L6_3__c != null && !coa.CM_L6_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_3__c});
				}
			}			
			if(coa.CM_L6_4__c != null && !coa.CM_L6_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_4__c});
				}
			}			
			if(coa.CM_L6_5__c != null && !coa.CM_L6_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_5__c});
				}
			}		
			if(coa.CM_L6_6__c != null && !coa.CM_L6_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_6__c});
				}
			}			
			if(coa.CM_L6_7__c != null && !coa.CM_L6_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_7__c});
				}
			}
			if(coa.CM_L6_8__c != null && !coa.CM_L6_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_8__c});
				}
			}			
			if(coa.CM_L6_9__c != null && !coa.CM_L6_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_9__c});
				}
			}			
			if(coa.CM_L6_10__c != null && !coa.CM_L6_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L6_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L6_10__c});
				}
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L7') {
			if(coa.CM_L7_1__c != null && !coa.CM_L7_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_1__c});
				}
			}			
			if(coa.CM_L7_2__c != null && !coa.CM_L7_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_2__c});
				}
			}
			if(coa.CM_L7_3__c != null && !coa.CM_L7_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_3__c});
				}
			}			
			if(coa.CM_L7_4__c != null && !coa.CM_L7_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_4__c});
				}
			}			
			if(coa.CM_L7_5__c != null && !coa.CM_L7_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_5__c});
				}
			}		
			if(coa.CM_L7_6__c != null && !coa.CM_L7_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_6__c});
				}
			}			
			if(coa.CM_L7_7__c != null && !coa.CM_L7_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_7__c});
				}
			}
			if(coa.CM_L7_8__c != null && !coa.CM_L7_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_8__c});
				}
			}			
			if(coa.CM_L7_9__c != null && !coa.CM_L7_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_9__c});
				}
			}			
			if(coa.CM_L7_10__c != null && !coa.CM_L7_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L7_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L7_10__c});
				}
			}																
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L8') {
			if(coa.CM_L8_1__c != null && !coa.CM_L8_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_1__c});
				}
			}			
			if(coa.CM_L8_2__c != null && !coa.CM_L8_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_2__c});
				}
			}
			if(coa.CM_L8_3__c != null && !coa.CM_L8_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_3__c});
				}
			}			
			if(coa.CM_L8_4__c != null && !coa.CM_L8_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_4__c});
				}
			}			
			if(coa.CM_L8_5__c != null && !coa.CM_L8_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_5__c});
				}
			}		
			if(coa.CM_L8_6__c != null && !coa.CM_L8_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_6__c});
				}
			}			
			if(coa.CM_L8_7__c != null && !coa.CM_L8_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_7__c});
				}
			}
			if(coa.CM_L8_8__c != null && !coa.CM_L8_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_8__c});
				}
			}			
			if(coa.CM_L8_9__c != null && !coa.CM_L8_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_9__c});
				}
			}			
			if(coa.CM_L8_10__c != null && !coa.CM_L8_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L8_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L8_10__c});
				}
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L9') {
			if(coa.CM_L9_1__c != null && !coa.CM_L9_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_1__c});
				}
			}			
			if(coa.CM_L9_2__c != null && !coa.CM_L9_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_2__c});
				}
			}
			if(coa.CM_L9_3__c != null && !coa.CM_L9_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_3__c});
				}
			}			
			if(coa.CM_L9_4__c != null && !coa.CM_L9_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_4__c});
				}
			}			
			if(coa.CM_L9_5__c != null && !coa.CM_L9_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_5__c});
				}
			}		
			if(coa.CM_L9_6__c != null && !coa.CM_L9_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_6__c});
				}
			}			
			if(coa.CM_L9_7__c != null && !coa.CM_L9_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_7__c});
				}
			}
			if(coa.CM_L9_8__c != null && !coa.CM_L9_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_8__c});
				}
			}			
			if(coa.CM_L9_9__c != null && !coa.CM_L9_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_9__c});
				}
			}			
			if(coa.CM_L9_10__c != null && !coa.CM_L9_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L9_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L9_10__c});
				}
			}																
		}			

		if(coa.CM_Approver_Final_Level__c == 'L10') {
			if(coa.CM_L10_1__c != null && !coa.CM_L10_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_1__c});
				}
			}			
			if(coa.CM_L10_2__c != null && !coa.CM_L10_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_2__c});
				}
			}
			if(coa.CM_L10_3__c != null && !coa.CM_L10_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_3__c});
				}
			}			
			if(coa.CM_L10_4__c != null && !coa.CM_L10_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_4__c});
				}
			}			
			if(coa.CM_L10_5__c != null && !coa.CM_L10_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_5__c});
				}
			}		
			if(coa.CM_L10_6__c != null && !coa.CM_L10_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_6__c});
				}
			}			
			if(coa.CM_L10_7__c != null && !coa.CM_L10_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_7__c});
				}
			}
			if(coa.CM_L10_8__c != null && !coa.CM_L10_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_8__c});
				}
			}			
			if(coa.CM_L10_9__c != null && !coa.CM_L10_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_9__c});
				}
			}			
			if(coa.CM_L10_10__c != null && !coa.CM_L10_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L10_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L10_10__c});
				}
			}																
		}	
		
		if(coa.CM_Approver_Final_Level__c == 'L11') {
			if(coa.CM_L11_1__c != null && !coa.CM_L11_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_1__c});
				}
			}			
			if(coa.CM_L11_2__c != null && !coa.CM_L11_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_2__c});
				}
			}
			if(coa.CM_L11_3__c != null && !coa.CM_L11_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_3__c});
				}
			}			
			if(coa.CM_L11_4__c != null && !coa.CM_L11_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_4__c});
				}
			}			
			if(coa.CM_L11_5__c != null && !coa.CM_L11_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_5__c});
				}
			}		
			if(coa.CM_L11_6__c != null && !coa.CM_L11_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_6__c});
				}
			}			
			if(coa.CM_L11_7__c != null && !coa.CM_L11_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_7__c});
				}
			}
			if(coa.CM_L11_8__c != null && !coa.CM_L11_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_8__c});
				}
			}			
			if(coa.CM_L11_9__c != null && !coa.CM_L11_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_9__c});
				}
			}			
			if(coa.CM_L11_10__c != null && !coa.CM_L11_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L11_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L11_10__c});
				}
			}																
		}			
				
		if(coa.CM_Approver_Final_Level__c == 'L12') {
			if(coa.CM_L12_1__c != null && !coa.CM_L12_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_1__c});
				}
			}			
			if(coa.CM_L12_2__c != null && !coa.CM_L12_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_2__c});
				}
			}
			if(coa.CM_L12_3__c != null && !coa.CM_L12_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_3__c});
				}
			}			
			if(coa.CM_L12_4__c != null && !coa.CM_L12_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_4__c});
				}
			}			
			if(coa.CM_L12_5__c != null && !coa.CM_L12_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_5__c});
				}
			}		
			if(coa.CM_L12_6__c != null && !coa.CM_L12_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_6__c});
				}
			}			
			if(coa.CM_L12_7__c != null && !coa.CM_L12_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_7__c});
				}
			}
			if(coa.CM_L12_8__c != null && !coa.CM_L12_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_8__c});
				}
			}			
			if(coa.CM_L12_9__c != null && !coa.CM_L12_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_9__c});
				}
			}			
			if(coa.CM_L12_10__c != null && !coa.CM_L12_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L12_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L12_10__c});
				}
			}																
		}			

		if(coa.CM_Approver_Final_Level__c == 'L13') {
			if(coa.CM_L13_1__c != null && !coa.CM_L13_1__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_1__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_1__c});
				}
			}			
			if(coa.CM_L13_2__c != null && !coa.CM_L13_2__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_2__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_2__c});
				}
			}
			if(coa.CM_L13_3__c != null && !coa.CM_L13_3__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_3__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_3__c});
				}
			}			
			if(coa.CM_L13_4__c != null && !coa.CM_L13_4__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_4__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_4__c});
				}
			}			
			if(coa.CM_L13_5__c != null && !coa.CM_L13_5__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_5__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_5__c});
				}
			}		
			if(coa.CM_L13_6__c != null && !coa.CM_L13_6__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_6__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_6__c});
				}
			}			
			if(coa.CM_L13_7__c != null && !coa.CM_L13_7__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_7__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_7__c});
				}
			}
			if(coa.CM_L13_8__c != null && !coa.CM_L13_8__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_8__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_8__c});
				}
			}			
			if(coa.CM_L13_9__c != null && !coa.CM_L13_9__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_9__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_9__c});
				}
			}			
			if(coa.CM_L13_10__c != null && !coa.CM_L13_10__c.startsWith('Gr.')) {
				if(mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c) != null) {
					mapSelectedSubCategoryToFinalAcronymSet.get(coa.CM_Sub_Category__c).add(coa.CM_L13_10__c);
				} else {
					mapSelectedSubCategoryToFinalAcronymSet.put(coa.CM_Sub_Category__c, new Set<String>{coa.CM_L13_10__c});
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
		if(coa.CM_Sub_Category__c == '01. Contract unit price'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Contract_unit_price__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);			
		}
			
		if(coa.CM_Sub_Category__c == '02. Special price / Promotion discount'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_SpecialPricePromotionDiscount__c
		) {		
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);		
		}
											
		if(coa.CM_Sub_Category__c == '03. FS selling price'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_selling_price__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);																							
		}								
			
		if(coa.CM_Sub_Category__c == '04. FS commission (Variable)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_Commission_Variable__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);			
		}								
				
		if(coa.CM_Sub_Category__c == '05. FS commission (Fixed)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_FS_Commission_Fixed__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);					
		}								
							
		if(coa.CM_Sub_Category__c == '06. Key money / Rebate / Spot / Other'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_KeyMoney_Rebate_Sport_Other__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);
		}								
						
		if(coa.CM_Sub_Category__c == '07. Only in the case of Rebate'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Only_in_the_case_of_Rebate__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);							
		}								
				
			
		if(coa.CM_Sub_Category__c == '08. Other support'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Other_support__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);								
		}								
			
		if(coa.CM_Sub_Category__c == '09. Promotion / Other expense'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Promotion_OtherExpense__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);						
		}														
			
		if(coa.CM_Sub_Category__c == '10. Promotion (Cooperation / Sampling)'
			&& coa.CM_Sub_sub_Category__c == rfa.CM_Promotion_CooperationSampling__c
		) {
			mapSelectedSubCategoryToFinalGroup = getFinalGroupByLevel(coa, mapSelectedSubCategoryToFinalGroup);				
		}			
		
		return mapSelectedSubCategoryToFinalGroup;
	}//getSelectedSubCategoryWithFinalGroup();	
	
	//Loop all fields to retrieve each Approver's Acronym or Group
	//two formats are available: CEO or Gr.5
	//only retrive Gr., only one Gr. in one Level !  CM_L1_1__c will win CM_L1_2__c
	private static Map<String, String> getFinalGroupByLevel(
		COA__c coa, 
		Map<String, String> mapSelectedSubCategoryToFinalGroup
	) {
		if(coa.CM_Approver_Final_Level__c == 'L1') {
			if(coa.CM_L1_1__c != null && coa.CM_L1_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L1_1__c);
			} else if(coa.CM_L1_2__c != null && coa.CM_L1_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L1_2__c);
			}				
		}
		
		if(coa.CM_Approver_Final_Level__c == 'L2') {
			if(coa.CM_L2_1__c != null && coa.CM_L2_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L2_1__c);
			} else if(coa.CM_L2_2__c != null && coa.CM_L2_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L2_2__c);
			}				
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L3') {
			if(coa.CM_L3_1__c != null && coa.CM_L3_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L3_1__c);
			} else if(coa.CM_L3_2__c != null && coa.CM_L3_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L3_2__c);
			}				
		}			

		if(coa.CM_Approver_Final_Level__c == 'L4') {
			if(coa.CM_L4_1__c != null && coa.CM_L4_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L4_1__c);
			} else if(coa.CM_L4_2__c != null && coa.CM_L4_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L4_2__c);
			}				
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L5') {
			if(coa.CM_L5_1__c != null && coa.CM_L5_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_1__c);
			} else if(coa.CM_L5_2__c != null && coa.CM_L5_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_2__c);
			} else if(coa.CM_L5_3__c != null && coa.CM_L5_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_3__c);
			} else if(coa.CM_L5_4__c != null && coa.CM_L5_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_4__c);
			} else if(coa.CM_L5_5__c != null && coa.CM_L5_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_5__c);
			} else if(coa.CM_L5_6__c != null && coa.CM_L5_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_6__c);
			} else if(coa.CM_L5_7__c != null && coa.CM_L5_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_7__c);
			} else if(coa.CM_L5_8__c != null && coa.CM_L5_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_8__c);
			} else if(coa.CM_L5_9__c != null && coa.CM_L5_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_9__c);
			} else if(coa.CM_L5_10__c != null && coa.CM_L5_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L5_10__c);
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L6') {
			if(coa.CM_L6_1__c != null && coa.CM_L6_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_1__c);
			} else if(coa.CM_L6_2__c != null && coa.CM_L6_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_2__c);
			} else if(coa.CM_L6_3__c != null && coa.CM_L6_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_3__c);
			} else if(coa.CM_L6_4__c != null && coa.CM_L6_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_4__c);
			} else if(coa.CM_L6_5__c != null && coa.CM_L6_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_5__c);
			} else if(coa.CM_L6_6__c != null && coa.CM_L6_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_6__c);
			} else if(coa.CM_L6_7__c != null && coa.CM_L6_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_7__c);
			} else if(coa.CM_L6_8__c != null && coa.CM_L6_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_8__c);
			} else if(coa.CM_L6_9__c != null && coa.CM_L6_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_9__c);
			} else if(coa.CM_L6_10__c != null && coa.CM_L6_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L6_10__c);
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L7') {
			if(coa.CM_L7_1__c != null && coa.CM_L7_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_1__c);
			} else if(coa.CM_L7_2__c != null && coa.CM_L7_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_2__c);
			} else if(coa.CM_L7_3__c != null && coa.CM_L7_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_3__c);
			} else if(coa.CM_L7_4__c != null && coa.CM_L7_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_4__c);
			} else if(coa.CM_L7_5__c != null && coa.CM_L7_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_5__c);
			} else if(coa.CM_L7_6__c != null && coa.CM_L7_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_6__c);
			} else if(coa.CM_L7_7__c != null && coa.CM_L7_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_7__c);
			} else if(coa.CM_L7_8__c != null && coa.CM_L7_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_8__c);
			} else if(coa.CM_L7_9__c != null && coa.CM_L7_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_9__c);
			} else if(coa.CM_L7_10__c != null && coa.CM_L7_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L7_10__c);
			}																
		}		
		
		if(coa.CM_Approver_Final_Level__c == 'L8') {
			if(coa.CM_L8_1__c != null && coa.CM_L8_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_1__c);
			} else if(coa.CM_L8_2__c != null && coa.CM_L8_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_2__c);
			} else if(coa.CM_L8_3__c != null && coa.CM_L8_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_3__c);
			} else if(coa.CM_L8_4__c != null && coa.CM_L8_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_4__c);
			} else if(coa.CM_L8_5__c != null && coa.CM_L8_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_5__c);
			} else if(coa.CM_L8_6__c != null && coa.CM_L8_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_6__c);
			} else if(coa.CM_L8_7__c != null && coa.CM_L8_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_7__c);
			} else if(coa.CM_L8_8__c != null && coa.CM_L8_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_8__c);
			} else if(coa.CM_L8_9__c != null && coa.CM_L8_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_8__c);
			} else if(coa.CM_L8_10__c != null && coa.CM_L8_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L8_10__c);
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L9') {
			if(coa.CM_L9_1__c != null && coa.CM_L9_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_1__c);
			} else if(coa.CM_L9_2__c != null && coa.CM_L9_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_2__c);
			} else if(coa.CM_L9_3__c != null && coa.CM_L9_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_3__c);
			} else if(coa.CM_L9_4__c != null && coa.CM_L9_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_4__c);
			} else if(coa.CM_L9_5__c != null && coa.CM_L9_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_5__c);
			} else if(coa.CM_L9_6__c != null && coa.CM_L9_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_6__c);
			} else if(coa.CM_L9_7__c != null && coa.CM_L9_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_7__c);
			} else if(coa.CM_L9_8__c != null && coa.CM_L9_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_8__c);
			} else if(coa.CM_L9_9__c != null && coa.CM_L9_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_9__c);
			} else if(coa.CM_L9_10__c != null && coa.CM_L9_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L9_10__c);
			}																
		}						

		if(coa.CM_Approver_Final_Level__c == 'L10') {
			if(coa.CM_L10_1__c != null && coa.CM_L10_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_1__c);
			} else if(coa.CM_L10_2__c != null && coa.CM_L10_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_2__c);
			} else if(coa.CM_L10_3__c != null && coa.CM_L10_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_3__c);
			} else if(coa.CM_L10_4__c != null && coa.CM_L10_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_4__c);
			} else if(coa.CM_L10_5__c != null && coa.CM_L10_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_5__c);
			} else if(coa.CM_L10_6__c != null && coa.CM_L10_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_6__c);
			} else if(coa.CM_L10_7__c != null && coa.CM_L10_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_7__c);
			} else if(coa.CM_L10_8__c != null && coa.CM_L10_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_8__c);
			} else if(coa.CM_L10_9__c != null && coa.CM_L10_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_9__c);
			} else if(coa.CM_L10_10__c != null && coa.CM_L10_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L10_10__c);
			}																
		}	
		
		if(coa.CM_Approver_Final_Level__c == 'L11') {
			if(coa.CM_L11_1__c != null && coa.CM_L11_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_1__c);
			} else if(coa.CM_L11_2__c != null && coa.CM_L11_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_2__c);
			} else if(coa.CM_L11_3__c != null && coa.CM_L11_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_3__c);
			} else if(coa.CM_L11_4__c != null && coa.CM_L11_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_4__c);
			} else if(coa.CM_L11_5__c != null && coa.CM_L11_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_5__c);
			} else if(coa.CM_L11_6__c != null && coa.CM_L11_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_6__c);
			} else if(coa.CM_L11_7__c != null && coa.CM_L11_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_7__c);
			} else if(coa.CM_L11_8__c != null && coa.CM_L11_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_8__c);
			} else if(coa.CM_L11_9__c != null && coa.CM_L11_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_9__c);
			} else if(coa.CM_L11_10__c != null && coa.CM_L11_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L11_10__c);
			}																
		}			
		
		if(coa.CM_Approver_Final_Level__c == 'L12') {
			if(coa.CM_L12_1__c != null && coa.CM_L12_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_1__c);
			} else if(coa.CM_L12_2__c != null && coa.CM_L12_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_2__c);
			} else if(coa.CM_L12_3__c != null && coa.CM_L12_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_3__c);
			} else if(coa.CM_L12_4__c != null && coa.CM_L12_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_4__c);
			} else if(coa.CM_L12_5__c != null && coa.CM_L12_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_5__c);
			} else if(coa.CM_L12_6__c != null && coa.CM_L12_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_6__c);
			} else if(coa.CM_L12_7__c != null && coa.CM_L12_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_7__c);
			} else if(coa.CM_L12_8__c != null && coa.CM_L12_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_8__c);
			} else if(coa.CM_L12_9__c != null && coa.CM_L12_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_9__c);
			} else if(coa.CM_L12_10__c != null && coa.CM_L12_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L12_10__c);
			}																
		}		

		if(coa.CM_Approver_Final_Level__c == 'L13') {
			if(coa.CM_L13_1__c != null && coa.CM_L13_1__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_1__c);
			} else if(coa.CM_L13_2__c != null && coa.CM_L13_2__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_2__c);
			} else if(coa.CM_L13_3__c != null && coa.CM_L13_3__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_3__c);
			} else if(coa.CM_L13_4__c != null && coa.CM_L13_4__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_4__c);
			} else if(coa.CM_L13_5__c != null && coa.CM_L13_5__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_5__c);
			} else if(coa.CM_L13_6__c != null && coa.CM_L13_6__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_6__c);
			} else if(coa.CM_L13_7__c != null && coa.CM_L13_7__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_7__c);
			} else if(coa.CM_L13_8__c != null && coa.CM_L13_8__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_8__c);
			} else if(coa.CM_L13_9__c != null && coa.CM_L13_9__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_9__c);
			} else if(coa.CM_L13_10__c != null && coa.CM_L13_10__c.startsWith('Gr.')) {
				mapSelectedSubCategoryToFinalGroup.put(coa.CM_Sub_Category__c, coa.CM_L13_10__c);
			}																
		}				
		return mapSelectedSubCategoryToFinalGroup;
	}//end of getFinalGroupByLevel();	

	
	
	
	
	
	
	

	/*
		============ isAfter & isInsert ============ 
	*/	
	//loop all the approvers' fields to pick up the available Acronym
	public static Map<String, Set<String>> getSelectedLevelsWithAcronyms(
		COA__c coa, 
		Map<String, Set<String>> mapSelectedLevelsToAcronymSet
	) {
		if(coa.CM_L1_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L1') != null) {
				mapSelectedLevelsToAcronymSet.get('L1').add(coa.CM_L1_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L1', new Set<String>{coa.CM_L1_1__c});
			}
		}			
		if(coa.CM_L1_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L1') != null) {
				mapSelectedLevelsToAcronymSet.get('L1').add(coa.CM_L1_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L1', new Set<String>{coa.CM_L1_2__c});
			}
		}				
		
		if(coa.CM_L2_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L2') != null) {
				mapSelectedLevelsToAcronymSet.get('L2').add(coa.CM_L2_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L2', new Set<String>{coa.CM_L2_1__c});
			}
		}			
		if(coa.CM_L2_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L2') != null) {
				mapSelectedLevelsToAcronymSet.get('L2').add(coa.CM_L2_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L2', new Set<String>{coa.CM_L2_2__c});
			}
		}				

		if(coa.CM_L3_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_1__c});
			}
		}			
		if(coa.CM_L3_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_2__c});
			}
		}	
			
		if(coa.CM_L4_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L4') != null) {
				mapSelectedLevelsToAcronymSet.get('L4').add(coa.CM_L4_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L4', new Set<String>{coa.CM_L4_1__c});
			}
		}			
		if(coa.CM_L4_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L4') != null) {
				mapSelectedLevelsToAcronymSet.get('L4').add(coa.CM_L4_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L4', new Set<String>{coa.CM_L4_2__c});
			}
		}				
	
		if(coa.CM_L5_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_1__c});
			}
		}			
		if(coa.CM_L5_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_2__c});
			}
		}	
		if(coa.CM_L5_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_3__c});
			}
		}				
		if(coa.CM_L5_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_4__c});
			}
		}			
		if(coa.CM_L5_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_5__c});
			}
		}			
		if(coa.CM_L5_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_6__c});
			}
		}				
		if(coa.CM_L5_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_7__c});
			}
		}	
		if(coa.CM_L5_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_8__c});
			}
		}			
		if(coa.CM_L5_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_9__c});
			}
		}			
		if(coa.CM_L5_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L5') != null) {
				mapSelectedLevelsToAcronymSet.get('L5').add(coa.CM_L5_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L5', new Set<String>{coa.CM_L5_10__c});
			}
		}																

		if(coa.CM_L6_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_1__c});
			}
		}			
		if(coa.CM_L6_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_2__c});
			}
		}	
		if(coa.CM_L6_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_3__c});
			}
		}				
		if(coa.CM_L6_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_4__c});
			}
		}			
		if(coa.CM_L6_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_5__c});
			}
		}			
		if(coa.CM_L6_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_6__c});
			}
		}			
		if(coa.CM_L6_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_7__c});
			}
		}	
		if(coa.CM_L6_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_8__c});
			}
		}			
		if(coa.CM_L6_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_9__c});
			}
		}				
		if(coa.CM_L6_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L6') != null) {
				mapSelectedLevelsToAcronymSet.get('L6').add(coa.CM_L6_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L6', new Set<String>{coa.CM_L6_10__c});
			}
		}					
			
		if(coa.CM_L7_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_1__c});
			}
		}			
		if(coa.CM_L7_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_2__c});
			}
		}	
		if(coa.CM_L7_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_3__c});
			}
		}				
		if(coa.CM_L7_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_4__c});
			}
		}			
		if(coa.CM_L7_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_5__c});
			}
		}		
		if(coa.CM_L7_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_6__c});
			}
		}			
		if(coa.CM_L7_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_7__c});
			}
		}	
		if(coa.CM_L7_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_8__c});
			}
		}			
		if(coa.CM_L7_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_9__c});
			}
		}			
		if(coa.CM_L7_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L7') != null) {
				mapSelectedLevelsToAcronymSet.get('L7').add(coa.CM_L7_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L7', new Set<String>{coa.CM_L7_10__c});
			}
		}																

		if(coa.CM_L8_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_1__c});
			}
		}			
		if(coa.CM_L8_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_2__c});
			}
		}	
		if(coa.CM_L8_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_3__c});
			}
		}			
		if(coa.CM_L8_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_4__c});
			}
		}				
		if(coa.CM_L8_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_5__c});
			}
		}		
		if(coa.CM_L8_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_6__c});
			}
		}			
		if(coa.CM_L8_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_7__c});
			}
		}	
		if(coa.CM_L8_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_8__c});
			}
		}			
		if(coa.CM_L8_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_9__c});
			}
		}				
		if(coa.CM_L8_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L8') != null) {
				mapSelectedLevelsToAcronymSet.get('L8').add(coa.CM_L8_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L8', new Set<String>{coa.CM_L8_10__c});
			}
		}																

		if(coa.CM_L9_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_1__c});
			}
		}				
		if(coa.CM_L9_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_2__c});
			}
		}
		if(coa.CM_L9_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_3__c});
			}
		}		
		if(coa.CM_L9_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_4__c});
			}
		}			
		if(coa.CM_L9_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_5__c});
			}
		}	
		if(coa.CM_L9_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_6__c});
			}
		}			
		if(coa.CM_L9_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_7__c});
			}
		}
		if(coa.CM_L9_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_8__c});
			}
		}		
		if(coa.CM_L9_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_9__c});
			}
		}		
		if(coa.CM_L9_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L9') != null) {
				mapSelectedLevelsToAcronymSet.get('L9').add(coa.CM_L9_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L9', new Set<String>{coa.CM_L9_10__c});
			}
		}																

		if(coa.CM_L10_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_1__c});
			}
		}		
		if(coa.CM_L10_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_2__c});
			}
		}	
		if(coa.CM_L10_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_3__c});
			}
		}			
		if(coa.CM_L10_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_4__c});
			}
		}			
		if(coa.CM_L10_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_5__c});
			}
		}			
		if(coa.CM_L10_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_6__c});
			}
		}			
		if(coa.CM_L10_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_7__c});
			}
		}	
		if(coa.CM_L10_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_8__c});
			}
		}				
		if(coa.CM_L10_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_9__c});
			}
		}				
		if(coa.CM_L10_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L10') != null) {
				mapSelectedLevelsToAcronymSet.get('L10').add(coa.CM_L10_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L10', new Set<String>{coa.CM_L10_10__c});
			}
		}																	

		if(coa.CM_L11_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_1__c});
			}
		}			
		if(coa.CM_L11_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_2__c});
			}
		}		
		if(coa.CM_L11_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_3__c});
			}
		}					
		if(coa.CM_L11_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_4__c});
			}
		}				
		if(coa.CM_L11_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_5__c});
			}
		}			
		if(coa.CM_L11_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_6__c});
			}
		}					
		if(coa.CM_L11_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_7__c});
			}
		}		
		if(coa.CM_L11_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_8__c});
			}
		}				
		if(coa.CM_L11_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_9__c});
			}
		}					
		if(coa.CM_L11_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L11') != null) {
				mapSelectedLevelsToAcronymSet.get('L11').add(coa.CM_L11_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L11', new Set<String>{coa.CM_L11_10__c});
			}
		}																	

		if(coa.CM_L12_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_1__c});
			}
		}				
		if(coa.CM_L12_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_2__c});
			}
		}	
		if(coa.CM_L12_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_3__c});
			}
		}				
		if(coa.CM_L12_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_4__c});
			}
		}				
		if(coa.CM_L12_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_5__c});
			}
		}		
		if(coa.CM_L12_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_6__c});
			}
		}			
		if(coa.CM_L12_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_7__c});
			}
		}	
		if(coa.CM_L12_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_8__c});
			}
		}				
		if(coa.CM_L12_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_9__c});
			}
		}			
		if(coa.CM_L12_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L12') != null) {
				mapSelectedLevelsToAcronymSet.get('L12').add(coa.CM_L12_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L12', new Set<String>{coa.CM_L12_10__c});
			}
		}																

		if(coa.CM_L13_1__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_1__c});
			}
		}			
		if(coa.CM_L13_2__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_2__c});
			}
		}	
		if(coa.CM_L13_3__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_3__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_3__c});
			}
		}			
		if(coa.CM_L13_4__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_4__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_4__c});
			}
		}				
		if(coa.CM_L13_5__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_5__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_5__c});
			}
		}			
		if(coa.CM_L13_6__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_6__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_6__c});
			}
		}			
		if(coa.CM_L13_7__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_7__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_7__c});
			}
		}	
		if(coa.CM_L13_8__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_8__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_8__c});
			}
		}			
		if(coa.CM_L13_9__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_9__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_9__c});
			}
		}			
		if(coa.CM_L13_10__c != null) {
			if(mapSelectedLevelsToAcronymSet.get('L13') != null) {
				mapSelectedLevelsToAcronymSet.get('L13').add(coa.CM_L13_10__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L13', new Set<String>{coa.CM_L13_10__c});
			}
		}																				
		return mapSelectedLevelsToAcronymSet;
	}//end of getSelectedLevelsWithAcronyms();
	
	
	/*
		============ isBefore & isInsert ============ 
	*/	
	//query Final Approvers by Group for each selected Category
	public static Map<String, List<User>> getFinalApproverByGroup(
		//RFA__c rfa, 
		Map<String, String> mapSelectedSubCategoryToFinalGroup, 
		Map<String, List<User>> mapSelectedSubToFinalApproversByGroup,
		User runningUser
	) {
		Boolean ifGroup5 = false;
		List<User> listApproversInGr5 = null;
		Boolean ifGroup6 = false;
		for(String value : mapSelectedSubCategoryToFinalGroup.values()) {
			if(value == 'Gr.5') {
				ifGroup5 = true;
			}
			if(value == 'Gr.6') {
				ifGroup6 = true;
			}			
		}
		
		if(ifGroup5) {
			listApproversInGr5 = new List<User>();
			//Group Mapping
			for(User u : [
				Select Id, Name, Username,
				COA_Acronym__c, COA_Group__c,
				L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
				L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 				
				from User 
				where IsActive = true 
					and COA_Group__c = 'Gr.5'
					and L2_Function_E__c =: runningUser.L2_Function_E__c
					and L3_Function_E__c =: runningUser.L3_Function_E__c
					and L4_Function_E__c =: runningUser.L4_Function_E__c
					//no HR master to support mapping to L5, L6
					//and L5_Function_E__c =: runningUser.L5_Function_E__c
					//and L6_Function_E__c =: runningUser.L6_Function_E__c
			]
			) {
				listApproversInGr5.add(u);
			}	
					
		}//end of if(Gr.5);
		
		if(ifGroup5) {
			for(String key : mapSelectedSubCategoryToFinalGroup.keySet()) {
				if(mapSelectedSubCategoryToFinalGroup.get(key) == 'Gr.5') {
					mapSelectedSubToFinalApproversByGroup.put(key, listApproversInGr5);
				}
			}
		}
				
		return mapSelectedSubToFinalApproversByGroup;
	}	
	
	
	
	/*
		============ isAfter & isInsert ============ 
	*/	
	//only Gr.5 at this time
	public static Map<String, List<User>> getSelectedLevelsToApproversByGroup(
		//RFA__c rfa, 
		//Map<String, String> mapSelectedSubCategoryToFinalGroup, 
		Map<String, String> mapSelectedLevelsToGroup,
		//Map<String, List<User>> mapSelectedSubToFinalApproversByGroup,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup,
		User runningUser
	) {
		Boolean ifGroup5 = false;
		List<User> listApproversInGr5 = null;
		Boolean ifGroup6 = false;
		for(String value : mapSelectedLevelsToGroup.values()) {
			if(value == 'Gr.5') {
				ifGroup5 = true;
			}
			if(value == 'Gr.6') {
				ifGroup6 = true;
			}			
		}
		
		if(ifGroup5) {
			listApproversInGr5 = new List<User>();
			//Group Mapping
			for(User u : [
				Select Id, Name, Username,
				COA_Acronym__c, COA_Group__c,
				L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
				L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 				
				from User 
				where IsActive = true 
					and COA_Group__c = 'Gr.5'
					and L2_Function_E__c =: runningUser.L2_Function_E__c
					and L3_Function_E__c =: runningUser.L3_Function_E__c
					and L4_Function_E__c =: runningUser.L4_Function_E__c
					//no HR master to support mapping to L5, L6
					//and L5_Function_E__c =: runningUser.L5_Function_E__c
					//and L6_Function_E__c =: runningUser.L6_Function_E__c
			]
			) {
				listApproversInGr5.add(u);
			}	
					
		}//end of if(Gr.5);
		
		if(ifGroup5) {
			for(String key : mapSelectedLevelsToGroup.keySet()) {
				if(mapSelectedLevelsToGroup.get(key) == 'Gr.5') {
					mapSelectedLevelsToApproversByGroup.put(key, listApproversInGr5);
				}
			}
		}
				
		return mapSelectedLevelsToApproversByGroup;
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