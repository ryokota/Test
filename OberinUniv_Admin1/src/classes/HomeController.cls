public with sharing class HomeController {
    
    public Student__c student{get; set;}
    public Id studentId{get; set;}
    public String selectedProgram{get; set;}
    
    public Program__c[] programs{get; set;}
    public Application__c[] applications{get; set;}
    
    String programId = System.currentPageReference().getParameters().get('id');

    public HomeController () {}
    
    /**
     * Init
     */
    public PageReference init(){
        if(DisplayLanguageService.setStudentLanguage()){
            PageReference page = System.Page.Home;
            page.setRedirect(true);
            return page;
        }
        getPrograms();
        getApplications();
        return null;
    }
    
    private void getPrograms(){
    
        Student__c[] students =[
            SELECT id, RecordTypeId
              FROM Student__c
             WHERE User__c = :UserInfo.getUserId()
             LIMIT 1
        ];
        Id recordTypeId = null;
        
        if (students.size() > 0){
            studentId = students[0].id;
            recordTypeId = getRecordTypeId();
        }

        Date today = Date.today();
        programs = [
            SELECT id, name,
                   Fiscal_Year__c,
                   Application_period_from__c,
                   Application_period_to__c,
                   Program_description__c
              FROM Program__c
             WHERE Application_period_from__c <= :today
               AND Application_period_to__c >= :today 
               AND RecordTypeId = :recordTypeId 
        ];
    }
    
    private void getApplications(){
        
        applications=[
            SELECT Id, Name, Status__c, Program__c, Program__r.Id, Program__r.Name, RecordType.Name
              FROM Application__c
             WHERE Applicant__c in(SELECT Contact__c FROM Student__c WHERE User__c = :UserInfo.getUserId())
        ];
    }
    
    /**
     * Edit Profile
     */
    public PageReference editProfile(){
        
        Student__c s = POU_CommonService.getCurrentStudent();
        if(s.isAgreed__c){
            // PageReference page = System.Page.EditProfile;
            // page.setRedirect(true);
            // page.getParameters().put('id', s.Id);
            // return page;
            PageReference page = new PageReference('/'+s.Id+'/e?retURL=/home');
            page.setRedirect(true);
            return page;
        }
    
        PageReference page = System.Page.ConsentForm;
        page.setRedirect(true);
        return page;
    }
    
    /**
     * Select Program
     */
    public PageReference selectProgram(){
    
        Student__c s = POU_CommonService.getCurrentStudent();
        if(!s.isAgreed__c){
            ApexPages.addMessage(
                new ApexPages.Message(ApexPages.Severity.WARNING, Label.Profile_is_incomplete)
            );
            return null;
        }
        if(String.isBlank(selectedProgram)){
            return null;
        }

        // 一度に作成できる申請中データは2件まで。
        AggregateResult appCount=[
            SELECT Count(Id) cnt
              FROM Application__c
             WHERE Applicant_student__c =:studentId
               AND Status__c in('New','Waiting for 1st Review','Waiting for 2nd Review','Requires individual evaluation')
        ];
        if(integer.valueOf(appCount.get('cnt'))>1){
            ApexPages.addMessage(
                new ApexPages.Message(ApexPages.Severity.WARNING, Label.Limit_the_number_of_excess_application)
            );
            return null;
        }
        
        DisplayLanguageService.setProgramLanguage(selectedProgram);
        Application__c[] apps = getApplications(selectedProgram, studentId);
        
        if(apps.size()>0){
            PageReference page = System.Page.ProgramApplication;
            page.getParameters().put('id', apps[0].Id);
            page.setRedirect(true);
            return page;
        }
        
        String recordTypeName = getRecordTypeName(selectedProgram);
        
        RecordType rt = POU_CommonService.getRecordType('Application__c', recordTypeName);
        
        Application__c app = new Application__c(
            Applicant__c = s.contact__c,
            Applicant_student__c = s.Id,
            Program__c = selectedProgram,
            recordtypeId = rt.id,
            ownerId = UserInfo.getUserId()
        );
        insert app;

        PageReference page = System.Page.ProgramApplication;
        page.getParameters().put('id', app.Id);
        page.setRedirect(true);
        return page;
    }
    
    /**
     * Program.RecordTypeを取得
     */
    private String getRecordTypeName(String porgramId){
    
        Program__c[] programs=[
            SELECT Id, RecordType.Name, Program_type__c
              FROM Program__c
             WHERE Id=:porgramId
        ];
        
        if(OberlinDefines.PROG_RECTYPE_OUT.equals(programs[0].RecordType.Name)){
            if(OberlinDefines.PROG_TYPE_SHORT.equals(programs[0].Program_type__c)){
                return OberlinDefines.APPS_RECTYPE_OUT_SHORT;//'Outbound for Short-term';
            }else if(OberlinDefines.PROG_TYPE_LONG.equals(programs[0].Program_type__c)){
                return OberlinDefines.APPS_RECTYPE_OUT_LONG;//'Outbound for Long-term';
            }else if(OberlinDefines.PROG_TYPE_GO.equals(programs[0].Program_type__c)){
                return OberlinDefines.APPS_RECTYPE_OUT_GO;//'Outbound for GO/AH';
            }
            return 'Inbound';
        } else {
            if(OberlinDefines.PROG_TYPE_SHORT.equals(programs[0].Program_type__c)){
                return OberlinDefines.APPS_RECTYPE_IN_SHORT;//'Inbound for Short-term';
            }else if(OberlinDefines.PROG_TYPE_EXCHANGE.equals(programs[0].Program_type__c)){
                return OberlinDefines.APPS_RECTYPE_IN_EXCHANGE;//'Inbound for Exchange';
            }
            return 'Outbound';
        }
    }
    
    private Application__c[] getApplications(String programId, String studentId){
        Application__c[] applications=[
            SELECT id, name, Program__c, Program__r.Name
              FROM Application__c
             WHERE Applicant_student__c =:studentId
               AND Program__c =:programId
        ];
        return applications;
    }
    
    private Id getRecordTypeId() {
        
        Profile[] profiles =[
            SELECT id, name 
              FROM Profile
             WHERE id = :UserInfo.getProfileId()
        ];
        
        RecordType[] rectypes=[
            SELECT id, name 
              FROM RecordType
             WHERE SobjectType='Program__c' 
               AND isActive = true
        ];
        
        if(profiles.size() == 0 || rectypes.size() == 0){
            return null;
        }
        
        String AvailableRecordType = OberlinDefines.PROG_RECTYPE_OUT;
        if(OberlinDefines.INBOUND_PROFILE.equals(profiles[0].name)){
            AvailableRecordType = OberlinDefines.PROG_RECTYPE_IN;
        }

        for (RecordType rectype : rectypes){
            if(AvailableRecordType.equals(rectype.name)){
                return rectype.id;
            }
        }
        return null;
    }
    
    /**
     * Change Password
     */
    public PageReference changePassword(){
    
        PageReference page = System.Page.ChangePassword;
        page.setRedirect(true);
        return page;

    }
    
    /**
     * Delete Program
     */
    public PageReference deleteProgram(){
    
        Application__c[] apps=[
            SELECT Id, Status__c
              FROM Application__c
             WHERE Id =:selectedProgram
        ];
        if('Accepted'.equals(apps[0].Status__c)){
            
            ApexPages.addMessage(
                new ApexPages.Message(ApexPages.Severity.WARNING, Label.can_not_delete_the_application)
            );
            return null;
        }
        delete apps;
        
        PageReference page = System.Page.Home;
        page.setRedirect(true);
        return page;
    }
}