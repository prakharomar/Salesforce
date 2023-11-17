public class RelatedListController {
    @AuraEnabled
    public static List<Account> getRecords(Integer offSetCount) {
        return [SELECT Id, Name, AccountNumber, Phone, CreatedDate FROM Account LIMIT 20 OFFSET :offSetCount];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAllRecords() {
        return [SELECT Id, Name, AccountNumber, Phone, CreatedDate FROM Account];
    }

    @AuraEnabled(cacheable=true)
     public static List<Account> getContactList() {
        List<Account> conList= [SELECT  Id, Name, AccountNumber, Phone, CreatedDate FROM Account ];
         return conList;
     }

   
}