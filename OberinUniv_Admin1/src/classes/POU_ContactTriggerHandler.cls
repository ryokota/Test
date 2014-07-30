public with sharing class POU_ContactTriggerHandler {
    
    private static List<String> recordTypeNames = new String[]{'Coordinator','Director contact'};
    
    // ==INSERT
    public void onBeforeInsert(Contact[] newItems, Map<Id, Contact> newItemMap) {
    }
    
    
    public void  onAfterInsert(Contact[] newItems, Map<Id, Contact> newItemMap) {
        updateCoordinatorsAndDirectors(newItems);
    }
    
    // ==UPDATE
    public void onBeforeUpdate(Contact[] oldItems, Contact[] newItems, Map<Id, Contact> oldItemMap, Map<Id, Contact> newItemMap) {
    }
    
    public void  onAfterUpdate(Contact[] oldItems, Contact[] newItems, Map<Id, Contact> oldItemMap, Map<Id, Contact> newItemMap) {
        updateUser(oldItems, newItems);
    }
    
    // ==DELETE
    public void onBeforeDelete(Contact[] oldItems, Map<Id, Contact> oldItemMap) {}
    public void  onAfterDelete(Contact[] oldItems, Map<Id, Contact> oldItemMap) {}

    // ==UNDELETE
    public void     onUndelete(Contact[] items) {}
    
    private void updateCoordinatorsAndDirectors(Contact[] contacts) {
        
        if (contacts!=null && contacts.size()>0) {
        
            List<RecordType> recordTypes = [SELECT Id,IsActive,Name,SobjectType FROM RecordType WHERE Name in :recordTypeNames AND IsActive=true];
            Map<String, Id> recordTypeMap = new Map<String, Id>(); // Name --> Record Type Id
            for (RecordType rt : recordTypes) {
                recordTypeMap.put(rt.Name, rt.id);
            }
            
            Set<Id> selectedAccountIds = new Set<Id>();
            Map<Id, String> accountToCoordinatorMap = new Map<Id,String>();
            Map<Id, String> accountToDirectorMap = new Map<Id,String>();
            for (Contact c:contacts) {
                
                if (c.accountId!=null) {
                    
                    if (c.RecordTypeId == recordTypeMap.get('Coordinator')) {
                        accountToCoordinatorMap.put(c.accountId, c.id);
                        selectedAccountIds.add(c.accountId);
                    }
                    
                    if (c.RecordTypeId == recordTypeMap.get('Director contact')) {
                        accountToDirectorMap.put(c.accountId, c.id);
                        selectedAccountIds.add(c.accountId);
                    }
                
                }
                
            }
            
            List<Account> selectedAccounts = [SELECT Id, Coordinator__c, Director_Contact__c FROM Account WHERE Id IN :selectedAccountIds];
            List<Account> toBeUpdated = new List<Account>();
            Boolean updateThisElement;
            for (Account a:selectedAccounts) {
                updateThisElement = false;
                
                // set coordinator to be updated only if it has changed
                Id newCoordinator = accountToCoordinatorMap.get(a.id);
                if (newCoordinator!=null && newCoordinator!=a.Coordinator__c) {
                    a.Coordinator__c = newCoordinator;
                    updateThisElement = true;
                }
                
                // set director to be updated only if it has changed
                Id newDirector = accountToDirectorMap.get(a.id);
                if (newDirector!=null && newDirector!=a.Director_Contact__c) {
                    a.Director_Contact__c = newDirector;
                    updateThisElement = true;
                }
                
                if (updateThisElement == true) {
                    toBeUpdated.add(a);
                }
                
                
            }
            
            update toBeUpdated;
        
        }
        
        
        
    }
    
    /**
     * to User
     */
    private void updateUser(Contact[] oldItems, Contact[] newItems){
        
        Map<Id, Contact> conMap = new Map<Id, Contact>();
        for(integer i = 0; i < oldItems.size(); i++){
            Contact oldCon = oldItems[i];
            Contact newCon = newItems[i];
            
            if ( POU_CommonService.isNotEquals(oldCon.Email, newCon.Email)
              || POU_CommonService.isNotEquals(oldCon.lastname, newCon.lastname)
              || POU_CommonService.isNotEquals(oldCon.firstname, newCon.firstname )
              || POU_CommonService.isNotEquals(oldCon.Language_settings__c, newCon.Language_settings__c) ){
              
                conMap.put(newCon.id, newCon);//反映対象項目に違いのあるContactを抽出
            }
        }
        
        if(conMap.size()>0){
            User[] users=[
                SELECT Id, ContactId, Email, LastName, FirstName, Language_settings__c
                  FROM User
                 WHERE ContactId in :conMap.keySet()
            ];
            if(users.size()>0){
                for(integer i = 0; i < users.size(); i++){
                    User u = users[i];
                    Contact c = conMap.get(u.ContactId);
                    
                    u.LastName = c.LastName;
                    u.FirstName = c.FirstName;
                    u.Email = c.Email;
                    u.Language_settings__c = c.Language_settings__c;
                }
                update users;
            }
        }
    }
    
}