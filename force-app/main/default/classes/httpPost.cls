@RestResource(urlMapping='/salesforcepost')
global class httpPost {
   
    @HttpPost
    global static Account getProducts(String str, String Industry){
   	
    Account acc = new Account();
    acc.Name = str;
    acc.Industry = Industry;
    insert acc;
    
    return acc;
    }

}