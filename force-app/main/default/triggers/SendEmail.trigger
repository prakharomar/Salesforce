trigger SendEmail on Contact (before insert)
{
    CreateContactTrigger__c TC =  CreateContactTrigger__c.getInstance(UserInfo.getUserId());
    
	If(TC.Send_Email_Automatically__c == true)
    {
         CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='Before Insert';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
}