public with sharing class testweather {
    
    public string city{get;set;}
    
    public string temp{get;set;}
    
    public string humid{get;set;}
    
    public string temp_min{get;set;}
    
    public string temp_max{get;set;}
    
    public string pressure{get;set;}
    
    public string sunset {get;set;}
    
    public string sunrise {get;set;}
    
    public testweather(ApexPages.StandardController stdController) {    
        
        Account account = (Account)stdController.getRecord();
        
        account=[Select Id, ShippingCity from Account where Id =:account.Id];
        
        string accountCity = account.ShippingCity;
        
        string apiKey = '6e5229f55d5fb2a5d12b7975307007b3';
        
        string requestEndPoint = 'https://api.openweathermap.org/data/2.5/weather';
        
        requestEndPoint += '?q=' + accountCity;
        
        requestEndPoint += '&units=metrics';
        
        requestEndPoint += '&APPID=' + apiKey;
        
        
        
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
            
            city = String.valueOf(results.get('name'));
            
            
            
            Map<String, Object> mainResults=(Map<String, Object>)(results.get('main'));
            
            Map<String, Object> sysResults=(Map<String, Object>)(results.get('sys'));
            
            sunrise   = String.valueOf(sysResults.get('sunrise'));
            
            sunset   = String.valueOf(sysResults.get('sunset'));
            
            temp = String.valueOf(mainResults.get('temp'));
            
            pressure = String.valueOf(mainResults.get('pressure'));
            
            humid = String.valueOf(mainResults.get('humidity'));
            
            temp_min = String.valueOf(mainResults.get('temp_min'));
            
            temp_max = String.valueOf(mainResults.get('temp_max'));
            
        }
<<<<<<< HEAD
        else   
=======
        else
            
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
        {
            
            ApexPages.message myMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error in reading data.');
            
            ApexPages.addMessage(myMsg);
            
        }
<<<<<<< HEAD

=======
        
        
        
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
    }
}