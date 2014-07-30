@IsTest public with sharing class PictureUploadControllerTest {
    @IsTest(SeeAllData=true) public static void errorPictureTest() {
        PictureUploadController con = new PictureUploadController();
    }
    @IsTest(SeeAllData=true) public static void newUserPictureTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            
            Student__c student = StudentInfo.getCurrentStudent();
            student.Picture_ID__c='picture_id_nothing';
            update student;
            
            PictureUploadController con = new PictureUploadController();
            con.getFileKey();
        }
    }
    @IsTest(SeeAllData=true) public static void withPictureTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            Id studentId = StudentInfo.getCurrentStudent().Id;
            
            Attachment file = new Attachment(Body = Blob.valueOf('BODY_CONTENT'));
            file.parentId = studentId;
            
            FileUploadController fcon = new FileUploadController();
            //fcon.parentId = studentId;
            fcon.fileKey = OberlinDefines.PROFILE_PICTURE_FILE_NAME;
            fcon.file = file;
            fcon.upload();
            
            Student__c student = StudentInfo.getCurrentStudent();

            PictureUploadController con = new PictureUploadController();
            con.getFileKey();
        }
    }
    @IsTest(SeeAllData=true) public static void noPictureTest() {
        // create user 
        User u = POU_TestData.createOperationUser();
        System.runAs(u){
            Id studentId = StudentInfo.getCurrentStudent().Id;
            
            Attachment file = new Attachment(Body = Blob.valueOf('BODY_CONTENT'));
            file.parentId = studentId;
            
            FileUploadController fcon = new FileUploadController();
            fcon.parentId = studentId;
            fcon.fileKey = null;
            fcon.file = file;
            fcon.upload();
            
            Student__c student = StudentInfo.getCurrentStudent();

            PictureUploadController con = new PictureUploadController();
            con.getFileKey();
        }
    }
}