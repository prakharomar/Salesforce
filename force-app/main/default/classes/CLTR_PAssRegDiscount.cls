public class CLTR_PAssRegDiscount 
{
	public static void calcDisc(List<Passenger__c> PL)
    {
        List<String> DSN = new List<String>();
        for(Passenger__c EP: PL)
        {
            EP.Registration_Fee__c = EP.Registration_Fee__c - (EP.Registration_Fee__c * EP.Discount__c/100);
            DSN.add(EP.Passenger_Name__c);
        }
        String S = DSN.toString();
        SendEmail(S);
       // CallScheApex();
    }
    
    public static void SendEmail(String S)
        {
            CL_Eg2_SendEmailAgainAgain EM = new CL_Eg2_SendEmailAgainAgain();
            EM.Subj =S;
            EM.toadd='prakharomar@gmail.com';
            EM.Mbody='Sending Mail';
            EM.SendEmail();
        }
    
   /*
    static void CallScheApex() 
   {
       CL_ScheduleApex SA = new CL_ScheduleApex();
       String CRN = '59 59 23 04 01 ? 2022';
       System.schedule('From Trigger', CRN, SA);
   }
   */
    
}