@IsTest public with sharing class FileUploadControllerTest {
    @IsTest(SeeAllData=true) static void testUpload() {
        
        Student__c[] s = [
            SELECT id
              FROM Student__c 
             WHERE User__c = :UserInfo.getUserId()
             LIMIT 1
        ];
        if(s.size()>0){
            // ok
        } else {
            Id recordTypeId = [
                SELECT id 
                  FROM RecordType 
                 WHERE SobjectType='Account' 
                   AND name = :OberlinDefines.RECORD_TYPE_UNIV_NAME
            ].id;
            Account a = new Account(
                name ='FileUploadControllerTest',
                recordtypeId = recordTypeId ,
                isOwner__c = true
            );
            insert a;
            
            RecordType[] types = [
                SELECT Id 
                  FROM RecordType
                 WHERE name='student'
                   AND SobjectType='Contact' 
                   AND isActive = true
            ];
            Contact tmpContact = new Contact();
            tmpContact.FirstName = 'Student';
            tmpContact.LastName = 'FileUpload';
            tmpContact.AccountId = a.id;
            tmpContact.RecordTypeId = types[0].id;
            
            insert tmpContact;
            
            Student__c tmp = new Student__c(
                name='zeroData',
                User__c = UserInfo.getUserId()
            );
            tmp.Family_name_in_JP_KANJI__c='zero';
            tmp.First_name_in_JP_KANJI__c='data';
            tmp.Family_name_in_EN__c  ='zero';
            tmp.First_name_in_EN__c ='data';
            tmp.Contact__c = tmpContact.id;
            tmp.Email__c = 'yshinohara+upload@pasonatquila.com';
            tmp.Language_settings__c = 'ja';
            insert tmp;
            s.add(tmp);
        }
        
        FileUploadController ctrl = new FileUploadController();
        
        ctrl.parentId = StudentInfo.getCurrentStudent().Id;
        
        Attachment testFile = new Attachment(Body = Blob.valueOf('BODY_CONTENT'));
        testFile.parentId = s[0].id;
        ctrl.file = testFile ;
        ctrl.fileKey = OberlinDefines.PROFILE_PICTURE_FILE_NAME;
        ctrl.upload();
        
    }
}