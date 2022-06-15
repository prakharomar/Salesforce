public class CL_AuraEnabled_LC_sObject 
{
    @AuraEnabled
	public static string createAcc(STring nm, String ph, String fx, String ind)
    {
        String msg;
        
        try
        {
            Account A = new Account();
            A.Name = nm;
            A.Phone = ph;
            A.fax = fx;
            A.industry = ind;
            Insert A;
            msg ='Account Created Successfully'+A.id;
        } 
        
        catch(Exception e)
        {
            msg ='Error in creating Account'+e.getMessage();
        }
   
        return msg;
    }
}