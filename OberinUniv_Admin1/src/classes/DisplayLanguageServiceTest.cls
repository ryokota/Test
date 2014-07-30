@IsTest  public with sharing class DisplayLanguageServiceTest{
    @IsTest(SeeAllData=true) static void test() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
        
            Student__c student = StudentInfo.getCurrentStudent();
            
            RecordType[] RecordTypes=[
                SELECT id
                  FROM RecordType
                 WHERE SobjectType='Program__c' 
                   AND isActive = true
            ];
        
            Id recid=RecordTypes[0].id;
            
            Program__c p = new Program__c (
                Name='language test',
                RecordTypeId=recid,
                Language_settings__c='en_US'
            );
            insert p;
            
            DisplayLanguageService.setProgramLanguage(p.id);
            User[] beforeList = [
                SELECT LanguageLocaleKey, lastname
                  FROM User
                 WHERE id=:student.User__c
            ];
            
            System.assertEquals(p.Language_settings__c, beforeList[0].LanguageLocaleKey);
            
            // return to the original
            DisplayLanguageService.setStudentLanguage();
            User[] afterList = [
                SELECT LanguageLocaleKey
                  FROM User
                 WHERE id=:student.User__c
            ];
            System.assertEquals(student.Language_settings__c, afterList[0].LanguageLocaleKey);
        }
    }
}