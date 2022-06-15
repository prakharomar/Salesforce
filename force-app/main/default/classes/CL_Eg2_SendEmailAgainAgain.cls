public class CL_Eg2_SendEmailAgainAgain
{
    public string toadd    {get;set;}
    public string Subj 	   {get;set;}
    public string Mbody    {get;set;}
    
    public void SendEmail()
    {
        Messaging.SingleEmailMessage MyEmail = new Messaging.SingleEmailMessage();
        List<String> tad = new List<String>{toadd};
        MyEmail.setToAddresses(tad);
        MyEmail.setSubject(Subj);
        MyEmail.setPlainTextBody(Mbody);
        
        List<Messaging.Email> EML = new List<Messaging.Email>{MyEmail};        
        Messaging.sendEmail( EML);
    }

}