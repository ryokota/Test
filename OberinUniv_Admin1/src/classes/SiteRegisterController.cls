/**
 * An apex class that creates a portal user
 */
public with sharing class SiteRegisterController {
    // PORTAL_ACCOUNT_ID is the account on which the contact will be created on and then enabled as a portal user.
    // you need to add the account owner into the role hierarchy before this will work - please see Customer Portal Setup help for more information.       

    public User user {get;set;}
    public String university {get;set;}
    public String verifyMail {get;set;}
    public String mode { get; set; }// 派遣/受入 2014-06-11
    public String area { get; set; }// 地域 2014-06-11

    // 地域選択の作成 2014-06-11
    public List<SelectOption> getAreaOptions() {
    
        List<SelectOption> options = new List<SelectOption>();
        DescribeFieldResult f = SObjectType.Account.fields.Region__c;
        List<PicklistEntry> entries = f.getPicklistValues();
        for (PicklistEntry e : entries) {
            if (e.isActive()) {
                options.add(new SelectOption(e.getValue(), e.getLabel()));
            }
        }
        return options ;
    }
    // リフレッシュ 2014-06-11
    public PageReference RefreshPart(){
        return null;
    }
    // 
    public List<SelectOption> getItems() {
    
        Id recordTypeId = [
            SELECT id 
              FROM RecordType 
             WHERE SobjectType='Account' 
               AND name = :OberlinDefines.RECORD_TYPE_UNIV_NAME
             LIMIT 1
        ].id;

        // 地域情報補完
        if(area==null || area=='' || area.length()==0){
            DescribeFieldResult f = SObjectType.Account.fields.Region__c;
            List<PicklistEntry> entries = f.getPicklistValues();
            PicklistEntry e = entries[0];
            area=e.getValue();
        }
        
//        List<Account> accountList = [
//            SELECT id, name 
//              FROM account 
//             WHERE recordtypeid =:recordTypeId 
//             ORDER BY name
//        ];
        List<Account> accountList = new List<Account>();
        if(mode=='in'){
            accountList =[
                SELECT Id, Name 
                  FROM Account 
                 WHERE RecordTypeId =:recordTypeId 
                   AND IsOwner__c = false
                   AND ( Region__c = :area OR Regardless_of_region__c = true )
                 ORDER BY Regardless_of_region__c, Name
            ];
        }else if(mode=='out'){
            accountList =[
                SELECT Id, Name 
                  FROM Account 
                 WHERE RecordTypeId =:recordTypeId 
                   AND IsOwner__c = true
                 ORDER BY Name
            ];
        }
        
        List<SelectOption> options = new List<SelectOption>();
        if(mode=='in'){
            options.add(new SelectOption('', Label.BlankUniversity));
        }
        for (Account a : accountList) {
            options.add(new SelectOption(a.id,a.name));
        }
        return options;
    }

    
    public SiteRegisterController () {
    }
    
    public PageReference init(){
        user = getUser();
        if(String.isBlank(university)){
            Account[] a = [
                SELECT id
                  FROM Account
                 WHERE isOwner__c = true
                 LIMIT 1
            ];
            if(a.size()>0){
                university = a[0].id;
            }
        }
        
        // 処理モードにより言語設定の切り替え、地域の固定を行う
        String test = System.currentPageReference().getParameters().get('mode'); 
        
        if(test==null || test == '' || test.length()==0){
            mode='out';
            user.Language_settings__c='ja';
        }else if(test=='in'){
            mode='in';
            user.Language_settings__c='en_US';
        }else if(test=='out'){
            mode='out';
            user.Language_settings__c='ja';
        }
        return null;
    }
      
    public PageReference registerUser() {

        Id userId;
        Id studentId;
        Id accountId;
        boolean isOwner = false;
        
        if (isValid()){
            accountId = SiteRegisterService.getAccountId(university);//get UniversityId;
            Savepoint sp = Database.setSavepoint();
            try {
                Student__c student = createStudent();
                insert student;
                studentId = student.id;
                
                isOwner = SiteRegisterService.isSystemOwnerUniversity(university);
                
                User user = createPortalUserData(accountId);
                updateStudent(studentId, user.Id, isOwner );
                
                // It can not be specified in the profile, comment out.
                // User user = createPortalUserData();
                // userId = Site.createPortalUser(user, accountId, null);
            } catch(Exception ex) {
                Database.rollback(sp);
                ApexPages.addMessages(ex);
                return null;
            }
            PageReference page = System.Page.SiteRegisterConfirm;
            page.setRedirect(true);
            return page;
        }
        return null;
    }
    
    private Student__c createStudent(){
        return new Student__c(
              name = user.lastname+' '+user.firstname
            , Email__c = user.email
            , Language_settings__c = user.Language_settings__c
            , First_name_in_EN__c = user.firstname
            , First_name_in_JP_KANJI__c = user.firstname
            , Family_name_in_EN__c = user.lastname
            , Family_name_in_JP_KANJI__c = user.lastname
        );
    }
    
//    private User createPortalUserData(){
//        
//        User user = getUser();
//        
//        user.Username = user.email;
//        user.Email = user.email;
//        user.CommunityNickname = user.email;
//
//        user.alias = user.firstname.left(1)+user.lastname.left(4);
//        user.LanguageLocaleKey = user.Language_settings__c;
//        
//        user.profileId = SiteRegisterService.getProfile(user, university);
//        
//        return user;
//    }
    
    private User createPortalUserData(Id accountId){
    
        RecordType[] types = [
            SELECT Id 
              FROM RecordType
             WHERE name='student'
               AND SobjectType='Contact' 
               AND isActive = true
        ];
    
        Contact c = new Contact();
        c.FirstName = user.firstname;
        c.LastName = user.lastname;
        c.AccountId = accountId;
        c.email = user.email;
        c.Language_settings__c = user.Language_settings__c;
        if(types.size()>0){
            c.RecordTypeId = types[0].id;
        }
        insert c;
        
        User user = getUser();
        
        User u = SiteRegisterService.getNewUser();
        u.Username = user.email;
        u.lastname = user.lastname;
        u.firstname = user.firstname;
        u.Email = user.email;
        u.LanguageLocaleKey = user.Language_settings__c;
        u.Language_settings__c = user.Language_settings__c;

        u.alias = user.firstname.left(1)+user.lastname.left(4);
        u.CommunityNickname = user.email;
        u.contactId = c.id;
        u.profileId = SiteRegisterService.getProfile(user, university);
        
        insert u;
        
        System.ResetPasswordResult ret = System.resetPassword(u.Id, true);
        
        return u;
    }
    
    private void updateStudent(Id studentId, Id userId, boolean isOwner){

        Id RecTypeId=null;
        if(isOwner){
            RecTypeId=StudentInfo.getOutboundStudentRecordType();
        }else{
            RecTypeId=StudentInfo.getInboundStudentRecordType();
        }

        User[] users = [
            SELECT ContactId
              FROM User
             WHERE Id =:userId
        ];
        
        Student__c[] slist=[
            SELECT id
              FROM Student__c
             WHERE id=:studentId
        ];
        if(slist.size()>0){
            Student__c s=slist[0];
            s.Contact__c = users.size() > 0 ? users[0].ContactId : null;
            s.User__c = userId;
            s.RecordTypeId = RecTypeId;
            s.OwnerId = userId;
            if(isOwner){
                s.First_name_in_EN__c ='';
                s.Family_name_in_EN__c ='';
            }
            update slist;
        }

        /*
        update new Student__c(
            Id = studentId
          , Contact__c = users.size() > 0 ? users[0].ContactId : null
          , User__c = userId
          , RecordTypeId = RecTypeId
        );*/
    }
    
    private Boolean isValid(){
        User u = getUser();
        if (String.isBlank(u.FirstName)){
            u.FirstName.addError(System.Label.RequiredMessage);
            return false;
        }else if(mode=='in'){
            if(!isFullAlphabet(u.FirstName)){
                u.FirstName.addError(Label.EnterAlphabet);
                return false;
            }
        }
        if (String.isBlank(u.LastName)){
            u.LastName.addError(System.Label.RequiredMessage);
            return false;
        }else if(mode=='in'){
            if(!isFullAlphabet(u.LastName)){
                u.LastName.addError(Label.EnterAlphabet);
                return false;
            }
        }
        if (String.isBlank(u.Email)){
            u.Email.addError(System.Label.RequiredMessage);
            return false;
        } else if (String.isBlank(verifyMail)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
                System.Label.Mail_for_confirm +': '+System.Label.RequiredMessage, 
                System.Label.Mail_for_confirm +': '+System.Label.RequiredMessage));
            return false;
        } else if(!verifyMail.equals(u.Email)){
            u.Email.addError(System.Label.Email_do_not_match);
            return false;
        }
        if(String.isBlank(u.Language_settings__c)){
            u.LanguageLocaleKey.addError(System.Label.RequiredMessage);
            return false;
        }
        
        // 大学がブランクの場合にエラー 2014-06-11
        if(String.isBlank(university)){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
                Label.University +': '+System.Label.RequiredMessage, 
                Label.University +': '+System.Label.RequiredMessage));
            return false;
        }
        return true;
    }

    public static Boolean isFullAlphabet(String s) {
        String regexp = Label.SiteRegisterRegexp;
        return (s == null || s == '') ? true : Pattern.matches(regexp, s);
    }
    
    public User getUser(){
        if (user == null) {
            user = SiteRegisterService.getNewUser();
        }
        return user;
    }
}