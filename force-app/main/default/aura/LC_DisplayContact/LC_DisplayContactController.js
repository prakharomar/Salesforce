({
	loadme : function(component, event, helper)
    {
		var colm = [
            {label:"First Name" ,fieldName:"FirstName"},
            {label:"Last Name" ,fieldName:"LastName", type :"text"},
            {label:"Contact Phone" ,fieldName:"Phone", type:"phone"},
            {label:"Conatct Email" ,fieldName:"Email" ,type:"email"}
        		   ];
        
        component.set("v.clm",colm);
        
        var action = component.get("c.allCon");
        
        action.setCallback(this,function(response){
           											var state = response.getState();
            										if(state == 'SUCCESS')
                                                    {
                                                        var result = response.getReturnValue();
                                                        component.set("v.con",result);
                                                    }
        });
        
        $A.enqueueAction(action);
        
	}
})