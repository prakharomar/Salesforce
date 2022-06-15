({
	saveme : function(component, event, helper) 
    {
		var cnm = component.get("v.accname");
        var cph = component.get("v.accPhone");
        var cfx = component.get("v.accFax");
        var cind = component.get("v.accIndustry");
        
        //Step 1  -->call the SSC apex method
        var action = component.get("c.createAcc");
        
        //step 2  --->Pass the parameters
        action.setParams({"nm":cnm, "ph":cph, "fx":cfx, "ind":cind});
        
        //step 3  --->Invoke/callback the method
        action.setCallback(this,function(response){
            										var state = response.getState();
            										if(state == 'SUCCESS')
                                                    {
                                                        var result = response.getReturnValue();
                                                        alert(result);
                                                    }
        											});
        
        //step 4  -->Enqueue the method
        $A.enqueueAction(action); 
	}
})