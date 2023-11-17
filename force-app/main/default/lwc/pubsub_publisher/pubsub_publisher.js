import { LightningElement } from 'lwc';

import pubsub from 'c/pubsub';


export default class Pubsub_publisher extends LightningElement 
{
    name;
    phone;
    msg;
    namechange(event)
    {
        this.name = event.target.value;
    }
    phnchange(event)
    {
        this.phone = event.target.value;
    }
    msgchange(event)
    {
        this.msg = event.target.value;
    }
    subme(event)
    {
        let message ={
                        "Sender Name" : this.name,
                        "Phone Number" : this.phone,
                        "Message" : this.msg
                     };
         pubsub.fire('eventnotify',message);            
    }
}