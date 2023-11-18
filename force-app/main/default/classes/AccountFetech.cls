public  class AccountFetech 
{
  
    @AuraEnabled
    public static String addComment(String recordId, String comment){

        FeedItem post = new FeedItem();
        post.ParentId = recordId;
        post.Body = comment;
        insert post;

        return 'Success';
    }
}