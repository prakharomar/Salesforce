public class CL_Eg1_SendSingleEmail 
{
		public void SendEmail()
        {
            Messaging.SingleEmailMessage EM  = new Messaging.SingleEmailMessage();
            
            List<String> toaddress = New list<String>{'prakharomar@gmail.com','prakharomar123@gmail.com'};
            
            EM.setToAddresses(toaddress);
            EM.setSubject('HI this is subject');
            Em.setPlainTextBody('This is Body of the Mail');
            
            List<Messaging.Email> SE = new List<Messaging.Email>{EM};
            messaging.sendEmail(SE);
                
            
        }
}