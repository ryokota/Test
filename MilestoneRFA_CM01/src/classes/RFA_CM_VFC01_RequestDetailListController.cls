public with sharing class RFA_CM_VFC01_RequestDetailListController {


    private RFA__c target ;
    
    public List<CM_RequestDetails__c> requestDetailsList { get; set; }
    
    public RFA_CM_VFC01_RequestDetailListController(ApexPages.StandardController controller) {
        target = (RFA__c)controller.getRecord();
    }

    public void Initialization() {

       requestDetailsList =  [ Select c.SystemModstamp, c.RecordTypeId, c.Name, c.LastModifiedDate, c.LastModifiedById, 
                                               c.IsDeleted, c.Id, c.CreatedDate, c.CreatedById, c.CM_Target_Dealer__c, c.CM_Special_sales_term_to__c, 
                                               c.CM_Special_sales_term_from__c, c.CM_RFA__c, c.CM_Payment_timing__c, c.CM_Payment_method__c, 
                                               c.CM_Payment_amount_Tax_exclusive_price__c, c.CM_Payment_DueDate__c, c.CM_Other_payment_methods__c, 
                                               c.CM_Order_term_to__c, c.CM_Order_term_from__c, c.CM_Input__c, c.CM_Delivery_term_to__c, 
                                               c.CM_Delivery_term_from__c, c.CM_Contract_term_to__c, c.CM_Contract_term_from__c, c.CM_Contract_Condition_Price__c, 
                                               c.CM_CHIRASHI__c From CM_RequestDetails__c c
                                            where c.CM_RFA__c =: target.id];   
    }
    
    //public List<CM_RequestDetails__c> getRequestDetails() {
    //    return requestDetailsList; 
    //}
}