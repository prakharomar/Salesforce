public with sharing class Wire_Data_Display 
{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAcc()
    {
        return [select id, name, phone, industry, rating from Account];
    }
    
    @AuraEnabled(cacheable = true)
    public static List<Passenger__c> getPas()
    {
        return [select id, Travel_Experience__c from Passenger__c where id = 'a1R5g000000Fg0oEAC'];
    }

}