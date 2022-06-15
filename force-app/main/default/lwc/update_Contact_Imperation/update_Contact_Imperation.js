import { LightningElement, wire } from 'lwc';

import updatecon from '@salesforce/apex/search_contact.getContacts';

import { updateRecord } from 'lightning/uiRecordApi';

import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_IELD from '@salesforce/schema/Contact.LastName';
import ID_FIELD from '@salesforce/schema/Contact.Id';

import { refreshApex } from '@salesforce/apex';

const col = [
    { label: 'First Name', fieldName: 'FirstName', editable: true },
    { label: 'LastName', fieldName: 'LastName', type: 'text', editable: true },
    { label: 'Email', fieldName: 'Email', type: 'email', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone',editable: true }
            ];


export default class Update_Contact_Imperation extends LightningElement
{
    colsss = col;
    input ;
    draftvalues =[];
    

    inputtext(event)
    {
        this.input = event.target.value;
    }

    @wire(updatecon,{searchkey:'$input'}) prak;

    handlesave(event)
    {
        const fields = []; 

        //step 1 ----> capture the values
        fields[ID_FIELD.fieldApiName] = event.detail.draftvalues[0].Id;  
        fields[LAST_NAME_IELD.fieldApiName] = event.detail.draftvalues[0].LastName;
        fields[FIRST_NAME_FIELD.fieldApiName] = event.detail.draftvalues[0].FirstName;
        
        //step 2  ----> create Record Set
        const recordInput ={fields}

        //step 3 ---> call Imperation
        updateRecord(recordInput).then(response =>{
            alert("Record Updated Successfully");
            this.draftvalues = null;
            return refreshApex(this.prak);
        }).catch(error =>{
            alert("Error Occured"+error.body.message);
        });
    }
}