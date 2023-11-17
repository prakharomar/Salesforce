public class CL_ScheduleApex implements Schedulable
{
   public void Execute(SchedulableContext A)
   {
       List<Applicant__c> AP = [Select id,name from Applicant__c];
       
       Try
       {
         for(Applicant__c EA: AP)
         {
             try
             {
                 Delete EA;
             }
             Catch(Exception e)
             {
                 Case Cs = New Case();
                 Cs.Description = 'Applicant deletion failed with ID' + EA.Id;
             }
         }
           
       }
       Catch(Exception e)
       {
           Case Cs = new Case();
           Cs.Description= 'Everything failed';    
       }
           
   }   
	
}