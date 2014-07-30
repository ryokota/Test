public without sharing class BOD_BODMeetingTriggerHandler {
	
	ID PublicGroupId_BODMember = BOD_Utility.getPuglicGroupId( BOD_Constants.PublicGroupName_BODMember );   //'BOD_Member'); //'00GN0000000HcjU';
	ID PublicGroupId_BODAdvisor = BOD_Utility.getPuglicGroupId( BOD_Constants.PublicGroupName_BODAdvisor ); 
	ID PublicGroupId_BODAdmin = BOD_Utility.getPuglicGroupId( BOD_Constants.PublicGroupName_BODAdmin );   //'BOD_Admin'); //'00GN0000000HcjT';
	ID PublicGroupId_BODSecretary = BOD_Utility.getPuglicGroupId( BOD_Constants.PublicGroupName_BODSecretary ); //'BOD_Secretary'); //'00GN0000000HcjV';
		
	public void insertBODMembersWithNewMeeting(List<BOD_Meeting__c> listBODMeetings) {
		
		Set<Id> setBODMemberIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODMember);
		Set<Id> setBODAdvisorIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODAdvisor);
		Set<Id> setBODAdminIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODAdmin);		
		Set<Id> setBODSecretaryIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODSecretary);

		
		ID idBODMemberRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODMember_DevName, 
				BOD_Constants.BODMembersObj_APIName); //('BOD_Member', 'BOD_Members__c');
		ID idBODAdvisorRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODAdvisor_DevName, 
				BOD_Constants.BODMembersObj_APIName);				
		ID idBODAdminRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODAdmin_DevName, 
				BOD_Constants.BODMembersObj_APIName); //('Admin_of_BOD', 'BOD_Members__c');
		ID idBODSecretaryRT = 
			BOD_Utility.getRecordType(
				BOD_Constants.BODMembersRT_BODSecretary_DevName, 
				BOD_Constants.BODMembersObj_APIName); //('Secretary_of_BOD', 'BOD_Members__c');
		
		List<BOD_Members__c> listNewBODMembers = new List<BOD_Members__c>();
		
		for(BOD_Meeting__c meeting : listBODMeetings) {
			
			if(setBODMemberIds != null && setBODMemberIds.size() > 0) {
				for(Id aId : setBODMemberIds) {

					BOD_Members__c member = new BOD_Members__c();
					member.BOD_Meeting__c = meeting.Id;
					member.Username__c = aId;
					member.RecordTypeId = idBODMemberRT;
					
					listNewBODMembers.add(member);
				}
			}
			
			if(setBODAdvisorIds != null && setBODAdvisorIds.size() > 0) {
				for(Id aId : setBODAdvisorIds) {

					BOD_Members__c member = new BOD_Members__c();
					member.BOD_Meeting__c = meeting.Id;
					member.Username__c = aId;
					member.RecordTypeId = idBODAdvisorRT;
					
					listNewBODMembers.add(member);
				}
			}			
			
			//don't need to add Secretary as members on BOD Meeting, will control acess on each Agenda Item
			//even Secretary has read only on BOD Meeting, 
			if(setBODSecretaryIds != null && setBODSecretaryIds.size() > 0) {
				for(Id aId : setBODSecretaryIds) {					
					BOD_Members__c member = new BOD_Members__c();
					member.BOD_Meeting__c = meeting.Id;
					member.Username__c = aId;
					member.RecordTypeId = idBODSecretaryRT;
					
					listNewBODMembers.add(member);
				}
			}	
			
			if(setBODAdminIds != null && setBODAdminIds.size() > 0) {
				for(Id aId : setBODAdminIds) {
					BOD_Members__c member = new BOD_Members__c();
					member.BOD_Meeting__c = meeting.Id;
					member.Username__c = aId;
					member.RecordTypeId = idBODAdminRT;
					
					listNewBODMembers.add(member);
				}
			}					
			
		}//end of for(meetings)

		//will add access permission for each member based on Record Type in BOD Member Trigger
		if(listNewBODMembers != null && listNewBODMembers.size() > 0) {
			insert listNewBODMembers;
		}
		
		
	}//end of method;
	

	

	

}