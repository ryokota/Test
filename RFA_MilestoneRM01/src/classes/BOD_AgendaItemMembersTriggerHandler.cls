public without sharing class BOD_AgendaItemMembersTriggerHandler {
	
	
	/*
		after insert trigger
	*/
	
	//after insert trigger
	public void addPermissionForNewAgendaItemMembers(List<Agenda_Item_Members__c> listNewAgendaItemMembers) {
		
		ID idAgendaItemMemberRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODMember_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		ID idAgendaItemAdminRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODAdmin_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		ID idAgendaItemSecretaryRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODSecretary_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 
		ID idAgendaItemGuestRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.AgendaItemMembersRT_BODGuest_DevName, 
				BOD_Constants.AgendaItemMembersObj_APIName); 			
						
		
		list<Agenda_Item__Share> listAgendaItemShares = new list<Agenda_Item__Share>();
		
		/*
			Guest is added manually by Admin, Guest can only have Read-Only
			Admin, Member and Secretary are added by System automatically 
		*/
		for(Agenda_Item_Members__c member : listNewAgendaItemMembers) {
			
			if(member.RecordTypeId == idAgendaItemMemberRT) {
				Agenda_Item__Share share = new Agenda_Item__Share();
				share.ParentId = member.Agenda_Item__c;
				share.UserOrGroupId = member.User__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.AgendaItem_RowCause_Member; //'Member__c';
						
				listAgendaItemShares.add(share);	

			} else if(member.RecordTypeId == idAgendaItemAdminRT) {
				Agenda_Item__Share share = new Agenda_Item__Share();
				share.ParentId = member.Agenda_Item__c;
				share.UserOrGroupId = member.User__c;
				share.AccessLevel = 'Edit';
				share.RowCause = BOD_Constants.AgendaItem_RowCause_Admin;//'Admin__c';
						
				listAgendaItemShares.add(share);						
										
			} else if(member.RecordTypeId == idAgendaItemSecretaryRT) {
				Agenda_Item__Share share = new Agenda_Item__Share();
				share.ParentId = member.Agenda_Item__c;
				share.UserOrGroupId = member.User__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.AgendaItem_RowCause_Secretary; //'Secretary__c';
						
				listAgendaItemShares.add(share);				
																			
			} else if(member.RecordTypeId == idAgendaItemGuestRT) {
				Agenda_Item__Share share = new Agenda_Item__Share();
				share.ParentId = member.Agenda_Item__c;
				share.UserOrGroupId = member.User__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.AgendaItem_RowCause_Guest; //'Guest__c';
						
				listAgendaItemShares.add(share);												
			}
			
		}	
		
		if(listAgendaItemShares != null && listAgendaItemShares.size() > 0) {
			insert listAgendaItemShares;
		}		
		
		system.debug('-------- listAgendaItemShares: ' + listAgendaItemShares);	
		
	}//end of Method;	
	
	
	/*
		after delete trigger
	*/
	
	public void removePermissionForDeletedAgendaItemMembers(List<Agenda_Item_Members__c> listOldDeletedAgendaItemMembers) {
		
		list<Agenda_Item__Share> listAgendaItemSharesForDelete = new list<Agenda_Item__Share>();
		
		Map<Id, Set<Id>> mapAgendaIdToMemberIds = new Map<Id, Set<Id>>();
		
		//use MeetingId as Key for querying sharing for each meeting
		for(Agenda_Item_Members__c member : listOldDeletedAgendaItemMembers) {
			if(mapAgendaIdToMemberIds.containsKey(member.Agenda_Item__c)) {
				mapAgendaIdToMemberIds.get(member.Agenda_Item__c).add(member.User__c);
			} else {
				mapAgendaIdToMemberIds.put( member.Agenda_Item__c, new Set<Id>{member.User__c} );
			}
			
		}
		
		//ParentId -> BODMeeting Id,  UserOrGroupId -> BODMember/UserId
		for(Agenda_Item__Share aAgendaItemShare : [Select Id, ParentId, UserOrGroupId, RowCause, AccessLevel 
			from Agenda_Item__Share Where ParentId IN: mapAgendaIdToMemberIds.keySet() and RowCause != 'Owner'
		]) {
				
				for(Id aUserId : mapAgendaIdToMemberIds.get(aAgendaItemShare.ParentId)) {
					if(aUserId == aAgendaItemShare.UserOrGroupId) {
						listAgendaItemSharesForDelete.add(aAgendaItemShare);
					}
				}
			
		}
		
		if(listAgendaItemSharesForDelete != null && listAgendaItemSharesForDelete.size() > 0) {
			delete listAgendaItemSharesForDelete;
		}
		
	}	

}