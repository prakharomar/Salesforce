@isTest
class testClassTrigger 
{
	public static testmethod void method()
       { 
        Account A = FactoryClass.createAccount();

        Profile p = [SELECT Id FROM Profile WHERE Name='System Administrator'];   
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', LocaleSidKey='en_US', ProfileId = p.Id, TimeZoneSidKey='America/Los_Angeles', UserName='standarduser@testorg.com');
        insert u;

       system.runAs(u)
       {   
           try
           {   
               delete A;
           }
           catch(Exception e)
           {
               system.assertEquals('Only system Admin can delete', e.getMessage());
           }
       }
    
       }
    
}