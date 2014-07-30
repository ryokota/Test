/*
http://wiki.developerforce.com/page/Wrapper_Class
*/
public without sharing class BOD_VFCtrl_SendingAgendaController {
    
    public boolean hasError {get; private set;}
    
    public BOD_Meeting__c objBODMeeting {get; set;}
    
    public List<Agenda_Item__c> listAgendaItems {get; set;}
    
    public List<Agenda_Item__c> listAgendaItemsToBeReported {get; set;}
    
    public String strToList;
    public String strCCList;
    
    public String[] strArrToAddresses = new String[]{};
    public String[] strArrCcAddresses = new String[]{};
    
    ID idBODMemberRT;   
    ID idBODAdminRT;
    ID idBODSecretaryRT;
    ID idBODGuestRT;
    
    public BOD_VFCtrl_SendingAgendaController(ApexPages.StandardController controller) {
        
        objBODMeeting = (BOD_Meeting__c)controller.getRecord(); 
 
        objBODMeeting = [Select Id, OwnerId, 
        	Name, Name_JP__c, Addition_EN__c, Addition_JP__c,
        	Type__c, Start_Time__c, 
            Venue__c, Venue_JP__c, Meeting_Description__c,
            Comment_In_Email__c, Email_Comment_JP__c, 
            Header_Email_Comment_EN__c, 
            Header_Email_Comment_JP__c		 
            from BOD_Meeting__c where Id =: objBODMeeting.Id];
        
        listAgendaItems = [Select Id, Name, Finished_for_Email__c, 
            Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c,
            Document_Language__c,
            Order_To_Be_Reported__c, Order_To_Be_Resolved__c,
            (Select Id, Name, Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c, Document_Language__c 
            	from Agenda_Item__r order by CreatedDate Desc limit 1) 
            from Agenda_Item__c 
            where BOD_Meeting__c =: objBODMeeting.Id 
                and Agenda_Item_Type__c =: BOD_Constants.AgendaItemType_ToBeResolved //'Proposal to be Resolved'
                and Related_Agenda_Item__c = null
            order by CreatedDate asc
            ];
            
        listAgendaItemsToBeReported = [Select Id, Name, Finished_for_Email__c, 
            Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c,
            Document_Language__c, 
            Order_To_Be_Reported__c, Order_To_Be_Resolved__c, 
            (Select Id, Name, Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c, Document_Language__c 
            	from Agenda_Item__r order by CreatedDate Desc limit 1) 
            from Agenda_Item__c 
            where BOD_Meeting__c =: objBODMeeting.Id 
                and Agenda_Item_Type__c =: BOD_Constants.AgendaItemType_ToBeReported //'Item to be Reported'
                and Related_Agenda_Item__c = null
            order by CreatedDate asc
            ];          
            
        idBODMemberRT = BOD_Utility.getRecordType(BOD_Constants.BODMembersRT_BODMember_DevName, BOD_Constants.BODMembersObj_APIName); //('BOD_Member', 'BOD_Members__c');
        idBODAdminRT = BOD_Utility.getRecordType(BOD_Constants.BODMembersRT_BODAdmin_DevName, BOD_Constants.BODMembersObj_APIName); //('Admin_of_BOD', 'BOD_Members__c');  
        idBODSecretaryRT = BOD_Utility.getRecordType(BOD_Constants.BODMembersRT_BODSecretary_DevName, BOD_Constants.BODMembersObj_APIName); //('Secretary_of_BOD', 'BOD_Members__c');       
        idBODGuestRT = BOD_Utility.getRecordType(BOD_Constants.BODMembersRT_BODGuest_DevName, BOD_Constants.BODMembersObj_APIName); //('BOD_Guest', 'BOD_Members__c'); 
    }  
    

    public PageReference cancel() {
        return new pageReference('/' + objBODMeeting.Id);
    }

    public PageReference save() {
        
        update listAgendaItems;
        update listAgendaItemsToBeReported;
                
        //return new PageReference('javascript:window.close()'); 
        return new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/' + objBODMeeting.Id);
    }       
    
    public PageReference sendAgendaByEmail() {
        
        update listAgendaItems;
        update listAgendaItemsToBeReported;
        
        sendEmail_AgendaList();
        
		insertEmailLog();
        
        //return new PageReference('javascript:window.close()'); 
        return new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/' + objBODMeeting.Id);
    }
    
    public void insertEmailLog() {
        BOD_Email_Log__c objEmailLog = new BOD_Email_Log__c();
        objEmailLog.BOD_Meeting__c = objBODMeeting.Id;
        objEmailLog.Sender__c = Userinfo.getUserId();
        objEmailLog.Send_By__c = System.now();
              
        objEmailLog.To_List__c = strToList;
        objEmailLog.CC_List__c = strCCList;
        
        objEmailLog.Name_EN__c = objBODMeeting.Name;
        objEmailLog.Name_JP__c = objBODMeeting.Name_JP__c;
        objEmailLog.Addition_EN__c = objBODMeeting.Addition_EN__c;
        objEmailLog.Addition_JP__c = objBODMeeting.Addition_JP__c;
        
        objEmailLog.Type__c = objBODMeeting.Type__c;
        objEmailLog.Start_Time__c = objBODMeeting.Start_Time__c;
        objEmailLog.Venue__c = objBODMeeting.Venue__c;   
        objEmailLog.Venue_JP__c = objBODMeeting.Venue_JP__c;   
        objEmailLog.Meeting_Description__c = objBODMeeting.Meeting_Description__c;
        
        objEmailLog.Header_Email_Comment_EN__c = objBODMeeting.Header_Email_Comment_EN__c;
        objEmailLog.Header_Email_Comment_JP__c = objBODMeeting.Header_Email_Comment_JP__c;
        objEmailLog.Footer_Email_Comment_EN__c = objBODMeeting.Comment_In_Email__c;
        objEmailLog.Footer_Email_Comment_JP__c = objBODMeeting.Email_Comment_JP__c;
        
        insert objEmailLog;    	
    }
    
    public PageReference sendAgendaByEmail_OnlyToAdmins() {
        
        update listAgendaItems;
        update listAgendaItemsToBeReported;
        
        sendEmail_AgendaList_OnlyToAdmins();
        
		insertEmailLog();
        
        //return new PageReference('javascript:window.close()'); 
        return new pageReference(URL.getSalesforceBaseUrl().toExternalForm() + '/' + objBODMeeting.Id);
    }    

    public void sendEmail_AgendaList() {   
    	       
        Set<Id> setReceiverIds = new Set<Id>();
        
        integer intCountMember = 0;
        integer intCountAdmin = 0;
        integer intCountSecretary = 0;
        integer intCountGuest = 0;
        
        for(BOD_Members__c member : [Select Id, Username__c, Username__r.Name, Username__r.Email, RecordTypeId 
            from BOD_Members__c where BOD_Meeting__c =: objBODMeeting.Id]
        ) {
            
            if(member.RecordTypeId == idBODMemberRT) {
            	intCountMember++;
            	strArrToAddresses.add(member.Username__r.Email);
            	
                if(strToList == null) {
                    strToList = member.Username__r.Name;
                } else {
                    strToList = strToList + ', ' + member.Username__r.Name;
                }
            } else {
            	
            	strArrCcAddresses.add(member.Username__r.Email);
            	
                if(strCCList == null) {
                    strCCList = member.Username__r.Name;
                } else {
                    strCCList = strCCList + ', ' + member.Username__r.Name;
                }
                
                //count for email member type
                if(member.RecordTypeId == idBODAdminRT) {
                	intCountAdmin++;
                } else if (member.RecordTypeId == idBODSecretaryRT) {
                	intCountSecretary++;
                } else if (member.RecordTypeId == idBODGuestRT) {
                	intCountGuest++;
                }
                
            }
            
            setReceiverIds.add(member.Username__c);            
                                    
        }//end of for(members);       
        system.debug('---------- setReceiverIds: ' + setReceiverIds);   
        system.debug('---------- setReceiverIds size() : ' + setReceiverIds.size());  
        
        system.debug('---------- intCountMember: ' + intCountMember); 
        system.debug('---------- intCountAdmin: ' + intCountAdmin); 
        system.debug('---------- intCountSecretary: ' + intCountSecretary); 
        system.debug('---------- intCountGuest: ' + intCountGuest); 
        
        
        
        //or OwnerId?
        setReceiverIds.add(Userinfo.getUserId());
        //setReceiverIds.add(objBODMeeting.OwnerId);        
        
        /*
        	Since Secretary will not be included as a Member for each BOD Meeting, 
        	have to add it from Public group.
        */
        /*
        ID PublicGroupId_BODSecretary = BOD_Utility.getPuglicGroupId( BOD_Constants.PublicGroupName_BODSecretary );
        Set<Id> setBODSecretaryUserIds = BOD_Utility.getBODGroupMembersOfUsers(PublicGroupId_BODSecretary);
        system.debug('------ PublicGroupId_BODSecretary: ' + PublicGroupId_BODSecretary);
        system.debug('------ setBODSecretaryUserIds size: ' + setBODSecretaryUserIds.size());
        
        if(setBODSecretaryUserIds != null && setBODSecretaryUserIds.size() > 0) {
        	for(User aSecretary : [
        		Select Id, Name, Username, Email, isActive from User 
        			where Id IN: setBODSecretaryUserIds and isActive = true and BOD__c = true ] ) { //limit 1

            	strArrCcAddresses.add(aSecretary.Email);
            	
            	intCountSecretary++;
            	
                if(strCCList == null) {
                    strCCList = aSecretary.Name;
                } else {
                    strCCList = strCCList + ', ' + aSecretary.Name;
                }
        		setReceiverIds.add(aSecretary.Id);
        	}//end of for;
        }//end of if;
        
        system.debug('----------- intCountSecretary: ' + intCountSecretary);
        */
             
        
        sendEmailWithContent(setReceiverIds);
    }//end of sendEmail_AgendaList();
    
    public void sendEmail_AgendaList_OnlyToAdmins() {   
    	system.debug('--------- sendEmail_AgendaList_OnlyToAdmins()');       
        Set<Id> setReceiverIds = new Set<Id>();
        
        for(BOD_Members__c member : [Select Id, Username__c, Username__r.Name, Username__r.Email, RecordTypeId 
            from BOD_Members__c where BOD_Meeting__c =: objBODMeeting.Id and RecordTypeId =: idBODAdminRT]
        ) {
        	strArrToAddresses.add(member.Username__r.Email);
        	
        	if(strToList == null) {
        		strToList = member.Username__r.Name;
            } else {
            	strToList = strToList + ', ' + member.Username__r.Name;
            }
           
            setReceiverIds.add(member.Username__c);
            
            //or OwnerId?
            setReceiverIds.add(Userinfo.getUserId());
            //setReceiverIds.add(objBODMeeting.OwnerId);                     
            
        }//end of for(members);       
        system.debug('---------- setReceiverIds: ' + setReceiverIds);    
        
        sendEmailWithContent(setReceiverIds);    
    }    
    
    public void sendEmailWithContent(Set<Id> setReceiverIds) {
    	
        String strEmailSubject = objBODMeeting.Name + ' ' + BOD_Utility.processNullString(objBODMeeting.Addition_EN__c) 
        	+ ' / ' + BOD_Utility.processNullString(objBODMeeting.Name_JP__c) + ' ' + BOD_Utility.processNullString(objBODMeeting.Addition_JP__c);
               
        system.debug('----- Email Subject: ' + strEmailSubject);    	
        
        String strHTMLToBeResolved = ' ';
        String strHTMLToBeResolved_JP = ' ';
        String strHTMLToBeReported = ' ';
        String strHTMLToBeReported_JP = ' ';
        
        listAgendaItems = [Select Id, Name, Finished_for_Email__c, 
            Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c,
            Document_Language__c,
            Order_To_Be_Reported__c, Order_To_Be_Resolved__c,
            (Select Id, Name, Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c, Document_Language__c 
            	from Agenda_Item__r order by CreatedDate Desc limit 1) 
            from Agenda_Item__c 
            where BOD_Meeting__c =: objBODMeeting.Id 
                and Agenda_Item_Type__c =: BOD_Constants.AgendaItemType_ToBeResolved  //'Proposal to be Resolved'
                and Related_Agenda_Item__c = null
                and Finished_for_Email__c = true
			order by Order_To_Be_Resolved__c asc
            ];
            
        listAgendaItemsToBeReported = [Select Id, Name, Finished_for_Email__c, 
            Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c,
            Document_Language__c, 
            Order_To_Be_Reported__c, Order_To_Be_Resolved__c, 
            (Select Id, Name, Agenda_Item_Type__c, Description__c, Document_Title__c, Version_Count__c, Document_Language__c 
            	from Agenda_Item__r order by CreatedDate Desc limit 1) 
            from Agenda_Item__c 
            where BOD_Meeting__c =: objBODMeeting.Id 
                and Agenda_Item_Type__c =: BOD_Constants.AgendaItemType_ToBeReported //'Item to be Reported'
                and Related_Agenda_Item__c = null
                and Finished_for_Email__c = true
			order by Order_To_Be_Reported__c asc
            ];           
        
        for(Agenda_Item__c item : listAgendaItems) {
            if(item.Document_Title__c != null && item.Version_Count__c > 0) {
                strHTMLToBeResolved = strHTMLToBeResolved + '<li>' 
                + '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + item.Id + '">' + item.Name + '</a>'
                + ' - ' + item.Document_Title__c + '</li>' + '</br>';
            } else {
                strHTMLToBeResolved = strHTMLToBeResolved + '<li>' 
                + '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + item.Id + '">' + item.Name + '</a>'
                + ' - ' + '</li>' + '</br>';
            }
            
            list<Agenda_Item__c> listChildItems = item.Agenda_Item__r;
            if(listChildItems != null && listChildItems.size() > 0) {
            	if(listChildItems[0].Document_Title__c != null && listChildItems[0].Version_Count__c > 0) {
                	strHTMLToBeResolved_JP = strHTMLToBeResolved_JP + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + listChildItems[0].Id + '">' + listChildItems[0].Name + '</a>'
                	+ ' - ' + listChildItems[0].Document_Title__c + '</li>' + '</br>';
            	} else {
                	strHTMLToBeResolved_JP = strHTMLToBeResolved_JP + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + listChildItems[0].Id + '">' + listChildItems[0].Name + '</a>'
                	+ ' - ' + '</li>' + '</br>';
            	}
            } else {
            	    strHTMLToBeResolved_JP = strHTMLToBeResolved_JP + '<li>' + ' - ' + '</li>' + '</br>';
            }
        }
        
         for(Agenda_Item__c item : listAgendaItemsToBeReported) {
            if(item.Document_Title__c != null && item.Version_Count__c > 0) {
                strHTMLToBeReported = strHTMLToBeReported + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + item.Id + '">' + item.Name + '</a>'
                	+ ' - ' + item.Document_Title__c + '</li>' + '</br>';                                
            } else {
                strHTMLToBeReported = strHTMLToBeReported + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + item.Id + '">' + item.Name + '</a>'
                	+ ' - ' + '</li>' + '</br>';
            }  
            
            list<Agenda_Item__c> listChildItems = item.Agenda_Item__r;
            if(listChildItems != null && listChildItems.size() > 0) {
            	if(listChildItems[0].Document_Title__c != null && listChildItems[0].Version_Count__c > 0) {
                	strHTMLToBeReported_JP = strHTMLToBeReported_JP + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + listChildItems[0].Id + '">' + listChildItems[0].Name + '</a>'
                	+ ' - ' + listChildItems[0].Document_Title__c + '</li>' + '</br>';
            	} else {
                	strHTMLToBeReported_JP = strHTMLToBeReported_JP + '<li>' 
                	+ '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + listChildItems[0].Id + '">' + listChildItems[0].Name + '</a>'
                	+ ' - ' + '</li>' + '</br>';
            	}
            }  else {
            	    strHTMLToBeReported_JP = strHTMLToBeReported_JP + '<li>' + ' - ' + '</li>' + '</br>';
            }           
                 
        }       
        
        String strHtmlBody = BOD_Util_Email.getHtmlBody_AgendaList(
            strEmailSubject, 
            strHTMLToBeResolved, 
            strHTMLToBeReported, 
            strHTMLToBeResolved_JP, 
            strHTMLToBeReported_JP, 
            objBODMeeting
        );    
        
                
        sendSingleEmailMessageEmail(setReceiverIds, strEmailSubject, strHtmlBody);                                           
    }


    public void sendSingleEmailMessageEmail(
        Set<Id> userIds,
        String strEmailSubject, 
        String strHtmlBody//,
        //String strToAddresses,
        //String strCcAddresses
        )
    {         
    	system.debug('----------- sendSingleEmailMessageEmail() ');
    	system.debug('----------- user ids: ' + userIds.size());
    	system.debug('----------- to size: ' + strArrToAddresses.size());
    	system.debug('----------- to addresses: ' + strArrToAddresses);
    	
    	system.debug('----------- cc size: ' + strArrCcAddresses.size());
    	system.debug('----------- cc addresses: ' + strArrCcAddresses);
    	
    	System.debug('You have made ' + Limits.getEmailInvocations() + ' email calls out of ' + Limits.getLimitEmailInvocations() + ' allowed');
    	
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        if(userIds != null && userIds.size() > 0) {
            for(Id userId : userIds) {
                Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
                mail.setSubject(strEmailSubject);
                mail.setHtmlBody(strHtmlBody);
                mail.setTargetObjectId(userId);
                //mail.setToAddresses(strArrToAddresses);
                //mail.setCcAddresses(strArrCcAddresses);
                mail.saveAsActivity = false;
                //mail.orgWideEmailAddressId = idOrgWideEmailAddress; 
                mail.setCharset('UTF-8');     
                mails.add(mail);
            }
        }               
        
        //https://www.salesforce.com/us/developer/docs/apexcode/Content/apex_forcecom_email_outbound.htm
        //try{
        	List<Messaging.SendEmailResult> instSendEmailResult = Messaging.sendEmail(mails, true);  //optAllOrNone  
        //} catch(Messaging.SendEmailError error) {
        	
        //}       
    }







}