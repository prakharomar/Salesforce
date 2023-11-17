public class CLTR_EmailCantChange
{
	public static void EmailCantChanged(List<Passenger__c> PN, List<Passenger__c> PO)
    {
        for(Passenger__c EPN : PN)
    {
		for(Passenger__c EPO : PO)
        {
            if(EPN.ID == EPO.ID)
            {
                if(EPN.Passenger_Primary_Email__c != EPO.Passenger_Primary_Email__c  && EPO.Passenger_Primary_Email__c !='no@email.com')
                {
                    EPN.Passenger_Primary_Email__c.AddError('Email cannot be changed');
                }
            }
        }
    }
    }
}