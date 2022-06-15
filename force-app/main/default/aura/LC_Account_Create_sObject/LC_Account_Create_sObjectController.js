({
	subme : function(component, event, helper) 
    {
		//step 0 bring the data from component
		var aa = component.get("v.acc");
        
        //step 1  call the apex method
        var action = component.get("c.createAcc");
        
        action.setParams({"acc":aa});
        
        action.setCallback(this,function(response){
            										var state = response.getState();
            										if(state == 'SUCCESS')
                                                    {
                                                        var result = response.getReturnValue();
                                                        alert(result);
                                                    }
           		 
        });
        
        $A.enqueueAction(action);
	},
    
    clear : function(component, event, helper) 
    {
        
        component.set("v.acc",{});
    }
})