public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = 
        [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact]; 
        return contacts;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactRecords(){
        List<Contact> contactList = new List<Contact>();
      
        try {

           
                contactList = [Select id,Email,Name,Phone,Owner.Name,Owner.Username from Contact where AccountId='0015g00000GKefEAAT'];
            
            system.debug('contactList :'+contactList);
            return contactList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Task> gettask(){
        List<Task> contactList = new List<Task>();
      
        try {

           
                contactList = [SELECT Id, OwnerId, Owner.Name, Subject, CreatedDate,created_date_formatted__c, CreatedBy.Name FROM Task];
            
            system.debug('contactList :'+contactList);
            return contactList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static Account getAccount(){
        return[SELECT id, Name from Account limit 1];
    }
}