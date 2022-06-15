import { api, LightningElement } from 'lwc';

import { deleteRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import { NavigationMixin } from 'lightning/navigation';

export default class Delete_Imperation extends NavigationMixin(LightningElement) 
{
    @api recordId;

    deleteme(event)
    {
        deleteRecord(this.recordId).then(response =>{
            const evt = new ShowToastEvent({
                title: 'Record Deleted',
                message: 'Record Deleted Successfully',
                variant: 'success',
            });
            this[NavigationMixin.Navigate]({
                type: 'standard__objectPage',
                attributes: {
                    objectApiName: 'Account',
                    actionName: 'home',
                },
            });
            this.dispatchEvent(evt);
        }).catch(error =>{
            alert("Unable to delete Record")
        });
    }
}