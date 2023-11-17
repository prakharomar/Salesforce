public with sharing class AccountHelper {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(String searchKey) {
        String key = '%' + searchKey + '%'; 
        if(searchKey == null ||  searchKey == ''){
                 return [SELECT Id, Name, Type, Rating,
                  Phone, Website, AnnualRevenue
                   FROM Account LIMIT 10];
        }
        else{
            return [SELECT Id, Name, Type, Rating,
                  Phone, Website, AnnualRevenue
                   FROM Account where name like : key
                   LIMIT 3];
        }
       
    }
}