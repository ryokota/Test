public class OberlinDefines {
    
    public static final String RECORD_TYPE_UNIV_NAME = 'University';//Account record
    public static final String INBOUND_PROFILE  = 'Oberlin inbound Student';
    public static final String OUTBOUND_PROFILE = 'Oberlin outbound Student';
    
    /** Application__c:RecordType */
    public static final String APPS_RECTYPE_IN_EXCHANGE= 'Inbound for Exchange';
    public static final String APPS_RECTYPE_IN_SHORT=    'Inbound for Short-term';
    public static final String APPS_RECTYPE_OUT_GO=      'Outbound for GO/AH';
    public static final String APPS_RECTYPE_OUT_LONG=    'Outbound for Long-term';
    public static final String APPS_RECTYPE_OUT_SHORT=   'Outbound for Short-term';
    
    /** Program__c:RecordType */
    public static final String PROG_RECTYPE_IN=  'Inbound Program';
    public static final String PROG_RECTYPE_OUT= 'Outbound Program';

    /** Program__c:Program_type__c */
    public static final String PROG_TYPE_SHORT=    'Short-term Program';
    public static final String PROG_TYPE_LONG=     'Long-term Program';
    public static final String PROG_TYPE_GO=       'Groval Outreach Program';
    public static final String PROG_TYPE_EXCHANGE= 'Exchange Program';
    
    public static final String DEFAULT_LANG = 'ja';
    public static final String DEFAULT_LOCALE = 'ja_JP';
    public static final String DEFAULT_TIMEZONE = 'Asia/Tokyo';
    public static final String DEFAULT_EMAIL_ENCODING = 'UTF-8';
    
    public static final String PROFILE_PICTURE_FILE_NAME = 'PROFILE_PIC';
    
    
    public User createNewUser(){
    
        return SiteRegisterService.getNewUser();
    }
}