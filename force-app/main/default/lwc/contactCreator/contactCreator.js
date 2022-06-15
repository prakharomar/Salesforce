import { LightningElement } from 'lwc';

import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactCreator extends LightningElement 
{
    objectname ='Contact';
    fieldsneeded =[FirstName,LastName,Email];

    handleSuccess(event)
    {
        const evt = new ShowToastEvent({
            title: 'Contact created',
            message: 'Record ID: ' + event.detail.id,
            variant: 'success',
        });
        this.dispatchEvent(evt);
    }
}