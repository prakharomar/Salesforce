trigger Update_Acc_Phone on Contact ( before insert) 
{
    /*
	Map<id,String> mp = new Map<id,String>();
    
    for(Contact con: Trigger.new)
    {
        mp.put(con.AccountId,con.Phone);
    }
    
    List<Account> acclist = [Select id, phone from Account where id In : mp.keySet()];
    List<Account> accToupdate = new List<Account>();
    for(Account Acc : acclist)
    {
        acc.phone = mp.get(acc.id);
        accToUpdate.add(acc);
    }
    update accToUpdate;
    
  */
   // Map<Id, String> Acc = new Map<Id, String>();
   
    Set<Id> Acc = new Set<Id>();
    for(Contact c : Trigger.new)
    {
        acc.add(c.AccountId);
    }
    List<Account> accList = [Select id,name, phone from Account where id In : acc];
	
    Map<Id,Account> mpAcc = new Map<Id,Account>();
    
    for(Account a : accList)
    {
        mpAcc.put(a.id, a);
    }
    for(Contact c : Trigger.new)
    {
        if(c.AccountId != null)
        {
            c.phone = mpAcc.get(c.AccountId).name;
        }
    }
   
   
}