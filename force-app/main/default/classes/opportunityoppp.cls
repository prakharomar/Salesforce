public class opportunityoppp 
{
	public static void afterinsert(Map<Id, Opportunity> newOpp)
    {
        Set<Id> opportunityid = newOpp.keySet();
    	//  opportunityid.add(newOpp.KeySet());
     	List<Opportunity> opplist =  [Select Id, AccountId, Name, Account.Phone from Opportunity where Id =: opportunityid] ;
    	List<Account> al = [Select id, RecordType.Name from Account];

        
        for(Opportunity o : opplist)
        {
            if(o.Account.Name == 'Omar')
            {
                
            }
        //   Contact C = new Contact();
        }
        
    }
}