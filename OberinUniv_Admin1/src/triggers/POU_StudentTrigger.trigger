trigger POU_StudentTrigger on Student__c (after  delete, after  insert, after  update,  after undelete, 
                                          before delete, before insert, before update ) {

    POU_StudentTriggerHandler handler = new POU_StudentTriggerHandler();
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            handler.onBeforeDelete(Trigger.old, Trigger.oldMap);
            
        }else if(Trigger.isInsert){
            handler.onBeforeInsert(Trigger.new, Trigger.newMap);
            
        }else if(Trigger.isUpdate){
            handler.onBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
            
        }
    }else if(Trigger.isAfter){
        if(Trigger.isDelete){
            handler.onAfterDelete(Trigger.old, Trigger.oldMap);
        
        }else if(Trigger.isInsert){
            handler.onAfterInsert(Trigger.new, Trigger.newMap);
            
        }else if(Trigger.isUpdate){
            handler.onAfterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        
        }else if(Trigger.isUnDelete){
            handler.OnUndelete(Trigger.new);
            
        }
    }
}