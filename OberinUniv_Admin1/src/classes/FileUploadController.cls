public with sharing class FileUploadController {

    public String fileKey {get;set;}
    public Id parentId {get;set;}
    public PageReference returnURL {get;set;}
    public Boolean noRedirect {get;set;}
    public Attachment file {get;set;}
    
    public FileUploadController (){
        file = new Attachment();
        noRedirect = false;
    }
    
    public PageReference upload(){
        PageReference pref = null;
        
        try{

            file.Name = fileKey != null ? fileKey : file.Name;
            file.ParentId = parentId == null ? StudentInfo.getCurrentStudent().Id : parentId;
            
            file.Id = findIdForUpdate(file.ParentId);
            
            if(file.body != null){
                // if( file.body.size() > 512000 ){
                //     file = new Attachment();
                //     return pref;
                // }
                upsert file;

                if(isPictureUpload(file.ParentId)){
                
                    Student__c s=[SELECT Picture_ID__c FROM Student__c WHERE id=:file.ParentId];
                    
                    if( POU_CommonService.isNotEquals(s.Picture_ID__c ,file.Id )){
                        s.Picture_ID__c = file.Id;
                        update s;
                    }
                }
                PageReference page = System.Page.Home;
                page.setRedirect(true);
                pref=page;
            }
            Student__c[] students=[SELECT Picture_ID__c FROM Student__c WHERE id=:file.ParentId];
            
            
        }catch(Exception e){
            if (ApexPages.currentPage() != null){
                ApexPages.addMessages(e);
            }
        }
        file = new Attachment();
        return pref;
    }
    
    private Id findIdForUpdate(Id parentId){
        Id fileId = null;
        if(parentId != null && fileKey != null){
            Attachment[] ret =[
                SELECT id
                  FROM Attachment
                 WHERE ParentId =: parentId
                   AND Name =: fileKey LIMIT 1
            ];
            fileId= ret.size() > 0 ? ret[0].id : null;
        }
        return fileId;
    }
    
    private Boolean isPictureUpload(Id parentId){
        return parentId.getsObjectType() == Student__c.sObjectType && fileKey == OberlinDefines.PROFILE_PICTURE_FILE_NAME;
    }
    
}