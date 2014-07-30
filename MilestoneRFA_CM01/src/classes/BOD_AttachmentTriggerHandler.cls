public without sharing class BOD_AttachmentTriggerHandler {
	
	
	/*
		Before & Insert Trigger
	*/
	
	//should be before insert && should be only on Agenda Item object
	//should check the Approval Status first and in before insert !!! 
	//anoter afer insert action, like set up file count will call error from Agenda Item trigger
	public void checkApprovalStatusOnAgendaItem(List<Attachment> listNewAttachments) {
		Map<Id, Id> mapAttachmentIdToAgendaItemId = new Map<Id, Id>();
		//check it on AgendaItem Object
		for(Attachment att : listNewAttachments) {
			if(String.valueOf(att.ParentId).startsWith('a0h')) {
				mapAttachmentIdToAgendaItemId.put(att.Id, att.ParentId);
			}
		}
		
		Set<Id> setTargetedAgendaItemIds = new Set<Id>();
		
		//for English agenda		
		for(Agenda_Item__c aAgenda : [Select Id, Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapAttachmentIdToAgendaItemId.values()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_English
				and Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setTargetedAgendaItemIds.add(aAgenda.Id);
		}
		
		//for Japanese agenda
		for(Agenda_Item__c aAgenda : [Select Id, Related_Agenda_Item__r.Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapAttachmentIdToAgendaItemId.values()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_Japanese
				and Related_Agenda_Item__r.Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setTargetedAgendaItemIds.add(aAgenda.Id);
		}						
		
		for(Attachment att : listNewAttachments) {
			Id idAgendaItem = mapAttachmentIdToAgendaItemId.get(att.Id);
			if(setTargetedAgendaItemIds.contains(idAgendaItem)) {
				att.addError(Label.BOD_TriggerMsg_Attachment_No_Upload_In_Approval); 
				//('Attachment cannot be uploaded on Agenda Item in Approval Process !');
			}
		}		
	}
	
	/*
		After & Insert Trigger
	*/
		
	//after insert
	public void processVersionCountOnInsert(List<Attachment> attachments) {
		Map<Id, Integer> mapAttachIdToVerCount = new Map<Id, Integer>();
		
		for(Attachment aAttachment : attachments) {
			//only process Attachment on Agenda Item
			if(String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				if(mapAttachIdToVerCount.containsKey(aAttachment.ParentId)) {
					mapAttachIdToVerCount.put(aAttachment.ParentId, (mapAttachIdToVerCount.get(aAttachment.ParentId) + 1));
				} else {
					mapAttachIdToVerCount.put(aAttachment.ParentId, 1);
				}
			}//check for Agenda Item
			
		}//for attachments
		
		List<Agenda_Item__c> listAgendaItemsForUpdate = new List<Agenda_Item__c>();
		
		for(Agenda_Item__c agentItem : [Select Id, Version_Count__c from Agenda_Item__c where Id IN: mapAttachIdToVerCount.keySet()]) {
			
			if(agentItem.Version_Count__c == null || agentItem.Version_Count__c == 0) {
				agentItem.Version_Count__c = mapAttachIdToVerCount.get(agentItem.Id);
				listAgendaItemsForUpdate.add(agentItem);
			} else {
				agentItem.Version_Count__c = agentItem.Version_Count__c + mapAttachIdToVerCount.get(agentItem.Id);
				listAgendaItemsForUpdate.add(agentItem);
			}

		}
		
		if(listAgendaItemsForUpdate != null && listAgendaItemsForUpdate.size() > 0) {
			try{
				update listAgendaItemsForUpdate;
			} catch(DMLException e) {
				for(Agenda_Item__c agenda : listAgendaItemsForUpdate) {
					agenda.addError( e ); //String.valueOf(e)
					//for(integer i = 0; i < e.getNumDml(); i++) {
						//agenda.addError(e.e.getDmlMessage[i]);
					//}
				}
			}
		}
		
	}//end of Method;


	//for after insert
	public void setDocumentTitle(List<Attachment> attachments) {
		Map<Id, String> mapAgendaIdToDocTitle = new Map<Id, String>();
		
		for(Attachment aAttachment : attachments) {
			//only process Attachment on Agenda Item
			if(String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				mapAgendaIdToDocTitle.put(aAttachment.ParentId, aAttachment.Name);
			}//check for Agenda Item
			
		}//for attachments		
		
		
		List<Agenda_Item__c> listAgendaItemsForUpdate = new List<Agenda_Item__c>();
		
		for(Agenda_Item__c aAgendaItem : [Select Id, Document_Title__c from Agenda_Item__c where Id IN: mapAgendaIdToDocTitle.keySet()]) {
			
			aAgendaItem.Document_Title__c = mapAgendaIdToDocTitle.get(aAgendaItem.Id);
			listAgendaItemsForUpdate.add(aAgendaItem);			

		}
		
		if(listAgendaItemsForUpdate != null && listAgendaItemsForUpdate.size() > 0) {
			update listAgendaItemsForUpdate;
		}							
		
	}
	
	//@future (callout=true)
	//public static void uploadFilesToHeroku(Set<Id> setNewAttIds) {		
	//}


	/*
		Before & Delete Trigger
	*/
	public void checkApprovalStatusOnDeleteAttachment(List<Attachment> listAttachments) {
		Map<Id, Id> mapAttachmentIdToAgendaItemId = new Map<Id, Id>();
		//check it on AgendaItem Object
		for(Attachment att : listAttachments) {
			if(String.valueOf(att.ParentId).startsWith('a0h')) {
				mapAttachmentIdToAgendaItemId.put(att.Id, att.ParentId);
			}
		}
		
		Set<Id> setTargetedAgendaItemIds = new Set<Id>();
		
		//for English agenda		
		for(Agenda_Item__c aAgenda : [Select Id, Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapAttachmentIdToAgendaItemId.values()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_English
				and Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setTargetedAgendaItemIds.add(aAgenda.Id);
		}
		
		//for Japanese agenda
		for(Agenda_Item__c aAgenda : [Select Id, Related_Agenda_Item__r.Approval_Status__c, Document_Language__c 
			from Agenda_Item__c where 
				Id IN: mapAttachmentIdToAgendaItemId.values()
				and Document_Language__c =: BOD_Constants.AgendaItem_DocLang_Japanese
				and Related_Agenda_Item__r.Approval_Status__c IN: BOD_Constants.AgendaItem_Status_In_Approval
			]) {
			setTargetedAgendaItemIds.add(aAgenda.Id);
		}						
		
		for(Attachment att : listAttachments) {
			Id idAgendaItem = mapAttachmentIdToAgendaItemId.get(att.Id);
			if(setTargetedAgendaItemIds.contains(idAgendaItem)) {
				att.addError(Label.BOD_TriggerMsg_Attachment_No_Del_In_Approval); 
				//('Attachment cannot be deleted on Agenda Item in Approval Process !');
			}
		}		
	}	
	
	


	/*
		After & Delete Trigger
	*/

	//after delete
	public void processVersionCountOnDelete(List<Attachment> attachments) {
		Map<Id, Integer> mapAttachIdToVerCount = new Map<Id, Integer>();
		
		for(Attachment aAttachment : attachments) {
			//only process Attachment on Agenda Item
			if(String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				if(mapAttachIdToVerCount.containsKey(aAttachment.ParentId)) {
					mapAttachIdToVerCount.put(aAttachment.ParentId, (mapAttachIdToVerCount.get(aAttachment.ParentId) + 1));
				} else {
					mapAttachIdToVerCount.put(aAttachment.ParentId, 1);
				}
			}//check for Agenda Item
			
		}//for attachments
		
		List<Agenda_Item__c> listAgendaItemsForUpdate = new List<Agenda_Item__c>();
		
		for(Agenda_Item__c agentItem : [Select Id, Version_Count__c from Agenda_Item__c where Id IN: mapAttachIdToVerCount.keySet()]) {
			
			if(agentItem.Version_Count__c > 0) {
				agentItem.Version_Count__c = agentItem.Version_Count__c - mapAttachIdToVerCount.get(agentItem.Id);
				listAgendaItemsForUpdate.add(agentItem);
			} 

		}
		
		if(listAgendaItemsForUpdate != null && listAgendaItemsForUpdate.size() > 0) {
			update listAgendaItemsForUpdate;
		}		
	}


	
	//after delete trigger
	public void setDocumentTitleOnDelete(List<Attachment> attachments) {
		
		//Agenda Item Id (Parent Id)  ---> Deleted Attachment Names
		Map<Id, Set<String>> mapAgendaIdToAttachName = new Map<Id, Set<String>>();
		
		
		for(Attachment aAttachment : attachments) {
			//only process Attachment on Agenda Item
			if(String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				
				if(mapAgendaIdToAttachName.containsKey(aAttachment.ParentId)) {
					mapAgendaIdToAttachName.get(aAttachment.ParentId).add(aAttachment.Name);
				} else {
					mapAgendaIdToAttachName.put(aAttachment.ParentId, new Set<String>{aAttachment.Name});
				}
				
			}//check for Agenda Item
			
		}//for attachments		
		
		
		List<Agenda_Item__c> listAgendaItemsForUpdate = new List<Agenda_Item__c>();
		
		for(Agenda_Item__c aAgendaItem : [Select Id, Document_Title__c,
			(Select Id, Name from Attachments Order By CreatedDate Desc limit 1) 
			from Agenda_Item__c where Id IN: mapAgendaIdToAttachName.keySet()]) {
				
			list<Attachment> listAttachs = 	aAgendaItem.Attachments;
			
			if(listAttachs == null || listAttachs.size() == 0) {
				aAgendaItem.Document_Title__c = null;
				
				listAgendaItemsForUpdate.add(aAgendaItem);
			} else {
				//if latest version was deleted, update the attachment name on Parent
				for(String strDeletedAttachName : mapAgendaIdToAttachName.get(aAgendaItem.Id) ) {
					if(strDeletedAttachName == aAgendaItem.Document_Title__c) {
						aAgendaItem.Document_Title__c = listAttachs[0].Name;
						listAgendaItemsForUpdate.add(aAgendaItem);
						break;
					}
				}//end of for;
				
				
				
			}//end of if-else;	
			
		}
		
				
		if(listAgendaItemsForUpdate != null && listAgendaItemsForUpdate.size() > 0) {
			update listAgendaItemsForUpdate;
		}							
		
	}	



}