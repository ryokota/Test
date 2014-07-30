public without sharing class BOD_Util_Email {
		
 	public static String getHtmlBody_AgendaList(
 		String strEmailSubject, 
 		String strHTMLToBeResolved, 
 		String strHTMLToBeReported, 
 		String strHTMLToBeResolved_JP, 
 		String strHTMLToBeReported_JP, 
 		BOD_Meeting__c objBODMeeting 
 	) { 						
 		//Date inst = System.Today();
		//system.debug(' -- Month: ' + inst.Month() + '  Day: ' +  inst.Day() + ' --- Year: ' + inst.Year());
		
 		String strHtmlBody =
 		  '<html>' +
 		    '<head>' +
        		//'<style type="text/css"> body {font-family: "Arial Unicode MS";}</style>' +
            '</head>' +
            '<body >' + //style = "font-family: Arial Unicode MS;"
              //'<div style = "font-size:12px;max-width:600px;"' + 
              '<div style = "font-size:14px;"' + //font-family:Arial Unicode MS;
                //'<p>' +                 
                //    '<img src="' + Label.RFA_CL129 + '" align="middle" alt="logo">' + 
                //'</p>' + 
                
                //'<p style="font-weight:bold"><h1>Agenda for the Board of Directors Meeting</h1></p>' + 
                
                //'<BR/>' + 
                
				//<br/>
                //'TO : ' + ppocNameList + '<br/>' +            
                //'CC : ' + ccNameList + '</p><br/>' +
                
                //'<p><In English></p>' +                 
                                              
                '<p>Dear CCEJ BOD Members and Auditors, </p>' + 
                
                '<p>I hereby announce that the CCEJ Board of Directors Meeting will be held as below.</p>' +
                
                BOD_Utility.processNullString(objBODMeeting.Header_Email_Comment_EN__c) +	
                
                '<p>&nbsp;&nbsp; Meeting Name : ' + objBODMeeting.Name + '<br/>' + 
                //'<p>Time & Date (日付) : ' + inst.Month() + '/' + inst.Day() + '/' + inst.Year() + '<br/>' + 
                '&nbsp;&nbsp; Time & Date : ' + objBODMeeting.Start_Time__c + ' (JST)<br/>' + 
                '&nbsp;&nbsp; Venue : ' + BOD_Utility.processNullString(objBODMeeting.Venue__c) + '</p>' +                 
                
                //'<p>Materials for Resolution: </p>' +
                '<h4>Materials for Resolution: </h4>' +
                '<ol>' + 
                 strHTMLToBeResolved +
                '</ol>' +
                '<h4>Materials for Reporting: </h4>' +
                '<ol>' + 
                  strHTMLToBeReported +
                '</ol>' +
                          
                //'<p style="font-weight:bold"><u>Comment : </u><br/>' +
                //'<p style="font-weight:bold">' +
                BOD_Utility.processNullString(objBODMeeting.Comment_In_Email__c) + //'<br/>' + 
                //'</p>' +      
                
                '<p>The documents contain insider information and therefore, please handle them with due care.<br/>' + 
                'Thank you for your attention and consideration.</p>' +
                
                '<p>Although it is not shown on the To list, this email is sent to all BOD members and Auditors.</p>' + 
                
                '<p> ' + '<br/>' + ' </p>' + 
                
                //'<p><日本語></p>' + 
                
                //'<p>メールの宛先には表示されておりませんが、取締役会メンバー全員に送信されております</p>' + 
                 
                '<p>CCEJ取締役、監査役各位</p>' + 
                
                '<p>拝啓　時下ますますご清祥のこととお喜び申し上げます。<br/>' + 
                'さて、以下の要領により取締役会を開催いたします。</p>' + 
                
                BOD_Utility.processNullString(objBODMeeting.Header_Email_Comment_JP__c) +	
                
                '<p>&nbsp;&nbsp; 取締役会名 : ' + BOD_Utility.processNullString(objBODMeeting.Name_JP__c) + '<br/>' + 
                //'<p>Time & Date (日付) : ' + inst.Month() + '/' + inst.Day() + '/' + inst.Year() + '<br/>' + 
                '&nbsp;&nbsp; 開始日時: ' + objBODMeeting.Start_Time__c + ' (JST)<br/>' + 
                '&nbsp;&nbsp; 開催場所 : ' + BOD_Utility.processNullString(objBODMeeting.Venue_JP__c) + '</p>' +                 
                
                '<h4>決議事項: </h4>' +
                '<ol>' + 
                 strHTMLToBeResolved_JP +
                '</ol>' +
                '<h4>報告事項: </h4>' +
                '<ol>' + 
                  strHTMLToBeReported_JP +
                '</ol>' +
                          
                //'<p style="font-weight:bold"><u>Comment : </u><br/>' +
                //'<p style="font-weight:bold">' +
                BOD_Utility.processNullString(objBODMeeting.Email_Comment_JP__c) + //'<br/>' + 
                //'</p>' +      
                               
                '<p>尚、本資料にはインサイダー情報が含まれておりますので、お取扱いにはご留意の程、お願い申し上げます。</p>' +  
                
                '<p>メールの宛先には表示されておりませんが、取締役会メンバー全員に送信されております。</p>' +                                      
                
                //'<p style="font-weight:bold"><u>Encrypt Text : </u><br/>' +
                //objBODMeeting.Text_Encrypted__c + '<br/>' + 
                //'</p>' +                          

                '<p>Salesforce Link: <br/>' + 
                '<a href="' + URL.getSalesforceBaseUrl().toExternalForm() + '/' + objBODMeeting.Id + '">' + objBODMeeting.Name + '</a><br/>' + 
                '</p>' + //Label.RFA_CL026               
                                    
              '</div>' +     
            '</body>' + 
          '</html>';
          
        return strHtmlBody;
 	}	
	
	
	

}