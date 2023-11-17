public class Null_Batch implements Database.Batchable<sObject>
{
	public List<Account> Start(Database.BatchableContext BC)
        {
            List<Account> A = [Select Id, Name From Account Where Id IN (Select AccountId From Contact)];
            Return A;
        }	
    
    
    public void Execute(Database.BatchableContext BC, List<Account> accList)	
		{
           /*
            Set<id> accid = new Set<id>();
            Map<Id, String> mpfi = new Map<Id, String>();
			for(Contact con: conList)
            {
                accid.add(con.Accountid);
            }
            List<Account> accList = [Select id, Related_Contact_Ids__c from Account where id =:accid];
            */
            
            for(Account acc : accList)
            {
                acc.Related_Contact_Ids__c  = '';
            }            
            System.debug('accList'+accList);
            update accList;
        }    
    
    public void finish(Database.BatchableContext BC)
    {
       Batch_Job M = new Batch_Job();
        Database.executeBatch(M);
    }
}