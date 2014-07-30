/*
 * Author           : Pasona Tquila
 * Version History  : 1.0
 * Creation         : 2014/05/23
 * RFA Final approved mail transmission gorup relation
 *  
 * update by yoshinari 2014/06/23
 */
public with sharing class CM_FinalApprovalMailDistination {

	/**
	 * Label Map
	 * Api Name -> LabelName (organization Name/English)
	 * In the case of Approval Content(type.b) change, and Modify here.
	 * add by yoshinari 2014/05/28
	 */
	private Map<String, String> orgLabelMap = new Map<String, String>{
		'CM_Contract_unit_price__c' 			=> '01. Contract unit price',
		'CM_SpecialPricePromotionDiscount__c' 	=> '02. Special price / Promotion discount',
		'CM_FS_selling_price__c' 				=> '03. FS selling price',
		'CM_FS_Commission_Variable__c' 			=> '04. FS commission (Variable)',
		'CM_FS_Commission_Fixed__c' 			=> '05. FS commission (Fixed)',
		'CM_KeyMoney_Rebate_Sport_Other__c' 	=> '06. Key money / Rebate / Spot / Other',
		'CM_Only_in_the_case_of_Rebate__c' 		=> '07. Only in the case of Rebate',
		'CM_Other_support__c' 					=> '08. Other support',
		'CM_Promotion_OtherExpense__c' 			=> '09. Promotion / Other expense',
		'CM_Promotion_CooperationSampling__c' 	=> '10. Promotion (Cooperation / Sampling)',
		'CM_Non_standard_Equipment__c' 			=> 'a. Non-standard Equipment',
		'CM_Vending_Equipment_parts__c' 		=> 'b. Vending Equipment parts',
		'CM_Incidental_work__c' 				=> 'c. Incidental work',
		'CM_Vending_Equipment_Lease__c' 		=> 'd. Vending Equipment Lease',
		'CM_Equipment_retirement__c' 			=> 'e. Equipment retirement'
	};

    /* 
     * setFinalApprovalMailDistinationGroup()
     * parameter RFA__c rfa
     */
    public void setFinalApprovalMailDistinationGroup(RFA__c rfa)
    {
        // search Final Approval mail Group /CM_FinalApprovalMailGroup__c
        // type.b Primary COA Category / Primary COA Sub Category 1 & smallCategory (Category2)
        // type.d Primary COA Category / Primary COA Sub Category 1 / Primary COA Sub Category 2 / Primary COA Sub Category 3

        // CM_FinalApprovalMailDestination__c
        List<CM_FinalApprovalMailDestination__c> famdListInsert = new List<CM_FinalApprovalMailDestination__c>();

        // CM_FinalApprovalMailGroup__c
        List<CM_FinalApprovalMailGroup__c> mailGroupList = new List<CM_FinalApprovalMailGroup__c>();

        // get recordTypeDeveloperName
        String recordTypeDeveloperName 
            = RFA_Utility_Constants.getRecordType(
                rfa.RecordTypeId, 
                RFA_Utility_Constants.sObj_RFA_APIName);
                
        system.debug('---- <setFinalApprovalMailDistinationGroup> recordTypeDeveloperName :' + recordTypeDeveloperName);
                
		// 2014.06.13 add by yoshinari
		List<string> companyList = new List<string>(); 
		if ( rfa.CM_Company_receiving_after_approval_mail__c != null ) {
			// change multi-select picklist -> List
			companyList = rfa.CM_Company_receiving_after_approval_mail__c.split(';');
		} 
		system.debug('---- <setFinalApprovalMailDistinationGroup> ---------------------------------------------------------------------- ');		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.CM_PrimaryCOACategory__c :' + rfa.CM_PrimaryCOACategory__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.CM_PrimaryCOASubCategory__c :' + rfa.CM_PrimaryCOASubCategory__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> ---------------------------------------------------------------------- ');		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.PrimaryCOACategory__c :' + rfa.PrimaryCOACategory__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.PrimaryCOASubCategory2__c :' + rfa.PrimaryCOASubCategory__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.PrimaryCOASubCategory2__c :' + rfa.PrimaryCOASubCategory2__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.PrimaryCOASubCategory3__c :' + rfa.PrimaryCOASubCategory3__c);		
		system.debug('---- <setFinalApprovalMailDistinationGroup> ---------------------------------------------------------------------- ');		

        // type B
        if (recordTypeDeveloperName 
            == RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST)
        {
            // get Category2
            List<String> category2 = getCategory2(rfa);
            system.debug('---- <setFinalApprovalMailDistinationGroup> category2 :' + category2);
            // add condition the CM_Company_receiving_after_approval_mail__c & CM_IsActive__c
            mailGroupList = [select id, Name, CM_OpenCheck__c, CM_Description__c
                                 from CM_FinalApprovalMailGroup__c 
                                 //where CM_Category__c = :rfa.PrimaryCOACategory__c
                                 //And CM_Sub_Category1__c = :rfa.CM_PrimaryCOASubCategory__c
                                 //And CM_Sub_Category2__c in : category2
                                 where 
                                 CM_Company_receiving_after_approval_mail__c in: companyList
                                 And CM_IsActive__c = true
								 And 
								 (
	                                 ( // B. Approval of Customer Terms & Conditions
	                                   CM_Category__c = :rfa.CM_PrimaryCOACategory__c
	                                   And CM_Sub_Category1__c = :rfa.CM_PrimaryCOASubCategory__c
	                                   And CM_Sub_Category2__c in : category2
	                                 )
	                                 OR
	                                 (  // 2014.06.20 add by yoshinari /change request
	                                 	// D. Credit Terms / Policies
	                                   CM_Category__c = :rfa.PrimaryCOACategory__c
	                                   And CM_Sub_Category1__c = :rfa.PrimaryCOASubCategory__c
	                                   And CM_Sub_Category2__c = :rfa.PrimaryCOASubCategory2__c
	                                   And CM_Sub_Category3__c = :rfa.PrimaryCOASubCategory3__c 
									 )
								)
                            ];
        }
        // type D or other ? <todo>
        else if (recordTypeDeveloperName 
            == RFA_Utility_Constants.RECORDTYPE_Commercial_D_REQUEST)
        {
            system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.CM_PrimaryCOASubCategory2__c :' + rfa.PrimaryCOASubCategory2__c);
            system.debug('---- <setFinalApprovalMailDistinationGroup> rfa.CM_PrimaryCOASubCategory3__c :' + rfa.PrimaryCOASubCategory3__c);
            // add condition the CM_Company_receiving_after_approval_mail__c & CM_IsActive__c
            mailGroupList = [select id, Name, CM_OpenCheck__c, CM_Description__c
                                 from CM_FinalApprovalMailGroup__c 
                                 where CM_Category__c = :rfa.PrimaryCOACategory__c
                                // And CM_Sub_Category1__c = :rfa.CM_PrimaryCOASubCategory__c
                                // And CM_Sub_Category2__c = :rfa.CM_PrimaryCOASubCategory2__c
                                // And CM_Sub_Category3__c = :rfa.CM_PrimaryCOASubCategory3__c 
                                 And CM_Sub_Category1__c = :rfa.PrimaryCOASubCategory__c
                                 And CM_Sub_Category2__c = :rfa.PrimaryCOASubCategory2__c
                                 And CM_Sub_Category3__c = :rfa.PrimaryCOASubCategory3__c 
                                 And CM_Company_receiving_after_approval_mail__c in: companyList
                                 And CM_IsActive__c = true
                            ];
            
        }
        
        system.debug('-- <setFinalApprovalMailDistinationGroup> mailGroupList :' + mailGroupList);

        // Final approval mail destination
        for (CM_FinalApprovalMailGroup__c mg : mailGroupList )
        {
             famdListInsert.add(
                new CM_FinalApprovalMailDestination__c(
                    CM_RFA__c = rfa.id,
                    CM_FinalApprovalMailGroup__c = mg.id
                )   
             );
        }
        // create CM_FinalApprovalMailDestination__c
        system.debug('-- <setFinalApprovalMailDistinationGroup> famdListInsert :' + famdListInsert);
        if(famdListInsert != null && famdListInsert.size() > 0)
        {
            insert famdListInsert;
        }
    }
    
    /*
     * getCategory2() 
     * small category -> Category2
     * parameter RFA__c rfa
     * return List<String> Category2 value List
     */
    private List<String> getCategory2(RFA__c rfa)
    {
        System.debug('## rfa.CM_Contract_unit_price__c :' + rfa.CM_Contract_unit_price__c);
        /* type.B small category */
        // 
        List<String> category2 = new List<String>();
        // 01.-10. a.-e small category -> category list
        /* //Change processing is "Get LabelName"  modified by yoshinari 2014/05/28
        if (rfa.CM_Contract_unit_price__c != null) category2.add(RFA__c.CM_Contract_unit_price__c.getDescribe().getLocalName());
        if (rfa.CM_SpecialPricePromotionDiscount__c != null) category2.add(RFA__c.CM_SpecialPricePromotionDiscount__c.getDescribe().getLabel());
        if (rfa.CM_FS_selling_price__c != null) category2.add(RFA__c.CM_FS_selling_price__c.getDescribe().getLabel());
        if (rfa.CM_FS_Commission_Variable__c != null) category2.add(RFA__c.CM_FS_Commission_Variable__c.getDescribe().getLabel());
        if (rfa.CM_FS_Commission_Fixed__c != null) category2.add(RFA__c.CM_FS_Commission_Fixed__c.getDescribe().getLabel());
        if (rfa.CM_KeyMoney_Rebate_Sport_Other__c != null) category2.add(RFA__c.CM_KeyMoney_Rebate_Sport_Other__c.getDescribe().getLabel());
        if (rfa.CM_Only_in_the_case_of_Rebate__c != null) category2.add(RFA__c.CM_Only_in_the_case_of_Rebate__c.getDescribe().getLabel());
        if (rfa.CM_Other_support__c != null) category2.add(RFA__c.CM_Other_support__c.getDescribe().getLabel());
        if (rfa.CM_Promotion_OtherExpense__c != null) category2.add(RFA__c.CM_Promotion_OtherExpense__c.getDescribe().getLabel());
        if (rfa.CM_Promotion_CooperationSampling__c != null) category2.add(RFA__c.CM_Promotion_CooperationSampling__c.getDescribe().getLabel());
        if (rfa.CM_Non_standard_Equipment__c != null) category2.add(RFA__c.CM_Non_standard_Equipment__c.getDescribe().getLabel());
        if (rfa.CM_Vending_Equipment_parts__c != null) category2.add(RFA__c.CM_Vending_Equipment_parts__c.getDescribe().getLabel());
        if (rfa.CM_Incidental_work__c != null) category2.add(RFA__c.CM_Incidental_work__c.getDescribe().getLabel());
        if (rfa.CM_Vending_Equipment_Lease__c != null) category2.add(RFA__c.CM_Vending_Equipment_Lease__c.getDescribe().getLabel());
        if (rfa.CM_Equipment_retirement__c != null) category2.add(RFA__c.CM_Equipment_retirement__c.getDescribe().getLabel());
        */

        if (rfa.CM_Contract_unit_price__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Contract_unit_price__c.getDescribe().getName()));
        if (rfa.CM_SpecialPricePromotionDiscount__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_SpecialPricePromotionDiscount__c.getDescribe().getName()));
        if (rfa.CM_FS_selling_price__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_FS_selling_price__c.getDescribe().getName()));
        if (rfa.CM_FS_Commission_Variable__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_FS_Commission_Variable__c.getDescribe().getName()));
        if (rfa.CM_FS_Commission_Fixed__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_FS_Commission_Fixed__c.getDescribe().getName()));
        if (rfa.CM_KeyMoney_Rebate_Sport_Other__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_KeyMoney_Rebate_Sport_Other__c.getDescribe().getName()));
        if (rfa.CM_Only_in_the_case_of_Rebate__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Only_in_the_case_of_Rebate__c.getDescribe().getName()));
        if (rfa.CM_Other_support__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Other_support__c.getDescribe().getName()));
        if (rfa.CM_Promotion_OtherExpense__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Promotion_OtherExpense__c.getDescribe().getName()));
        if (rfa.CM_Promotion_CooperationSampling__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Promotion_CooperationSampling__c.getDescribe().getName()));
        if (rfa.CM_Non_standard_Equipment__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Non_standard_Equipment__c.getDescribe().getName()));
        if (rfa.CM_Vending_Equipment_parts__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Vending_Equipment_parts__c.getDescribe().getName()));
        if (rfa.CM_Incidental_work__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Incidental_work__c.getDescribe().getName()));
        if (rfa.CM_Vending_Equipment_Lease__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Vending_Equipment_Lease__c.getDescribe().getName()));
        if (rfa.CM_Equipment_retirement__c != null) 
        	category2.add(getOrgLabelName(RFA__c.CM_Equipment_retirement__c.getDescribe().getName()));

        return category2;
    }

    /*
     * getOrgLabelName()
     * parameter String : ApiName
     * description: get LabelName from ApiName
     * add by yoshinari 2014/05/28
     */
    private String getOrgLabelName(String pApiName) 
    {
    	return orgLabelMap.get(pApiName);
    }

}