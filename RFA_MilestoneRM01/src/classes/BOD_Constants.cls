public without sharing class BOD_Constants {



	/*
		Public Group
	*/
	public static final String PublicGroupName_BODMember = 'BOD_Member';
	public static final String PublicGroupName_BODAdmin = 'BOD_Admin';
	public static final String PublicGroupName_BODSecretary = 'BOD_Secretary';



	/*
		Label	取締役会	
		Object Name	BOD_Meeting	
		API Name	BOD_Meeting__c
	*/
	
	public static final String BODMeeting_RowCause_Member = 'Member__c';	
	public static final String BODMeeting_RowCause_Admin = 'Admin__c';
	public static final String BODMeeting_RowCause_Secretary = 'Secretary__c';
	public static final String BODMeeting_RowCause_Guest = 'Guest__c';

	/*
		Label	取締役会メンバー	
		Object Name	BOD_Members	
		API Name	BOD_Members__c	
	*/
	public static final String BODMembersObj_APIName = 'BOD_Members__c';	
	
	public static final String BODMembersRT_BODMember_DevName = 'BOD_Member';
	public static final String BODMembersRT_BODAdmin_DevName = 'Admin_of_BOD';
	public static final String BODMembersRT_BODSecretary_DevName = 'Secretary_of_BOD';
	public static final String BODMembersRT_BODGuest_DevName = 'BOD_Guest';

	/*
		Label	議題	
		Object Name	Agenda_Item	
		API Name	Agenda_Item__c
	*/
	
	public static final String AgendaItem_RowCause_Member = 'Member__c';	
	public static final String AgendaItem_RowCause_Admin = 'Admin__c';
	public static final String AgendaItem_RowCause_Secretary = 'Secretary__c';
	public static final String AgendaItem_RowCause_Guest = 'Guest__c';	
	
	public static final String AgendaItemType_ToBeResolved = 'Proposal to be Resolved';
	public static final String AgendaItemType_ToBeReported = 'Item to be Reported';
	
	/*
		Field Label	Approval Status	
		Field Name	Approval_Status	
		API Name	Approval_Status__c	
		Data Type	Picklist
	*/
	public static String AgendaItem_ApprovalStatus_NotSubmitted = 'Not Submitted';
	public static String AgendaItem_ApprovalStatus_Submitted = 'Submitted';	
	public static String AgendaItem_ApprovalStatus_Approved = 'Approved';
	public static String AgendaItem_ApprovalStatus_Rejected = 'Rejected';
	public static String AgendaItem_ApprovalStatus_Recalled = 'Recalled';
	
	public static List<String> AgendaItem_Status_In_Approval = 
		new String[]{
			AgendaItem_ApprovalStatus_Submitted, 
			AgendaItem_ApprovalStatus_Approved, 
			AgendaItem_ApprovalStatus_Rejected
		};

	
	/*
		Field Label	Document Language	
		Field Name	Document_Language	
		API Name	Document_Language__c
		Data Type	Picklist
	*/
	public static String AgendaItem_DocLang_English = 'English';
	public static String AgendaItem_DocLang_Japanese = 'Japanese';	
	
	
	/*
		Label	Agenda Item Members	 
		Object Name	Agenda_Item_Members	
		API Name	Agenda_Item_Members__c
	*/
	public static final String AgendaItemMembersObj_APIName = 'Agenda_Item_Members__c';	
	
	public static final String AgendaItemMembersRT_BODMember_DevName = 'BOD_Member';
	public static final String AgendaItemMembersRT_BODAdmin_DevName = 'BOD_Admin';
	public static final String AgendaItemMembersRT_BODSecretary_DevName = 'BOD_Secretary';	
	public static final String AgendaItemMembersRT_BODGuest_DevName = 'BOD_Guest';
	
	
	
	

}