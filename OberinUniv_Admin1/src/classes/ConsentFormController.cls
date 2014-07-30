public with sharing class ConsentFormController {
    
    public ConsentFormController (){}
    
    /**
     * Initial processing
     */
    public PageReference init(){
        return null;
    }
    
    /**
     * [agree] button processing
     */
    public PageReference agree(){
        Student__c s = POU_CommonService.getCurrentStudent();
        // 直接編集画面に遷移[08/15]
        PageReference page = new PageReference('/'+s.Id+'/e?retURL=/home');
        page.setRedirect(true);
        return page;
        // PageReference page = System.Page.EditProfile;
        // page.getParameters().put('id', s.Id);
        // page.setRedirect(true);
        // return page;
    }
    
    /**
     * [back] button processing
     */
    public PageReference back(){
        PageReference page = System.Page.Home;
        page.setRedirect(true);
        return page;
    }
}