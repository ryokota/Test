public with sharing class SiteRegisterService {

    public static Id getAccountId(String university){
        Id id = [SELECT id FROM account WHERE id=:university].id;
        return id;
    }

    public static Id getProfileId(String profile){
        Id id = [SELECT id FROM profile WHERE name = :profile].id;
        return id;
    }
    
    public static Id getProfile(User user, String university){
    
        Account univ = [
            SELECT isOwner__c
              FROM Account
             WHERE id =:university
        ];
        
        if (univ.isOwner__c) {
            return  getProfileId(OberlinDefines.OUTBOUND_PROFILE);
        } else{
            return  getProfileId(OberlinDefines.INBOUND_PROFILE);
        }
    }
    
    /**
     * 
     */
    public static boolean isSystemOwnerUniversity(String university){
        
        Account univ = [
            SELECT isOwner__c
              FROM Account
             WHERE id =:university
        ];
        return univ.isOwner__c;
    }
    
    public static User getNewUser(){
        
        return new User(
            EmailEncodingKey = OberlinDefines.DEFAULT_EMAIL_ENCODING
          , LocaleSidKey = OberlinDefines.DEFAULT_LOCALE 
          , LanguageLocaleKey = OberlinDefines.DEFAULT_LANG 
          , Language_settings__c = OberlinDefines.DEFAULT_LANG 
          , TimeZoneSidKey = OberlinDefines.DEFAULT_TIMEZONE 
       );
    }
}