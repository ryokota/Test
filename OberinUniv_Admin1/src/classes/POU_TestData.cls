public with sharing class POU_TestData{
    
    public static User createOperationUser() {
        
        Account univ = createTestUniversity();
        SiteRegisterController con = new SiteRegisterController();

        User user = con.getUser();
        user.lastname='しのはら';
        user.firstname='テスト';
        user.email='yshinohara+OperateCheck@pasonatquila.com';
        user.Language_settings__c='ja';
        
        con.verifyMail='yshinohara+OperateCheck@pasonatquila.com';
        con.user=user;
        con.university=univ.id;
        con.registerUser();
        
        User[] Users=[
            SELECT id, ContactId
              FROM User
             WHERE email=:user.email
        ];
        return Users[0];
    }
    public static void updateCurrentStudent(){
        
        Student__c s = POU_CommonService.getCurrentStudent();
        s.Phone__c = '0';
        s.Email__c= 'yshinohara+apextest@pasonatquila.com';
        s.Language_settings__c = 'ja';

        s.Same_as_applicant_address_chk__c = true;
        s.Same_as_guardian_address_chk__c = true;
        s.Passport_status__c = 'Don\'t have';
        
        s.Family_name_in_EN__c='SHINO';
        s.First_name_in_EN__c='TEST';
        s.Have_you_ever_been_abroad__c='Yes';
        s.Do_you_have_any_concern_about_health__c='Yes';
        s.criminal_records_chk__c='Yes';
        s.Religion_chk__c='No';
        s.QA_Concern_foods_chk__c='No';
        s.QA_allergy_to_medicines_chk__c='No';
        s.Do_you_have_allergy_to_pets__c='No';
        s.Detail_of_your_oversea_experiences__c='this is test';
        s.Summary_of_health_issues_and_symptoms__c='this is test';
        s.Detail_of_criminal_record__c='this is test';

        s.Guardian_Family_name_in_EN__c = 'a';
        s.Guardian_Family_name_in_JP__c = 'あ';
        s.Guardian_First_name_in_EN__c = 'a';
        s.Guardian_First_name_in_JP__c = 'あ';
        
        s.Level_of_ELP_Program__c='Level 1';
        s.Gender__c='Male';
        s.Faculty__c='College of Arts and Sciences';
        s.Grade__c='1';
        s.Nationality_area__c='Asia';
        
        s.isAgreed__c=true;

        update s;
    }
    
    public static User createAcceptedUser() {
        
        Account univ = createTestAcceptedUniversity();
        SiteRegisterController con = new SiteRegisterController();

        User user = con.getUser();
        user.lastname='shinohara';
        user.firstname='test';
        user.email='yshinohara+Accepted@pasonatquila.com';
        user.Language_settings__c='en_US';
        
        con.verifyMail='yshinohara+Accepted@pasonatquila.com';
        con.user=user;
        con.university=univ.id;
        con.registerUser();
        
        User[] Users=[
            SELECT id, ContactId
              FROM User
             WHERE email=:user.email
        ];
        return Users[0];
    }
    
    public static Account createTestUniversity(){
        
        RecordType rt = POU_CommonService.getRecordType('Account', OberlinDefines.RECORD_TYPE_UNIV_NAME);

        Account univ = new Account();
        univ.name ='Owner University';
        univ.recordtypeId = rt.Id;
        univ.isOwner__c = true;
        insert univ;
        
        return univ;
    }
    
    public static Account createTestAcceptedUniversity(){
        
        RecordType rt = POU_CommonService.getRecordType('Account', OberlinDefines.RECORD_TYPE_UNIV_NAME);

        Account univ = new Account();
        univ.name ='Owner University';
        univ.recordtypeId = rt.Id;
        univ.isOwner__c = false;
        insert univ;
        
        return univ;
    }
    
    public static Program__c createTestProgramOutShort(){
        
        RecordType rt = POU_CommonService.getRecordType('Program__c', OberlinDefines.PROG_RECTYPE_OUT);
        Program__c p = new Program__c (
            name='Test Program'
          , RecordTypeId=rt.Id
          , Program_type__c=OberlinDefines.PROG_TYPE_SHORT
        );
        insert p;
        return p;
    }
    public static Program__c createTestProgramOutLong(){
        
        RecordType rt = POU_CommonService.getRecordType('Program__c', OberlinDefines.PROG_RECTYPE_OUT);
        Program__c p = new Program__c (
            name='Test Program'
          , RecordTypeId=rt.Id
          , Program_type__c=OberlinDefines.PROG_TYPE_LONG
        );
        insert p;
        return p;
    }
    public static Program__c createTestProgramOutGo(){
        
        RecordType rt = POU_CommonService.getRecordType('Program__c', OberlinDefines.PROG_RECTYPE_OUT);
        Program__c p = new Program__c (
            name='Test Program'
          , RecordTypeId=rt.Id
          , Program_type__c=OberlinDefines.PROG_TYPE_GO
        );
        insert p;
        return p;
    }
    public static Program__c createTestProgramInShort(){
        
        RecordType rt = POU_CommonService.getRecordType('Program__c', OberlinDefines.PROG_RECTYPE_IN);
        Program__c p = new Program__c (
            name='Test Program'
          , RecordTypeId=rt.Id
          , Program_type__c=OberlinDefines.PROG_TYPE_SHORT
        );
        insert p;
        return p;
    }
    public static Program__c createTestProgramInExchange(){
        
        RecordType rt = POU_CommonService.getRecordType('Program__c', OberlinDefines.PROG_RECTYPE_IN);
        Program__c p = new Program__c (
            name='Test Program'
          , RecordTypeId=rt.Id
          , Program_type__c=OberlinDefines.PROG_TYPE_EXCHANGE
        );
        insert p;
        return p;
    }
}