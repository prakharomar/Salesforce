public class CL_Get_Contacts_LWC 
{
    @AuraEnabled(cacheable = true)
	public static List<Contact> getRecord(String recordId)
    {
        List<Contact> conlist = new List<Contact>();
        if(recordId != null && recordId !='')
        {
          conlist = [Select id, name,title,  phone from Contact where Accountid=:recordId];
        }
        return conlist;
    }
}