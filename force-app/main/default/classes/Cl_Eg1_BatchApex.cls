public class Cl_Eg1_BatchApex implements Database.Batchable<sObject>
{
	public List<Applicant__c> Start(Database.BatchableContext BC)
        {
            List<Applicant__c> A = [Select Id, Name from Applicant__c];
            Return A;
        }	
    
    
    public void Execute(Database.BatchableContext BC, List<Applicant__c> App)	
		{
			for(Applicant__c EA: App)
            {
                EA.Name = 'Disco Dancer';
                update EA;
            }
        }    
    
    public void finish(Database.BatchableContext BC)
    {
        CL_Eg2_SendEmailAgainAgain Email = new CL_Eg2_SendEmailAgainAgain();
        Email.toadd = 'prakharomar@gmail.com';
        Email.Subj =  'SEnd from Btach Apex'; 
        Email.Mbody = 'HI from body ';
        Email.SendEmail();
    }
}