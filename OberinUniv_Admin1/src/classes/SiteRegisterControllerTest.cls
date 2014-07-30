/**
 * Class containing tests for SiteRegisterController
 */
@IsTest public with sharing class SiteRegisterControllerTest {
    @IsTest(SeeAllData=true) static void testRegistration() {
    
        SiteRegisterController controller = new SiteRegisterController();
        
        System.assert(controller.init() == null);
        
        controller.mode='in';
        
        Id recordTypeId = [
            SELECT id 
              FROM RecordType 
             WHERE SobjectType='Account' 
               AND name = :OberlinDefines.RECORD_TYPE_UNIV_NAME
        ].id;

        Account a = new Account(
            name ='Account university 1',
            recordtypeId = recordTypeId ,
            isOwner__c = true
        );
        insert a;
        controller.university = a.id;
        
        User u1 = new User(
            lastname=''
            , firstname=''
            , email=''
            , Language_settings__c = ''
        );
        User u2 = new User(
            lastname=''
            , firstname='drftg'
            , email=''
            , Language_settings__c = ''
        );
        User u3 = new User(
            lastname='qawse'
            , firstname='drftg'
            , email=''
            , Language_settings__c = ''
        );
        User u4 = new User(
            lastname='qawse'
            , firstname='drftg'
            , email='qaws@bb.net'
            , Language_settings__c = ''
        );
        User u = new User(
            lastname='yshinohara'
            , firstname='registerTest'
            , email='yshinohara+registerTest@pasonatquila.com'
            , Language_settings__c = 'ja'
        );

        controller.user = u1;
        System.assert(controller.registerUser() == null);
        controller.user = u2;
        System.assert(controller.registerUser() == null);
        controller.user = u3;
        System.assert(controller.registerUser() == null);
        controller.user = u4;
        System.assert(controller.registerUser() == null);
        controller.verifyMail = u4.email;
        System.assert(controller.registerUser() == null);
        
        
        controller.user = u;
        controller.verifyMail = u.email;
        
        PageReference ref = controller.registerUser();
        System.assert(ref.getUrl().equals(Page.SiteRegisterConfirm.getUrl()));

    }
    
    @IsTest(SeeAllData=true) static void testGetItems(){
        SiteRegisterController controller = new SiteRegisterController();
        
        Id recordTypeId = [
            SELECT id 
              FROM RecordType 
             WHERE SobjectType='Account' 
               AND name = :OberlinDefines.RECORD_TYPE_UNIV_NAME
        ].id;
        insert new Account(
            name ='Account university',
            recordtypeId = recordTypeId 
        );
        controller.mode='in';
        
        System.assert(controller.getItems().size()>0);
    }
    @IsTest(SeeAllData=true) static void testAreaOptions(){
        SiteRegisterController controller = new SiteRegisterController();
        System.assert(controller.getAreaOptions().size()>0);
    }
    @IsTest(SeeAllData=true) static void testRefreshPart(){
        SiteRegisterController controller = new SiteRegisterController();
        System.assert(controller.RefreshPart()==null);
    }
}