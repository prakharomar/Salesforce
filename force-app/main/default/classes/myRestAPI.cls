@RestResource(urlMapping='/salesforcekid')
global class myRestAPI {
    @HttpGet
    global static string getProducts(){
   		List<Account> accList = new List<Account>();
     	accList = [Select id, Name from Account Limit 10];
   		return JSON.serialize(accList);
    }
}