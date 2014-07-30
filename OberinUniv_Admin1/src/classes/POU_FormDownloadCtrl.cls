public with sharing class POU_FormDownloadCtrl {
  
  public Id programId;
  public List<Attachment> attachments {get;set;}
  
  public void setProgramId(Id aProgram) {
    programId = aProgram;
    attachments = [SELECT Id, Name, BodyLength from Attachment WHERE ParentId = :programId];
  }
  
  public Id getProgramId() {
    return programId;
  }

}