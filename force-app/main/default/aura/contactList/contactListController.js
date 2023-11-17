({
    getValueFromLwc : function(component, event, helper) {
	//	component.set("v.inputValue",event.getParam('value'));
        var utilityAPI = component.find("utilitybar");
        utilityAPI.minimizeUtility();
	} ,
    getTextareaLength: function(component, event, helper) {
        // Get a reference to the Lightning Textarea component
        var textareaCmp = component.find("myTextarea");

        // Get the value of the textarea
        var textareaValue = textareaCmp.get("v.value");

        // Get the length of the textarea value
        var textareaLength = textareaValue.length;
        component.set("v.lengthof",textareaLength);
        // Log the length or perform any desired action
        console.log("Length of textarea value: " + textareaLength);
    },
     handleInputChange: function(component, event, helper) {
        // Get the updated value of the attribute
        var updatedValue = component.get("v.textareaValue");
        
        // Log the updated value or perform any desired action
        console.log("Updated value of myString: " + updatedValue);
          var textareaLength = updatedValue.length;
        component.set("v.lengthof",textareaLength);
        // Log the length or perform any desired action
        console.log("Length of textarea value: " + textareaLength);
         
    }
})