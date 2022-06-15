import { LightningElement } from 'lwc';

import pubsub from 'c/pubsub';

export default class Pubsub_subsriber extends LightningElement 
{
    message;
    connectedCallback()
    {
        this.register();
    }
    register()
    {
        pubsub.register('eventnotify',this.handleEvent.bind(this));
    }
    handleEvent(messagefromevent)
    {
        this.message = messagefromevent ? JSON.stringify(messagefromevent,null,'\t') : 'no message payload';
    }
}