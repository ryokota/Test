@IsTest public with sharing class StudentInfoTest {

    @IsTest(SeeAllData=true) public static void test(){
        
        String inName = StudentInfo.editStudentName(
             'lastname', 'firstName'
           , 'lastNameKanji', 'firstNameKanji'
           , StudentInfo.INBOUND_RECTYPE
        );
        
        String outName = StudentInfo.editStudentName(
             'lastname', 'firstName'
           , 'lastNameKanji', 'firstNameKanji'
           , StudentInfo.OUTBOUND_RECTYPE
        );
        
        Id id = StudentInfo.getInboundStudentRecordType();
        
        System.assertEquals(inName ,'firstName lastname');
        System.assertEquals(outName ,'lastNameKanji firstNameKanji');
        System.assertNotEquals(id,null);
        
    }
}