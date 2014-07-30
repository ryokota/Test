public with sharing class POU_UserTriggerHandler {

    // ==INSERT
    public void onBeforeInsert(User[] newItems, Map<Id, User> newItemMap) {
    }
    public void onAfterInsert(User[] newItems, Map<Id, User> newItemMap) {
    }
    // ==UPDATE
    public void onBeforeUpdate(User[] oldItems, User[] newItems, Map<Id, User> oldItemMap, Map<Id, User> newItemMap) {
    }
    public void onAfterUpdate(User[] oldItems, User[] newItems, Map<Id, User> oldItemMap, Map<Id, User> newItemMap) {
        updateStudent(oldItems, newItems);
    }
    // ==DELETE
    public void onBeforeDelete(User[] oldItems, Map<Id, User> oldItemMap) {
    }
    public void onAfterDelete(User[] oldItems, Map<Id, User> oldItemMap) {
    }
    // ==UNDELETE
    public void onUndelete(User[] items) {
    }
    
    private void updateStudent(User[] oldItems, User[] newItems){
        Map<Id, User> userMap = new Map<Id, User>();
        for(integer i = 0; i < oldItems.size(); i++){
            User oldUser = oldItems[i];
            User newUser = newItems[i];
            if( POU_CommonService.isNotEquals(oldUser.Email, newUser.Email)
             || POU_CommonService.isNotEquals(oldUser.lastname, newUser.lastname)
             || POU_CommonService.isNotEquals(oldUser.firstname, newUser.firstname)
             || POU_CommonService.isNotEquals(oldUser.Language_settings__c, newUser.Language_settings__c) ){
            
                userMap.put(newUser.id, newUser);//反映対象項目に違いのあるUserを抽出
            }
        }
        
        if(userMap.size()>0){
            Student__c[] students=[
                SELECT Id, User__c, Email__c
                     , RecordType.Name
                     , Family_name_in_JP_KANJI__c
                     , First_name_in_JP_KANJI__c
                     , Family_name_in_EN__c
                     , First_name_in_EN__c
                     , Language_settings__c
                  FROM Student__c
                 WHERE User__c in :userMap.keySet()
            ];
            if(students.size()>0){
                for(integer i = 0; i < students.size(); i++){
                    Student__c s = students[i];
                    User u = userMap.get(s.User__c);
                    
                    if(StudentInfo.INBOUND_RECTYPE.equals(s.RecordType.Name)){
                        s.Family_name_in_EN__c = u.lastname;
                        s.First_name_in_EN__c = u.firstname;
                    }else{
                        s.Family_name_in_JP_KANJI__c=u.lastname;
                        s.First_name_in_JP_KANJI__c=u.firstname;
                    }
                    s.email__c=u.email;
                    s.Language_settings__c = u.Language_settings__c;
                }
                update students;
            }
        }
    }
}