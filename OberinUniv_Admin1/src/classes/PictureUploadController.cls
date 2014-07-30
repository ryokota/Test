public with sharing class PictureUploadController {
    
    public Student__c student {get;set;}
    public Boolean noPicture {get;set;}
    
    public PictureUploadController (){
        noPicture = true;
        
        student = StudentInfo.getCurrentStudent();
        
        if(student == null){
            return ;
        }
        if(String.isblank(student.Picture_ID__c)){
            noPicture = true;
            return ;
        } else {
            Attachment[] files =[SELECT id FROM Attachment WHERE Id = :student.Picture_ID__c];
            if(files.size() == 0){
                noPicture = true;
            } else {
                noPicture = false;
            }
        }
    }
    public String getFileKey(){
        return OberlinDefines.PROFILE_PICTURE_FILE_NAME;
    }
}