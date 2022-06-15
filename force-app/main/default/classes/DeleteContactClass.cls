public class DeleteContactClass 
{
    public static void getmethod(List<Account> Acc)
    {
       List<Account> Acco = new List<Account>();
       Set<Id> accid = new Set<Id>();
       Map<Id, Account> accts = new Map<Id, Account>([Select Id, (Select Id from contacts) from Account where id in :accid]);
        
        for(Account a : acco)
        {
           accid.add(a.id); 
        }
        
         for(Account ai : acco)
        {
            if(accts.get(ai.Id).contacts.size()>1)
            {
                ai.adderror('Account cannot be deleted');
            }
        }
    }
	 
    public static void adminDelete(List<Account> Acc)
    {
       Id profileid=Userinfo.getProfileId();
       profile profilname=[select Name from Profile where id=:profileid];
       
       for(Account EA:Acc)
       {
           if(profilname.Name!='System Administrator')
           {
                  EA.addError('Only system Admin can delete');                                    
           }
                            
        }

    }
    
}