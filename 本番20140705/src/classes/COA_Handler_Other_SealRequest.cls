public with sharing class COA_Handler_Other_SealRequest {
	
	public static void addApproversForNewRFAs(List<RFA__c> listNewRFAs) {
		
		List<RFAUserRole__c> listRFAApproverToInsert = new List<RFAUserRole__c>();
		
		for(RFA__c rfa : listNewRFAs) {
			
			//IT Support Shared User
			RFAUserRole__c approver1 = new RFAUserRole__c();
			approver1.UserName__c = Label.Seal_Second_To_Final_Approver_of_CCEJ_Company; //'005N0000000tPNB';
			approver1.RFA__c = rfa.Id;						
			approver1.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
				RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver); //'01210000000QsJj';
			approver1.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Seal;
			//approver.ApprovalOrder__c = appprover_order;
			listRFAApproverToInsert.add(approver1);
			
			/*
				if Seal Name CCEJ Company Check or Seal Name CCEJ Function Check is checked, select Kawamoto-san,
				all other cases, select Nakano-san
			*/
			if(rfa.Seal_Name_CCEJ_Company_Check__c == true || rfa.Seal_Name_CCEJ_Function_Check__c == true) {
				//川本　成彦       Kawamoto Naruhiko 00510000001rhvJ
				RFAUserRole__c approver2 = new RFAUserRole__c();
				approver2.UserName__c = Label.Seal_Final_Approver_of_CCEJ_Company; //'00510000001rhvJ';
				approver2.RFA__c = rfa.Id;						
				approver2.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver2.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Seal;
				//approver.ApprovalOrder__c = appprover_order;
				listRFAApproverToInsert.add(approver2);				
			} else {
				//Nakano Toshio 中野 宗夫 00510000001rhvi
				RFAUserRole__c approver2 = new RFAUserRole__c();
				approver2.UserName__c = Label.Seal_Final_Approver_of_Sub_Company; //'00510000001rhvi';
				approver2.RFA__c = rfa.Id;						
				approver2.RecordTypeId = Utility_Helper_RecordType.mapRFAUserRoleRecordTypeAPINameToIds.get(
					RFA_Utility_Constants.RFAUserRole_RTAPIName_Approver);
				approver2.Approver_Source__c = RFA_Utility_Constants.Approver_Source_Seal;
				//approver.ApprovalOrder__c = appprover_order;
				listRFAApproverToInsert.add(approver2);					
			}
			
		}
		
		if(listRFAApproverToInsert != null && listRFAApproverToInsert.size() > 0) {
			insert listRFAApproverToInsert;
		}
	}
	

}