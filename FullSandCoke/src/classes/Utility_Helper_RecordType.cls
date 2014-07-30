/*
	created by Jia Hu on 2014/05/20
*/
public with sharing class Utility_Helper_RecordType {
	
    /*
        RecordType Object: using label not API name
        Id approverRTId = RFAConstants.getRecordType('Approver', 'RFAUserRole__c');
        Record Type Label:  Approver
        Record Type Name:   RUR_Approver
    */  
    public static Id getRecordTypeIdByLabel(String sObjectType, String RecordTypeLabel)
    {
        system.debug('------- getRecordType() RT Name: ' + RecordTypeLabel + ' Object: ' + sObjectType);
        return [
        	Select Id, Name, DeveloperName 
        	FROM RecordType 
        	Where SObjectType =: sObjectType AND Name =: RecordTypeLabel
        	].Id;
    }  	
    
    //Utility_Helper_RecordType.getRecordTypeIdByAPIName('RFA__c', 'Capital_Budget_Initiate_Request');
    public static Id getRecordTypeIdByAPIName(String sObjectType, String DeveloperName)
    {
        system.debug('------- getRecordType() RT API Name: ' + DeveloperName + ' Object: ' + sObjectType);
        return [
        	Select Id, Name, DeveloperName 
        	FROM RecordType 
        	Where SObjectType =: sObjectType AND DeveloperName =: DeveloperName
        	].Id;
    }  	 
    
    /*
    	get the Record Type map for RFA__c sObject
    */
    public static Map<String, Id> mapRFARecordTypeAPINameToIds {
    	get {
    			if(mapRFARecordTypeAPINameToIds == null) {
    				mapRFARecordTypeAPINameToIds = new Map<String, Id>();
    				for(
    					RecordType rt : [Select Id, Name, DeveloperName 
    					from RecordType where SObjectType =: RFA_Utility_Constants.sObj_RFA_APIName
    					order by Name asc
    					]
    				) {
    					mapRFARecordTypeAPINameToIds.put(rt.DeveloperName, rt.Id);
    				}
    			}
    			return mapRFARecordTypeAPINameToIds;
    		} 
    	set;
    }
    
    public static Map<String, Id> mapRFAUserRoleRecordTypeAPINameToIds {
    	get {
    			if(mapRFAUserRoleRecordTypeAPINameToIds == null) {
    				mapRFAUserRoleRecordTypeAPINameToIds = new Map<String, Id>();
    				for(
    					RecordType rt : [Select Id, Name, DeveloperName 
    					from RecordType where SObjectType =: RFA_Utility_Constants.sObj_RFAUserRole_APIName
    					order by Name asc
    					]
    				) {
    					mapRFAUserRoleRecordTypeAPINameToIds.put(rt.DeveloperName, rt.Id);
    				}
    			}
    			return mapRFAUserRoleRecordTypeAPINameToIds;
    		} 
    	set;
    }    
    
    public static Map<String, Id> mapCOARecordTypeAPINameToIds {
    	get {
    			if(mapCOARecordTypeAPINameToIds == null) {
    				mapCOARecordTypeAPINameToIds = new Map<String, Id>();
    				for(
    					RecordType rt : [Select Id, Name, DeveloperName 
    					from RecordType where SObjectType =: RFA_Utility_Constants.sObj_COA_APIName
    					order by Name asc
    					]
    				) {
    					mapCOARecordTypeAPINameToIds.put(rt.DeveloperName, rt.Id);
    				}
    			}
    			return mapCOARecordTypeAPINameToIds;
    		} 
    	set;
    }       
    
    
    

	public static boolean ifFinancialReqtByRTId(Id rfaRecordTypeId) {
			if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_General_PROJECT_REQUEST)
				||		
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_CAPITAL_PROJECT_REQUEST)	
				||		
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Medium_PROJECT_REQUEST)
				||		
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_SMALL_PROJECT_REQUEST)	
				||											
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Travel_Expenses_REQUEST)
				||		
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Entertainment_REQUEST)	
			) {
				return true;
			}		
			return false;
	}

	public static boolean ifCommercialReqtByRTId(Id rfaRecordTypeId) {
		if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_A_REQUEST)
				||
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST)
				||
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_C_REQUEST)
				||																	
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_D_REQUEST)		
						) {
							return true;
						}
		return false;
	} 
	
	public static boolean ifCommercialTypeAReqtByRTId(Id rfaRecordTypeId) {
		if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_A_REQUEST)	
						) {
							return true;
						}
		return false;
	} 	
	
	public static boolean ifCommercialTypeBReqtByRTId(Id rfaRecordTypeId) {
		if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_B_REQUEST)	
						) {
							return true;
						}
		return false;
	} 		
	
	public static boolean ifCommercialTypeCReqtByRTId(Id rfaRecordTypeId) {
		if(
			rfaRecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Commercial_C_REQUEST)	
		) {
			return true;
		}
		return false;
	} 		
	
	public static boolean ifCommercialTypeDReqtByRTId(Id rfaRecordTypeId) {
		if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Commercial_D_REQUEST)	
						) {
							return true;
						}
		return false;
	} 		
	
	
	public static boolean ifMilestoneReqtByRTId(Id rfaRecordTypeId) {
			if(
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Initiate_REQUEST)
				||
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Charter_REQUEST)
				||
				rfaRecordTypeId == 
					Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
						RFA_Utility_Constants.RECORDTYPE_Project_Close_Out_REQUEST)															
			) {
				return true;
			}		
			return false;
	}	
	
	//RECORDTYPE_Project_Budget_Initiate_REQUEST = 'Capital_Budget_Initial_Request';   
	public static boolean ifCapitalBudgetInitiateReqtByRTId(Id rfaRecordTypeId) {
		if(
			rfaRecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Project_Budget_Initiate_REQUEST)
		) {
			return true;
		}		
		return false;
	}		
	
	
	public static boolean ifSealReqtByRTId(Id rfaRecordTypeId) {
		if(
			rfaRecordTypeId == 
				Utility_Helper_RecordType.mapRFARecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RECORDTYPE_Seal_Paperless_REQUEST)
		) {
			return true;
		}		
		return false;
	}	
	
	      

}