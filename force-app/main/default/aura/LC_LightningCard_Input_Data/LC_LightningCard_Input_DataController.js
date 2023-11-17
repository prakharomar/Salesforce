({
	subme : function(component, event, helper) 
    {
		component.set("v.empname","Tanya Saxena");
        component.set("v.empage","19");
        component.set("v.empsalary","7600.76");    
	},
    
    clearme : function(component, event, helper) 
    {
		component.set("v.empname",null);
        component.set("v.empage",null);
        component.set("v.empsalary",null);   
	}
})