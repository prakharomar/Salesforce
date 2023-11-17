public class AccountTrigger5Helper 
{
public static void beforeDelete(List<Account> accList)
{
        primaryConValidation(accList);
}
     private static void primaryConValidation(List<Account> accList)
     {
        List<Contact> conList = [Select Id,AccountId From Contact where AccountId IN :accList];
        Map<Id,Contact> accContactMap = new Map<id,Contact>();
         
         // MAP stores <key, value>
         // map ---> acc.id(key) ---> contact(value)
         // 18 ya 15 digit number --> acccoyntr. contact, registron form, leads
         // value --> contact 
         // 
         // empty ---> fill ---> fetch data 
         // 
        for(Contact con: conList)
        {
            accContactMap.put(con.AccountId,con);
        }
         
         /// map ---> fill
         //
         //map(12213123123123)  --> contact
         // null
         // String str = ;
         // Contact conwqeq
        for(Account acc : accList)
        {
            Contact con1 = accContactMap.get(acc.Id);
            
            // contact return 
            // null return 
            if(con1 != null)
            {
                acc.addError('You can not delete a account with primary contact.');
            }
        }
    }
    private static void testmet(List<Account> accList)
    {
         List<Contact> conList = [Select Id,AccountId From Contact where AccountId IN :accList ];
        
        for(Account acc: accList)
        {
            for(Contact con : conList)
            {
                if(con.AccountId == acc.id)
                {
                    //code logic
                    acc.addError('You can not delete a account with primary contact.');
                }
            }
        }
    }
}