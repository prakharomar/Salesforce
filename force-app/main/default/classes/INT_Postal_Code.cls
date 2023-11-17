public class INT_Postal_Code 
{
	public static void getCity()
    {
            Http P = new Http();
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://api.postalpincode.in/pincode/';
            endpoint += '212601';
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            System.debug(endpoint);
          
        	HttpResponse response = P.send(request);
            System.JSONParser jp = JSON.createParser(response.getBody());
        	
        	List<String> cityName = new List<String>();
        
        	System.debug(jp);
            while(jp.nextToken()!= null)       // step 2 --> Loop through the token after step 1 completed successfully
            {
                if(jp.getText() == 'Name')		// step 3 --> Check for the required key
                {
                    jp.nextToken();					// step 4 --> Move to the token for the result of the required key
                     cityName.add(jp.getText()); // step 5 Cast data accordingly as given in the JSON 
                    								// step 6  Perform the action 
                }   
            }
        System.debug(cityName);
        
        
    }
}