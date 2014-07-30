public with sharing class StudentDataCheckService {

    public StudentDataCheckService () {}

    public static boolean isValid(){
    
        Student__c[] students =[
            SELECT Id
                 , RecordType.Name
                 , Student_ID__c
                 , Email__c
                 , Grade__c
                 , Family_name_in_JP_KANJI__c , First_name_in_JP_KANJI__c
                 , Family_name_in_JP_KANA__c  , First_name_in_JP_KANA__c
                 , Family_name_in_EN__c       , First_name_in_EN__c
                 , Gender__c
                 , Birthdate__c
                 , Nationality__c
                 , Passport_status__c
                 , Date_of_Expiry__c
                 , Country_of_Birth__c


                 , Current_ZIP__c
                 , Current_State_in_JP__c
                 , Current_City_in_JP__c
                 , Current_Street_in_JP__c
                 , Current_Street_in_EN__c
                 , Current_City_in_EN__c
                 , Current_State_in_EN__c
                 , Current_Country_in_EN__c

                 , Guardian_Family_name_in_JP__c , Guardian_First_name_in_JP__c
                 , Guardian_Family_name_in_EN__c , Guardian_First_name_in_EN__c
                 , Relationship_to_Student__c

                 , Same_as_applicant_address_chk__c
                 , Guardian_ZIP__c
                 , Guardian_State_in_JP__c
                 , Guardian_City_in_JP__c
                 , Guardian_Street_in_JP__c
                 , Guardian_Street_in_EN__c
                 , Guardian_City_in_EN__c
                 , Guardian_State_in_EN__c
                 , Guardian_Country_in_EN__c

                 , Same_as_guardian_address_chk__c
                 , Permanent_State_in_JP__c
                 , Permanent_City_in_JP__c
                 , Permanent_Street_in_JP__c
                 , Permanent_Street_in_EN__c
                 , Permanent_City_in_EN__c
                 , Permanent_State_in_EN__c
                 , Permanent_Country_in_EN__c

                 , Level_of_ELP_Program__c
                 , criminal_records_chk__c
              FROM Student__c
             WHERE User__c = :UserInfo.getUserId()
             LIMIT 1
        ];
        if(students.size()>0){
            Student__c s = students[0];
            if(s.RecordType.Name.contains('Inbound')){
                return checkInboundStudent(s);
            }else if(s.RecordType.Name.contains('Outbound')){
                return checkOutboundStudent(s);
            }
        }
        return true;// No error
    }
    /**
     * Error check for inbound student
     */
    private static boolean checkInboundStudent(Student__c s){
    
        Integer errCount=0;
        if(errCount>0){
            return false;
        }
        return true;//No error
    }
    /**
     * Error check for outbound student
     */
    private static boolean checkOutboundStudent(Student__c s){
    
        Integer errCount=0;
        if(isRequiredError(s.Student_ID__c)){
            s.addError(Student__c.Student_ID__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Email__c)){
            s.addError(Student__c.Email__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Grade__c)){
            s.addError(Student__c.Grade__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Family_name_in_JP_KANJI__c)){
            s.addError(Student__c.Family_name_in_JP_KANJI__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.First_name_in_JP_KANJI__c)){
            s.addError(Student__c.First_name_in_JP_KANJI__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Family_name_in_JP_KANA__c)){
            s.addError(Student__c.Family_name_in_JP_KANA__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.First_name_in_JP_KANA__c)){
            s.addError(Student__c.First_name_in_JP_KANA__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Family_name_in_EN__c)){
            s.addError(Student__c.Family_name_in_EN__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.First_name_in_EN__c)){
            s.addError(Student__c.First_name_in_EN__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Gender__c)){
            s.addError(Student__c.Gender__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Birthdate__c)){
            s.addError(Student__c.Birthdate__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Nationality__c)){
            s.addError(Student__c.Nationality__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Passport_status__c)){
            s.addError(Student__c.Passport_status__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Date_of_Expiry__c)){
            s.addError(Student__c.Date_of_Expiry__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
        if(isRequiredError(s.Country_of_Birth__c)){
            s.addError(Student__c.Country_of_Birth__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
            errCount++;
        }
 //       if(isRequiredError(s.Prefecture_of_Birth__c)){
 //           s.addError(Student__c.Prefecture_of_Birth__c.getDescribe().getLabel()+':'+System.Label.RequiredMessage);
 //           errCount++;
 //       }
        
        
        if(errCount>0){
            return false;
        }
        return true;//No error
    }
    private static boolean isRequiredError(String val){
        if( String.isBlank(val) ){
            return true;
        }
        return false;
    }
    private static boolean isRequiredError(Date val){
        if( val==null ){
            return true;
        }
        return false;
    }
}