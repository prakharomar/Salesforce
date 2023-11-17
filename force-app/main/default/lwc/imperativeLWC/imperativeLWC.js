import { LightningElement } from 'lwc';

import { createRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ImperativeLWC extends LightningElement 
{
    acnm;
    acph;
    acfx;
    acin;


    accnm(event)
    {
        this.acnm = event.target.value;
    }
    accph(event)
    {
        this.acph = event.target.value;
    }
    accfx(event)
    {
        this.acfx = event.target.value;
    }
    accin(event)
    {
        this.acin = event.target.value;
    }
    saveme()
    {
        //step - 1  create the field list
        const fields ={'Name':this.acnm,'Fax': this.acfx, 'Phone':this.acph, 'Industry':this.acin};

        //step - 2 Create API object + fields
        const recordData1 ={apiName:'Account',fields};
        alert("Hi");
        //step - 3 use in imperation
        createRecord(recordData1)
        .then().catch();
    }

}