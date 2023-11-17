public with sharing class GetAccount 
{
    @AuraEnabled(cacheable = true)
	public static Account getRecord(String recordId)
    {
        Account Acc = new Account();
        if(recordId != null && recordId !='')
        {
            Acc = [Select id, name from Account where id =:recordId];
        }
        return Acc;
    }
}