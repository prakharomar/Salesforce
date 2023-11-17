trigger SmS on Lead (after insert) 
{
    Map<id,Lead> LeadMap = Trigger.newMap;
    Set<id> leadid = LeadMap.keySet();
	INT_SMS_API.sendMsg(leadid);
}