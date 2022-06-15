({
	callme : function(component, event, helper) 
    {
		var p = parseInt(component.get("v.principal"));
        var r = parseInt(component.get("v.rate"));
        var t = parseInt(component.get("v.tenure"));
        
        var paid  = parseInt((p*r*t)/100);
        component.set("v.interestpaid",paid);
        
        var sum = paid+p;
        component.set("v.total",sum)
	}
})