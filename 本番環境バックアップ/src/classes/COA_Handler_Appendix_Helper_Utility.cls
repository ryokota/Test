public with sharing class COA_Handler_Appendix_Helper_Utility {
	
	
	/*
		============ isBefore ============ 
	*/
	
	//loop all the approvers' fields to pick up the Acronym/Group Mapping Level
	public static Map<String, String> getAcronymAndGroupToMappingLevel(
		COA__c coa, 
		Map<String, String> mapAcronymAndGroupToMappingLevel
	) {
		if(coa.CM_L1_Mapping_Level__c != null) {
			if(coa.CM_L1_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L1_1__c, coa.CM_L1_Mapping_Level__c);
			} 
			
			if(coa.CM_L1_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L1_2__c, coa.CM_L1_Mapping_Level__c);
			} 			
		}			
			
		if(coa.CM_L2_Mapping_Level__c != null) {
			if(coa.CM_L2_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L2_1__c, coa.CM_L2_Mapping_Level__c);
			} 
			
			if(coa.CM_L2_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L2_2__c, coa.CM_L2_Mapping_Level__c);
			} 			
		}								

		if(coa.CM_L3_Mapping_Level__c != null) {
			if(coa.CM_L3_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L3_1__c, coa.CM_L3_Mapping_Level__c);
			} 
			
			if(coa.CM_L3_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L3_2__c, coa.CM_L3_Mapping_Level__c);
			} 			
		}	
			
		if(coa.CM_L4_Mapping_Level__c != null) {
			if(coa.CM_L4_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L4_1__c, coa.CM_L4_Mapping_Level__c);
			} 
			
			if(coa.CM_L4_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L4_2__c, coa.CM_L4_Mapping_Level__c);
			} 			
		}					
	
		if(coa.CM_L5_Mapping_Level__c != null) {
			if(coa.CM_L5_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_1__c, coa.CM_L5_Mapping_Level__c);
			} 			
			if(coa.CM_L5_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_2__c, coa.CM_L5_Mapping_Level__c);
			} 		
			if(coa.CM_L5_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_3__c, coa.CM_L5_Mapping_Level__c);
			} 			
			if(coa.CM_L5_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_4__c, coa.CM_L5_Mapping_Level__c);
			} 	
			if(coa.CM_L5_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_5__c, coa.CM_L5_Mapping_Level__c);
			} 		
			if(coa.CM_L5_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_6__c, coa.CM_L5_Mapping_Level__c);
			} 			
			if(coa.CM_L5_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_7__c, coa.CM_L5_Mapping_Level__c);
			} 		
			if(coa.CM_L5_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_8__c, coa.CM_L5_Mapping_Level__c);
			} 			
			if(coa.CM_L5_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_9__c, coa.CM_L5_Mapping_Level__c);
			} 	
			if(coa.CM_L5_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L5_10__c, coa.CM_L5_Mapping_Level__c);
			} 										
		}								

		if(coa.CM_L6_Mapping_Level__c != null) {
			if(coa.CM_L6_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_1__c, coa.CM_L6_Mapping_Level__c);
			} 			
			if(coa.CM_L6_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_2__c, coa.CM_L6_Mapping_Level__c);
			} 		
			if(coa.CM_L6_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_3__c, coa.CM_L6_Mapping_Level__c);
			} 			
			if(coa.CM_L6_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_4__c, coa.CM_L6_Mapping_Level__c);
			} 	
			if(coa.CM_L6_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_5__c, coa.CM_L6_Mapping_Level__c);
			} 		
			if(coa.CM_L6_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_6__c, coa.CM_L6_Mapping_Level__c);
			} 			
			if(coa.CM_L6_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_7__c, coa.CM_L6_Mapping_Level__c);
			} 		
			if(coa.CM_L6_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_8__c, coa.CM_L6_Mapping_Level__c);
			} 			
			if(coa.CM_L6_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_9__c, coa.CM_L6_Mapping_Level__c);
			} 	
			if(coa.CM_L6_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L6_10__c, coa.CM_L6_Mapping_Level__c);
			} 										
		}					
			
		if(coa.CM_L7_Mapping_Level__c != null) {
			if(coa.CM_L7_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_1__c, coa.CM_L7_Mapping_Level__c);
			} 			
			if(coa.CM_L7_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_2__c, coa.CM_L7_Mapping_Level__c);
			} 		
			if(coa.CM_L7_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_3__c, coa.CM_L7_Mapping_Level__c);
			} 			
			if(coa.CM_L7_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_4__c, coa.CM_L7_Mapping_Level__c);
			} 	
			if(coa.CM_L7_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_5__c, coa.CM_L7_Mapping_Level__c);
			} 		
			if(coa.CM_L7_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_6__c, coa.CM_L7_Mapping_Level__c);
			} 			
			if(coa.CM_L7_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_7__c, coa.CM_L7_Mapping_Level__c);
			} 		
			if(coa.CM_L7_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_8__c, coa.CM_L7_Mapping_Level__c);
			} 			
			if(coa.CM_L7_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_9__c, coa.CM_L7_Mapping_Level__c);
			} 	
			if(coa.CM_L7_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L7_10__c, coa.CM_L7_Mapping_Level__c);
			} 										
		}															

		if(coa.CM_L8_Mapping_Level__c != null) {
			if(coa.CM_L8_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_1__c, coa.CM_L8_Mapping_Level__c);
			} 			
			if(coa.CM_L8_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_2__c, coa.CM_L8_Mapping_Level__c);
			} 		
			if(coa.CM_L8_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_3__c, coa.CM_L8_Mapping_Level__c);
			} 			
			if(coa.CM_L8_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_4__c, coa.CM_L8_Mapping_Level__c);
			} 	
			if(coa.CM_L8_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_5__c, coa.CM_L8_Mapping_Level__c);
			} 		
			if(coa.CM_L8_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_6__c, coa.CM_L8_Mapping_Level__c);
			} 			
			if(coa.CM_L8_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_7__c, coa.CM_L8_Mapping_Level__c);
			} 		
			if(coa.CM_L8_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_8__c, coa.CM_L8_Mapping_Level__c);
			} 			
			if(coa.CM_L8_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_9__c, coa.CM_L8_Mapping_Level__c);
			} 	
			if(coa.CM_L8_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L8_10__c, coa.CM_L8_Mapping_Level__c);
			} 										
		}																

		if(coa.CM_L9_Mapping_Level__c != null) {
			if(coa.CM_L9_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_1__c, coa.CM_L9_Mapping_Level__c);
			} 			
			if(coa.CM_L9_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_2__c, coa.CM_L9_Mapping_Level__c);
			} 		
			if(coa.CM_L9_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_3__c, coa.CM_L9_Mapping_Level__c);
			} 			
			if(coa.CM_L9_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_4__c, coa.CM_L9_Mapping_Level__c);
			} 	
			if(coa.CM_L9_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_5__c, coa.CM_L9_Mapping_Level__c);
			} 		
			if(coa.CM_L9_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_6__c, coa.CM_L9_Mapping_Level__c);
			} 			
			if(coa.CM_L9_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_7__c, coa.CM_L9_Mapping_Level__c);
			} 		
			if(coa.CM_L9_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_8__c, coa.CM_L9_Mapping_Level__c);
			} 			
			if(coa.CM_L9_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_9__c, coa.CM_L9_Mapping_Level__c);
			} 	
			if(coa.CM_L9_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L9_10__c, coa.CM_L9_Mapping_Level__c);
			} 										
		}															

		if(coa.CM_L10_Mapping_Level__c != null) {
			if(coa.CM_L10_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_1__c, coa.CM_L10_Mapping_Level__c);
			} 			
			if(coa.CM_L10_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_2__c, coa.CM_L10_Mapping_Level__c);
			} 		
			if(coa.CM_L10_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_3__c, coa.CM_L10_Mapping_Level__c);
			} 			
			if(coa.CM_L10_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_4__c, coa.CM_L10_Mapping_Level__c);
			} 	
			if(coa.CM_L10_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_5__c, coa.CM_L10_Mapping_Level__c);
			} 		
			if(coa.CM_L10_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_6__c, coa.CM_L10_Mapping_Level__c);
			} 			
			if(coa.CM_L10_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_7__c, coa.CM_L10_Mapping_Level__c);
			} 		
			if(coa.CM_L10_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_8__c, coa.CM_L10_Mapping_Level__c);
			} 			
			if(coa.CM_L10_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_9__c, coa.CM_L10_Mapping_Level__c);
			} 	
			if(coa.CM_L10_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L10_10__c, coa.CM_L10_Mapping_Level__c);
			} 										
		}																	

		if(coa.CM_L11_Mapping_Level__c != null) {
			if(coa.CM_L11_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_1__c, coa.CM_L11_Mapping_Level__c);
			} 			
			if(coa.CM_L11_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_2__c, coa.CM_L11_Mapping_Level__c);
			} 		
			if(coa.CM_L11_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_3__c, coa.CM_L11_Mapping_Level__c);
			} 			
			if(coa.CM_L11_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_4__c, coa.CM_L11_Mapping_Level__c);
			} 	
			if(coa.CM_L11_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_5__c, coa.CM_L11_Mapping_Level__c);
			} 		
			if(coa.CM_L11_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_6__c, coa.CM_L11_Mapping_Level__c);
			} 			
			if(coa.CM_L11_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_7__c, coa.CM_L11_Mapping_Level__c);
			} 		
			if(coa.CM_L11_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_8__c, coa.CM_L11_Mapping_Level__c);
			} 			
			if(coa.CM_L11_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_9__c, coa.CM_L11_Mapping_Level__c);
			} 	
			if(coa.CM_L11_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L11_10__c, coa.CM_L11_Mapping_Level__c);
			} 										
		}																

		if(coa.CM_L12_Mapping_Level__c != null) {
			if(coa.CM_L12_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_1__c, coa.CM_L12_Mapping_Level__c);
			} 			
			if(coa.CM_L12_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_2__c, coa.CM_L12_Mapping_Level__c);
			} 		
			if(coa.CM_L12_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_3__c, coa.CM_L12_Mapping_Level__c);
			} 			
			if(coa.CM_L12_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_4__c, coa.CM_L12_Mapping_Level__c);
			} 	
			if(coa.CM_L12_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_5__c, coa.CM_L12_Mapping_Level__c);
			} 		
			if(coa.CM_L12_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_6__c, coa.CM_L12_Mapping_Level__c);
			} 			
			if(coa.CM_L12_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_7__c, coa.CM_L12_Mapping_Level__c);
			} 		
			if(coa.CM_L12_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_8__c, coa.CM_L12_Mapping_Level__c);
			} 			
			if(coa.CM_L12_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_9__c, coa.CM_L12_Mapping_Level__c);
			} 	
			if(coa.CM_L12_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L12_10__c, coa.CM_L12_Mapping_Level__c);
			} 										
		}																

		if(coa.CM_L13_Mapping_Level__c != null) {
			if(coa.CM_L13_1__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_1__c, coa.CM_L13_Mapping_Level__c);
			} 			
			if(coa.CM_L13_2__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_2__c, coa.CM_L13_Mapping_Level__c);
			} 		
			if(coa.CM_L13_3__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_3__c, coa.CM_L13_Mapping_Level__c);
			} 			
			if(coa.CM_L13_4__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_4__c, coa.CM_L13_Mapping_Level__c);
			} 	
			if(coa.CM_L13_5__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_5__c, coa.CM_L13_Mapping_Level__c);
			} 		
			if(coa.CM_L13_6__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_6__c, coa.CM_L13_Mapping_Level__c);
			} 			
			if(coa.CM_L13_7__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_7__c, coa.CM_L13_Mapping_Level__c);
			} 		
			if(coa.CM_L13_8__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_8__c, coa.CM_L13_Mapping_Level__c);
			} 			
			if(coa.CM_L13_9__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_9__c, coa.CM_L13_Mapping_Level__c);
			} 	
			if(coa.CM_L13_10__c != null) {
				mapAcronymAndGroupToMappingLevel.put(coa.CM_L13_10__c, coa.CM_L13_Mapping_Level__c);
			} 										
		}																				
		return mapAcronymAndGroupToMappingLevel;
	}	
	

	/*
		============ isBefore & isInsert ============ 
	*/
	
	//loop all the approvers' fields to pick up the available Acronym
	public static Map<String, Set<String>> getSelectedLevelsWithAcronyms(
		COA__c coa, 
		Map<String, Set<String>> mapSelectedLevelsToAcronymSet
	) {
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

		if(coa.CM_L3_1__c != null && !coa.CM_L3_1__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_1__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_1__c});
			}
		}			
		if(coa.CM_L3_2__c != null && !coa.CM_L3_2__c.startsWith('Gr.')) {
			if(mapSelectedLevelsToAcronymSet.get('L3') != null) {
				mapSelectedLevelsToAcronymSet.get('L3').add(coa.CM_L3_2__c);
			} else {
				mapSelectedLevelsToAcronymSet.put('L3', new Set<String>{coa.CM_L3_2__c});
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
	}
	

	public static Map<String, String> getSelectedLevelsWithGroup(
		COA__c coa, 
		Map<String, String> mapSelectedLevelsToGroup
	) {
		if(coa.CM_L1_1__c != null && coa.CM_L1_1__c.startsWith('Gr.')) {			
			mapSelectedLevelsToGroup.put('L1', coa.CM_L1_1__c);
		} else if(coa.CM_L1_2__c != null && coa.CM_L1_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L1', coa.CM_L1_2__c);		
		}
		
		if(coa.CM_L2_1__c != null && coa.CM_L2_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L2', coa.CM_L2_1__c);
		} else if(coa.CM_L2_2__c != null && coa.CM_L2_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L2', coa.CM_L2_2__c);
		}				

		if(coa.CM_L3_1__c != null && coa.CM_L3_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L3', coa.CM_L3_1__c);
		} else if(coa.CM_L3_2__c != null && coa.CM_L3_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L3', coa.CM_L3_2__c);
		}	
			
		if(coa.CM_L4_1__c != null && coa.CM_L4_1__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L4', coa.CM_L4_1__c);
		} else if(coa.CM_L4_2__c != null && coa.CM_L4_2__c.startsWith('Gr.')) {
			mapSelectedLevelsToGroup.put('L4', coa.CM_L4_2__c);
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


	//Only work for one COA rule with Random order
	//reversed order to Level for using current Arch.  order 1 -> L13, 2 -> L12
	public static Map<String, String> getSelectedLevelsWithGroupFromReversedOrder(
		COA__c coa, 
		Map<String, String> mapSelectedLevelsToGroup
	) {
		if(coa.CM_L1_Order__c != null) {
			String L1 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L1_Order__c);	
			
			if(L1 != null) {	
				if(coa.CM_L1_1__c != null && coa.CM_L1_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L1, coa.CM_L1_1__c);
				} else if(coa.CM_L1_2__c != null && coa.CM_L1_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L1, coa.CM_L1_2__c);		
				}
			}
		}
		
		if(coa.CM_L2_Order__c != null) {
			String L2 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L2_Order__c);	
			
			if(L2 != null) {	
				if(coa.CM_L2_1__c != null && coa.CM_L2_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L2, coa.CM_L2_1__c);
				} else if(coa.CM_L2_2__c != null && coa.CM_L2_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L2, coa.CM_L2_2__c);		
				}
			}
		}			

		if(coa.CM_L3_Order__c != null) {
			String L3 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L3_Order__c);	
			
			if(L3 != null) {	
				if(coa.CM_L3_1__c != null && coa.CM_L3_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L3, coa.CM_L3_1__c);
				} else if(coa.CM_L3_2__c != null && coa.CM_L3_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L3, coa.CM_L3_2__c);		
				}
			}
		}
			
		if(coa.CM_L4_Order__c != null) {
			String L4 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L4_Order__c);	
			
			if(L4 != null) {	
				if(coa.CM_L4_1__c != null && coa.CM_L4_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L4, coa.CM_L4_1__c);
				} else if(coa.CM_L4_2__c != null && coa.CM_L4_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L4, coa.CM_L4_2__c);		
				}
			}
		}			
	
		if(coa.CM_L5_Order__c != null) {
			String L5 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L5_Order__c);	
			
			if(L5 != null) {	
				if(coa.CM_L5_1__c != null && coa.CM_L5_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_1__c);
				} else if(coa.CM_L5_2__c != null && coa.CM_L5_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_2__c);		
				} else if(coa.CM_L5_3__c != null && coa.CM_L5_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_3__c);
				} else if(coa.CM_L5_4__c != null && coa.CM_L5_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_4__c);		
				} else if(coa.CM_L5_5__c != null && coa.CM_L5_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_5__c);
				} else if(coa.CM_L5_6__c != null && coa.CM_L5_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_6__c);		
				} else if(coa.CM_L5_7__c != null && coa.CM_L5_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_7__c);
				} else if(coa.CM_L5_8__c != null && coa.CM_L5_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_8__c);		
				} else if(coa.CM_L5_9__c != null && coa.CM_L5_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_9__c);
				} else if(coa.CM_L5_10__c != null && coa.CM_L5_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L5, coa.CM_L5_10__c);		
				}					
			}
		}																

		if(coa.CM_L6_Order__c != null) {
			String L6 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L6_Order__c);	
			
			if(L6 != null) {	
				if(coa.CM_L6_1__c != null && coa.CM_L6_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_1__c);
				} else if(coa.CM_L6_2__c != null && coa.CM_L6_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_2__c);		
				} else if(coa.CM_L6_3__c != null && coa.CM_L6_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_3__c);
				} else if(coa.CM_L6_4__c != null && coa.CM_L6_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_4__c);		
				} else if(coa.CM_L6_5__c != null && coa.CM_L6_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_5__c);
				} else if(coa.CM_L6_6__c != null && coa.CM_L6_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_6__c);		
				} else if(coa.CM_L6_7__c != null && coa.CM_L6_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_7__c);
				} else if(coa.CM_L6_8__c != null && coa.CM_L6_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_8__c);		
				} else if(coa.CM_L6_9__c != null && coa.CM_L6_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_9__c);
				} else if(coa.CM_L6_10__c != null && coa.CM_L6_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L6, coa.CM_L6_10__c);		
				}					
			}
		}			
			
		if(coa.CM_L7_Order__c != null) {
			String L7 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L7_Order__c);	
			
			if(L7 != null) {	
				if(coa.CM_L7_1__c != null && coa.CM_L7_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_1__c);
				} else if(coa.CM_L7_2__c != null && coa.CM_L7_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_2__c);		
				} else if(coa.CM_L7_3__c != null && coa.CM_L7_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_3__c);
				} else if(coa.CM_L7_4__c != null && coa.CM_L7_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_4__c);		
				} else if(coa.CM_L7_5__c != null && coa.CM_L7_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_5__c);
				} else if(coa.CM_L7_6__c != null && coa.CM_L7_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_6__c);		
				} else if(coa.CM_L7_7__c != null && coa.CM_L7_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_7__c);
				} else if(coa.CM_L7_8__c != null && coa.CM_L7_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_8__c);		
				} else if(coa.CM_L7_9__c != null && coa.CM_L7_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_9__c);
				} else if(coa.CM_L7_10__c != null && coa.CM_L7_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L7, coa.CM_L7_10__c);		
				}					
			}
		}															

		if(coa.CM_L8_Order__c != null) {
			String L8 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L8_Order__c);	
			
			if(L8 != null) {	
				if(coa.CM_L8_1__c != null && coa.CM_L8_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_1__c);
				} else if(coa.CM_L8_2__c != null && coa.CM_L8_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_2__c);		
				} else if(coa.CM_L8_3__c != null && coa.CM_L8_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_3__c);
				} else if(coa.CM_L8_4__c != null && coa.CM_L8_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_4__c);		
				} else if(coa.CM_L8_5__c != null && coa.CM_L8_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_5__c);
				} else if(coa.CM_L8_6__c != null && coa.CM_L8_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_6__c);		
				} else if(coa.CM_L8_7__c != null && coa.CM_L8_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_7__c);
				} else if(coa.CM_L8_8__c != null && coa.CM_L8_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_8__c);		
				} else if(coa.CM_L8_9__c != null && coa.CM_L8_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_9__c);
				} else if(coa.CM_L8_10__c != null && coa.CM_L8_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L8, coa.CM_L8_10__c);		
				}					
			}
		}
		
		
		
		if(coa.CM_L9_Order__c != null) {
			String L9 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L9_Order__c);	
			
			if(L9 != null) {	
				if(coa.CM_L9_1__c != null && coa.CM_L9_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_1__c);
				} else if(coa.CM_L9_2__c != null && coa.CM_L9_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_2__c);		
				} else if(coa.CM_L9_3__c != null && coa.CM_L9_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_3__c);
				} else if(coa.CM_L9_4__c != null && coa.CM_L9_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_4__c);		
				} else if(coa.CM_L9_5__c != null && coa.CM_L9_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_5__c);
				} else if(coa.CM_L9_6__c != null && coa.CM_L9_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_6__c);		
				} else if(coa.CM_L9_7__c != null && coa.CM_L9_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_7__c);
				} else if(coa.CM_L9_8__c != null && coa.CM_L9_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_8__c);		
				} else if(coa.CM_L9_9__c != null && coa.CM_L9_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_9__c);
				} else if(coa.CM_L9_10__c != null && coa.CM_L9_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L9, coa.CM_L9_10__c);		
				}					
			}
		}											

		if(coa.CM_L10_Order__c != null) {
			String L10 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L10_Order__c);	
			
			if(L10 != null) {	
				if(coa.CM_L10_1__c != null && coa.CM_L10_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_1__c);
				} else if(coa.CM_L10_2__c != null && coa.CM_L10_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_2__c);		
				} else if(coa.CM_L10_3__c != null && coa.CM_L10_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_3__c);
				} else if(coa.CM_L10_4__c != null && coa.CM_L10_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_4__c);		
				} else if(coa.CM_L10_5__c != null && coa.CM_L10_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_5__c);
				} else if(coa.CM_L10_6__c != null && coa.CM_L10_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_6__c);		
				} else if(coa.CM_L10_7__c != null && coa.CM_L10_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_7__c);
				} else if(coa.CM_L10_8__c != null && coa.CM_L10_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_8__c);		
				} else if(coa.CM_L10_9__c != null && coa.CM_L10_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_9__c);
				} else if(coa.CM_L10_10__c != null && coa.CM_L10_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L10, coa.CM_L10_10__c);		
				}					
			}
		}														

		if(coa.CM_L11_Order__c != null) {
			String L11 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L11_Order__c);	
			
			if(L11 != null) {	
				if(coa.CM_L11_1__c != null && coa.CM_L11_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_1__c);
				} else if(coa.CM_L11_2__c != null && coa.CM_L11_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_2__c);		
				} else if(coa.CM_L11_3__c != null && coa.CM_L11_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_3__c);
				} else if(coa.CM_L11_4__c != null && coa.CM_L11_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_4__c);		
				} else if(coa.CM_L11_5__c != null && coa.CM_L11_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_5__c);
				} else if(coa.CM_L11_6__c != null && coa.CM_L11_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_6__c);		
				} else if(coa.CM_L11_7__c != null && coa.CM_L11_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_7__c);
				} else if(coa.CM_L11_8__c != null && coa.CM_L11_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_8__c);		
				} else if(coa.CM_L11_9__c != null && coa.CM_L11_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_9__c);
				} else if(coa.CM_L11_10__c != null && coa.CM_L11_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L11, coa.CM_L11_10__c);		
				}					
			}
		}												

		if(coa.CM_L12_Order__c != null) {
			String L12 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L12_Order__c);	
			
			if(L12 != null) {	
				if(coa.CM_L12_1__c != null && coa.CM_L12_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_1__c);
				} else if(coa.CM_L12_2__c != null && coa.CM_L12_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_2__c);		
				} else if(coa.CM_L12_3__c != null && coa.CM_L12_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_3__c);
				} else if(coa.CM_L12_4__c != null && coa.CM_L12_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_4__c);		
				} else if(coa.CM_L12_5__c != null && coa.CM_L12_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_5__c);
				} else if(coa.CM_L12_6__c != null && coa.CM_L12_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_6__c);		
				} else if(coa.CM_L12_7__c != null && coa.CM_L12_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_7__c);
				} else if(coa.CM_L12_8__c != null && coa.CM_L12_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_8__c);		
				} else if(coa.CM_L12_9__c != null && coa.CM_L12_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_9__c);
				} else if(coa.CM_L12_10__c != null && coa.CM_L12_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L12, coa.CM_L12_10__c);		
				}					
			}
		}												

		if(coa.CM_L13_Order__c != null) {
			String L13 = Utility_Helper_String.getLevelWithReversedOrder(coa.CM_L13_Order__c);	
			
			if(L13 != null) {	
				if(coa.CM_L13_1__c != null && coa.CM_L13_1__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_1__c);
				} else if(coa.CM_L13_2__c != null && coa.CM_L13_2__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_2__c);		
				} else if(coa.CM_L13_3__c != null && coa.CM_L13_3__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_3__c);
				} else if(coa.CM_L13_4__c != null && coa.CM_L13_4__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_4__c);		
				} else if(coa.CM_L13_5__c != null && coa.CM_L13_5__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_5__c);
				} else if(coa.CM_L13_6__c != null && coa.CM_L13_6__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_6__c);		
				} else if(coa.CM_L13_7__c != null && coa.CM_L13_7__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_7__c);
				} else if(coa.CM_L13_8__c != null && coa.CM_L13_8__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_8__c);		
				} else if(coa.CM_L13_9__c != null && coa.CM_L13_9__c.startsWith('Gr.')) {			
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_9__c);
				} else if(coa.CM_L13_10__c != null && coa.CM_L13_10__c.startsWith('Gr.')) {
					mapSelectedLevelsToGroup.put(L13, coa.CM_L13_10__c);		
				}					
			}
		}	
																					
		return mapSelectedLevelsToGroup;
	}//end of ;






	/*
		============ isAfter & isInsert ============ 
	*/
	//can return listRFAApproverToInsert for batch RFAs
	public static void insertApproversByLevels(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup 
	) {
		List<RFAUserRole__c> listRFAApproverToInsert = new List<RFAUserRole__c>();
		
		Integer intApprovalOrder = 1;
		
		Set<Id> setExistingApproverIds = new Set<Id>();
		setExistingApproverIds.add(rfa.CreatedById);
		
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L13') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') && mapSelectedLevelsToApproversByAcronym.get('L13') != null && mapSelectedLevelsToApproversByAcronym.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L13') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L13')  && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') || mapSelectedLevelsToApproversByGroup.containsKey('L12')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') && mapSelectedLevelsToApproversByAcronym.get('L12') != null && mapSelectedLevelsToApproversByAcronym.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L12') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L12') && mapSelectedLevelsToApproversByGroup.get('L12') != null && mapSelectedLevelsToApproversByGroup.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}			
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L11') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L11')  && mapSelectedLevelsToApproversByAcronym.get('L11') != null && mapSelectedLevelsToApproversByAcronym.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L11')  && mapSelectedLevelsToApproversByGroup.get('L11') != null && mapSelectedLevelsToApproversByGroup.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') || mapSelectedLevelsToApproversByGroup.containsKey('L10')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') && mapSelectedLevelsToApproversByAcronym.get('L10') != null && mapSelectedLevelsToApproversByAcronym.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L10') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L10') && mapSelectedLevelsToApproversByGroup.get('L10') != null && mapSelectedLevelsToApproversByGroup.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}		
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}						

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') || mapSelectedLevelsToApproversByGroup.containsKey('L9')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') && mapSelectedLevelsToApproversByAcronym.get('L9') != null && mapSelectedLevelsToApproversByAcronym.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L9') && mapSelectedLevelsToApproversByGroup.get('L9') != null && mapSelectedLevelsToApproversByGroup.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') || mapSelectedLevelsToApproversByGroup.containsKey('L8') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') && mapSelectedLevelsToApproversByAcronym.get('L8') != null && mapSelectedLevelsToApproversByAcronym.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L8') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L8') && mapSelectedLevelsToApproversByGroup.get('L8') != null && mapSelectedLevelsToApproversByGroup.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}			

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') || mapSelectedLevelsToApproversByGroup.containsKey('L7')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') && mapSelectedLevelsToApproversByAcronym.get('L7') != null && mapSelectedLevelsToApproversByAcronym.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L7') && mapSelectedLevelsToApproversByGroup.get('L7') != null && mapSelectedLevelsToApproversByGroup.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') || mapSelectedLevelsToApproversByGroup.containsKey('L6')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') && mapSelectedLevelsToApproversByAcronym.get('L6') != null && mapSelectedLevelsToApproversByAcronym.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L6') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L6') && mapSelectedLevelsToApproversByGroup.get('L6') != null && mapSelectedLevelsToApproversByGroup.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') || mapSelectedLevelsToApproversByGroup.containsKey('L5') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') && mapSelectedLevelsToApproversByAcronym.get('L5') != null && mapSelectedLevelsToApproversByAcronym.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L5')  && mapSelectedLevelsToApproversByGroup.get('L5') != null && mapSelectedLevelsToApproversByGroup.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') || mapSelectedLevelsToApproversByGroup.containsKey('L4')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L4')  && mapSelectedLevelsToApproversByAcronym.get('L4') != null && mapSelectedLevelsToApproversByAcronym.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L4') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L4') && mapSelectedLevelsToApproversByGroup.get('L4') != null && mapSelectedLevelsToApproversByGroup.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') || mapSelectedLevelsToApproversByGroup.containsKey('L3')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') && mapSelectedLevelsToApproversByAcronym.get('L3') != null && mapSelectedLevelsToApproversByAcronym.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L3') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L3') && mapSelectedLevelsToApproversByGroup.get('L3') != null && mapSelectedLevelsToApproversByGroup.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') || mapSelectedLevelsToApproversByGroup.containsKey('L2')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') && mapSelectedLevelsToApproversByAcronym.get('L2') != null && mapSelectedLevelsToApproversByAcronym.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L2') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L2') && mapSelectedLevelsToApproversByGroup.get('L2') != null && mapSelectedLevelsToApproversByGroup.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') || mapSelectedLevelsToApproversByGroup.containsKey('L1') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') && mapSelectedLevelsToApproversByAcronym.get('L1') != null && mapSelectedLevelsToApproversByAcronym.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L1') && mapSelectedLevelsToApproversByGroup.get('L1') != null && mapSelectedLevelsToApproversByGroup.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}								
			
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0 ) {
			insert listRFAApproverToInsert;
		}			
	}//end of insertApproversByLevels();
	
	
	
	
	public static void insertApproversByLevels_B1ToB7OrB8WithTypeD(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup,
		List<User> listApprovers,
		List<User> listELTApprovers,
		List<user> listInfoCopyUsers
	) {
		List<RFAUserRole__c> listRFAApproverToInsert = new List<RFAUserRole__c>();
		
		Integer intApprovalOrder = 1;
		
		Set<Id> setExistingApproverIds = new Set<Id>();
		setExistingApproverIds.add(rfa.CreatedById);
		
		if(listELTApprovers != null && listELTApprovers.size() > 0) {
			for(User u : listELTApprovers ) {
				setExistingApproverIds.add(u.Id);
			}
		}
		
		Boolean notAddedTypeDYet = true;
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L13') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') && mapSelectedLevelsToApproversByAcronym.get('L13') != null && mapSelectedLevelsToApproversByAcronym.get('L13').size() > 0) {				
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L13') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L13')  && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') || mapSelectedLevelsToApproversByGroup.containsKey('L12')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') && mapSelectedLevelsToApproversByAcronym.get('L12') != null && mapSelectedLevelsToApproversByAcronym.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L12') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L12') && mapSelectedLevelsToApproversByGroup.get('L12') != null && mapSelectedLevelsToApproversByGroup.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}		
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}			
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L11') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L11')  && mapSelectedLevelsToApproversByAcronym.get('L11') != null && mapSelectedLevelsToApproversByAcronym.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L11')  && mapSelectedLevelsToApproversByGroup.get('L11') != null && mapSelectedLevelsToApproversByGroup.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') || mapSelectedLevelsToApproversByGroup.containsKey('L10')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') && mapSelectedLevelsToApproversByAcronym.get('L10') != null && mapSelectedLevelsToApproversByAcronym.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L10') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L10') && mapSelectedLevelsToApproversByGroup.get('L10') != null && mapSelectedLevelsToApproversByGroup.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}		
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}						

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') || mapSelectedLevelsToApproversByGroup.containsKey('L9')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') && mapSelectedLevelsToApproversByAcronym.get('L9') != null && mapSelectedLevelsToApproversByAcronym.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L9') && mapSelectedLevelsToApproversByGroup.get('L9') != null && mapSelectedLevelsToApproversByGroup.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') || mapSelectedLevelsToApproversByGroup.containsKey('L8') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') && mapSelectedLevelsToApproversByAcronym.get('L8') != null && mapSelectedLevelsToApproversByAcronym.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L8') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L8') && mapSelectedLevelsToApproversByGroup.get('L8') != null && mapSelectedLevelsToApproversByGroup.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}			

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') || mapSelectedLevelsToApproversByGroup.containsKey('L7')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') && mapSelectedLevelsToApproversByAcronym.get('L7') != null && mapSelectedLevelsToApproversByAcronym.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L7') && mapSelectedLevelsToApproversByGroup.get('L7') != null && mapSelectedLevelsToApproversByGroup.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') || mapSelectedLevelsToApproversByGroup.containsKey('L6')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') && mapSelectedLevelsToApproversByAcronym.get('L6') != null && mapSelectedLevelsToApproversByAcronym.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L6') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L6') && mapSelectedLevelsToApproversByGroup.get('L6') != null && mapSelectedLevelsToApproversByGroup.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') || mapSelectedLevelsToApproversByGroup.containsKey('L5') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') && mapSelectedLevelsToApproversByAcronym.get('L5') != null && mapSelectedLevelsToApproversByAcronym.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L5')  && mapSelectedLevelsToApproversByGroup.get('L5') != null && mapSelectedLevelsToApproversByGroup.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') || mapSelectedLevelsToApproversByGroup.containsKey('L4')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L4')  && mapSelectedLevelsToApproversByAcronym.get('L4') != null && mapSelectedLevelsToApproversByAcronym.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L4') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L4') && mapSelectedLevelsToApproversByGroup.get('L4') != null && mapSelectedLevelsToApproversByGroup.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') || mapSelectedLevelsToApproversByGroup.containsKey('L3')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') && mapSelectedLevelsToApproversByAcronym.get('L3') != null && mapSelectedLevelsToApproversByAcronym.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L3') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L3') && mapSelectedLevelsToApproversByGroup.get('L3') != null && mapSelectedLevelsToApproversByGroup.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') || mapSelectedLevelsToApproversByGroup.containsKey('L2')) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') && mapSelectedLevelsToApproversByAcronym.get('L2') != null && mapSelectedLevelsToApproversByAcronym.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L2') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L2') && mapSelectedLevelsToApproversByGroup.get('L2') != null && mapSelectedLevelsToApproversByGroup.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') || mapSelectedLevelsToApproversByGroup.containsKey('L1') ) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') && mapSelectedLevelsToApproversByAcronym.get('L1') != null && mapSelectedLevelsToApproversByAcronym.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
				//intApprovalOrder++;
			}
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L1') && mapSelectedLevelsToApproversByGroup.get('L1') != null && mapSelectedLevelsToApproversByGroup.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		
		
		if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
			Boolean hasApproverAdded = false;
			for(User u : listApprovers) {
				if(!setExistingApproverIds.contains(u.Id)) {
					hasApproverAdded = true;	
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = intApprovalOrder;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
					listRFAApproverToInsert.add(approver);	
						
					setExistingApproverIds.add(u.Id);					
				}					
			}
			notAddedTypeDYet = false;
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		
		
		if(listELTApprovers != null && listELTApprovers.size() > 0) {
			for(User u : listELTApprovers) {
						
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = u.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = intApprovalOrder;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
				listRFAApproverToInsert.add(approver);					
			}
		}
		
													
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0 ) {
			insert listRFAApproverToInsert;
		}	
		
		
		List<RFAUserRole__c> listRFAInfoCopyToInsert = new List<RFAUserRole__c>();
		
		//Info Copy is not in the Approver List
		if(listInfoCopyUsers != null && listInfoCopyUsers.size() > 0) {
			for(User u : listInfoCopyUsers) {
				if(!setExistingApproverIds.contains(u.Id)) {		
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
					listRFAInfoCopyToInsert.add(approver);	
				}				
			}			
		}
		
		if(listRFAInfoCopyToInsert != null && listRFAInfoCopyToInsert.size() > 0) {
			insert listRFAInfoCopyToInsert;
		}
		
				
	}//end of ;
		
	
	
	
	
	
	
	
	
	

	public static void insertApproversByLevelsB1ToB7WithB8(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym_B8,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup_B8 		
	) {
		system.debug('-------- in insertApproversByLevelsB1ToB7WithB8() ');
		system.debug('-------- mapSelectedLevelsToApproversByAcronym: ' + mapSelectedLevelsToApproversByAcronym);
		system.debug('-------- mapSelectedLevelsToApproversByGroup: ' + mapSelectedLevelsToApproversByGroup);
		system.debug('-------- mapSelectedLevelsToApproversByAcronym_B8: ' + mapSelectedLevelsToApproversByAcronym_B8);
		system.debug('-------- mapSelectedLevelsToApproversByGroup_B8: ' + mapSelectedLevelsToApproversByGroup_B8);
		
		List<RFAUserRole__c> listRFAApproverToInsert = new List<RFAUserRole__c>();
		
		Integer intApprovalOrder = 1;
		
		Set<Id> setExistingApproverIds = new Set<Id>();
		setExistingApproverIds.add(rfa.CreatedById);
				
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L13')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L13') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L13')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') && mapSelectedLevelsToApproversByAcronym.get('L13') != null && mapSelectedLevelsToApproversByAcronym.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L13') && mapSelectedLevelsToApproversByAcronym_B8.get('L13') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L13') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L13')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L13') && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L13') && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}	
			if(hasApproverAdded) {
				intApprovalOrder++;
			}		
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L12')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L12') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L12')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') && mapSelectedLevelsToApproversByAcronym.get('L12') != null && mapSelectedLevelsToApproversByAcronym.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L12') && mapSelectedLevelsToApproversByAcronym_B8.get('L12') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L12') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L12')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L12') && mapSelectedLevelsToApproversByGroup.get('L12') != null && mapSelectedLevelsToApproversByGroup.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L12') && mapSelectedLevelsToApproversByGroup_B8.get('L12') != null && mapSelectedLevelsToApproversByGroup_B8.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}			
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L11') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L11') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') && mapSelectedLevelsToApproversByAcronym.get('L11') != null && mapSelectedLevelsToApproversByAcronym.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L11') && mapSelectedLevelsToApproversByAcronym_B8.get('L11') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L11') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L11') && mapSelectedLevelsToApproversByGroup.get('L11') != null && mapSelectedLevelsToApproversByGroup.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') && mapSelectedLevelsToApproversByGroup_B8.get('L11') != null && mapSelectedLevelsToApproversByGroup_B8.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L10')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L10') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L10')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') && mapSelectedLevelsToApproversByAcronym.get('L10') != null && mapSelectedLevelsToApproversByAcronym.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L10') && mapSelectedLevelsToApproversByAcronym_B8.get('L10') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L10') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L10')  ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L10') && mapSelectedLevelsToApproversByGroup.get('L10') != null && mapSelectedLevelsToApproversByGroup.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L10') && mapSelectedLevelsToApproversByGroup_B8.get('L10') != null && mapSelectedLevelsToApproversByGroup_B8.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}						

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L9')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L9') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') && mapSelectedLevelsToApproversByAcronym.get('L9') != null && mapSelectedLevelsToApproversByAcronym.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L9') && mapSelectedLevelsToApproversByAcronym_B8.get('L9') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L9') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L9') && mapSelectedLevelsToApproversByGroup.get('L9') != null && mapSelectedLevelsToApproversByGroup.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') && mapSelectedLevelsToApproversByGroup_B8.get('L9') != null && mapSelectedLevelsToApproversByGroup_B8.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L8')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L8') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L8')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') && mapSelectedLevelsToApproversByAcronym.get('L8') != null && mapSelectedLevelsToApproversByAcronym.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L8') && mapSelectedLevelsToApproversByAcronym_B8.get('L8') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L8') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L8')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L8') && mapSelectedLevelsToApproversByGroup.get('L8') != null && mapSelectedLevelsToApproversByGroup.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L8') && mapSelectedLevelsToApproversByGroup_B8.get('L8') != null && mapSelectedLevelsToApproversByGroup_B8.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}			

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L7') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L7') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') && mapSelectedLevelsToApproversByAcronym.get('L7') != null && mapSelectedLevelsToApproversByAcronym.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L7') && mapSelectedLevelsToApproversByAcronym_B8.get('L7') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L7') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L7') && mapSelectedLevelsToApproversByGroup.get('L7') != null && mapSelectedLevelsToApproversByGroup.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') && mapSelectedLevelsToApproversByGroup_B8.get('L7') != null && mapSelectedLevelsToApproversByGroup_B8.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L6') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L6') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L6')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') && mapSelectedLevelsToApproversByAcronym.get('L6') != null && mapSelectedLevelsToApproversByAcronym.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L6') && mapSelectedLevelsToApproversByAcronym_B8.get('L6') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L6') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L6')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L6') && mapSelectedLevelsToApproversByGroup.get('L6') != null && mapSelectedLevelsToApproversByGroup.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L6') && mapSelectedLevelsToApproversByGroup_B8.get('L6') != null && mapSelectedLevelsToApproversByGroup_B8.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L5') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L5') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L5')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') && mapSelectedLevelsToApproversByAcronym.get('L5') != null && mapSelectedLevelsToApproversByAcronym.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L5') && mapSelectedLevelsToApproversByAcronym_B8.get('L5') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L5') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L5') && mapSelectedLevelsToApproversByGroup.get('L5') != null && mapSelectedLevelsToApproversByGroup.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L5') && mapSelectedLevelsToApproversByGroup_B8.get('L5') != null && mapSelectedLevelsToApproversByGroup_B8.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L4')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L4') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L4')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') && mapSelectedLevelsToApproversByAcronym.get('L4') != null && mapSelectedLevelsToApproversByAcronym.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L4') && mapSelectedLevelsToApproversByAcronym_B8.get('L4') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L4') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L4')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L4') && mapSelectedLevelsToApproversByGroup.get('L4') != null && mapSelectedLevelsToApproversByGroup.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L4') && mapSelectedLevelsToApproversByGroup_B8.get('L4') != null && mapSelectedLevelsToApproversByGroup_B8.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L3')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L3') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L3')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') && mapSelectedLevelsToApproversByAcronym.get('L3') != null && mapSelectedLevelsToApproversByAcronym.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L3') && mapSelectedLevelsToApproversByAcronym_B8.get('L3') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L3') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L3')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L3') && mapSelectedLevelsToApproversByGroup.get('L3') != null && mapSelectedLevelsToApproversByGroup.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L3') && mapSelectedLevelsToApproversByGroup_B8.get('L3') != null && mapSelectedLevelsToApproversByGroup_B8.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L2')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L2') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L2')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') && mapSelectedLevelsToApproversByAcronym.get('L2') != null && mapSelectedLevelsToApproversByAcronym.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L2') && mapSelectedLevelsToApproversByAcronym_B8.get('L2') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L2') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L2')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L2') && mapSelectedLevelsToApproversByGroup.get('L2') != null && mapSelectedLevelsToApproversByGroup.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L2') && mapSelectedLevelsToApproversByGroup_B8.get('L2') != null && mapSelectedLevelsToApproversByGroup_B8.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}			
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L1') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L1') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L1')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') && mapSelectedLevelsToApproversByAcronym.get('L1') != null && mapSelectedLevelsToApproversByAcronym.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}			
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L1') && mapSelectedLevelsToApproversByAcronym_B8.get('L1') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}			
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L1') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L1') && mapSelectedLevelsToApproversByGroup.get('L1') != null && mapSelectedLevelsToApproversByGroup.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L1') && mapSelectedLevelsToApproversByGroup_B8.get('L1') != null && mapSelectedLevelsToApproversByGroup_B8.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}			
		}								
			
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0 ) {
			insert listRFAApproverToInsert;
		}			
	}//end of insertApproversByLevelsB1ToB7WithB8();
	


	public static void insertApproversByLevels_B1ToB8_With_TypeD(
		RFA__c rfa, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup, 
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym_B8,
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup_B8,
		List<User> listApprovers,
		List<User> listELTApprovers,
		List<user> listInfoCopyUsers		 		
	) {
		system.debug('-------- in insertApproversByLevelsB1ToB7WithB8() ');
		system.debug('-------- mapSelectedLevelsToApproversByAcronym: ' + mapSelectedLevelsToApproversByAcronym);
		system.debug('-------- mapSelectedLevelsToApproversByGroup: ' + mapSelectedLevelsToApproversByGroup);
		system.debug('-------- mapSelectedLevelsToApproversByAcronym_B8: ' + mapSelectedLevelsToApproversByAcronym_B8);
		system.debug('-------- mapSelectedLevelsToApproversByGroup_B8: ' + mapSelectedLevelsToApproversByGroup_B8);
		
		List<RFAUserRole__c> listRFAApproverToInsert = new List<RFAUserRole__c>();
		
		Integer intApprovalOrder = 1;
		
		Set<Id> setExistingApproverIds = new Set<Id>();
		setExistingApproverIds.add(rfa.CreatedById);
		
		
   		if(listELTApprovers != null && listELTApprovers.size() > 0) {
      		for(User u : listELTApprovers ) {
        		setExistingApproverIds.add(u.Id);
      		}
    	}
    
    	Boolean notAddedTypeDYet = true;		
		
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L13')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L13') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L13')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') && mapSelectedLevelsToApproversByAcronym.get('L13') != null && mapSelectedLevelsToApproversByAcronym.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L13') && mapSelectedLevelsToApproversByAcronym_B8.get('L13') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L13') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L13')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L13') && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L13') && mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}	
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L12')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L12') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L12')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') && mapSelectedLevelsToApproversByAcronym.get('L12') != null && mapSelectedLevelsToApproversByAcronym.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L12') && mapSelectedLevelsToApproversByAcronym_B8.get('L12') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L12') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L12')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L12') && mapSelectedLevelsToApproversByGroup.get('L12') != null && mapSelectedLevelsToApproversByGroup.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L12') && mapSelectedLevelsToApproversByGroup_B8.get('L12') != null && mapSelectedLevelsToApproversByGroup_B8.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}			
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L11') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L11') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') && mapSelectedLevelsToApproversByAcronym.get('L11') != null && mapSelectedLevelsToApproversByAcronym.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L11') && mapSelectedLevelsToApproversByAcronym_B8.get('L11') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L11') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L11') && mapSelectedLevelsToApproversByGroup.get('L11') != null && mapSelectedLevelsToApproversByGroup.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L11') && mapSelectedLevelsToApproversByGroup_B8.get('L11') != null && mapSelectedLevelsToApproversByGroup_B8.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L10')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L10') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L10')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') && mapSelectedLevelsToApproversByAcronym.get('L10') != null && mapSelectedLevelsToApproversByAcronym.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L10') && mapSelectedLevelsToApproversByAcronym_B8.get('L10') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L10') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L10')  ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L10') && mapSelectedLevelsToApproversByGroup.get('L10') != null && mapSelectedLevelsToApproversByGroup.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L10') && mapSelectedLevelsToApproversByGroup_B8.get('L10') != null && mapSelectedLevelsToApproversByGroup_B8.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}						

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L9')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L9') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') && mapSelectedLevelsToApproversByAcronym.get('L9') != null && mapSelectedLevelsToApproversByAcronym.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L9') && mapSelectedLevelsToApproversByAcronym_B8.get('L9') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L9') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L9') && mapSelectedLevelsToApproversByGroup.get('L9') != null && mapSelectedLevelsToApproversByGroup.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L9') && mapSelectedLevelsToApproversByGroup_B8.get('L9') != null && mapSelectedLevelsToApproversByGroup_B8.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L8')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L8') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L8')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') && mapSelectedLevelsToApproversByAcronym.get('L8') != null && mapSelectedLevelsToApproversByAcronym.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L8') && mapSelectedLevelsToApproversByAcronym_B8.get('L8') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L8') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L8')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L8') && mapSelectedLevelsToApproversByGroup.get('L8') != null && mapSelectedLevelsToApproversByGroup.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L8') && mapSelectedLevelsToApproversByGroup_B8.get('L8') != null && mapSelectedLevelsToApproversByGroup_B8.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}			

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L7') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L7') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') 
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') && mapSelectedLevelsToApproversByAcronym.get('L7') != null && mapSelectedLevelsToApproversByAcronym.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L7') && mapSelectedLevelsToApproversByAcronym_B8.get('L7') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L7') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L7') && mapSelectedLevelsToApproversByGroup.get('L7') != null && mapSelectedLevelsToApproversByGroup.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L7') && mapSelectedLevelsToApproversByGroup_B8.get('L7') != null && mapSelectedLevelsToApproversByGroup_B8.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L6') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L6') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L6')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') && mapSelectedLevelsToApproversByAcronym.get('L6') != null && mapSelectedLevelsToApproversByAcronym.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L6') && mapSelectedLevelsToApproversByAcronym_B8.get('L6') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			
			//intApprovalOrder++;
			
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L6') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L6')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L6') && mapSelectedLevelsToApproversByGroup.get('L6') != null && mapSelectedLevelsToApproversByGroup.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L6') && mapSelectedLevelsToApproversByGroup_B8.get('L6') != null && mapSelectedLevelsToApproversByGroup_B8.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L5') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L5') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L5')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') && mapSelectedLevelsToApproversByAcronym.get('L5') != null && mapSelectedLevelsToApproversByAcronym.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L5') && mapSelectedLevelsToApproversByAcronym_B8.get('L5') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L5') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L5') && mapSelectedLevelsToApproversByGroup.get('L5') != null && mapSelectedLevelsToApproversByGroup.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L5') && mapSelectedLevelsToApproversByGroup_B8.get('L5') != null && mapSelectedLevelsToApproversByGroup_B8.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L4')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L4') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L4')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') && mapSelectedLevelsToApproversByAcronym.get('L4') != null && mapSelectedLevelsToApproversByAcronym.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L4') && mapSelectedLevelsToApproversByAcronym_B8.get('L4') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L4') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L4')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L4') && mapSelectedLevelsToApproversByGroup.get('L4') != null && mapSelectedLevelsToApproversByGroup.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L4') && mapSelectedLevelsToApproversByGroup_B8.get('L4') != null && mapSelectedLevelsToApproversByGroup_B8.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L3')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L3') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L3')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') && mapSelectedLevelsToApproversByAcronym.get('L3') != null && mapSelectedLevelsToApproversByAcronym.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L3') && mapSelectedLevelsToApproversByAcronym_B8.get('L3') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L3') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L3')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L3') && mapSelectedLevelsToApproversByGroup.get('L3') != null && mapSelectedLevelsToApproversByGroup.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L3') && mapSelectedLevelsToApproversByGroup_B8.get('L3') != null && mapSelectedLevelsToApproversByGroup_B8.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}	
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L2')
			|| mapSelectedLevelsToApproversByGroup.containsKey('L2') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L2')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') && mapSelectedLevelsToApproversByAcronym.get('L2') != null && mapSelectedLevelsToApproversByAcronym.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L2') && mapSelectedLevelsToApproversByAcronym_B8.get('L2') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}				
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L2') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L2')) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L2') && mapSelectedLevelsToApproversByGroup.get('L2') != null && mapSelectedLevelsToApproversByGroup.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L2') && mapSelectedLevelsToApproversByGroup_B8.get('L2') != null && mapSelectedLevelsToApproversByGroup_B8.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}		
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') || mapSelectedLevelsToApproversByAcronym_B8.containsKey('L1') 
			|| mapSelectedLevelsToApproversByGroup.containsKey('L1') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L1')
		) {
			Boolean hasApproverAdded = false;
			if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') && mapSelectedLevelsToApproversByAcronym.get('L1') != null && mapSelectedLevelsToApproversByAcronym.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}			
			}
			if(mapSelectedLevelsToApproversByAcronym_B8.containsKey('L1') && mapSelectedLevelsToApproversByAcronym_B8.get('L1') != null && mapSelectedLevelsToApproversByAcronym_B8.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym_B8.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}			
			}			
			//intApprovalOrder++;
		//} else if(mapSelectedLevelsToApproversByGroup.containsKey('L1') || mapSelectedLevelsToApproversByGroup_B8.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByGroup.containsKey('L1') && mapSelectedLevelsToApproversByGroup.get('L1') != null && mapSelectedLevelsToApproversByGroup.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}
			if(mapSelectedLevelsToApproversByGroup_B8.containsKey('L1') && mapSelectedLevelsToApproversByGroup_B8.get('L1') != null && mapSelectedLevelsToApproversByGroup_B8.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup_B8.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_B2;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}
				}
			}			

			if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
				for(User u : listApprovers) {
					if(!setExistingApproverIds.contains(u.Id)) {
						hasApproverAdded = true;
						RFAUserRole__c approver = new RFAUserRole__c();
						approver.UserName__c = u.Id;
						approver.RFA__c = rfa.Id;
						approver.ApprovalOrder__c = intApprovalOrder;
						approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
						approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
						listRFAApproverToInsert.add(approver);	
						
						setExistingApproverIds.add(u.Id);					
					}					
				}
				notAddedTypeDYet = false;
			}
			
			if(hasApproverAdded) {
				intApprovalOrder++;
			}			
		}			
		
		if(notAddedTypeDYet && listApprovers != null && listApprovers.size() > 0) {
			Boolean hasApproverAdded = false;
			for(User u : listApprovers) {
				if(!setExistingApproverIds.contains(u.Id)) {
					hasApproverAdded = true;	
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.ApprovalOrder__c = intApprovalOrder;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
					listRFAApproverToInsert.add(approver);	
						
					setExistingApproverIds.add(u.Id);					
				}					
			}
			notAddedTypeDYet = false;
			if(hasApproverAdded) {
				intApprovalOrder++;
			}
		}		
		
		if(listELTApprovers != null && listELTApprovers.size() > 0) {
			for(User u : listELTApprovers) {
						
				RFAUserRole__c approver = new RFAUserRole__c();
				approver.UserName__c = u.Id;
				approver.RFA__c = rfa.Id;
				approver.ApprovalOrder__c = intApprovalOrder;
				approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
				listRFAApproverToInsert.add(approver);					
			}
		}
		
													
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0 ) {
			insert listRFAApproverToInsert;
		}	
		
		
		List<RFAUserRole__c> listRFAInfoCopyToInsert = new List<RFAUserRole__c>();
		
		//Info Copy is not in the Approver list
		if(listInfoCopyUsers != null && listInfoCopyUsers.size() > 0) {
			for(User u : listInfoCopyUsers) {
				if(!setExistingApproverIds.contains(u.Id)) {		
					RFAUserRole__c approver = new RFAUserRole__c();
					approver.UserName__c = u.Id;
					approver.RFA__c = rfa.Id;
					approver.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
							RFA_Utility_Constants.RFAUserRole_RTAPIName_InfoOnly);
					approver.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Appendix3_D;
						
					listRFAInfoCopyToInsert.add(approver);		
				}			
			}			
		}
		
		if(listRFAInfoCopyToInsert != null && listRFAInfoCopyToInsert.size() > 0) {
			insert listRFAInfoCopyToInsert;
		}
					
	}//end of insertApproversByLevels_B1ToB8_With_TypeD();
	
}