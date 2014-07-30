/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class Milestone_ProjectExecuteCtrlTest {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Test.startTest();
    	User u = [SELECT Id FROM User limit 1];
    	//Project Insert
    	Milestone1_Project__c insertP = new Milestone1_Project__c(Name = 'Test',Function__c = 'HR',Project_Status__c='Green',
															Project_Sponsor__c=u.id, Project_Leader__c=u.id,
															RM_Key_Events_From_This_Week__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ',
															RM_Key_Events_For_Next_Week__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ',
															RM_Issues_For_Escalation_Recovery_plan__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ',
															RM_Sponsor_discussion__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ',
															RM_Leader_discussion__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ',
															RM_Team_Member_discussion__c = 'ああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああいいいいいいいいいいいいいいいいいいいいああああああああああああああああああああ');
    	insert insertP;
        
        //Milestone Insert
        List<Milestone1_Milestone__c> mileList = new List<Milestone1_Milestone__c>();
        for(integer i=0; i<30; i++){
        	Milestone1_Milestone__c m = new Milestone1_Milestone__c(Name='Test'+i,
        						Kickoff__c = system.today(),
								Deadline__c=System.today(),
								 RM_Adjustment_Date__c = system.today(), RM_Actual_Date__c=system.today(),
								Project__c = insertP.Id);
			mileList.add(m);
        }
        insert mileList;
        
        //yosan Insert
        List<Milestone_Synergy_Management__c> sList = new List<Milestone_Synergy_Management__c>();
        for(integer i=1;i<13;i++){
        	String tempName = '' + i;
			if(i < 10) tempName = '0' + i;
        	Milestone_Synergy_Management__c sObj = new Milestone_Synergy_Management__c(Name='2014_'+tempName,
								POV_Plan_ABP_Opex__c = 10,
								POV_RE_Opex__c = 10,
								RM_RE_upper_Pr_Opex__c = 10,
								RM_RE_lower_Pr_Opex__c = 10,
								POV_Actual_Opex__c = 10,
								POV_Plan_ABP_Capex__c = 10,
								POV_RE_Capex__c = 10,
								RM_RE_upper_Pr_Capex__c = 10,
								RM_RE_lower_Pr_Capex__c = 10,
								POV_Actual_Capex__c = 10,
								Day1_Plan__c = 10,
								New_Plan__c = 10,
								ABP__c = 10,
								RE__c = 10,
								Actual__c = 10,
								Capex__c = 10,
								Depreciation__c = 10,
								Other_OPEX__c = 10,
								Project__c = insertP.Id  );
			sList.add(sObj);
        }
        insert sList;
        PageReference pageRef = Page.Milestone_ProjectExecute;
		pageRef.getParameters().put('projectId',insertP.Id);
		Test.setCurrentPage(pageRef);  
        Milestone_ProjectExecuteCtrl projectExec = new Milestone_ProjectExecuteCtrl();
        projectExec.back();
        projectExec.save();
        projectExec.PDFHistory();
        Test.stopTest();
    }
}