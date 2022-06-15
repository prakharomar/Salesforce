public with sharing class Wire_Data_Display 
{
    @AuraEnabled(cacheable = true)
    public static List<Account> getAcc()
    {
        return [select id, name, phone, industry, rating from Account];
    }
    
}