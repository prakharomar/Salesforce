public class CL_BringAllCon
{
    // added changes
    @AuraEnabled(cacheable = true)
	public static List<Contact> allCon()
    {
        List<Contact> C = [Select id, FirstName, LastName, Email, Phone from Contact  where Name != null limit 100 ] ;
        return C;
    }

    @AuraEnabled(cacheable=true)
    public static Passenger__c pasdata(){
        return [SELECT id, name from  Passenger__c limit 1];
    }

    @AuraEnabled
    public static void oad(List<Id> idSet){
        System.debug('msg');
    }
}