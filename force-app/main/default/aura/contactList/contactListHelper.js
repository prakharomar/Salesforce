({
    handleClick : function(component, event, helper) { 
        //highlight the component with a red dot when you load contacts
        var utilityAPI = component.find("UtilityBarEx");
        utilityAPI.setUtilityHighlighted({highlighted:true});        
        // Retrieve contacts during component initialization
        helper.loadContacts(component);        
    },    
})