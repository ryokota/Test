public with sharing class POU_StudentTriggerHandler {

    // ==INSERT
    public void onBeforeInsert(Student__c[] newItems, Map<Id, Student__c> newItemMap) {
    }
    public void onAfterInsert(Student__c[] newItems, Map<Id, Student__c> newItemMap) {
    }
    // ==UPDATE
    public void onBeforeUpdate(Student__c[] oldItems, Student__c[] newItems, Map<Id, Student__c> oldItemMap, Map<Id, Student__c> newItemMap) {
        setAgreed(oldItems, newItems);
        setName(newItems);
    }
    public void onAfterUpdate(Student__c[] oldItems, Student__c[] newItems, Map<Id, Student__c> oldItemMap, Map<Id, Student__c> newItemMap) {

        List<Student__c> agreedOldItems = new List<Student__c>();
        List<Student__c> agreedNewItems = new List<Student__c>();
        for(Integer i=0;i<oldItems.size();i++){
            agreedOldItems.add(oldItems[i]);
            agreedNewItems.add(newItems[i]);
            
        }
        system.debug('Debug::[POU_StudentTriggerHandler][onAfterUpdate]:size='+agreedOldItems.size());
        for(Integer i=agreedOldItems.size()-1; i>= 0; i--){
            system.debug('Debug::[POU_StudentTriggerHandler][onAfterUpdate]:OldName='+agreedOldItems[i].name);
            system.debug('Debug::[POU_StudentTriggerHandler][onAfterUpdate]:NewName='+agreedNewItems[i].name);
            if(!agreedNewItems[i].isAgreed__c){
                agreedOldItems.remove(i);
                agreedNewItems.remove(i); 
            }
        }
        system.debug('Debug::[POU_StudentTriggerHandler][onAfterUpdate]:old:size='+agreedOldItems.size());
        system.debug('Debug::[POU_StudentTriggerHandler][onAfterUpdate]:new:size='+agreedNewItems.size());
        if(agreedOldItems.size()>0 && agreedNewItems.size()>0){
            updateContact(agreedOldItems, agreedNewItems);
        }
    }
    // ==DELETE
    public void onBeforeDelete(Student__c[] oldItems, Map<Id, Student__c> oldItemMap) {
    }
    public void onAfterDelete(Student__c[] oldItems, Map<Id, Student__c> oldItemMap) {
    }
    // ==UNDELETE
    public void onUndelete(Student__c[] items) {
    }
    
    private void setAgreed(Student__c[] oldItems, Student__c[] newItems){
        for(integer i = 0; i < oldItems.size(); i++){
            if( oldItems[i].Picture_ID__c == null && newItems[i].Picture_ID__c == null ){
                // 写真アップロード処理以外
            } else if( oldItems[i].Picture_ID__c == null || newItems[i].Picture_ID__c == null ){
                // 写真アップロード処理（新規）
                continue; 
            } else if( POU_CommonService.isNotEquals( oldItems[i].Picture_ID__c, newItems[i].Picture_ID__c ) ){
                // 写真アップロード処理（変更）
                continue; 
            }

            if(!oldItems[i].isAgreed__c && !String.isBlank(oldItems[i].Contact__c) && !String.isBlank(oldItems[i].User__c)){
                if(newItems[i].User__c == UserInfo.getUserId()){
                    newItems[i].isAgreed__c=true;
                }
            }
        }
    }
    
    private void updateContact(Student__c[] oldItems, Student__c[] newItems){
        Map<Id, Student__c> StudentMap = new Map<Id, Student__c>();
        
        for(integer i = 0; i < oldItems.size(); i++){
            Student__c oldStudent = oldItems[i];
            Student__c newStudent = newItems[i];
            
            if ( POU_CommonService.isNotEquals(oldStudent.Email__c, newStudent.Email__c)
              || POU_CommonService.isNotEquals(oldStudent.Family_name_in_EN__c, newStudent.Family_name_in_EN__c)
              || POU_CommonService.isNotEquals(oldStudent.First_name_in_EN__c, newStudent.First_name_in_EN__c)
              || POU_CommonService.isNotEquals(oldStudent.Family_name_in_JP_KANJI__c, newStudent.Family_name_in_JP_KANJI__c)
              || POU_CommonService.isNotEquals(oldStudent.First_name_in_JP_KANJI__c, newStudent.First_name_in_JP_KANJI__c)
              || POU_CommonService.isNotEquals(oldStudent.Language_settings__c, newStudent.Language_settings__c) ){
              
              StudentMap.put(newStudent.Contact__c, newStudent);//反映対象項目に違いのあるStudentを抽出
            }
        }
        if(StudentMap.size()>0){
            RecordType[] types =[
                SELECT id, name
                  FROM RecordType
                 WHERE SobjectType ='Student__c'
            ];
            Map<String, String> studentRecMap = new Map<String, String>();
            for(integer i = 0; i < types.size(); i++){
                RecordType t = types[i];
                studentRecMap.put(t.id, t.name);
            }
            
            Contact[] contacts=[
                SELECT id, User__c, Email, LastName, FirstName, Language_settings__c
                  FROM Contact
                 WHERE id in :StudentMap.keySet()
            ];
            if(contacts.size()>0){
                for(integer i = 0; i < contacts.size(); i++){
                    Contact c = contacts[0];
                    Student__c s = StudentMap.get(c.id);
                    
                    if(StudentInfo.INBOUND_RECTYPE.equals(studentRecMap.get(s.RecordTypeid))){
                        c.lastname = s.Family_name_in_EN__c;
                        c.firstname = s.First_name_in_EN__c;
                    }else{
                        if(s.Family_name_in_JP_KANJI__c==null){
                            c.lastname = s.Family_name_in_EN__c;
                            c.firstname = s.First_name_in_EN__c;
                        }else{
                            c.lastname = s.Family_name_in_JP_KANJI__c;
                            c.firstname = s.First_name_in_JP_KANJI__c;
                        }
                    }
                    c.Email = s.Email__c;
                    c.Language_settings__c = s.Language_settings__c;
                }
                update contacts;
            }
        }
    }
    
    private void setName(Student__c[] newItems){
        if(newItems.size()>0){
            for(integer i = 0; i < newItems.size(); i++){
                Student__c s = newItems[i];
                s.name = editStudentName(
                        s.Family_name_in_EN__c,
                        s.First_name_in_EN__c,
                        s.Family_name_in_JP_KANJI__c,
                        s.First_name_in_JP_KANJI__c,
                        s.RecordTypeId
                    );
            }
        }
    }
    public String editStudentName(
          String lastName, String firstName
        , String lastNameKanji, String firstNameKanji
        , Id RecordTypeId){
        
        RecordType[] rt = [
            SELECT Name 
              FROM RecordType 
             WHERE Id = :RecordTypeId
        ];
        if('Outbound'.equals(rt[0].Name)){
            return  lastNameKanji + ' ' + firstNameKanji;
        }
        return firstName + ' ' + lastName;
    }
}