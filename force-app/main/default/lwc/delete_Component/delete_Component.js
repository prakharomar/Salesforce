import { LightningElement,wire ,track} from 'lwc';
import getAccount from '@salesforce/apex/CL_BringAllCon.allCon';
import { deleteRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class Delete_Component extends LightningElement 
{
    mycon;
    myerror;
    _wiredData;

    @wire(getAccount) contacts (wireResult)
     {
         const { data, error } = wireResult;
          this._wiredData = wireResult;
          
         if(data)
         {
             this.mycon = data;
         }
         if(error)
         {
             this.myerror = error;
         }
     }

    @track recordId;

    handleContactDelete(event)
    {
        this.recordId = event.target.value;
        console.log(this.recordId);
        deleteRecord(this.recordId)
        .then(() =>{
            const toastEvent = new ShowToastEvent({
            title:'Record Deleted',
            message:'Record deleted successfully',
            variant:'success',
        })
         this.dispatchEvent(toastEvent);
        return refreshApex(this._wiredData);
        })
        .catch(error =>{
           alert('Unable to delete record due to ' + error.body.message);
        }
        );
    }

    
}