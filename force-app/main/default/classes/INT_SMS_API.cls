public class INT_SMS_API 
{
    @future(callout = true)
	public static void sendMsg(Set<Id> leadId)
    {
        List<Lead> LeadList = [select id, name , MobilePhone from lead where id in: leadId ];
        for(Lead l : LeadList)
        {
            Http P = new Http();
            HttpRequest request = new HttpRequest();
            String endpoint = 'https://api.textlocal.in/send/?';
            endpoint += 'apikey=NDg3NjQ5Nzk2NzYxMzIzMTYyNDczOTMzNDc3MTRiNTU=';
            endpoint += '&numbers=918004778379';
            endpoint += '&sender=TXTLCL';
            endpoint += '&message='+'Hellooooooo';
           
            
            request.setEndpoint(endpoint);
            request.setMethod('GET');
            System.debug(endpoint);
            HttpResponse response = P.send(request);
        }
    }
}