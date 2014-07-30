global with sharing class RM_ProjectExecuteJSON 
{
    
    public String listMilestones() {
        List<Milestone1_Milestone__c> milestones = [SELECT Id, Name FROM Milestone1_Milestone__c LIMIT 10]; 
        JSONGenerator generator = JSON.createGenerator(true);
        generator.writeStartObject();
        generator.writeNumberField('level', 1);
        generator.writeStringField('id', '');
        generator.writeObjectField('isMS', true);
        generator.writeStringField('desc', 'xyz');
        generator.writeEndObject();
        // return generator.getAsString();    
        
        return '[ { "level\": "1", "id": "a081000000wXNLkAAO", \"isMS\": true, \"desc\": \"Stream MDM\", \"values\": [{ \"completed\": false, \"parent\": \"\", \"from\": \"/Date(1391385600000)/\", \"to\": \"/Date(1394323200000)/\", \"dataObj\": { \"id\": \"a081000000wXNLkAAO\", \"progress\": \"0\", \"expectedProgress\": 44.11764705882353, }, \"customClass\": \"ganttYellow\", \"label\": \"Stream MDM\" }] }, ]';
    }
    
}