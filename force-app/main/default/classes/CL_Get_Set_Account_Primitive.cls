public class CL_Get_Set_Account_Primitive 
{
    public String accName		{get;set;}
    public String accphone		{get;set;}
    public String accFax		{get;set;}
    public String accIndustry	{get;set;}
    public String accRating		{get;set;}
    
    public String msg			{get;set;}
    public String clr	{get;set;}
   
    
    public void CreateAcc()
    {
        Try
        {
        Account A = new Account();
        A.Name = accName;
        A.Phone = accphone;
        A.Industry = accIndustry;
        A.Fax = accFax;
        A.Rating = accRating;
            
            Insert A;
            msg = 'Account Created Sucessfully'+ A.Id;
            clr = 'green';
        }
        Catch(Exception E)
        {
            msg = 'Accout creation Failed due to'+ E.getMessage();
            clr = 'red';
        }
    }
    
}