public class CL_India_Post_Code 
{
    public void indiaPostPinCode()
    {
        String endpoint = 'https://api.postalpincode.in/pincode/212601';
    	Http p = new http();
        HttpRequest  request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response = p.send(request);
        String result = response.getBody();
        System.debug(result);
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        JSONParser parser = JSON.createParser(response.getBody());
        String cityName ;
        while (parser.nextToken() != null) 
        {
            if (parser.getText() == 'Name') 
            {
                // Get the value.
                parser.nextToken();
                // get the city name
                cityName = parser.getText();
                System.debug(cityName);
            }
        }
        
    }
}