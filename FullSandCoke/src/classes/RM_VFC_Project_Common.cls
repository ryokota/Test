public with sharing class RM_VFC_Project_Common {
    
    public RFA__c  rfa { get; set; }                //RFA情報
    public String  userName { get; set; }           //ユーザー名
    
    public String  developerName { get; set; }      //レコードタイプ名

    public Id projectId { get; set; }               //プロジェクトＩＤ
    public Id rfaId { get; set; }                   //RFAID
    private String retUrl { get; set; }             //遷移先のURL取得
    private String pjid { get; set; }               //Project Id
    private PageReference ref { get; set; }
    
    //コンストラクタ（初期処理）
    public RM_VFC_Project_Common(ApexPages.StandardController stdController) {
        
        //RFA情報を標準より取得
        this.rfa = (RFA__c)stdController.getRecord();
        
        //レコードタイプを取得
        this.rfa.recordTypeid = ApexPages.currentPage().getParameters().get('RecordType');
        
        system.debug('r:' + ApexPages.currentPage().getParameters().get('RecordType') + '/p:' + ApexPages.currentPage().getParameters().get('pjid'));
        
        //レコードタイプ DeveloperaNameを取得
        if(this.rfa.recordTypeid != null){
            RecordType r = [select Id, DeveloperName from RecordType where id = :this.rfa.recordTypeid];
            this.developerName = r.DeveloperName;           
        }
        system.debug('●developerName●' + this.developerName);
        
        //URLパラメータ取得
        this.retUrl = ApexPages.currentPage().getParameters().get('retURL');
        this.pjid = ApexPages.currentPage().getParameters().get('pjid');
        
        //プロジェクトの値を初期値として設定する
        if (this.pjid != '' && this.pjid != null) {
            getProjectData(this.pjid);
        }
        
        //ユーザー名を設定
        this.userName = userInfo.getName();
        
    }
    
    
    //Chater保存＆新規処理
    public pagereference SaveAndNewOfCharter(){
        
        RFA__c r = SaveCharter();
        if (r == null) {
            return null;
        }
        pagereference pf = new pagereference('/setup/ui/recordtypeselect.jsp');
        pf.getParameters().put('ent', System.Label.RFA_ID);
        pf.getParameters().put('retURL', '/' + r.Id);
        
        pagereference save_new_url = ref;
        save_new_url.getParameters().put('retURL', '/' + r.Id);
        pf.getParameters().put('save_new_url', save_new_url.getUrl());
        return PF;
        
    }
    
    public pagereference SaveOfCharter(){
        
        RFA__c r = SaveCharter();
        if (r == null) {
            return null;
        }
        return new pagereference('/' + r.Id);
        
    }
    
    //Charter保存処理
    private RFA__c SaveCharter(){
        
        Savepoint sp = Database.setSavepoint();
        
        try {
            
            //RFA登録
            insert rfa;
            
            //保存後、標準ページに遷移
            return rfa;
        
        }catch(DmlException ex){
            
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR , ex.getMessage()));
        }
    
        return null;
    }
    
    public pagereference saveAndNewOfCloseOut() {
        
        RFA__c rfa = saveCloseOut();
        
        if (rfa == null) {
            return null;
        } else {
            
            pagereference pf = new pagereference('/setup/ui/recordtypeselect.jsp');
            pf.getParameters().put('ent', System.Label.RFA_ID);
            pf.getParameters().put('retURL', '/' + rfa.Id);
            
            pagereference save_new_url = ref;
            save_new_url.getParameters().put('retURL', '/' + rfa.Id);
            pf.getParameters().put('save_new_url', save_new_url.getUrl());
            return PF;
            
        }
    }
    
    public pagereference saveOfCloseOut() {
        
        RFA__c rfa = saveCloseOut();
        
        if (rfa == null) {
            return null;
        } else {
            return new pagereference('/' + rfa.Id);
        }
    }
    
    private RFA__c saveCloseOut() {
        
        Savepoint sp = Database.setSavepoint();
        
        try {
            
            //RFA新規登録
            insert rfa;
            
            //詳細画面へ遷移
            return rfa;
            
        } catch (Exception ex) {
            
            Database.rollback(sp);
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR , ex.getMessage()));
            return null;
        }
    }
    
    public PageReference isRfa() {
        
        String rfaPrefixId = RFA__c.sObjectType.getDescribe().getKeyPrefix();
        String newRfaUrl = '/' + rfaPrefixId +'/e';
        
        if (isRfa(this.rfa.recordTypeid)) {
            this.ref = getRfaVf(this.rfa.recordTypeid);
        } else {
            
            if (ApexPages.currentPage().getUrl().length() >= ApexPages.currentPage().getUrl().indexOf('?')){
                this.ref = new PageReference(newRfaUrl + ApexPages.currentPage().getUrl().substring(ApexPages.currentPage().getUrl().indexOf('?'),ApexPages.currentPage().getUrl().length()-27));               
            }else{
                this.ref = new PageReference(newRfaUrl);
                                
            }
            ref.getParameters().put('nooverride', '1');
        }
        
        String currentPage = ApexPages.currentPage().getUrl().substring(0, ApexPages.currentPage().getUrl().indexOf('?'));
        String url = ref.getUrl();
        
        //遷移先画面URLと現在のURLが同一の場合は遷移処理をやめる
        if (currentPage == url) {
            return null;
        }
        
        ref.getParameters().put('RecordType', this.rfa.recordTypeid);
        ref.getParameters().put('retURL',     this.retUrl);
        
        if (this.pjid != '' || this.pjid == null) {
            ref.getParameters().put('pjid',     this.pjid);
        }
        
        ref.setRedirect(true);
        return ref;
    }
    
    //レコードタイプ判別処理。Project系のレコードタイプか判定をする
    private boolean isRfa(id rid) {

        if (this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST ||
            this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST ||
            this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST) {
                return true;
        }
        
        return false;
    }
    
    //レコードタイプによって遷移する画面を決定する
    private pageReference getRfaVf(id rid) {

        if (this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST) {
            return Page.RM_VFC_Project_Initiate;
        }

        if (this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST) {
            return Page.RM_VFC_Project_Charter;
        }

        if (this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST) {
            return Page.RM_VFC_Project_CloseOut;
        }
        
        return null;
    }
    
    //RelatedProject選択時のProject自動連携処理
    public void getProjectData() {
        getProjectData(this.projectId);
    }
    private void getProjectData(Id pid) {
        //マッピングしてください！
        List<Milestone1_Project__c> projects = [select
                                                RM_Project_No__c,
                                                Id,
                                                Name,
                                                Kickoff__c,
                                                Deadline__c,
                                                Function__c,
                                                Project_Sponsor__c,
                                                Project_Leader__c,
                                                RM_Background_Current_Issue__c,
                                                Description__c,
                                                RM_Estimated_Benefit_Overview__c,
                                                RM_Commercial_Check__c,
                                                RM_Commercial_Select__c,
                                                RM_SCM_Check__c,
                                                RM_SCM_Select__c,
                                                RM_Procurement_Check__c,
                                                RM_Procurement_Select__c,
                                                RM_HR_Check__c,
                                                RM_HR_Select__c,
                                                RM_Finance_Check__c,
                                                RM_Finance_Select__c,
                                                RM_IS_Check__c,
                                                RM_IS_Select__c,
                                                RM_Legal_Check__c,
                                                RM_Legal_Select__c,
                                                RM_PAC_Check__c,
                                                RM_PAC_Select__c,
                                                RM_BI_Check__c,
                                                RM_BI_Select__c,
                                                Category_Big_Title_NO__c,
                                                Category_Big_Title__c,
                                                Priority__c,
                                                CCPP_Status__c,
                                                Individual_or_with_ATK__c,
                                                Opex_or_CAPEX__c,
                                                Reduction_or_Avoidance__c,
                                                RM_Details_of_Solution__c,
                                                RM_Communication_Change__c,
                                                RM_L3_Name__c,
                                                RM_Activity_to_pass_Open_issue__c,
                                                Sub_Function__c,
                                                LastModifiedById,
                                                CreatedById,
                                                RM_PaybackPeriodYears__c,
                                                RM_Change__c,
                                                RM_Keep__c,
                                                RM_Actual_Date__c,
                                                RM_Routine_Function__c,
                                                RM_Quantitative_Benefit_Spending__c,
                                                RM_Financial_Validation__c,
                                                Project_Classification__c
                                            from
                                                Milestone1_Project__c
                                            where
                                                ID = :pid];
        if(projects.isEmpty()) {
            return;
        }
         
        Milestone1_Project__c project = projects.get(0);
        
        if(project.Project_Classification__c != null && project.Project_Classification__c.length() >= 1 ){
            //プロジェクトクラスの連携
            this.rfa.RM_Project_Classification__c = project.Project_Classification__c.substring(project.Project_Classification__c.length()-1,project.Project_Classification__c.length());
        
        }
        
        this.rfa.RM_Change__c                               = project.RM_Change__c;
        this.rfa.RM_Routine_Function__c                     = project.RM_Routine_Function__c;
        this.rfa.RM_Keep__c                                 = project.RM_Keep__c;
        this.rfa.RM_Actual_Date__c                          = project.RM_Actual_Date__c;
        this.rfa.RM_Plan_Date__c                            = project.Deadline__c;
        this.rfa.RM_Actual_Date__c                          = project.RM_Actual_Date__c;
        this.rfa.RM_Related_Project__c                      = project.id;
        this.rfa.RM_Start_Date__c                           = project.Kickoff__c;
        this.rfa.RM_End_Date__c                             = project.Deadline__c;
        this.rfa.RequestTitle__c                            = project.Name;
        this.rfa.RM_Owner_Function_L2__c                    = project.Function__c;
        this.rfa.RM_Sponsor__c                              = project.Project_Sponsor__c;
        this.rfa.RM_Project_Lead_From_Owner_Function__c     = project.Project_Leader__c;    
        this.rfa.RM_Background_Current_Issue__c             = project.RM_Background_Current_Issue__c;
        this.rfa.RM_Project_Objectives__c                   = project.Description__c;
        this.rfa.RM_Estimated_Benefit_Overview__c           = project.RM_Estimated_Benefit_Overview__c;      
        this.rfa.RM_Commercial_Check__c                     = project.RM_Commercial_Check__c;    
        this.rfa.RM_Commercial_Select__c                    = project.RM_Commercial_Select__c;
        this.rfa.RM_SCM_Check__c                            = project.RM_SCM_Check__c;
        this.rfa.RM_SCM_Select__c                           = project.RM_SCM_Select__c;
        this.rfa.RM_Procurement_Check__c                    = project.RM_Procurement_Check__c;
        this.rfa.RM_Procurement_Select__c                   = project.RM_Procurement_Select__c;    
        this.rfa.RM_HR_Check__c                             = project.RM_HR_Check__c;
        this.rfa.RM_HR_Select__c                            = project.RM_HR_Select__c;
        this.rfa.RM_Finance_Check__c                        = project.RM_Finance_Check__c;
        this.rfa.RM_Finance_Select__c                       = project.RM_Finance_Select__c;
        this.rfa.RM_IS_Check__c                             = project.RM_IS_Check__c;
        this.rfa.RM_IS_Select__c                            = project.RM_IS_Select__c;
        this.rfa.RM_Legal_Check__c                          = project.RM_Legal_Check__c;
        this.rfa.RM_Legal_Select__c                         = project.RM_Legal_Select__c;
        this.rfa.RM_PAC_Check__c                            = project.RM_PAC_Check__c;
        this.rfa.RM_PAC_Select__c                           = project.RM_PAC_Select__c;
        this.rfa.RM_BI_Check__c                             = project.RM_BI_Check__c;
        this.rfa.RM_BI_Select__c                            = project.RM_BI_Select__c;
        this.rfa.RM_Category_No__c                          = project.Category_Big_Title_NO__c;
        this.rfa.RM_Category_Title__c                       = project.Category_Big_Title__c;
        this.rfa.RM_Priority_Level__c                       = project.Priority__c;
        this.rfa.RM_CCPP_Status__c                          = project.CCPP_Status__c;
        this.rfa.RM_Individual_or_With_ATK__c               = project.Individual_or_with_ATK__c;
        this.rfa.RM_Opex_or_CAPEX__c                        = project.Opex_or_CAPEX__c;
        this.rfa.RM_ABP_Incl_or_Not_incl__c                 = project.Reduction_or_Avoidance__c;
        this.rfa.RM_Details_of_Solution__c                  = project.RM_Details_of_Solution__c;
        this.rfa.RM_Communication_Change__c                 = project.RM_Communication_Change__c;
        this.rfa.RM_PaybackPeriodYears__c                   = project.RM_PaybackPeriodYears__c;
        this.rfa.RM_Sub_Function__c                         = project.Sub_Function__c;
        this.rfa.RM_Function__c                             = project.Function__c;      
        this.rfa.RM_L3_Name__c                              = project.RM_L3_Name__c;
        this.rfa.RM_Activity_to_pass_Open_issue__c          = project.RM_Activity_to_pass_Open_issue__c;
        this.rfa.RM_Quantitative_Benefit_Spending__c        = project.RM_Quantitative_Benefit_Spending__c;
        this.rfa.RM_Financial_Validation__c                 = project.RM_Financial_Validation__c;
        system.debug('●this.developerName●' + this.developerName + '●●' + RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST);
        //CloseOutRequestの場合Charter情報を関連RFAとして保存する
        if (this.developerName == RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST){
            this.rfa.Related_RFA_1__c = getRelatedRFAId(project.Id, system.label.RM_Project_Charter_Request_ID);
        }
        
    }
    
    private Id getRelatedRFAId(Id pid,Id recordTypeId) {
        
        List<RFA__c> r = [select
                                Id,recordTypeId
                            from
                                RFA__c
                            where
                                RM_Related_Project__c =:pid And
                                RecordTypeId =:recordTypeId Limit 1];
                                
        return r.isEmpty() ? null : r.get(0).id;
    }
    
    private List<Milestone1_Milestone__c> getMilestoneByProjectId(Id pid) {
        
        return [select
                        Id,
                        Name,
                        Milestone_No__c,
                        RM_Function__c,
                        Kickoff__c,
                        Deadline__c
                    from
                        Milestone1_Milestone__c
                    where
                        Project__c = :pid];
    }
}