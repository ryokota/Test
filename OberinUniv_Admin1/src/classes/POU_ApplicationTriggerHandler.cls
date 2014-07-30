public with sharing class POU_ApplicationTriggerHandler {
    
    // ==INSERT
    public void onBeforeInsert(Application__c[] newItems, Map<Id, Application__c> newItemMap) {
        // 1 - check the university is applying to the program
        
        // 2 - check the validation on review process according to program definition 
    }
    
    
    public void  onAfterInsert(Application__c[] newItems, Map<Id, Application__c> newItemMap) {
        
    }
    
    // ==UPDATE
    public void onBeforeUpdate(Application__c[] oldItems, Application__c[] newItems, Map<Id, Application__c> oldItemMap, Map<Id, Application__c> newItemMap) {
        addUpdateCount(newItems);
    }
    
    public void  onAfterUpdate(Application__c[] oldItems, Application__c[] newItems, Map<Id, Application__c> oldItemMap, Map<Id, Application__c> newItemMap) {
//        updateFieldsForMassEmail(newItems,'Accepted');
        eraseFieldsForMassEmail(oldItems);
        addingFieldsForMassEmail(newItems);
        setDefaultExpense(newItems);
        editFieldsNameForMassEmail(newItems, oldItemMap);
    }
    
    // ==DELETE
    public void onBeforeDelete(Application__c[] oldItems, Map<Id, Application__c> oldItemMap) {}
    public void  onAfterDelete(Application__c[] oldItems, Map<Id, Application__c> oldItemMap) {}

    // ==UNDELETE
    public void     onUndelete(Application__c[] items) {}
    
    
    private void addUpdateCount( Application__c[] newItems){
    
        for (Application__c a : newItems) {
            if(a.Update_count__c==null){
                a.Update_count__c=0;
            }
            a.Update_count__c=a.Update_count__c+1;
        }
    }
    
    private void eraseFieldsForMassEmail(Application__c[] olds){

        Set<Id> contactIds = new Set<Id>();         
        Map<Id,Application__c> con2app = new Map<Id,Application__c>();
        for (Application__c a : olds) {
                contactIds.add(a.Applicant__c);
                con2app.put(a.Applicant__c, a);
        }
        List<Contact> contacts = [
            SELECT ID, Programs_Pre_Apply__c, Programs_Pending__c, Programs_Accepted__c
              FROM Contact WHERE ID in :contactIds
        ];
        List<Contact> toBeUpdated = new List<Contact>();
        for (Contact c : contacts) {
            Application__c app = con2app.get(c.id);
            if (app!=null) {
                Set<String> preApply = (c.Programs_Pre_Apply__c!=null) ? (Set<String>) JSON.deserialize(c.Programs_Pre_Apply__c,Set<String>.class) : new Set<String>();
                Set<String> pending  = (c.Programs_Pending__c!=null)   ? (Set<String>) JSON.deserialize(c.Programs_Pending__c,Set<String>.class)   : new Set<String>();
                Set<String> accepted = (c.Programs_Accepted__c!=null)  ? (Set<String>) JSON.deserialize(c.Programs_Accepted__c,Set<String>.class)  : new Set<String>();
                
                preApply.remove(app.Program__c );
                pending.remove (app.Program__c );
                accepted.remove(app.Program__c );
                
                preApply.remove(app.Program__c + ':' + app.University__c);
                pending.remove (app.Program__c + ':' + app.University__c);
                accepted.remove(app.Program__c + ':' + app.University__c);
                
                preApply.remove(app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                pending.remove (app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                accepted.remove(app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                
                c.Programs_Pre_Apply__c = Json.serialize(preApply);
                c.Programs_Pending__c   = Json.serialize(pending);
                c.Programs_Accepted__c  = Json.serialize(accepted);
                
                toBeUpdated.add(c);
            }
        }
        update toBeUpdated;
    }
    private void addingFieldsForMassEmail(Application__c[] news){

        Set<Id> contactIds = new Set<Id>();         
        Map<Id,Application__c> con2app = new Map<Id,Application__c>();
        for (Application__c a : news) {
                contactIds.add(a.Applicant__c);
                con2app.put(a.Applicant__c, a);
        }
        List<Contact> contacts = [
            SELECT ID, Programs_Pre_Apply__c, Programs_Pending__c, Programs_Accepted__c
              FROM Contact WHERE ID in :contactIds
        ];
        List<Contact> toBeUpdated = new List<Contact>();
        for (Contact c : contacts) {
            Application__c app = con2app.get(c.id);
            if (app!=null) {
                Set<String> preApply = (c.Programs_Pre_Apply__c!=null) ? (Set<String>) JSON.deserialize(c.Programs_Pre_Apply__c,Set<String>.class) : new Set<String>();
                Set<String> pending  = (c.Programs_Pending__c!=null)   ? (Set<String>) JSON.deserialize(c.Programs_Pending__c,Set<String>.class)   : new Set<String>();
                Set<String> accepted = (c.Programs_Accepted__c!=null)  ? (Set<String>) JSON.deserialize(c.Programs_Accepted__c,Set<String>.class)  : new Set<String>();
                
                if (String.isBlank(app.status__c)) {
                    // preApply.add(app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                    preApply.add(app.Program__c);
                } else if ('Waiting for 1st Review'.equals(app.status__c)) {
                    // pending.add (app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                    pending.add (app.Program__c);
                } else if ('Waiting for 2nd Review'.equals(app.status__c)) {
                    // pending.add (app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                    pending.add (app.Program__c);
                } else if ('Requires individual evaluation'.equals(app.status__c)) {
                    // pending.add (app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                    pending.add (app.Program__c);
                } else if ('Accepted'.equals(app.status__c)) {
                    // accepted.add(app.Program__c + ':' + app.University__c + ':' + app.Start_Semester_of_Stay__c);
                    accepted.add(app.Program__c);
                }
                
                c.Programs_Pre_Apply__c = Json.serialize(preApply);
                c.Programs_Pending__c   = Json.serialize(pending);
                c.Programs_Accepted__c  = Json.serialize(accepted);
                
                toBeUpdated.add(c);
            }
        }
        update toBeUpdated;
    }
    private void editFieldsNameForMassEmail(Application__c[] news, Map<Id, Application__c> oldItemMap){
    
        system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Start');
    
        Set<Id> contactIds = new Set<Id>();
        Set<Id> programIds = new Set<Id>();
        Set<Id> educateIds = new Set<Id>();
        Map<Id,Application__c> con2app = new Map<Id,Application__c>();
        for (Application__c a : news) {
            contactIds.add(a.Applicant__c);
            programIds.add(a.Program__c);
            educateIds.add(a.University__c);
            con2app.put(a.Applicant__c, a);
        }
        
        // Get related programs
        List<Program__c> programs = [
            SELECT Id, Name, Fiscal_Year__c, Semester__c
              FROM Program__c WHERE Id in :programIds
        ];
        Map<Id,Program__c> prgMap = new Map<Id,Program__c>();
        for (Program__c p : programs) {
            prgMap.put(p.Id, p);
        }
        
        // Get educational institutions related
        List<Account> accounts = [
            SELECT Id, BillingCountry
              FROM Account WHERE Id in :educateIds
        ];
        Map<Id,Account> accMap = new Map<Id,Account>();
        for (Account a : accounts) {
            accMap.put(a.Id, a);
        }
        
        List<Contact> contacts = [
            SELECT Id, Name, Active_Academic_semester__c, Active_Academic_Year__c, Active_Country__c, Active_Departure_semester__c, Active_Program__c
              FROM Contact WHERE Id in :contactIds
        ];
        List<Contact> toBeUpdated = new List<Contact>();
        
        for (Contact c : contacts) {
            
            system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:contact.name='+c.Name);

            Application__c a = con2app.get(c.id);
            if (a!=null) {
                system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Status1='+a.Status__c);
                system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:old status='+oldItemMap.get(a.Id).Status__c);

                if( !String.isBlank(a.Status__c) && a.Status__c.equals(oldItemMap.get(a.Id).Status__c) ){ continue; }
                
                system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Status2='+a.Status__c);
                if('Accepted'.equals(a.Status__c)){
                
                    system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Updating');
               
                    Program__c p = prgMap.get(a.Program__c);
                    Account u = accMap.get(a.University__c);

                    system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Program='+ p.Name);
                    system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:Year='+ p.Fiscal_Year__c);
                    system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:semester1='+ p.Semester__c);
                    system.debug('Debug::[POU_ApplicationTriggerHandler]:[editFieldsNameForMassEmail]:semester2='+ a.Departure_semester__c);
                    
                    c.Active_Program__c=            p.Name;// Program.Name
                    c.Active_Academic_Year__c=      p.Fiscal_Year__c;// Program.Fiscal_Year__c
                    c.Active_Academic_semester__c=  p.Semester__c;// Program.semester
                    c.Active_Departure_semester__c= a.Departure_semester__c;// Application.Semester__c
                    c.Active_Country__c=            (u== null) ? '' : u.BillingCountry;
                } else {
                    c.Active_Program__c=            '';// blank
                    c.Active_Academic_Year__c=      '';// blank
                    c.Active_Academic_semester__c=  '';// blank
                    c.Active_Departure_semester__c= '';// blank
                    c.Active_Country__c=            '';// blank
                }

                toBeUpdated.add(c);
            }
        }
        update toBeUpdated;
    }
        
/*
    private void updateFieldsForMassEmail(Application__c[] items, String status) {
        Set<Id> contactIds = new Set<Id>();         
        Map<Id,Application__c> con2app = new Map<Id,Application__c>();
        for (Application__c a:items) {
            
                contactIds.add(a.Applicant__c);
                con2app.put(a.Applicant__c,a);
            
        }
        
        List<Contact> contacts = [SELECT ID, Programs_selected__c FROM Contact WHERE ID in :contactIds];
        List<Contact> toBeUpdated = new List<Contact>();
        for (Contact c:contacts) {
            Application__c app = con2app.get(c.id);
            if (app!=null) {
                
                Set<String> existing = (c.Programs_selected__c!=null) ? (Set<String>) JSON.deserialize(c.Programs_selected__c,Set<String>.class) : new Set<String>();
                
                if (app.status__c == status) {
                    existing.add(app.Program__c);
                } else {
                    existing.remove(app.Program__c);
                }
                c.Programs_selected__c = Json.serialize(existing);
                toBeUpdated.add(c);
            }
        }
        update toBeUpdated;
    }
    private void autoSubmitForApproval(Application__c[] newItems) {
        for (Application__c a : newItems) {
            try {
                // Create an approval request for the company
                Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
                req.setComments('Approval auto submission');
                req.setObjectId(a.id);
                Approval.ProcessResult result = Approval.process(req);
            } catch (Exception e) {
                // catch approval error to prevent rollback
            }
        }
    }
*/    

    /**
     * Expense : The automatic creation of program fee.
     */
    private void setDefaultExpense(Application__c[] newItems){
    
        Map<String, Id> recTypes = new Map<String, Id>();
        for (RecordType  type : [ SELECT Id,Name FROM RecordType WHERE IsActive = True AND SobjectType = 'Expense__c']) {
            recTypes.put(type.Name, type.Id);
        }
        
        Set<Id> programIds = new Set<Id>();
        Set<Id> contacstId = new Set<Id>();
        for (Application__c a : newItems) {
            programIds.add(a.Program__c);
            contacstId.add(a.Applicant__c);
        }
        Map<Id, Program__c> programs = new Map<Id, Program__c>();
        for (Program__c p:[SELECT Id, cost__c FROM Program__c WHERE Id in :programIds AND cost__c<>null]) {
            programs.put(p.Id, p);
        }
        Map<Id, Contact> contacts = new Map<Id, Contact>();
        for (Contact c:[SELECT Id, Account.Id, Account.Name, Account.isOwner__c FROM Contact WHERE Id in :contacstId]) {
            contacts.put(c.Id, c);
        }
        
        List<Expense__c> expenses = new List<Expense__c>();
        for (Application__c a : newItems) {
            
            if( !'Accepted'.equals(a.Status__c) ){ continue; }
            
            //Contact[] contacts = [SELECT Id, Account.Id, Account.Name, Account.isOwner__c FROM Contact WHERE Id=:a.Applicant__c];
            
            if(contacts.size()>0){
                Id RecypeId = recTypes.get(contacts.get(a.Applicant__c).Account.IsOwner__c ? 'Expense Outbound' : 'Expense Inbound' );
                expenses.add(
                    new Expense__c(
                        RecordTypeId = RecypeId ,
                        Program__c = a.Program__c ,
                        Contact__c = a.Applicant__c ,
                        Application__c = a.Id ,
                        Program_fee__c = programs.get(a.Program__c).cost__c
                    )
                );
            }
        }
        insert expenses;
    }

}