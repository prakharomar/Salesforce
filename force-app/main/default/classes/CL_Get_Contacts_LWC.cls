public class CL_Get_Contacts_LWC 
{
    @AuraEnabled(cacheable = true)
<<<<<<< HEAD
	public static List<Account> getRecord(String recordId)
    {
        List<Account> conlist = new List<Account>();
        if(recordId != null && recordId !='')
        {
          conlist = [Select id, name  from Account where id=:recordId];
=======
	public static List<Contact> getRecord(String recordId)
    {
        List<Contact> conlist = new List<Contact>();
        if(recordId != null && recordId !='')
        {
          conlist = [Select id, name,title,  phone from Contact where Accountid=:recordId];
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
        }
        return conlist;
    }
}