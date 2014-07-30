trigger AttachmentTrigger on Attachment (
	before insert, after insert, 
	before update, after update, 
	before delete, after delete,
	after undelete
) {
	
	BOD_AttachmentTriggerHandler instTriggerHandler = new BOD_AttachmentTriggerHandler();
	
	if(trigger.isBefore && trigger.isInsert) {
		
		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		for(Attachment aAttachment : Trigger.new) {
			//only check on Agenda Item custom object
			if(!runningUser.BOD__c && String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				aAttachment.addError(Label.BOD_Trigger_Info_BODUser);
			}
		}
		
		//this function is diabled, since BOD Admin want to replace the attachment even in approval process
		//check only working on AgendaItem Object
		//can not upload attachment to Agenda Item (Eng + Jpn) on Approval 
		//instTriggerHandler.checkApprovalStatusOnAgendaItem(trigger.new);		
		
	}
	
	if(trigger.isAfter && trigger.isInsert) {
		
		system.debug('----------- AttachmentTrigger:  if(trigger.isAfter && trigger.isInsert) {} ');				
		
		for(Attachment aAttachment : Trigger.new) {
			//only check Agenda Item custom object
			if(aAttachment.ContentType != 'application/pdf' 
				&& (
					String.valueOf(aAttachment.ParentId).startsWith('a0h') 
					|| String.valueOf(aAttachment.ParentId).startsWith('a0j') //only for BODDev Sandbox
					|| String.valueOf(aAttachment.ParentId).startsWith('a0k') 
				)
			) {
					
				aAttachment.addError(Label.BOD_Trigger_Info_PDFFormat);
			}
		}
		system.debug('--------- Trigger.new: ' + trigger.new);
				
		instTriggerHandler.processVersionCountOnInsert(Trigger.new);
		
		instTriggerHandler.setDocumentTitle(Trigger.new);
		
		/*
			Passing the new uploaded Attachment Ids to Heroku
		*/
		Set<Id> setNewAttIdsForHeroku = new Set<Id>();
		
		for(Attachment aAttachment : Trigger.new) {
			//only check Agenda Item / BOD Meeting custom object
			if(
				aAttachment.ContentType == 'application/pdf' 
				&& (
					String.valueOf(aAttachment.ParentId).startsWith('a0h') 
					|| String.valueOf(aAttachment.ParentId).startsWith('a0j') //only for BODDev Sandbox
					|| String.valueOf(aAttachment.ParentId).startsWith('a0k') 
				)
			) {					
				setNewAttIdsForHeroku.add(aAttachment.Id);				
			}
		}
		
		if(setNewAttIdsForHeroku != null && setNewAttIdsForHeroku.size() > 0) {
			
			if(Label.BOD_Upload_Attachment_To_Heroku_In_Production == 'Yes' 
				&& BOD_Utility.isProduction()) {
					
				//BOD_ApexCallHeroku.uploadAttachmentsToHeroku(setNewAttIdsForHeroku);
				BOD_ApexCallHeroku.passAttachmentIdsToHeroku(setNewAttIdsForHeroku);
				
			} else if(Label.BOD_Upload_Attachment_To_Heroku_In_Sandbox == 'Yes' 
				&& BOD_Utility.isSandbox()) {
					
				BOD_ApexCallHeroku.passAttachmentIdsToHeroku(setNewAttIdsForHeroku);
			}
		}//end of if();
		
	}//end of if(trigger.isAfter && trigger.isInsert);
	
	
	if(trigger.isBefore && trigger.isUpdate) {

		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		for(Attachment aAttachment : Trigger.new) {
			//only check on Agenda Item custom object
			if(!runningUser.BOD__c && String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				aAttachment.addError(Label.BOD_Trigger_Info_BODUser);
			}
		}
		
	}
	
	if(trigger.isAfter && trigger.isUpdate) {
		instTriggerHandler.setDocumentTitle(Trigger.new);
	}	
	

	if(trigger.isBefore && trigger.isDelete) {
		
		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		for(Attachment aAttachment : Trigger.old) {
			//only check on Agenda Item custom object
			if(!runningUser.BOD__c && String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				aAttachment.addError(Label.BOD_Trigger_Info_BODUser);
			}
		}
		
		//removed
		//instTriggerHandler.checkApprovalStatusOnDeleteAttachment(trigger.old);
		
	}
	
	if(trigger.isAfter && trigger.isDelete) {
		
		instTriggerHandler.processVersionCountOnDelete(Trigger.old);		
		
		instTriggerHandler.setDocumentTitleOnDelete(Trigger.old);
		
		/*
			Passing the Deleted Attachment Ids to Heroku
		*/
		Set<Id> setDeletedAttIdsForHeroku = new Set<Id>();
		
		for(Attachment aAttachment : Trigger.old) {
			//only check Agenda Item / BOD Meeting custom object
			if(
				aAttachment.ContentType == 'application/pdf' 
				&& (
					String.valueOf(aAttachment.ParentId).startsWith('a0h') 
					|| String.valueOf(aAttachment.ParentId).startsWith('a0j') //only for BODDev Sandbox
					|| String.valueOf(aAttachment.ParentId).startsWith('a0k') 
				)
			) {					
				setDeletedAttIdsForHeroku.add(aAttachment.Id);				
			}
		}
		
		if(setDeletedAttIdsForHeroku != null && setDeletedAttIdsForHeroku.size() > 0) {
								
			BOD_ApexCallHeroku.passDeletedAttachmentIdsToHeroku(setDeletedAttIdsForHeroku);

		}//end of if();						
		
	}// end of After & Delete		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		for(Attachment aAttachment : Trigger.new) {
			//only check on Agenda Item custom object
			if(!runningUser.BOD__c && String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				aAttachment.addError(Label.BOD_Trigger_Info_BODUser);
			}
		}//end of for();
		
		
		
		/*
			Passing the undeleted Attachment Ids to Heroku
		*/
		Set<Id> setUnDeletedAttIdsForHeroku = new Set<Id>();
		
		for(Attachment aAttachment : Trigger.new) {
			//only check Agenda Item / BOD Meeting custom object
			if(
				aAttachment.ContentType == 'application/pdf' 
				&& (
					String.valueOf(aAttachment.ParentId).startsWith('a0h') 
					|| String.valueOf(aAttachment.ParentId).startsWith('a0j') //only for BODDev Sandbox
					|| String.valueOf(aAttachment.ParentId).startsWith('a0k') 
				)
			) {					
				setUnDeletedAttIdsForHeroku.add(aAttachment.Id);				
			}
		}
		
		if(setUnDeletedAttIdsForHeroku != null && setUnDeletedAttIdsForHeroku.size() > 0) {
								
			BOD_ApexCallHeroku.passUnDeletedAttachmentIdsToHeroku(setUnDeletedAttIdsForHeroku);

		}//end of if();		
		
		
		
		
				
		
	}//end of After & Undelete		

}