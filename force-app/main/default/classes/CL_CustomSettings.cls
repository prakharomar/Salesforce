public class CL_CustomSettings 
{
    public string firstname   	{get;set;}
    public string Lastname   	{get;set;}
    public string Msg		   	{get;set;}
    public string Msgclr	   	{get;set;}
    
    public void CreateCon()
    {
        Map<String,MySFDCColours__c> Myvfclr = MySFDCColours__c.getAll();
        
        MySFDCColours__c cl = Myvfclr.get('Contact VF');
        
        If(cl.Pink__c == True && cl.PinkNum__c == 100)
        {
            Msgclr ='pink';
        }
        
        If(cl.Green__c == True && cl.GreenNum__c == 100)
        {
            Msgclr ='Green';
        }
        
        If(cl.Red__c == True && cl.RedNum__c == 100)
        {
            Msgclr ='Red';
        }
        
        Try
        {
            Contact C = New contact();
            C.FirstName = firstname;
            C.LastName = Lastname;
            Insert C;
            Msg = 'Contact Created Successfully';
        }
        Catch(Exception e)
        {
            Msg = 'Contact Creation Failed';
        }
    }
    
}