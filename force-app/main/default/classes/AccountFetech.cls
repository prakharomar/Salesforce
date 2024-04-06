public  class AccountFetech 
{
    public static List<Account> getAcc()
    {
        return [Select id,Name, Phone, Industry from Account Limit 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<String> fetchRecords(String componentName){

        // fetch records
        // ignore the parameter we don't need it
        String response = null;
        return null;
    }    

    @AuraEnabled
    public static String addComment(String recordId, String comment){

        FeedItem post = new FeedItem();
        post.ParentId = recordId;
        post.Body = comment;
        insert post;

        return 'Success';
    }

    @AuraEnabled
     public static void addComment1(String recordId, String comment){

         List<ProcessInstanceWorkitem> wis = [
                                      SELECT Id, ProcessInstance.TargetObjectId 
                                FROM   ProcessInstanceWorkitem];

         Map<Id, ProcessInstanceWorkitem> mapi = new Map<Id, ProcessInstanceWorkitem>();
         for(ProcessInstanceWorkitem p : wis){
             mapi.put(p.ProcessInstance.TargetObjectId, p);
         }      
         
         
     }
     // feature branch 1
}