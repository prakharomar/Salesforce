({
	callme : function(component, event, helper) 
    {
		var a = parseInt(component.get("v.num1"));
        var b = parseInt(component.get("v.num2"));
        var c = parseInt(component.get("v.num3"));
        
        if(a>b && a>c)
        {
            component.set("v.Result",a);
        }
        else if(b>a && b>c)
        {
            component.set("v.Result",b);
        }
        else
        {
            component.set("v.Result",c);
        }
	},
    
    killme : function(component, event, helper) 
    {
	     component.set("v.num1",null);	
         component.set("v.num2",null);	
         component.set("v.num3",null);	
         component.set("v.Result","0");	
	}
})