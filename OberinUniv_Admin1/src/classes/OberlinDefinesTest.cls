@IsTest public with sharing class OberlinDefinesTest {

    @IsTest(SeeAllData=true) public static void test(){
    
        POU_ExpensesService a = new POU_ExpensesService();
    
        OberlinDefines o = new OberlinDefines();
    
        o.createNewUser();
    }
}