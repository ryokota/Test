public with sharing class COA_Handler_Appendix_Helper_D {
	
	private static Set<String> setAcronyms = new Set<String>();
	private static Set<String> setGroups = new Set<String>();
	
	private static Set<String> setELTAcronyms = new Set<String>();
	private static Set<String> setELTGroups = new Set<String>();
	
	private static Set<String> setInfoCopyAcronyms = new Set<String>();
	private static Set<String> setInfoCopyGroups = new Set<String>();
	
	public static List<User> listApprovers = new List<User>();
	public static List<User> listELTApprovers = new List<User>();
	public static List<User> listInfoCopyUsers = new List<User>();		
		
	/*
		============ isBefore & isInsert ============ 
	*/
	

	/*
		============ isAfter & isInsert ============ 
	*/
	public static void processAppendix3TypeDInAfterInsert(RFA__c rfa) {
		system.debug('---------- processAppendix3TypeDInAfterInsert(): ' + rfa);
			
		system.debug('---------- rfa.PrimaryCOACategory__c: ' + rfa.PrimaryCOACategory__c);
		system.debug('---------- rfa.PrimaryCOASubCategory__c: ' + rfa.PrimaryCOASubCategory__c);
		system.debug('---------- rfa.PrimaryCOASubCategory2__c: ' + rfa.PrimaryCOASubCategory2__c);
		system.debug('---------- rfa.PrimaryCOASubCategory3__c: ' + rfa.PrimaryCOASubCategory3__c);
		
		// ====== Step 1 ======		
		
		/*	
		//  example, L1/L2/..L13 => CEO, CFO, ...
		Map<String, Set<String>> mapSelectedLevelsToAcronymSet = new Map<String, Set<String>>();	
		//  example, L1/L2/..L13 => User 1, User 2, ...			
		Map<String, List<User>> mapSelectedLevelsToApproversByAcronym = new Map<String, List<User>>();
			
		Map<String, String> mapSelectedLevelsToGroup = new Map<String, String>();			
		Map<String, List<User>> mapSelectedLevelsToApproversByGroup = new Map<String, List<User>>();			

		//get all Acronym for query Users, need to consider Gr.5 or special case, mapping needed
		Set<String> setAcronymOfAllApprovers = new Set<String>();
			
		Map<String, String> mapAcronymAndGroupToMappingLevel = new Map<String, String>();
		*/
				
		// ====== Step 2 ======		
		if(rfa.PrimaryCOACategory__c != null 
			&& rfa.PrimaryCOASubCategory__c != null 
			&& rfa.PrimaryCOASubCategory2__c != null
			&& rfa.PrimaryCOASubCategory3__c != null
		) {
			system.debug('------- rfa.PrimaryCOASubCategory3__c != null ');
			for(COA__c coa : [					
				Select Id, PrimaryCOACategory__c, PrimaryCOASubCategory__c, PrimaryCOASubCategory2__c, PrimaryCOASubCategory3__c,
				
				Function_Commercial_1__c, Function_Commercial_2__c, Function_Commercial_3__c, Function_Commercial_4__c,
				Function_Commercial_5__c, Function_Commercial_6__c, Function_Commercial_7__c, Function_Commercial_8__c,
				Function_Commercial_9__c, Function_Commercial_10__c,
				
				ELT_1__c, ELT_2__c, ELT_3__c, ELT_4__c, ELT_5__c, ELT_6__c, ELT_7__c, ELT_8__c,
						
				Info_Copy_1__c, Info_Copy_2__c, Info_Copy_3__c, Info_Copy_4__c, Info_Copy_5__c,
				Info_Copy_6__c, Info_Copy_7__c, Info_Copy_8__c, Info_Copy_9__c, Info_Copy_10__c				
						
				from COA__c 
				where 
					RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.COA_RTAPIName_Appendix3_D
						)
					and 
					PrimaryCOACategory__c =: rfa.PrimaryCOACategory__c
					and
					PrimaryCOASubCategory__c =: rfa.PrimaryCOASubCategory__c
					and
					PrimaryCOASubCategory2__c =: rfa.PrimaryCOASubCategory2__c
					and
					PrimaryCOASubCategory3__c =: rfa.PrimaryCOASubCategory3__c
					order by CreatedDate Desc
					limit 1
				]
			) {
				system.debug('-------- COA rule Id: ' + coa.Id);
				processCOARules(coa);																	
					
			}//end of for(COAs)		
		
		} else if(rfa.PrimaryCOACategory__c != null 
			&& rfa.PrimaryCOASubCategory__c != null 
			&& rfa.PrimaryCOASubCategory2__c != null
		) {
			system.debug('------- rfa.PrimaryCOASubCategory2__c != null ');		
			for(COA__c coa : [					
				Select Id, PrimaryCOACategory__c, PrimaryCOASubCategory__c, PrimaryCOASubCategory2__c, PrimaryCOASubCategory3__c,
				
				Function_Commercial_1__c, Function_Commercial_2__c, Function_Commercial_3__c, Function_Commercial_4__c,
				Function_Commercial_5__c, Function_Commercial_6__c, Function_Commercial_7__c, Function_Commercial_8__c,
				Function_Commercial_9__c, Function_Commercial_10__c,
				
				ELT_1__c, ELT_2__c, ELT_3__c, ELT_4__c, ELT_5__c, ELT_6__c, ELT_7__c, ELT_8__c,
						
				Info_Copy_1__c, Info_Copy_2__c, Info_Copy_3__c, Info_Copy_4__c, Info_Copy_5__c,
				Info_Copy_6__c, Info_Copy_7__c, Info_Copy_8__c, Info_Copy_9__c, Info_Copy_10__c				
						
				from COA__c 
				where 
					RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.COA_RTAPIName_Appendix3_D
						)
					and 
					PrimaryCOACategory__c =: rfa.PrimaryCOACategory__c
					and
					PrimaryCOASubCategory__c =: rfa.PrimaryCOASubCategory__c
					and
					PrimaryCOASubCategory2__c =: rfa.PrimaryCOASubCategory2__c
					order by CreatedDate Desc
					limit 1
				]
			) {
				system.debug('-------- COA rule Id: ' + coa.Id);
				processCOARules(coa);																	
					
			}//end of for(COAs)		
			
		} else if(rfa.PrimaryCOACategory__c != null 
			&& rfa.PrimaryCOASubCategory__c != null 
		) {
			system.debug('------- rfa.PrimaryCOASubCategory__c != null ');					
			for(COA__c coa : [					
				Select Id, PrimaryCOACategory__c, PrimaryCOASubCategory__c, PrimaryCOASubCategory2__c, PrimaryCOASubCategory3__c,
				
				Function_Commercial_1__c, Function_Commercial_2__c, Function_Commercial_3__c, Function_Commercial_4__c,
				Function_Commercial_5__c, Function_Commercial_6__c, Function_Commercial_7__c, Function_Commercial_8__c,
				Function_Commercial_9__c, Function_Commercial_10__c,
				
				ELT_1__c, ELT_2__c, ELT_3__c, ELT_4__c, ELT_5__c, ELT_6__c, ELT_7__c, ELT_8__c,
						
				Info_Copy_1__c, Info_Copy_2__c, Info_Copy_3__c, Info_Copy_4__c, Info_Copy_5__c,
				Info_Copy_6__c, Info_Copy_7__c, Info_Copy_8__c, Info_Copy_9__c, Info_Copy_10__c				
						
				from COA__c 
				where 
					RecordTypeId =: Utility_Helper_RecordType.mapCOARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.COA_RTAPIName_Appendix3_D
						)
					and 
					PrimaryCOACategory__c =: rfa.PrimaryCOACategory__c
					and
					PrimaryCOASubCategory__c =: rfa.PrimaryCOASubCategory__c
					order by CreatedDate Desc
					limit 1
				]
			) {
				system.debug('-------- COA rule Id: ' + coa.Id);
				processCOARules(coa);		
																			
			}//end of for(COAs)		
						
		}//end of if-else();

		User runningUser = [
			Select 
				Id, Name, Username, COA_Acronym__c,
				L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
				L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
			from User 
			where Id =: Userinfo.getUserId()
		];

		
		if(setELTAcronyms != null && setELTAcronyms.size() > 0) {
			for(User u : [
				Select 
					Id, Name, Username, COA_Acronym__c, 
					L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
					L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
				from User 
				where COA_Acronym__c IN: setELTAcronyms
				]
			) {	
				if(u != runningUser) {
					listELTApprovers.add(u);
				}						
			}
		}

		if(setAcronyms != null && setAcronyms.size() > 0) {
			for(User u : [
				Select 
					Id, Name, Username, COA_Acronym__c, 
					L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
					L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
				from User 
				where COA_Acronym__c IN: setAcronyms AND COA_Acronym__c NOT IN: setELTAcronyms
				]
			) {	
				if(u != runningUser) {
					listApprovers.add(u);
				}						
			}
		}
		
		if(setInfoCopyAcronyms != null && setInfoCopyAcronyms.size() > 0) {
			for(User u : [
				Select 
					Id, Name, Username, COA_Acronym__c, 
					L2_Function_E__c, L3_Function_E__c, L4_Function_E__c, 
					L5_Function_E__c, L6_Function_E__c, L7_Function_E__c 
				from User 
				where COA_Acronym__c IN: setInfoCopyAcronyms AND COA_Acronym__c NOT IN: setAcronyms AND COA_Acronym__c NOT IN: setELTAcronyms
				]
			) {	
				if(u != runningUser) {
					listInfoCopyUsers.add(u);
				}						
			}
		}		
		
		
	}//end of processAppendix3TypeDInAfterInsert();	

	private static void processCOARules(COA__c coa) {
		
		processFunctionAreaFiels(coa);
		processETLFields(coa);
		processInfoCopyFields(coa);
		
		system.debug('------- setAcronyms: ' + setAcronyms);
		system.debug('------- setELTAcronyms: ' + setELTAcronyms);
		system.debug('------- setInfoCopyAcronyms: ' + setInfoCopyAcronyms);
	}

	private static void processFunctionAreaFiels(COA__c coa) {
			
		if(coa.Function_Commercial_1__c != null) {
			if(coa.Function_Commercial_1__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_1__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_1__c );
			}
		}
								
		if(coa.Function_Commercial_2__c != null) {
			if(coa.Function_Commercial_2__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_2__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_2__c );
			}
		}		
		
		if(coa.Function_Commercial_3__c != null) {
			if(coa.Function_Commercial_3__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_3__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_3__c );
			}
		}		
																																	
		if(coa.Function_Commercial_4__c != null) {
			if(coa.Function_Commercial_4__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_4__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_4__c );
			}
		}		
		
		if(coa.Function_Commercial_5__c != null) {
			if(coa.Function_Commercial_5__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_5__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_5__c );
			}
		}		
		
		if(coa.Function_Commercial_6__c != null) {
			if(coa.Function_Commercial_6__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_6__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_6__c );
			}
		}		
			
		if(coa.Function_Commercial_7__c != null) {
			if(coa.Function_Commercial_7__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_7__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_7__c );
			}
		}			
			
		if(coa.Function_Commercial_8__c != null) {
			if(coa.Function_Commercial_8__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_8__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_8__c );
			}
		}

		if(coa.Function_Commercial_9__c != null) {
			if(coa.Function_Commercial_9__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_9__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_9__c );
			}
		}

		if(coa.Function_Commercial_10__c != null) {
			if(coa.Function_Commercial_10__c.startsWith('Gr.')) {
				setGroups.add(coa.Function_Commercial_10__c);	
			} else {
				setAcronyms.add( coa.Function_Commercial_10__c );
			}
		}								
	}//end of processFunctionAreaFiels();		

	private static void processETLFields(COA__c coa) {
		if(coa.ELT_1__c != null) {
			setELTAcronyms.add(coa.ELT_1__c);
		}			
		if(coa.ELT_2__c != null) {
			setELTAcronyms.add(coa.ELT_2__c);
		}			
		if(coa.ELT_3__c != null) {
			setELTAcronyms.add(coa.ELT_3__c);
		}														
		if(coa.ELT_4__c != null) {
			setELTAcronyms.add(coa.ELT_4__c);
		}		
		if(coa.ELT_5__c != null) {
			setELTAcronyms.add(coa.ELT_5__c);
		}			
		if(coa.ELT_6__c != null) {
			setELTAcronyms.add(coa.ELT_6__c);
		}														
		if(coa.ELT_7__c != null) {
			setELTAcronyms.add(coa.ELT_7__c);
		}			
		if(coa.ELT_8__c != null) {
			setELTAcronyms.add(coa.ELT_8__c);
		}										
	}//end of processETLField(COA__c coa);

	private static void processInfoCopyFields(COA__c coa) {
		
		if(coa.Info_Copy_1__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_1__c);
		}			
		if(coa.Info_Copy_2__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_2__c);
		}					
		if(coa.Info_Copy_3__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_3__c);
		}														
		if(coa.Info_Copy_4__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_4__c);
		}				
		if(coa.Info_Copy_5__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_5__c);
		}			
		if(coa.Info_Copy_6__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_6__c);
		}					
		if(coa.Info_Copy_7__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_7__c);
		}														
		if(coa.Info_Copy_8__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_8__c);
		}	
		if(coa.Info_Copy_9__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_9__c);
		}														
		if(coa.Info_Copy_10__c != null) {
			setInfoCopyAcronyms.add(coa.Info_Copy_10__c);
		}			
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