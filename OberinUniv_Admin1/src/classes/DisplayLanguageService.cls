public with sharing class DisplayLanguageService {

    public static void setProgramLanguage(Id programId){
        Program__c[] plist=[
            SELECT id, Language_settings__c
            FROM Program__c
            WHERE id=:programId
        ];
        
        if(plist.size()>0){
            Program__c program = plist[0];
            Student__c student = StudentInfo.getCurrentStudent();
            
            String language = program.Language_settings__c;
            
            if(language!=null){
                if(student.Language_settings__c.equals(language)){
                    return;
                }
                User[] users=[
                    SELECT id, LanguageLocaleKey
                      FROM User
                     WHERE id=:student.User__c
                ];
                if(users.size()>0){
                    users[0].LanguageLocaleKey=language;
                    update users;
                }
                User[] test=[
                    SELECT id, LanguageLocaleKey, Language_settings__c
                      FROM User
                     WHERE id=:student.User__c
                ];
            }
        }
    }
    public static boolean setStudentLanguage(){
        Student__c student = StudentInfo.getCurrentStudent();
        
        User[] users=[
            SELECT id, LanguageLocaleKey
            FROM User
            WHERE id=:student.User__c
        ];
        if(users[0].LanguageLocaleKey.equals(student.Language_settings__c)){
            return false;
        }else{
            update new User(
                id=student.User__c,
                LanguageLocaleKey=student.Language_settings__c
            );
            return true;
        }
    }
}