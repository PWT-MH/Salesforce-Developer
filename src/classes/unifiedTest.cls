/*  
   Created By   :P.W.Tyler   
   Created Date :23rd October 2015
   Last Mod Date:
   Class Function: Creating test data
                   
                  
   Change History:
           
    
*/
@isTest
public class unifiedTest {

    public static Project_Review__c createProject(string projectName) {
       Project_Review__c project = new Project_Review__c();
       project.Project_Name__c=projectName;
       project.Status__c = 'Open';
       project.Stakeholder_Sponser__c='Joe King';
       project.Sponsor_Email__c = 'pwtyleruk@gmail.com';
       
       return project;
       
    }
}