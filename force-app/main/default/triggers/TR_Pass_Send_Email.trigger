trigger TR_Pass_Send_Email on Passenger__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) 
{
    If(Trigger.isInsert && Trigger.IsBefore)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='Before Insert';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isInsert && Trigger.IsAfter)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='After Insert';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isupdate && Trigger.IsBefore)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='Before Update';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isInsert && Trigger.IsAfter)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='After Update';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isdelete && Trigger.IsBefore)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='Before Delete';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isDelete && Trigger.IsAfter)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='After Delete';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
    If(Trigger.isUnDelete && Trigger.IsAfter)
    {
           CL_Eg2_SendEmailAgainAgain E = new CL_Eg2_SendEmailAgainAgain(); 
           E.toadd ='prakharomar@gmail.com';
           E.Subj='After UnDelete';
           E.Mbody ='No body';
           E.SendEmail(); 
    }
}