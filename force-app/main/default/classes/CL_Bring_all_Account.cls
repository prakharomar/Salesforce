public class CL_Bring_all_Account 
{
	@AuraEnabled
    public static List<Account> bringAccount()
    {
        Return [Select id, Name, BillingAddress,Industry,Fax, Phone from Account];
    }
}