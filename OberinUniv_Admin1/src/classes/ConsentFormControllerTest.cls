@IsTest public with sharing class ConsentFormControllerTest{
    @IsTest(SeeAllData=true) static void initTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            ConsentFormController con = new ConsentFormController();
            con.init();
        }
    }
    @IsTest(SeeAllData=true) static void agreeTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            ConsentFormController con = new ConsentFormController();
            con.agree();
        }
    }
    @IsTest(SeeAllData=true) static void backTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            ConsentFormController con = new ConsentFormController();
            con.back();
        }
    }
}