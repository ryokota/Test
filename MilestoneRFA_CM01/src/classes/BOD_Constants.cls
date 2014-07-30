public without sharing class BOD_Constants {

	/*
		Public Group
	*/
	public static final String PublicGroupName_BODMember = 'BOD_Member';
	public static final String PublicGroupName_BODAdvisor = 'BOD_Advisor';
	public static final String PublicGroupName_BODAdmin = 'BOD_Admin';
	public static final String PublicGroupName_BODSecretary = 'BOD_Secretary';



	/*
		Label	取締役会	
		Object Name	BOD_Meeting	
		API Name	BOD_Meeting__c
	*/
	
	public static final String BODMeeting_RowCause_Member = 'Member__c';	
	public static final String BODMeeting_RowCause_Advisor = 'Advisor__c';
	public static final String BODMeeting_RowCause_Admin = 'Admin__c';
	public static final String BODMeeting_RowCause_Secretary = 'Secretary__c';
	public static final String BODMeeting_RowCause_Guest = 'Guest__c';

	/*
		Label	取締役会メンバー	
		Object Name	BOD_Members	
		API Name	BOD_Members__c	
	*/
	public static final String BODMembersObj_APIName = 'BOD_Members__c';	
	
	public static final String BODMembersRT_BODMember_DevName = 'BOD_Member';
	public static final String BODMembersRT_BODAdvisor_DevName = 'BOD_Advisor';
	public static final String BODMembersRT_BODAdmin_DevName = 'Admin_of_BOD';
	public static final String BODMembersRT_BODSecretary_DevName = 'Secretary_of_BOD';
	public static final String BODMembersRT_BODGuest_DevName = 'BOD_Guest';

	/*
		Label	議題	
		Object Name	Agenda_Item	
		API Name	Agenda_Item__c
	*/
	
	public static final String AgendaItem_RowCause_Member = 'Member__c';	
	public static final String AgendaItem_RowCause_Advisor = 'Advisor__c';
	public static final String AgendaItem_RowCause_Admin = 'Admin__c';
	public static final String AgendaItem_RowCause_Secretary = 'Secretary__c';
	public static final String AgendaItem_RowCause_Guest = 'Guest__c';	
	
	public static final String AgendaItemType_ToBeResolved = 'Proposal to be Resolved';
	public static final String AgendaItemType_ToBeReported = 'Item to be Reported';
	
	/*
		Field Label	Approval Status	
		Field Name	Approval_Status	
		API Name	Approval_Status__c	
		Data Type	Picklist
	*/
	public static String AgendaItem_ApprovalStatus_NotSubmitted = 'Not Submitted';
	public static String AgendaItem_ApprovalStatus_Submitted = 'Submitted';	
	public static String AgendaItem_ApprovalStatus_Approved = 'Approved';
	public static String AgendaItem_ApprovalStatus_Rejected = 'Rejected';
	public static String AgendaItem_ApprovalStatus_Recalled = 'Recalled';
	
	public static List<String> AgendaItem_Status_In_Approval = 
		new String[]{
			AgendaItem_ApprovalStatus_Submitted, 
			AgendaItem_ApprovalStatus_Approved //, 
			//AgendaItem_ApprovalStatus_Rejected
		};

	
	/*
		Field Label	Document Language	
		Field Name	Document_Language	
		API Name	Document_Language__c
		Data Type	Picklist
	*/
	public static String AgendaItem_DocLang_English = 'English';
	public static String AgendaItem_DocLang_Japanese = 'Japanese';	
	
	
	/*
		Label	Agenda Item Members	 
		Object Name	Agenda_Item_Members	
		API Name	Agenda_Item_Members__c
	*/
	public static final String AgendaItemMembersObj_APIName = 'Agenda_Item_Members__c';	
	
	public static final String AgendaItemMembersRT_BODMember_DevName = 'BOD_Member';
	public static final String AgendaItemMembersRT_BODAdvisor_DevName = 'BOD_Advisor';
	public static final String AgendaItemMembersRT_BODAdmin_DevName = 'BOD_Admin';	
	public static final String AgendaItemMembersRT_BODSecretary_DevName = 'BOD_Secretary';	
	public static final String AgendaItemMembersRT_BODGuest_DevName = 'BOD_Guest';
	
	
    //public static final String BOD_System_User = 'RFA System';
    
    public static Id getOrgWideEmailAddressId(String strOrgWideEmail_DisplayName) {
    	OrgWideEmailAddress[] owea = [select Id, IsAllowAllProfiles, DisplayName 
    		from OrgWideEmailAddress where DisplayName =: strOrgWideEmail_DisplayName];
		system.debug('------ OrgWideEmailAddress[]: ' + owea);
		if(owea != null && owea.size() > 0) {
			return owea[0].Id;
		}
		return null;
    }	
    
    
    public static final Map<Id, Integer> mapBODMemberIdToOrders 
    	= new Map<Id, Integer>{
    		'00510000001t3ZD' => 1,  //calin.dragan@ccej.co.jp	
    		'00510000001rhsP' => 2,  //michael.coombs@ccej.co.jp 
    		'00510000001t5xW' => 3,  //dan.nistor@ccej.co.jp
    		'00510000001t3ZE' => 4,  //fumio.akachi@ccej.co.jp	
    		'00510000001rhvJ' => 5,  //naruhiko.kawamoto@ccej.co.jp
    		'00510000001t3ZI' => 6,  //masaki.ito@ccej.co.jp
    		'00510000002Wpqh' => 7, //irfinan@coca-cola.com
    		'00510000002Wpqm' => 8,  //dsayre@coca-cola.com
    		'00510000002Wpr6' => 9,  //hinagaki@hokuriku.ccbc.co.jp
    		'00510000001t3ZF' => 10,  //keiji.takanashi@ccej.co.jp
    		'00510000002WprB' => 11,  //yoshi1067@g08.itscom.net
    		'00510000001t3ZH' => 12,  //tomizo.nagafuchi@ccej.co.jp	
    		'00510000001t3ZG' => 13,  //yutaka.sugita@ccej.co.jp
    		'00510000002WprG' => 14,  //snozaki@mail.kikkoman.co.jp
    		'00510000002WprL' => 15  //kodawara@coca-cola.com
    };
    
    //川本　成彦        	naruhiko.kawamoto@ccej.co.jp
    public static final Id idKawamoto = '00510000001rhvJ';

/*
取締役、監査役序列 --- From: 中野　宗夫 @ 2014/04/22
地位		            氏名	            本人メールアドレス	             秘書	        秘書メールアドレス
代表取締役社長	 常勤	カリン・ドラガン	calin.dragan@ccej.co.jp	     若原　尚子	    naoko.wakahara@ccej.co.jp    1
代表取締役副社長 常勤	マイケル・クームス	michael.coombs@ccej.co.jp    坂本美佐子	    misako.sakamoto@ccej.co.jp   2
取締役副社長	 常勤	ダン・ニスター	    dan.nistor@ccej.co.jp	     中野　和子	    kazuko.nakano@ccej.co.jp    3
取締役	     常勤	赤地　文夫        fumio.akachi@ccej.co.jp	     塚越　真衣	    mai.tsukagoshi@ccej.co.jp  4
取締役	     常勤	川本　成彦        	naruhiko.kawamoto@ccej.co.jp 山下 多香子	    takako.yamashita@ccej.co.jp  5
取締役	     常勤	伊藤　正樹	        masaki.ito@ccej.co.jp	     山下 多香子	    takako.yamashita@ccej.co.jp  6
取締役	     非常勤	イリアル・フィナン	irfinan@coca-cola.com	     Debbie Bradbury dbradbury@coca-cola.com  7
取締役	     非常勤	ダニエル・セイヤー	dsayre@coca-cola.com	     Verica Collier	 vecollier@coca-cola.com  8
取締役	     非常勤	稲垣　晴彦      	hinagaki@hokuriku.ccbc.co.jp	横山　晶子	     ayokoyama@hokuriku.ccbc.co.jp  9
取締役	     非常勤	高梨　圭二	        keiji.takanashi@ccej.co.jp	  山下 多香子	     takako.yamashita@ccej.co.jp  10
取締役	     非常勤	吉岡　　浩	        yoshi1067@g08.itscom.net	－	   11
					
監査役	常勤	       永渕　富三	        tomizo.nagafuchi@ccej.co.jp	－	  12  
監査役	常勤	       杉田　　豊	        yutaka.sugita@ccej.co.jp	－	  13
監査役	非常勤	  野﨑　貞夫	        snozaki@mail.kikkoman.co.jp	  本郷　由布子	yhongo@mail.kikkoman.co.jp   14
監査役	非常勤	  小田原　加奈	        kodawara@coca-cola.com		  15
*/	

}