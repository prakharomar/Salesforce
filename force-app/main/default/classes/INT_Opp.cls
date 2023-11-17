@RestResource(urlMapping='/getOpp1212')
global  class INT_Opp 
{
    // Objective --> Get list of 10 Oppp in JSON format
	@HttpGet
    global static string getOpp1(){
        
        List<Opportunity> oppList =[Select id, Name from Opportunity limit 10];
        
        String s = JSON.serialize(oppList);
        
        return s;
    }
    
}