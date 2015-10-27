/*  
   Created By   :P.W.Tyler   
   Created Date :27th October 2015
   Last Mod Date:
   Class Function: Project Reviewer
                   
                  
   Change History:
           
*/ 

public with sharing class ProjectReviewController {
	
	private string Id;
	public string inputValue {get;set;}
	public ProjectReviewController(ApexPages.StandardController controller) {
	 	Id = ApexPages.currentPage().getParameters().get('Id');
	 	system.Debug('ProjectReviewController:ProjectReviewController:Id=' + Id);
	 	
	}
	
	public PageReference saveThis() {
	    system.Debug('ProjectReviewController:save:InputText=' + inputValue);
	    return null;
	}

}