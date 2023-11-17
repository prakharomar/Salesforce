<<<<<<< HEAD
({ /*
=======
({
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
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
<<<<<<< HEAD
    },
    */
    allAccount : function(component, event, helper)
    {
        var recordId = component.get('v.recordId');
    	var action = component.get("c.getRecord");
        action.setParams({"recordId":recordId});
        action.setCallback(this,function(a)
                           {
                               component.set("v.acclist",a.getReturnValue()) ; 
                           });
        
        $A.enqueueAction(action);
        
    },
    openModel: function(component, event, helper) {
      // Set isModalOpen attribute to true
      component.set("v.isModalOpen", true);
   },
  
   closeModel: function(component, event, helper) {
      // Set isModalOpen attribute to false  
      component.set("v.isModalOpen", false);
   },
  
   submitDetails: function(component, event, helper) {
      // Set isModalOpen attribute to false
      //Add your code to call apex method or do some processing
      component.set("v.isModalOpen", false);
   },
    
    scriptsLoaded : function(component, event, helper) {
        component.set("v.isLoaded", true);
        setTimeout(function(){
            window.print();
        }, 2000);
 }
=======
    }
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
})