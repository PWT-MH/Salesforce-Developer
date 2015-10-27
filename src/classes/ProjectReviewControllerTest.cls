/*  
   Created By   :P.W.Tyler   
   Created Date :27th October 2015
   Last Mod Date:
   Class Function: Project Reviewer test
                   
                  
   Change History:
           
*/ 
@isTest
private class ProjectReviewControllerTest {

    static testMethod void saveThisTest() {
        Project_Review__c proj = new Project_Review__c();
        proj=unifiedTest.createProject('HELLO WORLD');
        insert proj;
        
        PageReference pageRef = Page.ProjectReview;
        Test.setCurrentPage(pageRef);
        Apexpages.StandardController sc = new Apexpages.standardController(proj);
        
        ProjectReviewController cont = new ProjectReviewController(sc);
        cont.SaveThis();
          
    }
}