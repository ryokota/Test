public with sharing class COA_Handler_Appendix_Helper_Utility {

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
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L13') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L13') != null && mapSelectedLevelsToApproversByAcronym.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L13') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L13') != null && mapSelectedLevelsToApproversByGroup.get('L13').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L13')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L12') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L12') != null && mapSelectedLevelsToApproversByAcronym.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L12') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L12') != null && mapSelectedLevelsToApproversByGroup.get('L12').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L12')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}			
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L11') != null && mapSelectedLevelsToApproversByAcronym.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L11') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L11') != null && mapSelectedLevelsToApproversByGroup.get('L11').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L11')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}
		
		if(mapSelectedLevelsToApproversByAcronym.containsKey('L10') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L10') != null && mapSelectedLevelsToApproversByAcronym.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L10') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L10') != null && mapSelectedLevelsToApproversByGroup.get('L10').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L10')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}						

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L9') != null && mapSelectedLevelsToApproversByAcronym.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L9') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L9') != null && mapSelectedLevelsToApproversByGroup.get('L9').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L9')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L8') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L8') != null && mapSelectedLevelsToApproversByAcronym.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L8') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L8') != null && mapSelectedLevelsToApproversByGroup.get('L8').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L8')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}			

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L7') != null && mapSelectedLevelsToApproversByAcronym.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L7') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L7') != null && mapSelectedLevelsToApproversByGroup.get('L7').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L7')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L6') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L6') != null && mapSelectedLevelsToApproversByAcronym.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L6') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L6') != null && mapSelectedLevelsToApproversByGroup.get('L6').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L6')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L5') != null && mapSelectedLevelsToApproversByAcronym.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L5') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L5') != null && mapSelectedLevelsToApproversByGroup.get('L5').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L5')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}		

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L4') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L4') != null && mapSelectedLevelsToApproversByAcronym.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L4') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L4') != null && mapSelectedLevelsToApproversByGroup.get('L4').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L4')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L3') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L3') != null && mapSelectedLevelsToApproversByAcronym.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L3') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L3') != null && mapSelectedLevelsToApproversByGroup.get('L3').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L3')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L2') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L2') != null && mapSelectedLevelsToApproversByAcronym.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L2') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L2') != null && mapSelectedLevelsToApproversByGroup.get('L2').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L2')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}	

		if(mapSelectedLevelsToApproversByAcronym.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByAcronym.get('L1') != null && mapSelectedLevelsToApproversByAcronym.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByAcronym.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		} else if(mapSelectedLevelsToApproversByGroup.containsKey('L1') ) {
			if(mapSelectedLevelsToApproversByGroup.get('L1') != null && mapSelectedLevelsToApproversByGroup.get('L1').size() > 0) {
				for(User u : mapSelectedLevelsToApproversByGroup.get('L1')) {
					if(!setExistingApproverIds.contains(u.Id)) {
						
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
				intApprovalOrder++;
			}
		}								
			
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0 ) {
			insert listRFAApproverToInsert;
		}			
	}//end of insertApproversByLevels();
	
	





}