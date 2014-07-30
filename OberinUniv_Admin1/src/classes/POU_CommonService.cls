public with sharing class POU_CommonService {

    public static RecordType getRecordType(String objectName, String recordTypeName){
        
        RecordType[] types = [
            SELECT Id , Name
              FROM RecordType 
             WHERE SobjectType=:objectName
               AND Name=:recordTypeName
               AND isActive = true
        ];
        return types.size() == 0 ? new RecordType() : types[0];
    }
    
    public static Student__c getCurrentStudent(){
        
        Student__c[] students = [
            SELECT Id, Name, contact__c, User__c, isAgreed__c
              FROM Student__c
             WHERE User__c=:UserInfo.getUserId()
        ];
        return students.size() == 0 ? new Student__c() : students[0];
    }
    
    /**
     * If the two strings are different, return true
     */
    public static boolean isNotEquals(String val1, String val2){
        
        if( String.isBlank(val1) && String.isBlank(val2) ){
            return false;
        } else if ( String.isBlank(val1) || String.isBlank(val2) ){
            return true;
        } else if ( val1.equals(val2) ){
            return false;
        }
        return true;
    }
}