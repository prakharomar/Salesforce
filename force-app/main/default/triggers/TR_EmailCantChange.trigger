trigger TR_EmailCantChange on Passenger__c (before update)
{
	List<Passenger__c> PN = Trigger.New;
    List<Passenger__c> PO = Trigger.Old;
    
    TriggerControl__c TC = 	TriggerControl__c.getInstance(UserInfo.getUserId());
    
    If(TC.Passenger_Primary_Email_Change__c == true)
    {
        CLTR_EmailCantChange.EmailCantChanged(PN, PO);
    }
    
   
    
}