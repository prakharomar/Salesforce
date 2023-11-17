public class VF_PopUp 
{
	public string person {get;set;}
    public double counter {get; set; }
	public boolean showPopup {get; set; }
	public string teststr {get; set; }
    
    public VF_PopUp(ApexPages.StandardController stdController)
    {
        Account account = (Account)stdController.getRecord();
        
        account=[Select Id,Name, Industry from Account where Id =:account.Id];
     	person = account.Name;
  
    }
    public pageReference actionA() 
    {
    teststr  = 'sandeep';
    counter = 0;
    showPopup = true;
    
    return null; 
    }
    public boolean displayPopup {get; set;}     
    
    public void closePopup() {        
        displayPopup = false;    
    }     
    public void showPopup() {        
        displayPopup = true;    
    }
}