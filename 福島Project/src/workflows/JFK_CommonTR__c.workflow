<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>JFK_ApproveApplication1_JCJ</fullName>
        <description>チェックシートの２次担当者の上司が「申請承認」をした時にメールを担当者に送信します。</description>
        <protected>false</protected>
        <recipients>
            <field>GS_SecondTantosya__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/JFK_ApproveApplication1_JCJ</template>
    </alerts>
    <alerts>
        <fullName>JFK_RejectApplication1_JCJ</fullName>
        <description>チェックシートの２次担当者の上司が「申請却下」をした時にメールを担当者に送信します。</description>
        <protected>false</protected>
        <recipients>
            <recipient>ksuto@pasonatquila.fukushima</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/JFK_RejectApplication1_JCJ</template>
    </alerts>
    <alerts>
        <fullName>JFK_RejectSashimodoshi_JCJ</fullName>
        <description>２次担当者が１次担当者に差し戻した時、メールを１次担当者に差し戻します。</description>
        <protected>false</protected>
        <recipients>
            <field>GS_FirstTantosya__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/JFK_Sashimodoshi_JCJ</template>
    </alerts>
    <alerts>
        <fullName>JFK_SendMail_UpdateApplication1_JCJ</fullName>
        <description>チェックシートの２次担当者が「修正申請」をした時にメールをマネージャに送信します。</description>
        <protected>false</protected>
        <recipients>
            <recipient>ksuto@pasonatquila.fukushima</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/JFK_UpdateApplication1_JCJ</template>
    </alerts>
    <fieldUpdates>
        <fullName>JFK_GSStatus_Reject2Complete</fullName>
        <field>GS_SecondTantosya_Status__c</field>
        <formula>&quot;完了&quot;</formula>
        <name>JFK_GSStatus_Reject2Complete</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>JFK_GS_SetJigyoshoMei</fullName>
        <field>GS_JigyosyoMei__c</field>
        <formula>JijyosyoTR_ShikyuJiki__r.Nendo_Kai_Jigyosyo__r.Account__r.Name</formula>
        <name>JFK_GS_SetJigyoshoMei</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TestBySuto</fullName>
        <field>GS_JissekiSyoruiShinsa_KanryoBi_1st__c</field>
        <name>TestBySuto</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Null</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>JFK_AfterRejectApplication2_JCJ</fullName>
        <actions>
            <name>JFK_GSStatus_Reject2Complete</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>JFK_CommonTR__c.GS_SecondTantosya_Status__c</field>
            <operation>equals</operation>
            <value>申請却下</value>
        </criteriaItems>
        <description>チェックシートの２次担当者の上司が「申請却下」した後、GSの２次担当者ステータスを「完了」に戻す。</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JFK_ApproveApplication2_JCJ</fullName>
        <actions>
            <name>JFK_ApproveApplication1_JCJ</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>JFK_CommonTR__c.GS_SecondTantosya_Status__c</field>
            <operation>equals</operation>
            <value>申請承認</value>
        </criteriaItems>
        <description>チェックシートの２次担当者の上司が「申請承認」した時に発生</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JFK_GS_SetJigyoshoMei</fullName>
        <actions>
            <name>JFK_GS_SetJigyoshoMei</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>汎用TR（GS）に事業所名を設定（グローバル検索対策）</description>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>JFK_RejectApplication2_JCJ</fullName>
        <actions>
            <name>JFK_RejectApplication1_JCJ</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>JFK_CommonTR__c.GS_SecondTantosya_Status__c</field>
            <operation>equals</operation>
            <value>申請却下</value>
        </criteriaItems>
        <description>チェックシートの２次担当者の上司が「申請却下」した時に発生</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JFK_Sashimodoshi_JCJ</fullName>
        <actions>
            <name>JFK_RejectSashimodoshi_JCJ</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>JFK_CommonTR__c.GS_FirstTantosya_Status__c</field>
            <operation>equals</operation>
            <value>差し戻し中</value>
        </criteriaItems>
        <description>チェックシートの２次担当者が１次担当者に「差し戻し」をした時に発生</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>JFK_UpdateApplication2_JCJ</fullName>
        <actions>
            <name>JFK_SendMail_UpdateApplication1_JCJ</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>JFK_CommonTR__c.GS_SecondTantosya_Status__c</field>
            <operation>equals</operation>
            <value>修正申請中</value>
        </criteriaItems>
        <description>チェックシートの２次担当者が「修正申請」依頼をした時に発生</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>ActionTask</fullName>
        <assignedTo>ksuto@pasonatquila.fukushima</assignedTo>
        <assignedToType>user</assignedToType>
        <description>ああああああああああああああ</description>
        <dueDateOffset>5</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>ああああああああああああああ</subject>
    </tasks>
</Workflow>
