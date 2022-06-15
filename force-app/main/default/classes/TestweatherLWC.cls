global with sharing class TestweatherLWC
{

@AuraEnabled(cacheable = true)
global static WeatherData   gettemp(String recordId)
{
    
    Contact C = [Select id, MailingCity from Contact where id =: recordId];
    String shipcity = C.MailingCity ;
    string temp ;
    string apiKey = '6e5229f55d5fb2a5d12b7975307007b3';
    
    string requestEndPoint = 'https://api.openweathermap.org/data/2.5/weather';
    
    requestEndPoint += '?q=' + shipcity;
    
    requestEndPoint += '&units=metrics';
    
    requestEndPoint += '&APPID=' + apiKey;

    WeatherData weather = new WeatherData();
    
    Http http = new Http();
    
    HttpRequest request = new HttpRequest();
    
    request.setEndPoint(requestEndPoint);
    
    request.setMethod('GET');
    
    HttpResponse response = http.send(request);
    
    if(response.getStatusCode() == 200) 
        
    {
        
        // deserialize json string into primitive data type.
        
        Map<String, Object> results =(Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        
        system.debug(results);
        
       

        Map<String, Object> mainResults=(Map<String, Object>)(results.get('main'));
        
        Map<String, Object> sysResults=(Map<String, Object>)(results.get('sys'));
       
        weather.cityName = shipcity;
        weather.cityTemp = Integer.valueOf(mainResults.get('temp'));
        weather.pressure = String.valueOf(mainResults.get('pressure'));
        weather.temp_min = Integer.valueOf(mainResults.get('temp_min'));
        weather.temp_max = Integer.valueOf(mainResults.get('temp_max'));
        weather.sunrise  = String.valueOf(sysResults.get('sunrise'));  
        weather.sunset   = String.valueOf(sysResults.get('sunset'));
        weather.country  = String.valueOf(sysResults.get('country'));
      //  System.debug('--------------------------------'+weather.country);
       // temp =  String.valueOf(mainResults.get('temp'));
      //  Decimal strToDec = decimal.valueOf(temp);
          System.debug('Result' + weather);
        
    }
    return weather;
}
global class WeatherData {
    @AuraEnabled public String cityName;
    @AuraEnabled public Integer cityTemp;
    @AuraEnabled public String pressure;
    @AuraEnabled public Integer temp_min;
    @AuraEnabled public Integer temp_max;
    @AuraEnabled public String sunrise;
    @AuraEnabled public String sunset;
    @AuraEnabled public String country;
 
}
    
}