public with sharing class Utility_Helper_Money {


	
	
	/*
		==== String ===
	*/
	//with space
	 public static String getMoneyFormatInString(String strMoney) {
	 	
	 	if(strMoney.contains(',')) {
	 		return strMoney;
	 	} else if(strMoney.contains('.')) {
	 		return getMoneyFormatWithCommaAndSpace(strMoney.substringBefore('.')) + '.' + strMoney.substringAfter('.');
	 	} else {
	 		return getMoneyFormatWithCommaAndSpace(strMoney);
	 	}
	 	return '0';
	 }
	 
	 //without space
	 public static String getMoneyFormatInDecimal(Decimal decMoney) {
	 	
	 	String strMoney = String.valueOf(decMoney);
	 	
	 	if(strMoney.contains(',')) {
	 		return strMoney;
	 	} else if(strMoney.contains('.')) {
	 		return getMoneyFormatWithCommaNoSpace(strMoney.substringBefore('.')) + '.' + strMoney.substringAfter('.');
	 	} else {
	 		return getMoneyFormatWithCommaNoSpace(strMoney);
	 	}
	 	return '0';
	 }	 
	 
    //¥1234567 -> 1, 234, 567
    public static String getMoneyFormatWithCommaAndSpace(String strInteger) {
    	system.debug('-------- Money Input: ' + strInteger + ' length: ' + strInteger.length());
    	//system.debug('------ 0, 2: ' + strNoFormat.substring(0, 2));
    	
    	integer strLength = strInteger.length();
    	if(strLength <= 3) {
    		return strInteger;
    	} else if(3 < strLength && strLength <= 6) {
    		return strInteger.substring(0, (strLength - 3) ) + ', ' 
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(6 < strLength && strLength <= 9) {
    		return strInteger.substring(0, (strLength - 6) ) + ', ' 
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ', '
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(9 < strLength && strLength <= 12) {
    		return strInteger.substring(0, (strLength - 9) ) + ', ' 
    			 + strInteger.substring((strLength - 9), (strLength - 6) ) + ', '
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ', '
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(12 < strLength && strLength <= 15) {
    		return strInteger.substring(0, (strLength - 12) ) + ', ' 
    			 + strInteger.substring((strLength - 12), (strLength - 9) ) + ', '
    			 + strInteger.substring((strLength - 9), (strLength - 6) ) + ', '
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ', '
    			 + strInteger.substring((strLength - 3), strLength);
    	}        	
    	    	
    	return '0';
    }	
    
    ////¥1234567 -> 1,234,567
    public static String getMoneyFormatWithCommaNoSpace(String strInteger) {
    	system.debug('-------- Money Input: ' + strInteger + ' length: ' + strInteger.length());
    	//system.debug('------ 0, 2: ' + strNoFormat.substring(0, 2));
    	
    	integer strLength = strInteger.length();
    	if(strLength <= 3) {
    		return strInteger;
    	} else if(3 < strLength && strLength <= 6) {
    		return strInteger.substring(0, (strLength - 3) ) + ',' 
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(6 < strLength && strLength <= 9) {
    		return strInteger.substring(0, (strLength - 6) ) + ', ' 
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ','
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(9 < strLength && strLength <= 12) {
    		return strInteger.substring(0, (strLength - 9) ) + ', ' 
    			 + strInteger.substring((strLength - 9), (strLength - 6) ) + ','
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ','
    			 + strInteger.substring((strLength - 3), strLength);
    	} else if(12 < strLength && strLength <= 15) {
    		return strInteger.substring(0, (strLength - 12) ) + ', ' 
    			 + strInteger.substring((strLength - 12), (strLength - 9) ) + ','
    			 + strInteger.substring((strLength - 9), (strLength - 6) ) + ','
    			 + strInteger.substring((strLength - 6), (strLength - 3) ) + ','
    			 + strInteger.substring((strLength - 3), strLength);
    	}        	
    	    	
    	return '0';
    }	    

}