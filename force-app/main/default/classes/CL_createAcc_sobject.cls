public class CL_createAcc_sobject 
{
	@AuraEnabled
    public static string createAcc(Account acc)
    {
        string result ;
        try
        {
            insert acc;
            result = 'Account created'+acc.id;
        }
        catch(Exception e)
        {
            result ='Account creation failed'+e.getMessage();
        }
        
        return result ;
    }
}