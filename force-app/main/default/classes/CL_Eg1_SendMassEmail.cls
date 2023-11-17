public class CL_Eg1_SendMassEmail 
{
	public void SendEmail()
        {
            List<Contact> C = [Select FirstName,LastName, Email from Contact where phone ='8182'];
            List<id> CID = new List<Id>();
            
            for(Contact EC : C)
                {
                    CID.add(EC.id);
                }
            EmailTemplate Et = [Select Id, Name from EmailTemplate where name ='Support: Case Created (Phone Inquiries)'];
            
            Messaging.MassEmailMessage ME = new Messaging.MassEmailMessage();
            // ME.setTargetObjectId(CID);
           
            
        }
}