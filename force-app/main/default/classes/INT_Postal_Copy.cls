public class INT_Postal_Copy 
{
    public static void getCityData(){
        
        Http P = new Http();
        HttpRequest request = new HttpRequest();
        String endpoint = 'https://api.postalpincode.in/pincode/';
        endpoint += '212601';
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        System.debug('EndPoint'+endpoint);
        
        HttpResponse response = P.send(request);
        
        System.debug('Respone---> '+response);
        
        String jsonResponse = response.getBody();
        
        System.debug('jsonResponse---> '+jsonResponse);
        
        System.JSONParser jp = JSON.createParser(response.getBody());
        
			List<String> cityName = new List<String>();     
        string msg ='';
        string status = '';
        
         while(jp.nextToken()!= null)       // step 2 --> Loop through the token after step 1 completed successfully
            {
                if(jp.getText() == 'Message'){
                    jp.nextToken();	
                    msg = jp.getText();
                }
                if(jp.getText() == 'Status'){
                    jp.nextToken();	
                    if(jp.getText() == 'Error')
                        break;
                }
                
                if(jp.getText() == 'Name')		// step 3 --> Check for the required key
                {
                     jp.nextToken();					// step 4 --> Move to the token for the result of the required key
                     cityName.add(jp.getText()); // step 5 Cast data accordingly as given in the JSON 
                    								// step 6  Perform the action 
                }   
            }
        
        System.debug('msg--->'+msg);
        System.debug('status--->'+status);
        System.debug('cityName--->'+cityName);
        
       
    }
}