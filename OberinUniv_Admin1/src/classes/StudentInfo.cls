public with sharing class StudentInfo {

    static Student__c curStudent;
    static User curUser;
    
    public static final String INBOUND_RECTYPE='Inbound';
    public static final String OUTBOUND_RECTYPE='Outbound';

    public static Student__c getCurrentStudent(){
        
        system.debug('debug::[StudentInfo]:UserId='+UserInfo.getUserId());
        Student__c[] rec = [
            SELECT id, 
                   name, 
                   Contact__c, 
                   User__c,
                   Picture_ID__c,
                   Language_settings__c
              FROM Student__c 
             WHERE User__c =: UserInfo.getUserId()
        ];
        system.debug('debug::[StudentInfo]:size=['+rec.size()+']');
        curStudent = rec.size() > 0 ? rec[0] : null;
        return curStudent;
    }
    
    /**
     * edit the student name.
     * - For outbound, family name + first name in japanese.
     * - For inbound, first name + family name in english.
     */
//    public static String getStudentName(Student__c student){
//        String name='';
//        if(OUTBOUND_RECTYPE.equals(student.RecordType.name)){
//            name=student.Family_name_in_JP_KANJI__c+' '+student.First_name_in_JP_KANJI__c;
//        }else if(INBOUND_RECTYPE.equals(student.RecordType.name)){
//            name=student.First_name_in_EN__c+' '+student.Family_name_in_EN__c;
//        }
//        return name;
//    }
    public static String editStudentName(
          String lastName, String firstName
        , String lastNameKanji, String firstNameKanji
        , String recordTypeName){
        String name = '';
        if(OUTBOUND_RECTYPE.equals(recordTypeName)){
            name = lastNameKanji + ' ' + firstNameKanji;
        }else if(INBOUND_RECTYPE.equals(recordTypeName)){
            name = firstName + ' ' + lastName;
        }
        return name;
    }
    
    
    /**
     * get RecordType [Inbound] as student.
     */
    public static Id getInboundStudentRecordType(){
        RecordType[] types=[
            SELECT id
              FROM RecordType
             WHERE SobjectType='Student__c'
               AND Name=:INBOUND_RECTYPE
        ];
        if(types.size()>0){
            return types[0].id;
        }
        return null;
    }
    /**
     * get RecordType [Outbound] as student.
     */
    public static Id getOutboundStudentRecordType(){
        RecordType[] types=[
            SELECT id
              FROM RecordType
             WHERE SobjectType='Student__c'
               AND Name=:OUTBOUND_RECTYPE
        ];
        if(types.size()>0){
            return types[0].id;
        }
        return null;
    }
}