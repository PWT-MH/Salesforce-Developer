public with sharing class testCalendar {
    public void googleCalendarExtract()
	{
	    System.debug ('testCalendar.googleCalendarExtract:Start');
	    //string sessionAuthToken = null;	
	    CalendarService service = new CalendarService();
	    service.setAuthSubToken('ya29.NAC6OAiSqTEcXh8AAABkOj6iBvPKX4qIIGT5S00dVcoyIjXh564hwt-2kLCscw');
	    
	    GoogleData feed = service.getAllCalendarsFeed();
	    list<GoogleData.Calendar> cals = GoogleData.calendarFactory(feed.entries);
	    
	    system.debug('Cals='  + cals);
	    
	    System.debug ('testCalendar.googleCalendarExtract:End');	
	}
}