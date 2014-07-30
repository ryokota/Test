/*
 *  Author           : Pasona Tquila
 *  Version History  : 1.0
 *  Creation         : 2014/05/21
 *
 *  Updated by Yoshinari from 2014/05/22                                    
 */

public class CM_RequestDetailValidation {

    // create recordTypeMap
    Map<String , RecordType> recordTypeMap = new Map<String, RecordType>();
    Map<String, CM_RequestDetails__c> detailCheckMap;

    public CM_RequestDetailValidation() 
    {
    }
    
    /*
     * commercialCirculationCheck()
     * parameter : RFA__c rfa
     * return List<String>
     */
    public List<String> commercialCirculationCheck(RFA__c rfa) {
		system.debug('-- commercialCirculationCheck() start -- ' + rfa);

        // RequestDetails Map
        detailCheckMap = new Map<String, CM_RequestDetails__c>();

        // error set
        //Set<String> errorList = new Set<String>();
        List<String> errorList = new List<String>();

        // create recordType Map
        for (RecordType rType : 
                [select id, toLabel(Name) , DeveloperName 
                    from RecordType where SObjectType='CM_RequestDetails__c']) {
                    // put to Map
                    recordTypeMap.put(rType.DeveloperName, rType);
        }
		system.debug('-- recordTypeMap :' + recordTypeMap);

        //　search target request detail
        for (CM_RequestDetails__c tmp :
            [select id, Name, recordType.DeveloperName
                from CM_RequestDetails__c 
                where CM_RFA__c =: rfa.id])
        {
            system.debug( '-- tmp: ' + tmp);
            // Duplicate registration error
            //if (detailCheckMap.get(tmp.recordType.DeveloperName) != null)
            system.debug( '-- detailCheckMap.containsKey(tmp.recordType.DeveloperName): ' + detailCheckMap.containsKey(tmp.recordType.DeveloperName));
            
            if (detailCheckMap.containsKey(tmp.recordType.DeveloperName))
            {
                // duplicate error
                errorList.add('duplicate details record regist errror');
            } 
            else 
            {
                // put to Map (CM_RequestDetails__c) 
                detailCheckMap.put(tmp.recordType.DeveloperName, tmp);
            }
        }

        // small category record check
        system.debug( '-- errorList.isEmpty() ' + errorList.isEmpty());
        if (errorList.isEmpty())
        {
            system.debug( '-- rfa.CM_Contract_unit_price__c: ' + rfa.CM_Contract_unit_price__c);
            // 01. Contract unit price
            rfaDetailDataCheck(
                rfa.CM_Contract_unit_price__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Constract_unit_price,
                errorList);
                
            // 02. Special price / Promotion discount
            rfaDetailDataCheck(
                rfa.CM_SpecialPricePromotionDiscount__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Special_price_promotion_discount,
                errorList);
                
            /*
            // 03. FS selling price
            rfaDetailDataCheck(
                rfa.CM_FS_selling_price__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price,
                errorList);
			*/
            /*
            // 04. FS commission (Variable)
            rfaDetailDataCheck(
                rfa.CM_FS_Commission_Variable__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable,
                errorList);
             */
             
            Map<String, String> multipleRecordMap = new Map<String, String>(); 
            // 03. FS selling price & 04 FS commission(variable) Multiple conditions 
            rfaDetailDataCheck(
            	new String[]{rfa.CM_FS_selling_price__c,rfa.CM_FS_Commission_Variable__c},
            	new String[]{RFA_Utility_Constants.RECORDTYPE_Detail_FS_selling_price, RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Variable},
            	errorList);
            	
            // 05. FS commission (Fixed)
            rfaDetailDataCheck(
                rfa.CM_FS_Commission_Fixed__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_FS_commission_Fixed,
                errorList);
                
            // 06. Key money / Rebate / Spot / Other
            rfaDetailDataCheck(
                rfa.CM_KeyMoney_Rebate_Sport_Other__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_KeyMoney_Rebate_Spot_Other,
                errorList);
                
            // 07. Only in the case of Rebate
            rfaDetailDataCheck(
                rfa.CM_Only_in_the_case_of_Rebate__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Only_in_the_case_of_Rebate,
                errorList);
                
            // 08. Other support
            rfaDetailDataCheck(
                rfa.CM_Other_support__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Other_support,
                errorList);
                
            // 09. Promotion / Other expense
            rfaDetailDataCheck(
                rfa.CM_Promotion_OtherExpense__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_OtherExpense,
                errorList);
                
            // 10. Promotion (Cooperation / Sampling)
            rfaDetailDataCheck(
                rfa.CM_Promotion_CooperationSampling__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Promotion_CooperationSample_Sampling,
                errorList);

            // a. Non-standard Equipment
            rfaDetailDataCheck(
                rfa.CM_Non_standard_Equipment__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_NonStandard_Equipment,
                errorList);

            // b. Vending Equipment parts
            rfaDetailDataCheck(
                rfa.CM_Vending_Equipment_parts__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentParts,
                errorList);

            // c. Incidental work
            rfaDetailDataCheck(
                rfa.CM_Incidental_work__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_IncidentalWork,
                errorList);

            // d. Vending Equipment Lease
            rfaDetailDataCheck(
                rfa.CM_Vending_Equipment_Lease__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_VendingEquipmentLease,
                errorList);

            // e. Equipment retirement
            rfaDetailDataCheck(
                rfa.CM_Equipment_retirement__c, 
                RFA_Utility_Constants.RECORDTYPE_Detail_Equipment_retirement,
                errorList);
        }
        system.debug('-- errorList.size : ' + errorList.size() + '  -- errorList : ' + errorList);
        return errorList;
    }
    
    /*
     * rfaDetailDataCheck()
     * request detail record check & make error message
     * parameter String: SmallCategory , String recordTypeDeveloperName, List<String> : errMsgList 
     */
    private void rfaDetailDataCheck(
    	String smallCategory, 
    	String recordTypeDeveloperName, 
    	List<String> errMsgList) {
        
        CM_RequestDetails__c rd = detailCheckMap.get(recordTypeDeveloperName);

        system.debug('-- smallCategory : ' + smallCategory);
        system.debug('-- recordTypeDeveloperName : ' + recordTypeDeveloperName);
        system.debug('-- errMsgList : ' + errMsgList);

        system.debug('-- rd : ' + rd);

        if (smallCategory != null && rd == null)
        {
            errMsgList.add(System.Label.CM_No_detail_record_error_message +': ' + recordTypeMap.get(recordTypeDeveloperName).Name);
        }
        else if (smallCategory == null && rd != null)
        {
            errMsgList.add(System.Label.CM_Extra_detail_record_error_message + ': ' + recordTypeMap.get(recordTypeDeveloperName).Name);
        }
    }

    /*
     * rfaDetailDataCheck()
     * request detail record check & make error message
     * parameter : String[] SmallCategorys , String[] recordTypeDeveloperName, List<String> errMsgList 
     */
    private void rfaDetailDataCheck(
    	String[] smallCategorys, 
    	String[] recordTypeDeveloperNames, 
    	List<String> errMsgList) 
    {
    
        system.debug('-- smallCategorys : ' + smallCategorys);
        system.debug('-- recordTypeDeveloperNames : ' + recordTypeDeveloperNames);
        system.debug('-- errMsgList : ' + errMsgList);
    
		integer index = 0;
		Integer selectedSelectCnt = 0;		// selected item count
		String tmpErrorMessage = '';			// error message
		boolean noRecordErrorFlg = true;    // no detail record error : true
		boolean extraRecordErrorFlg = false; // extra detail record error : true
		List<String> noRecordErrorRecordTypeDeveloperNames = new List<String>();
		List<String> extraRecordErrorRecordTypeDeveloperNames = new List<String>();
		for (String str :smallCategorys)
		{
			system.debug('-- str:' + str);
			system.debug('-- detailCheckMap.containsKey(recordTypeDeveloperNames[index] : ' + detailCheckMap.containsKey(recordTypeDeveloperNames[index]));
			// no record ?
			if (str != null )
			{
				selectedSelectCnt++;
				if (detailCheckMap.get(recordTypeDeveloperNames[index]) != null) 
				{
					noRecordErrorFlg = false;
				}
				else
				{
					noRecordErrorRecordTypeDeveloperNames.add(recordTypeDeveloperNames[index]);
				}
			}
			else 
			{
				if (detailCheckMap.get(recordTypeDeveloperNames[index]) != null)
				{
					// extra record error
					extraRecordErrorFlg = true;
					extraRecordErrorRecordTypeDeveloperNames.add(recordTypeDeveloperNames[index]);
				}
			}
			index++;
		}
		// make a error message
		system.debug('-- noRecordErrorFlg :' + noRecordErrorFlg);
		if (noRecordErrorFlg && selectedSelectCnt != 0)
		{
			tmpErrorMessage = System.Label.CM_No_detail_record_error_message + ': ';
			for ( String errItem : noRecordErrorRecordTypeDeveloperNames )
			{
				tmpErrorMessage += ' >' + recordTypeMap.get(errItem).Name;
			}
			errMsgList.add(tmpErrorMessage);
		}
		system.debug('-- extraRecordErrorFlg :' + extraRecordErrorFlg);
		if (extraRecordErrorFlg)
		{
			tmpErrorMessage = System.Label.CM_Extra_detail_record_error_message + ': ';
			for ( String errItem : extraRecordErrorRecordTypeDeveloperNames )
			{
				tmpErrorMessage += ' >' + recordTypeMap.get(errItem).Name;
			}
			errMsgList.add(tmpErrorMessage);
		}
    }
}