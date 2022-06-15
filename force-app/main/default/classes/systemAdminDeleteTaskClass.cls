public class systemAdminDeleteTaskClass 
{
	public static void adminDeleteTask(List<Task> task)
    {
       Id profileid=Userinfo.getProfileId();
       profile profilname=[select Name from Profile where id=:profileid];
       
       for(Task TA:task)
       {
           if(profilname.Name!='System Administrator')
           {
                  TA.addError('Only system Admin can delete Task');                                    
           }
                            
        } 
}
}