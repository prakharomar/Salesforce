import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class IfElse extends LightningElement 
{
    name='test';
    age='';
    salary='';
    show =true;
    
    namehandler(event)
    {
        this.name = event.target.value;
    }

    agehandler(event)
    {
        this.age = event.target.value;
    }

    salaryhandler(event)
    {
        this.salary = event.target.value;
    }

    saveButton()
    {
       if(this.show == true)
       {
           this.show = false;
       }
       else
       {
            this.show = true;
       }
       const event = new ShowToastEvent({
        title: 'Toast message',
        message: 'Toast Message',
        variant: 'success',
        mode: 'dismissable'
    });
    this.dispatchEvent(event);
    }
}