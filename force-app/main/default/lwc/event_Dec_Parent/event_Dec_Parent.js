import { LightningElement } from 'lwc';

export default class Event_Dec_Parent extends LightningElement 
{
    vol =0;
    lbl ='Waiting for button to Press'
    callincvol(event)
    {
        if(this.vol >= 0 && this.vol < 100)
        {
           this.lbl = event.detail;
            this.vol = this.vol+1;
        }
    }
    calldecvol(event)
    {
        if(this.vol > 0 && this.vol <= 100)
        {
            this.lbl ='From Parent'
            this.vol = this.vol-1;
        }
    }
}