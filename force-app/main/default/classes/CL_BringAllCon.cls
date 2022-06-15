public class CL_BringAllCon
{
    @AuraEnabled(cacheable = true)
	public static List<Contact> allCon()
    {
        List<Contact> C = [Select id, FirstName, LastName, Email, Phone from Contact  where Name != null limit 10 ] ;
        return C;
    }
}