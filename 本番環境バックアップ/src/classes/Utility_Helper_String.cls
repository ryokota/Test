public with sharing class Utility_Helper_String {
	
	public static Decimal removeNullInput(Decimal decInput) {
		if(decInput == null) {
			return 0;
		} else {
			return decInput;
		}
	}	
	
    public static boolean isBlank(String str) 
    {
        return str == null || str.trim() == null || str.trim().length() == 0;
    }    
    
    public static String processNullString(String str) {
    	if(isBlank(str)) {
    		return ' ';
    	} else {
    		return str;
    	}
    }
    
    public static String[] getMultiSelectPicklistValues(String strMultiSelectPicklist) {
    	if(strMultiSelectPicklist != null && strMultiSelectPicklist.contains(';')) {
    		List<String> listValues = strMultiSelectPicklist.split(';');
    		//Picklist (Multi-Select) has the limit for 40 charachter of each Picklist value
    		//SCM: Supply Chain Function L3
    		for(Integer i = 0; i < listValues.size(); i++) {
    			if(listValues[i] == 'Environment & Occupational Safety') {
    				listValues.remove(i);
    				listValues.add('Environment & Occupational Safety & Health');
    			}
    		}   		
    		return listValues;
    	} else if(strMultiSelectPicklist != null) {
    		String[] arrayString = new List<String>();
    		arrayString.add(strMultiSelectPicklist);
    		return arrayString;
    	}
    	
    	return null;
    }	
	
    public static Set<String> getMultiSelectPicklistValuesInSet(String strMultiSelectPicklist) {
    	
    	Set<String> setStrings = new Set<String>();
    	//Picklist (Multi-Select) has the limit for 40 charachter of each Picklist value
    	//SCM: Supply Chain Function L3
    	if(strMultiSelectPicklist != null && strMultiSelectPicklist.contains(';')) {
    		for(String str : strMultiSelectPicklist.split(';')) {
    			if(str == 'Environment & Occupational Safety') {
    				setStrings.add('Environment & Occupational Safety & Health');
    			} else {
    				setStrings.add(str);
    			}
    		}
    	} else if(strMultiSelectPicklist != null) {    		
    		setStrings.add(strMultiSelectPicklist);
    	}    	
    	return setStrings;
    }	
    
    //compare level, like, L1, .... L13    example: L1 > L2 > L3
    public static Boolean ifNewLevelHigherThanOldLevel(String strNewLevel, String strOldLevel) {
    	Integer intNewLevel = 0;
    	Integer intOldLevel = 0;
    	
    	if(strNewLevel != null) {
    		intNewLevel = Integer.valueOf(strNewLevel.substring(1, strNewLevel.length()));
    		system.debug('----- intNewLevel: ' + intNewLevel);
    	}
    	
    	if(strOldLevel != null) {
    		intOldLevel = Integer.valueOf(strOldLevel.substring(1, strOldLevel.length()));
    		system.debug('----- intOldLevel: ' + intOldLevel);
    	}    	
    	
    	if(intNewLevel < intOldLevel) {
    		return true;
    	}
    	
    	return false;
    }
    
    //Integer Order from 1 -> 13; Level from L13 -> L1
    public static String getLevelWithReversedOrder(Decimal decOrder) {
    	Integer intOrder = Integer.valueOf(decOrder);
    	if(intOrder <= 0 || intOrder > 13) {
    		return null;
    	}
    	return 'L' + String.ValueOf(14 - intOrder);
    }
    	

}