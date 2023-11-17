public with sharing class Wire_Data_Display 
{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAcc()
    {
        return [select id, name, phone, industry, rating from Account];
    }
    
<<<<<<< HEAD
    @AuraEnabled(cacheable = true)
    public static List<Passenger__c> getPas()
    {
        return [select id, Travel_Experience__c from Passenger__c where id = 'a1R5g000000Fg0oEAC'];
    }

=======
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
}