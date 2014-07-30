@IsTest public with sharing class HomeControllerTest {

    @IsTest(SeeAllData=true) public static void testInitPage(){
        // create user 
        User u = POU_TestData.createOperationUser();
        
        Program__c p1 = POU_TestData.createTestProgramOutShort();
        Program__c p2 = POU_TestData.createTestProgramOutLong();
        Program__c p3 = POU_TestData.createTestProgramOutGo();
        
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            con.selectedProgram=p1.Id;
            con.selectProgram();
            
            POU_TestData.updateCurrentStudent();
            con.selectProgram();
            
            Student__c s=POU_CommonService.getCurrentStudent();
            Application__c[] apps=[SELECT Id FROM Application__c  WHERE Applicant_student__c=:s.Id AND Program__c=:p1.Id];
            
            for (Application__c a: apps){
                a.Status__c='Accepted';
            }
            update apps;
        }
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            con.selectedProgram=p2.Id;
            con.selectProgram();
        }
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            con.selectedProgram=p3.Id;
            con.selectProgram();
        }
        
    }
    @IsTest(SeeAllData=true) public static void testInitPage2(){
    
        User u = POU_TestData.createAcceptedUser();
        Program__c p4 = POU_TestData.createTestProgramInShort();
        Program__c p5 = POU_TestData.createTestProgramInExchange();
        
        System.runAs(u){
            POU_TestData.updateCurrentStudent();
            HomeController con = new HomeController();
            con.init();
            con.selectedProgram=p4.Id;
            con.selectProgram();
        }
        Application__c[] a = [SELECT id FROM Application__c WHERE Applicant__c=:u.ContactId];

//            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
//            req.setComments('Approval auto submission');
//            req.setObjectId(a[0].id);
//            Approval.ProcessResult result = Approval.process(req);

//            approvalRecall.recallApproval(a[0].id);
        
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            con.selectedProgram=p5.Id;
            con.selectProgram();
            
            Application__c[] apps=[SELECT Id FROM Application__c LIMIT 1];
            con.selectedProgram=apps[0].Id;
            con.deleteProgram();
        }
        
    }
    static testMethod void testEditProfile(){
    
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            con.editProfile();
        }
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            POU_TestData.updateCurrentStudent();
            con.editProfile();
        }
                
    }
    static testMethod void testChangePassword(){
    
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            HomeController con = new HomeController();
            con.init();
            POU_TestData.updateCurrentStudent();
            con.ChangePassword();
        }
    }
}