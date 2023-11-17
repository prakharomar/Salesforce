public class CL_Integ_DeSerialize 
{
	public void deserialize()
    {
        String JS = '{"Name":"Omar","Marks":[10,20,30],"City":"Delhi"}';
        
        Map<String, Object> mp = (Map<String, Object>) JSON.deserializeUntyped(JS);
        System.debug(JS);
      //  Map<String, Object> mp1 = (Map<String, Object>) (mp.get('Marks'));
     //   List<Object> lst = new List<Object>();
      //  lst = mp.get('Marks');
      //  System.debug(lst);
       List<Object> lst = new List<Object>();
       lst = (List<Object>) mp.get('Marks');
        System.debug(lst);   
    }
    public void deserializeParser()
    {
        String jString ='{"Status":"Success","Code":100,"Account":[{"Name":"ds1","Phone":"0807"},{"Name":"ds2","Phone":"08072022"}]}';
        System.JSONParser jp = JSON.createParser(jString);  // step 1 --> Create JSON Parser 
        
        while(jp.nextToken()!= null)       // step 2 --> Loop through the token after step 1 completed successfully
        {
            if(jp.getText() == 'Account')		// step 3 --> Check for the required key
            {
                jp.nextToken();					// step 4 --> Move to the token for the result of the required key
                List<Account> Acc = (List<Account>) jp.readValueAs(List<Account>.class);   // step 5 Cast data accordingly as given in the JSON 
                Insert Acc;									// step 6  Perform the action 
            }   
        }
    }
    public void deserializeParser1()
    {
         String jString ='{"Status":"Success","Code":100,"Account":[{"Name":"ds1","Phone":"0807"},{"Name":"ds2","Phone":"08072022"}]}';
         System.JSONParser jp = JSON.createParser(jString);  // step 1 --> Create JSON Parser 
         List<String> result = new List<String>();
             while(jp.nextToken()!= null)       // step 2 --> Loop through the token after step 1 completed successfully
            {
                if(jp.getText() == 'Name')      
                {
                    jp.nextToken();
                    String res = jp.getText();
                    result.add(res);
                }   
            }
        System.debug(result);
    }
}