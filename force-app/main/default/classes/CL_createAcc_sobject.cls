public class CL_createAcc_sobject 
{
	@AuraEnabled
    public static List<Account> getRecord(String recordId)
    {
        List<Account> conlist = new List<Account>();
          if(recordId != null && recordId !='')
          {
          conlist = [Select id, name  from Account where id=:recordId];
        }
        return conlist;
    }
}