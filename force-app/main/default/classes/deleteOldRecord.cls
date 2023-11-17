public class deleteOldRecord implements Database.Batchable<sObject>
{
	public List<Contact> start(Database.BatchableContext BC)
    {
        List<Contact> CC = [Select Id, Name from Contact where CreatedDate > LAST_N_DAYS:180];
         Return CC;
    }
    public void execute(Database.BatchableContext BC, List<Contact> CC)
    {
        delete CC;
    }
    public void finish(Database.BatchableContext BC)
    {
        
    }
}