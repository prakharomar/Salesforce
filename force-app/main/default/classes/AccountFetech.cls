public with sharing class AccountFetech 
{
    // added check
    public static List<Account> getAcc()
    {
        return [Select id,Name, Phone, Industry from Account Limit 10];
    }    
}