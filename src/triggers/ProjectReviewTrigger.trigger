/*  
   Created By   :P.W.Tyler   
   Created Date :22nd October,2015
   Last Mod Date:
   Class Function: Master Trigger on Project Reviews.
                   
                  
   Change History:
        
         
    
*/
trigger ProjectReviewTrigger on Project_Review__c (after delete, after insert, after undelete, 
after update, before delete, before insert, before update) {
	
	system.debug ('ProjectReviewTrigger:Start');
	if (Trigger.isBefore) {
			
	    if (Trigger.isInsert) {
            system.debug ('ProjectReviewTrigger:isBefore:isInsert');
                ProjectReviewTriggerHandler handler= new ProjectReviewTriggerHandler(Trigger.old, Trigger.new);
                handler.processTriggerList();
	        } 
        if (Trigger.isUpdate) {
            	
            system.debug ('ProjectReviewTrigger:isBefore:isUpdate'); 
            ProjectReviewTriggerHandler handler= new ProjectReviewTriggerHandler(Trigger.oldMap, Trigger.newMap);
	    	handler.processTriggerMap(); 
                
        }
    } 

    if (Trigger.isDelete) {
	    system.debug ('ProjectReviewTrigger:isDelete');    
		}

    if (Trigger.IsAfter) {

			
        if (Trigger.isInsert) { 
            system.debug ('ProjectReviewTrigger:IsAfter:isInsert');	
        } 
        if (Trigger.isUpdate) {
            system.debug ('ProjectReviewTrigger:IsAfter:isUpdate');
            
        }
             
    }
}