import { LightningElement } from 'lwc';

import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Impcall extends LightningElement 
{
    name ;
    phone;
    fax;
    industry;

    accnm(event)
    {
        this.name = event.target.value;
    }
    accph(event)
    {
        this.phone = event.target.value;
    }
    accfx(event)
    {
        this.fax = event.target.value;
    }
    accin(event)
    {
        this.industry = event.target.value;
    }
 /*
    showToast() {
        const event = new ShowToastEvent({
            title: 'Account Created ',
            message :'Account Created Successfully',
            variant: 'success'
        });
        this.dispatchEvent(event);
    }
*/
    saveme()
    {
            const fields ={'Name': this.name,'Phone': this.phone,'Fax':this.fax,'Industry':this.industry};
            const recordInput ={apiName : 'Account', fields};
            
            createRecord(recordInput).then(response =>
                {
                const event = new ShowToastEvent({
                    title: 'Account Created ',
                    message :'Account Created Successfully',
                    variant: 'success'
                });
                this.dispatchEvent(event);
            }).catch(error => {
                alert("Account can't be created"+error.body.message);
            });
    }
}