global class approvalRecall
{
    webservice static void recallApproval(Id recId)    
    {        
        List<ProcessInstanceWorkitem> piwi = [
            SELECT Id, ProcessInstanceId, ProcessInstance.TargetObjectId 
              FROM ProcessInstanceWorkitem 
             WHERE ProcessInstance.TargetObjectId =: recId
        ];
        if(piwi.size()==0){
            return;
        }
        Approval.ProcessWorkitemRequest req = new Approval.ProcessWorkitemRequest();
        req.setAction('Removed');        
        req.setWorkitemId(piwi.get(0).Id);
        
        Approval.process(req,false);
    }
}