<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Project_Email</fullName>
        <description>Send Project Email</description>
        <protected>false</protected>
        <recipients>
            <field>Sponsor_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Projects/New_Project_Review</template>
    </alerts>
</Workflow>
