global class Int_Batch_Conversion_Int implements Database.Batchable<sObject>, Database.AllowsCallouts
{
	global Database.QueryLocator start(Database.BatchableContext bc) 
    {
        String query = 'Select id, name, amount from Opportunity where amount!= null';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, list<Opportunity> scope)
    {
        String endpoint = 'http://apilayer.net/api/live?access_key=b3c13e7fdaf2a01f4f68bfdf8065bcf4&currencies=INR&source=USD&format=1';
        Http p = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        
        HttpResponse response = P.send(request);
        String result = response.getBody();
        System.debug(result);
        Decimal amt;
        System.JSONParser jp = JSON.createParser(result);
        
        while(jp.nextToken() != null)
        {
            if(jp.getText() == 'USDINR')
            {
                jp.nextToken();
                amt = (Decimal)jp.getDecimalValue();
            }
        }
        System.debug('Current Conversion Rate is'+amt);
        for(Opportunity op : scope)
        {
            op.INR_Value__c  = 'Rs '+(amt*op.Amount);
        }   
        update scope;    
            
    }
    global void finish(Database.BatchableContext BC)
    {
        
    }
}