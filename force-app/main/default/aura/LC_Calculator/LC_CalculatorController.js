({
	cal : function(component, event, helper) 
    {
		var p = parseInt(component.get("v.principal"));
        var r = parseInt(component.get("v.rate"));
        var t = parseInt(component.get("v.year"));    
        
        var acc = (p*r*t)/100;
        component.set("v.interest",acc);
        
        var totalamount = acc+ p;
        component.set("v.total",totalamount);
	},
    
    clear : function(component, event, helper) 
    {
		component.set("v.principal",null);
        component.set("v.rate",null);
        component.set("v.year",null);
        component.set("v.interest",null);
        component.set("v.total",null);
	}
})