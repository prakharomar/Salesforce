public class Batch_Job implements Database.Batchable<sObject>
{
	public List<Contact> Start(Database.BatchableContext BC)
        {
            List<Contact> A = [Select Id, Name, Accountid from Contact where AccountId != null];
            Return A;
        }	

    public void Execute(Database.BatchableContext BC, List<Contact> conList)	
		{
           
            Set<id> accid = new Set<id>();
            Map<Id, Set<id>> accidconid = new Map<Id, Set<id>>();
            for(Contact con: conList)
            {
                if(accidconid.containsKey(con.Accountid))
                {
                    accidconid.get(con.Accountid).add(con.id);
                }
                else
                {
                    accidconid.put(con.Accountid, new Set<id>{con.id});
                }
            }
            
            List<Account> accList = [Select id, Related_Contact_Ids__c from Account where id =:accidconid.keySet()];
            Map<Id, Account> accMap = new Map<Id, Account>(accList);
            
            String temp = '';
            for(Account acc : accMap.values())
            {
                temp ='';
                if(acc.Related_Contact_Ids__c != null)
                {
                    temp = string.valueof(accidconid.get(acc.id));
                    acc.Related_Contact_Ids__c += temp;
                }
                else
                {
                    acc.Related_Contact_Ids__c = string.valueof(accidconid.get(acc.id));
                }
            }
            
            /*for(Contact con: conList)
            {
                if(mpfi.containsKey(con.AccountId))
                {
                    String temp = mpfi.get(con.AccountId);
                    temp = temp+','+con.Id;
                    mpfi.put(con.AccountId, temp);
                }
                else
                {
                    mpfi.put(con.AccountId, con.Id);
                }
            } 
            for(Account acc : accList)
            {
                 acc.Related_Contact_Ids__c = mpfi.get(acc.id);     
            } */
            System.debug('accList'+accList);
            update accMap.values();
        }    
    
    public void finish(Database.BatchableContext BC)
    {
       
    }
}