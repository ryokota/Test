@IsTest public with sharing class StudentDataCheckServiceTest {

    @IsTest(SeeAllData=true) public static void isValidTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            boolean r = StudentDataCheckService.isValid();
            System.assertEquals(r, false);
        }
    }
    
    @IsTest(SeeAllData=true) public static void isValid2Test() {
        // create user 
        User u = POU_TestData.createAcceptedUser();
        System.runAs(u){
            boolean r = StudentDataCheckService.isValid();
            //System.assertEquals(r, false);
        }
    }

}