/*  
 *  Class            : CM_RFA_VFC01_RequestDetailListController
 *  Author           : Pasona-Tquila
 *  Version History  : 1.0
 *  Creation         : 2014/05/20
 *  Assumptions      : N/A
 *  Description      : Class for CM_RFA_VFP01_RequestDetailList page controller   
 *
 *  Updated by Yoshinari from 2014/06/19                                    
 */
public with sharing class CM_VFC01_RequestDetailListController {
    
    // Variable declaration
    private RFA__c target ; // RFA Object
    private List<CM_RequestDetails__c> requestDetailsList ; // RFA Request Detail List

     // RecordType DeveloperName getter / value of RFA_Utility_Constants
    public String RECORDTYPE_Detail_Constract_unit_price  
        { get 
            { return  RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price;}
        }
    public String RECORDTYPE_Detail_Special_price_promotion_discount 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount;}
        }   
    public String RECORDTYPE_Detail_FS_selling_price 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price;}
        }    
    public String RECORDTYPE_Detail_FS_commission_Variable 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_FS_Commission_Variable;}
        }
    public String RECORDTYPE_Detail_FS_commission_Fixed 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed;}
        }  
    public String RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other;}
        }   
    public String RECORDTYPE_Detail_Only_in_the_case_of_Rebate 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate;}
        } 
    public String RECORDTYPE_Detail_Other_support 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Other_support;}
        }  
    public String RECORDTYPE_Detail_Promotion_OtherExpense 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense;}
        }   
    public String RECORDTYPE_Detail_Promotion_CooperationSample_Sampling 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling;}
        }   
    public String RECORDTYPE_Detail_NonStandard_Equipment 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment;}
        } 
    public String RECORDTYPE_Detail_VendingEquipmentParts 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts;}
        } 
    public String RECORDTYPE_Detail_IncidentalWork 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork;}
        }    
    public String RECORDTYPE_Detail_VendingEquipmentLease 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease;}
        } 
    public String RECORDTYPE_Detail_Equipment_retirement 
        { get 
            { return RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement;}
        }
    
    /*
     * Constructor
     */
    public CM_VFC01_RequestDetailListController(ApexPages.StandardController controller) {
        target = (RFA__c)controller.getRecord();
    }

    /*
     * Initialization
     */
    public void Initialization() 
    {
        // Soql RFA_RequestDetails__c
        requestDetailsList =  [ Select c.SystemModstamp, c.RecordType.Description, c.RecordType.DeveloperName, toLabel(c.RecordType.Name), 
                                    c.RecordTypeId, c.Name, c.LastModifiedDate, c.LastModifiedById, 
                                    c.IsDeleted, c.Id,  c.CreatedDate, c.CreatedById, c.CM_Used_Equipment__c, 
                                    c.CM_Target_Dealer__c, c.CM_Special_sales_term_to__c, c.CM_Special_sales_term_from__c, 
                                    c.CM_RecordType_Name__c, c.CM_RFA__c, c.CM_Payment_timing__c, c.CM_Payment_method__c, 
                                    c.CM_Payment_due_date__c, c.CM_Payment_amount_Tax_exclusive_price__c, c.CM_Part_Name__c, 
                                    c.CM_Other_payment_methods__c, c.CM_Other_Stand__c, c.CM_Order_term_to__c, c.CM_Order_term_from__c, 
                                    c.CM_Number_of_SampleCase__c, c.CM_New_Equipment__c, c.CM_Monthly_amount_Tax_exclusive_price__c, 
                                    c.CM_Model_Name__c, c.CM_Input__c, c.CM_Existing_Equipment__c, c.CM_Execution_due_date__c, 
                                    c.CM_Dispenser_Stand__c, c.CM_Delivery_term_to__c, c.CM_Delivery_term_from__c, c.CM_Cup_Stand__c, 
                                    c.CM_Cooler_Stand__c, c.CM_Contractor__c, c.CM_Contract_term_to__c, c.CM_Contract_term_from__c, 
                                    c.CM_Contract_Condition_Price_Description__c, 
                                    c.CM_Chanel_Of_Price_Guidelines__c, c.CM_Can_Stand__c, c.CM_CHIRASHI__c, c.CM_Automatic_Renewed__c , c.CM_Description__c
                                From CM_RequestDetails__c c 
                                where CM_RFA__c = :target.id
                                order By c.RecordType.Name];
        //setRecordTypeMap();
    }
    
    /**
     * getRequestDetailList()
     * return List<CM_RequestDetails__c>
     */
    public List<CM_RequestDetails__c> getRequestDetailList() {
        return requestDetailsList;
    }
    
    /**
     * Attachment Data class
     * add by yoshinari 2014.06.19 
     */
    public class AttachmentData {
    	public id fileId { get; set; } // object id
    	public string filename { get; set; }	// file name
    	public string lastModifiedBy { get; set; } // last modified by User
    	public Integer fileSize { get; set; } // KB
 		
 		/* 
 		 * constructor
 		 */
    	public AttachmentData(Attachment pAttachment) {
    		this.fileId = pAttachment.id;
    		this.filename = pAttachment.name;
    		this.lastModifiedBy = pAttachment.LastModifiedBy.Name;
    		this.fileSize = fileSizeConversion(pAttachment.BodyLength);
    	}
    	
    	/*
    	 * file SizeBbyte->KByte
    	 */
    	private Integer fileSizeConversion(Integer pSize) {
    		return pSize/1000; // Byte -> KByte
    	}
    }
    /**
     * getAttachments() 
     * return List<Attachment>
     */
    public List<Attachment> getAttachments() {
        return [Select a.SystemModstamp, a.ParentId, a.OwnerId, a.Name, a.LastModifiedDate, 
                    a.LastModifiedById, a.LastModifiedBy.Name, a.IsPrivate, a.IsDeleted, a.Id, a.Description, 
                    a.CreatedDate, a.CreatedById, a.ContentType, a.BodyLength, a.Body 
                From Attachment a 
                where parentid=:target.id];
    }

    /**
     * getAttachments() 
     * return List<Attachment>
     * Add by yoshinari 2014.06.19 
     */
    public List<AttachmentData> getAttachmentData() {
    	List<AttachmentData> attachmentDataList = new List<AttachmentData>();
        for (Attachment att : [Select a.SystemModstamp, a.ParentId, a.OwnerId, a.Name, a.LastModifiedDate, 
                    a.LastModifiedById, a.LastModifiedBy.Name, a.IsPrivate, a.IsDeleted, a.Id, a.Description, 
                    a.CreatedDate, a.CreatedById, a.ContentType, a.BodyLength, a.Body 
                From Attachment a 
                where parentid=:target.id])
         {
         	attachmentDataList.add(new AttachmentData(att));
         }
         return attachmentDataList;
    }
}