public class createListViewHelper {

   @AuraEnabled(cacheable=true)
   public static List<Contact> getConatcts()
   {
       return [SELECT Id, firstName, lastName, accountId, 
                account.Name, mailingStreet, mailingCity, mailingState, mailingPostalCode, mailingCountry, email 
                FROM Contact
                LIMIT 1000];
   }

   @AuraEnabled
   public static void deleteContacts(List<id> contactIds){
      if(contactIds.size() > 0 ){
            delete [SELECT Id FROM Contact WHERE Id in: contactIds];
        }
   }

   @AuraEnabled(cacheable=true)
   public static List<Contact> getSearchResult(String searchValue){
      string temp = '%'+searchValue+'%';
      return[
                SELECT Id, firstName, lastName, accountId, 
                account.Name, mailingStreet, mailingCity, mailingState, mailingPostalCode, mailingCountry, email 
                FROM Contact where name like : temp
                limit 1000
      ];
   }

   @AuraEnabled(cacheable=true)
   public static List<Contact> getContactsById(List<id> contactIds){
      if(contactIds.size() > 0 ){
            return [SELECT Id, Firstname, Lastname, accountId, 
                account.Name,  mailingCity, mailingState, mailingPostalCode, mailingCountry, email, fax,mailingStreet
                FROM Contact where Id in: contactIds
                LIMIT 1];
        }
        return null;
   }
   
   @AuraEnabled
   public static void createContact(Contact c ){
      System.debug('------'+c.Id);
      Contact con = new Contact();
      con.Id = c.Id;

      update c;
   }

}