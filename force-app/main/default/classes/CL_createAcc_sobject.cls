public class CL_createAcc_sobject 
{
	@AuraEnabled
<<<<<<< HEAD
    public static List<Account> getRecord(String recordId)
    {
        List<Account> conlist = new List<Account>();
          if(recordId != null && recordId !='')
          {
          conlist = [Select id, name  from Account where id=:recordId];
        }
        return conlist;
=======
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
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
    }
}