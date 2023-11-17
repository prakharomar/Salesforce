import { LightningElement } from 'lwc';

export default class Event_Dec_Child extends LightningElement 
{
    incme(event)
    {
        //step 1 ---> Create Event
        const inc = new CustomEvent('evtincvol',{detail:'Volume'});

        // step  2 ---> Dispatch Event
        this.dispatchEvent(inc);
    }
    decme(event)
    {
        // step 1 +step 2
        this.dispatchEvent(new CustomEvent('evtdecvol',{detail:'Volume'}));
    }
}