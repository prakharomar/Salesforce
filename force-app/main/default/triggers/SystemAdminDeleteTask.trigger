trigger SystemAdminDeleteTask on Task (before delete)
{
		systemAdminDeleteTaskClass.adminDeleteTask(trigger.old);
}