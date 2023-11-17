trigger TR_Auto_Discount on Passenger__c (before insert) 
{
	List<Passenger__c> PL = Trigger.New;
    
    CLTR_PAssRegDiscount.calcDisc(PL);
}