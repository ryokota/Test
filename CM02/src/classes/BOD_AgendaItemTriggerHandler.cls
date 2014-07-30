public without sharing class BOD_AgendaItemTriggerHandler {
	
	
	ID PublicGroupId_BODMember = 
		BOD_Utility.getPuglicGroupId( 
			BOD_Constants.PublicGroupName_BODMember );  
	ID PublicGroupId_BODAdvisor = 
		BOD_Utility.getPuglicGroupId( 
			BOD_Constants.PublicGroupName_BODAdvisor );  			
	ID PublicGroupId_BODAdmin = 
		BOD_Utility.getPuglicGroupId( 
			BOD_Constants.PublicGroupName_BODAdmin );  			
	ID PublicGroupId_BODSecretary = 
		BOD_Utility.getPuglicGroupId( 
			BOD_Constants.PublicGroupName_BODSecretary ); 
 
		
		
	/*
		before & update
	*/
	
	/*
		check when Agenda Language Changed
	*/
	public void processParentAgdendaLanguageChange(
		List<Agenda_Item__c> listNewAgendaItem, 
		Map<Id, Agenda_Item__c> mapOldAgendaItem
	) {
		
		Set<Id> setChangedAgendaIds = new Set<Id>();
		
		for(Agenda_Item__c agenda : listNewAgendaItem) {
			if(agenda.Document_Language__c == BOD_Constants.AgendaItem_DocLang_Japanese   
				&& agenda.Document_Language__c != mapOldAgendaItem.get(agenda.Id).Document_Language__c) {
				
				setChangedAgendaIds.add(agenda.Id);	
				
			}//end of if;
		}//end of for;
		
		Set<Id> setChangedParentAgendaIds = new Set<Id>();
		
		if(setChangedAgendaIds != null && setChangedAgendaIds.size() > 0) {
			for(Agenda_Item__c agenda : 
				[Select Id, (Select Id from Agenda_Item__r) 
				from Agenda_Item__c where Id IN:setChangedAgendaIds and Related_Agenda_Item__c = null
			]) {
				List<Agenda_Item__c> listChildAgendas = agenda.Agenda_Item__r;
				if(listChildAgendas != null && listChildAgendas.size() > 0) {
					setChangedParentAgendaIds.add(agenda.Id);
				}
				
			}
		}
		
		for(Agenda_Item__c agenda : listNewAgendaItem) {
			if(setChangedParentAgendaIds.contains(agenda.Id)) {
				agenda.addError(Label.BOD_TriggerMsg_Agenda_JP_Level); 
				//('Agenda in Japanese Version cannot be the first level Agenda!');
			}
		}
			
	}//end of processParentAgdendaLanguageChange();
	
	
	/*
		before update trigger
		cannot update Japanese Version Agenda when English version is on Approval
		
		should be considered with Method: checkApprovalProcessOnJapaneseAgendaItem()
	*/
	public void lockJapaneseAgendaItemOnApproval(
		//List<Agenda_Item__c> listNewAgendaItems, 
		Map<Id, Agenda_Item__c> mapNewAgendaItems, 
		Map<Id, Agenda_Item__c> mapOldAgendaItems
	) {
		//don't need to confirm which field is updated
		//Map<String, Schema.SObjectField> schemaFieldMap = Schema.SObjectType.Agenda_Item__c.fields.getMap();
		
		for(Agenda_Item__c aAgenda : [Select Id, Version_Count__c, Document_Title__c, 
			Approval_Status__c, Related_Agenda_Item__r.Approval_Status__c, Document_Language__c from Agenda_Item__c 
			where Id IN: mapNewAgendaItems.keySet()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_Japanese
				and Related_Agenda_Item__r.Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval			
			]
		) {
			/*
				Since we need to copy the Approval Status to Japanese version when English version Agenda has changed,
				we only allow BOD Admin or System Admin to update Approval Status Field only on Japanese version,
				other field changes will be blocked when English version is in Approval Process.
				
				There is another exception, when other fields are updated with Approval Status field, 
				very complicated to use Apex to distinguish this kind of action,
				therefore use Page layout or FLS to limit end use access to this field!
			*/
			if( 
				(mapNewAgendaItems.get(aAgenda.Id).Approval_Status__c != mapOldAgendaItems.get(aAgenda.Id).Approval_Status__c 
				 || mapNewAgendaItems.get(aAgenda.Id).Version_Count__c != mapOldAgendaItems.get(aAgenda.Id).Version_Count__c 
				 || mapNewAgendaItems.get(aAgenda.Id).Document_Title__c != mapOldAgendaItems.get(aAgenda.Id).Document_Title__c 
				)
				&& 
				( BOD_Utility.isBODAdminByUid( Userinfo.getUserId() )  
				  || BOD_Utility.isBODAdminByPid( Userinfo.getProfileId() )
				  || BOD_Utility.isBODMemberByUId( Userinfo.getUserId() )
				) 
			) {
				//BOD Admin Or System Admin can only edit Approval Status field
				//if( !(String.valueOf( Userinfo.getProfileId() ).substring(0, 15)).equals('00e10000000n8Hx') ) {
					system.debug('------------ compare profile id: ' 
						+ (String.valueOf( Userinfo.getProfileId() ).substring(0, 15)).equals('00e10000000n8Hx'));

				//}
			} else {
				mapNewAgendaItems.get(aAgenda.Id).addError(Label.BOD_TriggerMsg_Agenda_JP_In_Approval); 
				//('Can not update Japanese Version Agenda Item when English Version Agenda is in Approval Process !');
			}
		}				
	}	
	
	
	/*
		after & insert
	*/		
	
	
					
	public void insertAgendaItemMembersWithNewAgendaItem(List<Agenda_Item__c> listNewAgendaItems) {
		
		Set<Id> setBODMemberIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODMember);		
		Set<Id> setBODAdvisorIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODAdvisor);
		Set<Id> setBODAdminIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODAdmin);
		Set<Id> setBODSecretaryIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODSecretary);
		
		ID idAgendaItemMemberRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODMember_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		system.debug('------- idAgendaItemMemberRT: ' + idAgendaItemMemberRT);		
		
		ID idAgendaItemAdvisorRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODAdvisor_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		system.debug('------- idAgendaItemMemberRT: ' + idAgendaItemAdvisorRT);				
		
		ID idAgendaItemAdminRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODAdmin_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		system.debug('--------- idAgendaItemAdminRT: ' + idAgendaItemAdminRT);
		
		ID idAgendaItemSecretaryRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODSecretary_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		system.debug('------ idAgendaItemSecretaryRT: ' + idAgendaItemSecretaryRT);
		
		
		List<Agenda_Item_Members__c> listNewAgendaItemMembers = new List<Agenda_Item_Members__c>();
		
		for(Agenda_Item__c agenda : listNewAgendaItems) {
			
			if(setBODMemberIds != null && setBODMemberIds.size() > 0) {
				for(Id aId : setBODMemberIds) {

					Agenda_Item_Members__c member = new Agenda_Item_Members__c();
					member.Agenda_Item__c = agenda.Id;
					member.User__c = aId;
					member.RecordTypeId = idAgendaItemMemberRT;
					
					listNewAgendaItemMembers.add(member);
				}
			}
			
			if(setBODAdvisorIds != null && setBODAdvisorIds.size() > 0) {
				for(Id aId : setBODAdvisorIds) {

					Agenda_Item_Members__c member = new Agenda_Item_Members__c();
					member.Agenda_Item__c = agenda.Id;
					member.User__c = aId;
					member.RecordTypeId = idAgendaItemAdvisorRT;
					
					listNewAgendaItemMembers.add(member);
				}
			}			
			
			if(setBODAdminIds != null && setBODAdminIds.size() > 0) {
				for(Id aId : setBODAdminIds) {
					Agenda_Item_Members__c member = new Agenda_Item_Members__c();
					member.Agenda_Item__c = agenda.Id;
					member.User__c = aId;
					member.RecordTypeId = idAgendaItemAdminRT;
					
					listNewAgendaItemMembers.add(member);
				}
			}				
			
			if(!agenda.Confidential__c) {
				if(setBODSecretaryIds != null && setBODSecretaryIds.size() > 0) {
					for(Id aId : setBODSecretaryIds) {					
						Agenda_Item_Members__c member = new Agenda_Item_Members__c();
						member.Agenda_Item__c = agenda.Id;
						member.User__c = aId;
						member.RecordTypeId = idAgendaItemSecretaryRT;
					
						listNewAgendaItemMembers.add(member);
					}
				}
			}//end of if(Confidential);		
			
							
		}//end of for(meetings)

		//will add access permission for each member based on Record Type in BOD Member Trigger
		if(listNewAgendaItemMembers != null && listNewAgendaItemMembers.size() > 0) {
			insert listNewAgendaItemMembers;
		}
		
		
	}//end of method;		
		
	

	/*
		after & update
	*/	
	
	//when the field Confidential__c is updated, add or remove Secretary
	public void processConfidentialFieldChangedOfAgendaItemMembers(
		List<Agenda_Item__c> listNewAgendaItems, 
		Map<Id, Agenda_Item__c> mapOldAgendaItems
	) {

		ID idAgendaItemSecretaryRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODSecretary_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 		
		
		Set<Id> setBODSecretaryIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODSecretary);		
		
		list<Agenda_Item_Members__c> listAgendaMembersForAdd = new list<Agenda_Item_Members__c>();
		list<Agenda_Item_Members__c> listAgendaMembersForRemove = new list<Agenda_Item_Members__c>();
		
		for(Agenda_Item__c agenda : listNewAgendaItems) {
			if(agenda.Confidential__c != mapOldAgendaItems.get(agenda.Id).Confidential__c) {
				
				//Confidential__c == true
				if(agenda.Confidential__c) {
					
					map<Id, Agenda_Item_Members__c> mapAgendaItemMembers 
						= new map<Id, Agenda_Item_Members__c>([
							Select Id from Agenda_Item_Members__c 
								where Agenda_Item__c =: agenda.Id 
									and RecordTypeId =:idAgendaItemSecretaryRT]);
		
					if(mapAgendaItemMembers != null 
						&& mapAgendaItemMembers.keySet() != null 
						&& mapAgendaItemMembers.keySet().size() > 0
						&& mapAgendaItemMembers.values() != null
						&& mapAgendaItemMembers.values().size() > 0
					) {
							
						listAgendaMembersForRemove.addAll(mapAgendaItemMembers.values());
					}
					
				} else { //Confidential__c == false
					
					if(setBODSecretaryIds != null && setBODSecretaryIds.size() > 0) {
						for(Id aId : setBODSecretaryIds) {					
							Agenda_Item_Members__c member = new Agenda_Item_Members__c();
							member.Agenda_Item__c = agenda.Id;
							member.User__c = aId;
							member.RecordTypeId = idAgendaItemSecretaryRT;
					
							listAgendaMembersForAdd.add(member);
						}
					}					
										
				}//end of if-else;
				
				
			}//Confidential__c changed
		}//end of for(agenda list);
		
		if(listAgendaMembersForAdd != null && listAgendaMembersForAdd.size() > 0) {
			insert listAgendaMembersForAdd;
		}
		
		if(listAgendaMembersForRemove != null && listAgendaMembersForRemove.size() > 0) {
			delete listAgendaMembersForRemove;
		}
		
	}		
		
	/*
		should be considered with Method lockJapaneseAgendaItemOnApproval();
	*/
	public void checkApprovalProcessOnJapaneseAgendaItem(		
		List<Agenda_Item__c> listNewAgendaItems, 
		Map<Id, Agenda_Item__c> mapOldAgendaItems		
	) {
		
		Set<Id> setTargetedAgendaIds = new Set<Id>();
		
		for(Agenda_Item__c agenda : listNewAgendaItems) {
			if(agenda.Document_Language__c == BOD_Constants.AgendaItem_DocLang_Japanese   
				&& agenda.Approval_Status__c == BOD_Constants.AgendaItem_ApprovalStatus_Submitted
				//&& agenda.Approval_Status__c != mapOldAgendaItem.get(agenda.Id).Approval_Status__c
			) {
				/*
					cannot use trigger on Status Changes to control Japanese Agenda is sent for Approval, 
					since when English Agenda is sent to Approval, we also need to update the Approval Status of Japanese Version
					Then we don't know which Approval status changes on Japanese version is from Stanadard approval process or apex update
					
				*/
				if( !BOD_Utility.isBODAdminByUid( Userinfo.getUserId() ) && !BOD_Utility.isBODAdminByPid(Userinfo.getProfileId())  ) {
					setTargetedAgendaIds.add(agenda.Id);	
				}
				
			}//end of if();
		}//end of for();	
		
		
		for(Agenda_Item__c agenda : listNewAgendaItems) {
			if(setTargetedAgendaIds.contains(agenda.Id)) {
				agenda.addError(Label.BOD_TriggerMsg_JPAgenda_No_Approval); 
				//('Agenda in Japanese Version cannot Sumit for Approval!');
			}
		}			
		
	}
	
	public void processApprovalProcessStatusOnJapaneseAgendaItem(
		List<Agenda_Item__c> listNewAgendaItems, 
		Map<Id, Agenda_Item__c> mapOldAgendaItems
	) {
		
		Set<Id> setStatusUpdatedAgendaIds = new Set<Id>();
		
		for(Agenda_Item__c agenda : listNewAgendaItems) {
			if(agenda.Approval_Status__c != mapOldAgendaItems.get(agenda.Id).Approval_Status__c) {
				setStatusUpdatedAgendaIds.add(agenda.Id);
			}
		}//end of for;
		
		List<Agenda_Item__c> listJapAgendaForUpdate = new List<Agenda_Item__c>();
		//for(Agenda_Item__c agenda : [Select Id from Agenda_Item__c where Id IN: setStatusUpdatedAgendaIds]) {			
		//}
		
		/*
			select only one Child Agenda in Japanese from English Parent Agenda in English
		*/
		for(Agenda_Item__c aAgenda : [Select Id, Approval_Status__c, Document_Language__c,
			(Select Id, Approval_Status__c, Document_Language__c 
				from Agenda_Item__r 
					where Document_Language__c =: BOD_Constants.AgendaItem_DocLang_Japanese order by CreatedDate desc limit 1) 
			from Agenda_Item__c where 
				Id IN: setStatusUpdatedAgendaIds
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_English
				//and Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			//setTargetedAgendaItemIds.add(aAgenda.Id);
			
			List<Agenda_Item__c> listJapaneseAgendas = aAgenda.Agenda_Item__r;
			//Considering Japanese Agenda may not exist
			if(listJapaneseAgendas != null && listJapaneseAgendas.size() > 0) {
				listJapaneseAgendas[0].Approval_Status__c = aAgenda.Approval_Status__c;
				listJapAgendaForUpdate.add(listJapaneseAgendas[0]);
			}
						
		}	
		
		system.debug('------------- listJapAgendaForUpdate: ' + listJapAgendaForUpdate);
		
		if(listJapAgendaForUpdate != null && listJapAgendaForUpdate.size() > 0) {
			update listJapAgendaForUpdate;
		}
		
	}//end of method;	
	
	/*
		before & delete
	*/	


	public void checkApprovalStatusOnDeletedAgenda(
		List<Agenda_Item__c> listOldAgendaItems, Map<Id, Agenda_Item__c> mapOldAgendaItems) {
				
		Set<Id> setAgendaIdsInApproval = new Set<Id>();
		
		//for English agenda		
		for(Agenda_Item__c aAgenda : [Select Id, Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapOldAgendaItems.keySet()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_English
				and Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setAgendaIdsInApproval.add(aAgenda.Id);
		}
		
		//for Japanese agenda
		for(Agenda_Item__c aAgenda : [Select Id, Related_Agenda_Item__r.Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapOldAgendaItems.keySet()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_Japanese
				and Related_Agenda_Item__r.Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setAgendaIdsInApproval.add(aAgenda.Id);
		}			
		
		for(Agenda_Item__c agendaDeleted : listOldAgendaItems) {
			if(setAgendaIdsInApproval.contains(agendaDeleted.Id)) {
				agendaDeleted.addError(Label.BOD_TriggerMsg_Agenda_No_Del_In_Approval); //('Cannot delete Agenda Item in Approval Process!');
			}
		}
		
	}


}