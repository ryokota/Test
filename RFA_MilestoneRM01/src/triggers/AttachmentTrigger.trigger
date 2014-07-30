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
	}
	
	
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
		
	}		
		

	if(trigger.isAfter && trigger.isUnDelete) {
		
		User runningUser = [Select Id, BOD__c from User where id =: Userinfo.getUserId()];
		for(Attachment aAttachment : Trigger.new) {
			//only check on Agenda Item custom object
			if(!runningUser.BOD__c && String.valueOf(aAttachment.ParentId).startsWith('a0h')) {
				aAttachment.addError(Label.BOD_Trigger_Info_BODUser);
			}
		}		
		
	}		

}