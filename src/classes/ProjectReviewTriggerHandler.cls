/*  
   Created By   :P.W.Tyler   
   Created Date :22nd October 2015
   Last Mod Date:
   Class Function: Trigger handler on Project Reviews.
                   
                  
   Change History:
           
    
*/

public with sharing class ProjectReviewTriggerHandler {
    // These variables store Trigger.oldMap and Trigger.newMap
    Map<Id, Project_Review__c> oldProjs;
    Map<Id, Project_Review__c> newProjs;

    List<Project_Review__c> oldProjects = new List<Project_Review__c>();
    List<Project_Review__c> newProjects = new List<Project_Review__c>();

    // This is the constructor
    // A list of the old and new records is expected as inputs
    public ProjectReviewTriggerHandler(List <Project_Review__c> oldTriggerProjects,
                                       List <Project_Review__c> newTriggerProjects) {
        
        oldProjects = oldTriggerProjects;
        newProjects = newTriggerProjects;
        
    }
    // This is the constructor
    // A map of the old and new records is expected as inputs
    public ProjectReviewTriggerHandler(Map<Id, Project_Review__c> oldTriggerProjects,
                                       Map<Id, Project_Review__c> newTriggerProjects) {
                                       	
        oldProjs = oldTriggerProjects;
        newProjs = newTriggerProjects;                                   
    }
    
    public void processTriggerList(){
    	
    	system.debug('ProjectReviewTriggerHandler:processTriggerList:Start');
    	
    	for (Project_Review__c newProject : newProjects) {
    		
    	}
    	system.debug('ProjectReviewTriggerHandler:processTriggerList:End');
    	
    }
    public void processTriggerMap(){
        system.debug('ProjectReviewTriggerHandler:processTriggerMap:Start');
        for (Project_Review__c newProject : newProjs.values()) {
            
            Project_Review__c oldProject = oldProjs.get(newProject.Id);
             
        }
        
        system.debug('ProjectReviewTriggerHandler:processTriggerMap:End');
    }
}