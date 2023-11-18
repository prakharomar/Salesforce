public class RecordSharingViaApex {

    public static final String MY_CUSTOM_ROW_CAUSE = 'My_Custom_Row_Cause ;

    public static void addCustomSharingrule(Id recordId, Id userId){

        //Create a new sharing object for your custom object 
        // replace "My_Custom_Object_c" with your object's API name
        My_Custom_Object_ __c_Share customShare = new My_Custom_Object__c_Share();

        // Set the ID of the record being shared
        customShare .ParentId = recordId;

        // Set the ID of the user the record is being shared with 
        customShare.UserOrGroupId= userId;
        
        // Set the access level (read or edit)
        customShare.AccessLevel = 'read'
        
        //Set the row cause to your custom row cause
        customShare. RowCause = MY_CUSTOM_ROW_CAUSE;

        // Insert the new sharing record to apply the sharing rule  
        insert customShare;
    }
    
}