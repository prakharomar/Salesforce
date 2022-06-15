({
	callme : function(component, event, helper) 
    {
		var a =  parseInt(component.get("v.amountinvested"));
        var y =  parseInt(component.get("v.years"));
        var i =  parseInt(component.get("v.interest"));
        
        var paid = (a*y*i)/100;
        component.set("v.interestpaid",paid);
        
        var total = paid+a;
        component.set("v.amountpaid",total);
	}
})