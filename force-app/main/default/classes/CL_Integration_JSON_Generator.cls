public class CL_Integration_JSON_Generator 
{
	public void createJson(String Name, String Phone, String Industry)
    {
        System.JSONGenerator JS = JSON.createGenerator(true);  //step 1  --> Create Generator with pretty true or we can use flase
        JS.writeStartObject();								   //step 2  --> Start Writing to JSON
       /* 
            try
            {	
                 Account A = new Account();
                 A.Name = Name;
                 A.Phone = Phone;
                 A.Industry = Industry;
                 Insert A;
                
                 JS.writeStringField('Status', 'Success');
                 JS.writeIdField('AccId', A.Id);
                 JS.writeStringField('Acc Name', A.Name);
                 JS.writeStringField('Acc Phone', A.Phone);
            }
             catch(Exception e)
             {
                 JS.writeStringField('Status', 'Failed');
               //  JS.writeIdField('AccId', A.Id);
               //  JS.writeStringField('Acc Name', A.Name);
                 JS.writeNumberField('Code', 800);
             }
        
        JS.writeEndObject();									// step  --> End writng to JSON
        String result = js.getAsString();						// Get the final output
        System.debug(result);									// See/Check the output
        
        */
        System.JSONGenerator JS1 = JSON.createGenerator(true); 
        JS1.writeStartObject();
             try
             {
              	List<Account> Acc = [Select name, phone from Account where phone != null];  
                for(Account EA: Acc)
                {
                   JS1.writeStringField('Status', 'Success');
                   JS1.writeIdField('AccID', EA.Id);
                   JS1.writeStringField('Phone', EA.Phone);
                   JS1.writeNumberField('Code', 200); 
                }
             }
        	 catch(Exception e)
             {
                   JS1.writeStringField('Status', 'Failed');
              //   JS1.writeIdField('AccID', EA.Id);
                   JS1.writeStringField('Msg', 'Account not fetched');
                   JS1.writeNumberField('Code', 404);  
             } 
        JS1.writeEndObject();									// step  --> End writng to JSON
        String result1 = JS1.getAsString();						// Get the final output
        System.debug(result1);	
    }
}