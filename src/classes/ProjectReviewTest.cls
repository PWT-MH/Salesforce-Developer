/*  
   Created By   :P.W.Tyler   
   Created Date :23rd October 2015
   Last Mod Date:
   Class Function: Tests for ProjectReviewTrigger and ProjectReviewTriggerHandler
                   
                  
   Change History:
           
*/    
@isTest
private class ProjectReviewTest {

    // test the  insert trigger
    static testMethod void isInsertUpdateTest() {
    	Project_Review__c project = new Project_Review__c();
    	 
    	project = unifiedTest.createProject('The Big Project');
    	
    	insert project; 
    	
    	// test the update trigger
    	project.action__c = 'Review Actions';
    	update project;
    	
    	integer projCount = [SELECT count()
    	                     FROM Project_Review__c
    	                     WHERE action__c = 'Review Actions'];
    	system.assert(projCount==1); 
         
    }
    
    static testMethod void isInsertUpdateBulkTest() {
    	List<Project_Review__c> projects = new List<Project_Review__c>();
    	Project_Review__c proj = new Project_Review__c();
    	Test.startTest();
    	for (Integer i = 1; i < 201; i++){
    	 
    	    proj = unifiedTest.createProject('The Big Project' + i);
    	    projects.add(proj);
    	}
    	insert projects; 
    	
    	List <Project_Review__c> updateProjs = [SELECT action__c
    	                                        FROM Project_Review__c ];
    	for ( Project_Review__c up : updateProjs) {
    		up.action__c = 'Review Actions';
    	}  
    	// bulk test the update trigger 
    	update updateProjs;                                     
    	Test.stopTest(); 
    	integer projCount = [SELECT count()
    	                     FROM Project_Review__c
    	                     WHERE action__c = 'Review Actions'];
    	system.assert(projCount==200);
    }
}