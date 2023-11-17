public class CL_1404_LWC_Account 
{
	@AuraEnabled(cacheable = true)
    public static List<Account> getAccount(String recordId)
    {
        List<Account> AL = new List<Account>();
        Contact C = [select id, AccountId from Contact where id=:recordId];
        AL = [Select id, name, phone, fax from Account where id=:C.AccountId];
        return  AL;  
    }
}