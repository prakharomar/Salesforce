trigger DeleteContact on Account (before delete) 
{
    if(Trigger.IsDelete && Trigger.IsBefore)
    {
              DeleteContactClass.getmethod(Trigger.old);
              DeleteContactClass.adminDelete(Trigger.old);  
    }
}