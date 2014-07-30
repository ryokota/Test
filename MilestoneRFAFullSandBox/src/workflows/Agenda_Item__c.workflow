<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>BOD_Agenda_Approved</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>BOD Agenda - Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOD_Agenda_Recalled</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Recalled</literalValue>
        <name>BOD Agenda - Recalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOD_Agenda_Rejected</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>BOD Agenda - Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>BOD_Agenda_Submitted</fullName>
        <field>Approval_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>BOD Agenda - Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Parent_Agenda_Id</fullName>
        <description>Save parent agenda id to a unique field for checking duplicate record.</description>
        <field>One_EN_Agend_with_Only_One_JP_Agenda__c</field>
        <formula>Related_Agenda_Item__r.Id</formula>
        <name>Update Parent Agenda Id</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Only One Child Japanese Agenda</fullName>
        <actions>
            <name>Update_Parent_Agenda_Id</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>Related_Agenda_Item__c != null /* AND(   ISCHANGED(Related_Agenda_Item__c),   Related_Agenda_Item__c != null ) */</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
