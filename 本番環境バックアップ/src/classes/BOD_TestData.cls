@isTest(SeeAllData=false) 
public with sharing class BOD_TestData {
	
	private static testMethod void testBOD1() { 
		BOD_Meeting__c meeting = new BOD_Meeting__c();
		meeting.Name = 'New Meeting 1';
		meeting.Type__c = 'Online';
		meeting.Start_Time__c = System.now();
		
		insert meeting;
		
		Agenda_Item__c agenda = new Agenda_Item__c();
		agenda.Name = 'Agenda Name';
		agenda.BOD_Meeting__c = meeting.Id;
		agenda.Agenda_Item_Type__c = 'Proposal to be Resolved';
		
		insert agenda;
		
		Attachment attch = uploadAttachment(agenda.Id);
		
		//ID idBODGuest = BOD_Utility.getRecordType('BOD_Guest', 'BOD_Members__c');		
		//BOD_Members__c member = new BOD_Members__c();
		//member.BOD_Meeting__c = meeting.Id;
		//member.Username__c = Userinfo.getUserId();
		//member.RecordTypeId = idBODGuest;
		//insert member;
	}
	
    public static Attachment uploadAttachment(Id ParentId) {
        Attachment attach = new Attachment();
        Blob body = Blob.valueOf('Some Text');
        attach.Body = body;
        // add the user entered name
        attach.Name = 'RFA_Attachment.pdf';
        attach.ContentType = 'application/pdf';
        attach.IsPrivate = false;
        // attach the pdf to the account
        attach.ParentId = ParentId;        
        insert attach;
        return attach;
    }	
    

}