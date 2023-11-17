trigger SendEmail on Contact (before insert)
{
    /*
    CreateContactTrigger__c TC =  CreateContactTrigger__c.getInstance(UserInfo.getUserId());
    
	If(TC.Send_Email_Automatically__c == true)
    {
         CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='Before Insert';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    
    Contact[] cont =[Select name, Account.Name from contact where id in: Trigger.new];
    Map<ID, String> mpAcc = new Map<Id, String>();
    for(Contact C : Trigger.new)
    {
        mpAcc.put(c.AccountId, null);
    }
    List<Account> accList = [Select id, name from Account where id in: mpAcc.keySet()];
    For(Account acc :accList )
    {
        
    }
   */
    Set<Id> idofacc = new Set<Id>();
    For(Contact C : Trigger.new)
    {
        idofacc.add(c.AccountId);
    }
    System.debug(idofacc);
    List<Account> AccList = [Select id, name,(Select Id from Contacts) from Account where id in:idofacc];
    System.debug(AccList);
    List<Contact> conToUpdate = trigger.new;
    For(Account a : AccList)
    {
        Integer size = a.contacts.size() + 1;
        For(Contact C :conToUpdate)
        {
            C.LastName = A.Name +'-'+ size;
            System.debug(C.FirstName);
        }
    }
}