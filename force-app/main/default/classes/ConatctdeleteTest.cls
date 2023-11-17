@isTest
public class ConatctdeleteTest  
{
	public static testmethod void method()
    { 
        Contact C = new Contact();
        C.FirstName ='Omar';
        insert C;

               
        System.Test.startTest();  
        deleteOldRecord Ob = new deleteOldRecord();
        Database.executeBatch(Ob,201);
        System.Test.stopTest();
    }
}