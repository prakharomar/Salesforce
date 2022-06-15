public class CL_Eg3_SendEmailContact
{
   public void SendEmailToContact()
   {
       List<Contact> Con = [Select FirstName,LastName, Email from Contact where phone ='8182'];
       for(Contact EC : Con)
       {
           CL_Eg2_SendEmailAgainAgain MyEmail = new CL_Eg2_SendEmailAgainAgain();
           MyEmail.toadd = EC.Email;
           MyEmail.Subj = Ec.FirstName;
           MyEmail.Mbody = Ec.LastName;
           MyEmail.SendEmail();
       }
   }
}