public with sharing class Utility {
	
	
	public static boolean isSystemAdmin() {
		String strProfileName = [Select Id, Name from Profile where Id =: UserInfo.getProfileId()].Name;
		system.debug('------ Profile Name: ' + strProfileName);
		if(strProfileName == RFA_Utility_Constants.SysAdminProfile//'System Administrator' 
			|| 
			strProfileName == RFA_Utility_Constants.SysAdminJPProfile//'システム管理者'
		) {
			return true;
		}		
		return false;
	}
	
	public static boolean isActive(Id uId) {
		User u = [Select Id from User where Id =: uId and IsActive = true];
		if(u != null) {
			return true;
		}
		return false;
	}
	

	public static boolean isSandbox() {
		return URL.getSalesforceBaseUrl().getHost().left(2).equalsignorecase('cs');
	}

	public static boolean isProduction() {
		return URL.getSalesforceBaseUrl().getHost().left(2).equalsignorecase('ap');
	}	
	
	
	

}