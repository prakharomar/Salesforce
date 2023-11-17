trigger Trigger_Eg1 on Passenger__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) 
{
   CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
   E.toadd ='prakharomar@gmail.com';
   E.Subj='Test trigger';
   E.Mbody ='No body';
   E.SendEmail(); 
}