public without sharing class BOD_BODMembersTriggerHandler {
	
	//after insert trigger
	public void addPermissionForNewMembers(List<BOD_Members__c> listBODMembers) {
		/*
		ID idBODMemberRT = BOD_Utility.getRecordType('BOD_Member', 'BOD_Members__c');
		ID idBODSecretaryRT = BOD_Utility.getRecordType('Secretary_of_BOD', 'BOD_Members__c');
		ID idBODAdminRT = BOD_Utility.getRecordType('Admin_of_BOD', 'BOD_Members__c');
		ID idBODGuest = BOD_Utility.getRecordType('BOD_Guest', 'BOD_Members__c');
		*/
		
		ID idBODMemberRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODMember_DevName, 
				BOD_Constants.BODMembersObj_APIName); 

		ID idBODAdvisorRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODAdvisor_DevName, 
				BOD_Constants.BODMembersObj_APIName); 				
				
		ID idBODAdminRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODAdmin_DevName, 
				BOD_Constants.BODMembersObj_APIName); 
		ID idBODSecretaryRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODSecretary_DevName, 
				BOD_Constants.BODMembersObj_APIName); 
		ID idBODGuestRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODGuest_DevName, 
				BOD_Constants.BODMembersObj_APIName); 			
						
		
		list<BOD_Meeting__Share> listBODMeetingShares = new list<BOD_Meeting__Share>();
		
		/*
			Guest is added manually by Admin, Guest can only have Read-Only
			Admin, Member and Secretary are added by System automatically 
		*/
		for(BOD_Members__c member : listBODMembers) {
			
			if(member.RecordTypeId == idBODMemberRT) {
				BOD_Meeting__Share share = new BOD_Meeting__Share();
				share.ParentId = member.BOD_Meeting__c;
				share.UserOrGroupId = member.Username__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.BODMeeting_RowCause_Member; //'Member__c';
						
				listBODMeetingShares.add(share);	
				
			} else if(member.RecordTypeId == idBODAdvisorRT) {
				BOD_Meeting__Share share = new BOD_Meeting__Share();
				share.ParentId = member.BOD_Meeting__c;
				share.UserOrGroupId = member.Username__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.BODMeeting_RowCause_Advisor;//'Advisor__c';
						
				listBODMeetingShares.add(share);					

			} else if(member.RecordTypeId == idBODAdminRT) {
				BOD_Meeting__Share share = new BOD_Meeting__Share();
				share.ParentId = member.BOD_Meeting__c;
				share.UserOrGroupId = member.Username__c;
				share.AccessLevel = 'Edit';
				share.RowCause = BOD_Constants.BODMeeting_RowCause_Admin;//'Admin__c';
						
				listBODMeetingShares.add(share);						
										
			} else if(member.RecordTypeId == idBODSecretaryRT) {
				BOD_Meeting__Share share = new BOD_Meeting__Share();
				share.ParentId = member.BOD_Meeting__c;
				share.UserOrGroupId = member.Username__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.BODMeeting_RowCause_Secretary; //'Secretary__c';
						
				listBODMeetingShares.add(share);				
																			
			} else if(member.RecordTypeId == idBODGuestRT) {
				BOD_Meeting__Share share = new BOD_Meeting__Share();
				share.ParentId = member.BOD_Meeting__c;
				share.UserOrGroupId = member.Username__c;
				share.AccessLevel = 'Read';
				share.RowCause = BOD_Constants.BODMeeting_RowCause_Guest; //'Guest__c';
						
				listBODMeetingShares.add(share);												
			}
			
		}	
		
		if(listBODMeetingShares != null && listBODMeetingShares.size() > 0) {
			insert listBODMeetingShares;
		}			
		
	}//end of Method;
	
	/*
		remove user will remove all sharing except Owner permission
		no matter the permission is added from BOD member or just from manual sharing
	*/
	//after delete trigger   oldMap
	public void removePermissionForDeletedMembers(List<BOD_Members__c> listDeletedBODMembers) {
		
		list<BOD_Meeting__Share> listBODMeetingSharesForDelete = new list<BOD_Meeting__Share>();
		
		Map<Id, Set<Id>> mapMtgIdToMemberIds = new Map<Id, Set<Id>>();
		
		//use MeetingId as Key for querying sharing for each meeting
		for(BOD_Members__c member : listDeletedBODMembers) {
			if(mapMtgIdToMemberIds.containsKey(member.BOD_Meeting__c)) {
				mapMtgIdToMemberIds.get(member.BOD_Meeting__c).add(member.Username__c);
			} else {
				mapMtgIdToMemberIds.put( member.BOD_Meeting__c, new Set<Id>{member.Username__c} );
			}
			
		}
		
		//ParentId -> BODMeeting Id,  UserOrGroupId -> BODMember/UserId
		for(BOD_Meeting__Share aMtgShare : [Select Id, ParentId, UserOrGroupId, RowCause, AccessLevel 
			from BOD_Meeting__Share Where ParentId IN: mapMtgIdToMemberIds.keySet() and RowCause != 'Owner'
		]) {
				
				for(Id aUserId : mapMtgIdToMemberIds.get(aMtgShare.ParentId)) {
					if(aUserId == aMtgShare.UserOrGroupId) {
						listBODMeetingSharesForDelete.add(aMtgShare);
					}
				}
			
		}
		
		if(listBODMeetingSharesForDelete != null && listBODMeetingSharesForDelete.size() > 0) {
			delete listBODMeetingSharesForDelete;
		}
		
	}
	
	
	

}