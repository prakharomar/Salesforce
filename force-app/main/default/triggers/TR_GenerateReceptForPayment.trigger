trigger TR_GenerateReceptForPayment on Passenger__c (after insert)
{
    /* way 1
    List<Passenger__c> PL = Trigger.New;
    
    for(Passenger__c EP : PL)
    {
        Fee_and_Payment__c Pay = new Fee_and_Payment__c();
        Pay.Payment_Mode__c = 'Cash';
        Pay.Amount__c = EP.Registration_Fee__c;
        Pay.Passenger__c = EP.Id;  
        Insert Pay;
    }
     */
    
    Map<id,Passenger__c> PLM = Trigger.NewMap;
    Set<id> NPID = PLM.keySet();
    
    List<Passenger__c> PL = [select id, Registration_Fee__c from Passenger__c where id in: NPID];
    
    for(Passenger__c EP : PL)
    {
        Fee_and_Payment__c Pay = new Fee_and_Payment__c();
        Pay.Payment_Mode__c = 'Cash';
        Pay.Amount__c = EP.Registration_Fee__c;
        Pay.Passenger__c = EP.Id;  
        Insert Pay;
    }   
}