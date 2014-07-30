@IsTest public with sharing class POU_CommonTest {

    @IsTest(SeeAllData=true) public static void deleteContact() {
        
        Account a=[
            SELECT Id
              FROM Account
             LIMIT 1
        ];
        Contact c  =new Contact(
              AccountId=a.Id
            , LastName='test'
        );
        insert c;
        delete c;
        undelete c;
    }
    
    @IsTest(SeeAllData=true) public static void studentCheck(){
        StudentDataCheckService s = new StudentDataCheckService();
    }
    
    @IsTest(SeeAllData=true) public static void insertContact(){
    
        List<String> recordTypeNames = new String[]{'Coordinator','Director contact'};
        
        Id accountId = [
            SELECT id 
              FROM RecordType 
             WHERE SobjectType='Account' 
               AND name = :OberlinDefines.RECORD_TYPE_UNIV_NAME
        ].id;
        
        Account a = [SELECT Id FROM Account WHERE isOwner__c=true AND RecordtypeId=:accountId limit 1];
        List<RecordType> recordTypes = [SELECT Id,IsActive,Name,SobjectType FROM RecordType WHERE Name in :recordTypeNames AND IsActive=true];
        
        for (RecordType rt : recordTypes) {
            Contact c = new Contact();
            
            c.Lastname=rt.name;
            c.recordtypeId = rt.id;
            c.accountId = a.Id;
            
            insert c;
        }
    }
    
    @IsTest(SeeAllData=true) public static void check(){
        StudentDataCheckService.isValid();
    }
    
    @IsTest(SeeAllData=true) public static void deleteStudent(){
        Student__c s = new Student__c();
        s.Name='test';
        insert s;
        delete s;
        undelete s;
    }
    
    @IsTest(SeeAllData=true) public static void deleteProgram(){
        Application__c a = new Application__c();
        a.Status__c='Accepted';
        insert a;
        HomeController con = new HomeController();
        con.selectedProgram=a.Id;
        con.deleteProgram();
    }
    
    @IsTest(SeeAllData=true) public static void recall(){
    
        Application__c a = new Application__c();
        insert a;

        // プロセスの作成
        Approval.ProcessSubmitRequest psr = new Approval.ProcessSubmitRequest();
        // 申請するオブジェクトの設定
        psr.setObjectId(a.Id);
        // 次の承認者の設定（自動割当の場合はnull）
        psr.setNextApproverIds(new Id[] {UserInfo.getUserId()});
        // プロセス実行
        Approval.ProcessResult submitResult = Approval.process(psr);
        
        approvalRecall.recallApproval(a.id);
        
    }

}