public without sharing class ApexSharing {

    public static List<Account> getAccList(){
        return [SELECT Id, 
                       Name,
                       AnnualRevenue,BillingCity
                       From Account
                       WITH USER_MODE];
    }

}