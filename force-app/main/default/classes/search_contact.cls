public with sharing class search_contact
{
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(String searchkey)
    {
        String str = '%'+searchkey+'%';

        return [select id, FirstName, LastName, Email, Phone from Contact where FirstName like : str];
    }   
}