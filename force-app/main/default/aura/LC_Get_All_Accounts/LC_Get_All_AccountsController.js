({
	loadme : function(component, event, helper) 
    {
	   var colm =[
         
             {label:"First Name" ,fieldName:"Name"},
             {label:"Fax" ,fieldName:"Fax"},
             {label:"Industry" ,fieldName:"Industry"},
             {label:"Phone", fieldName:"Phone" ,type:"phone"}
       		 	];
        
        component.set("v.clm",colm);
        
        var action = component.get("c.bringAccount");
        
        action.setCallback(this, function(response){
           										var state = response.getState();
            									if(state == "SUCCESS")
                                                {
                                                    var result = response.getReturnValue();
                                                    component.set("v.acc",result);
                                                }
            			
        });
        
        $A.enqueueAction(action);
	}
})