import { LightningElement, track, api} from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ModalDemoInLWC extends LightningElement 
{
    @track isShowModal = false;
    fname;
    lname ;
    emaill;
    phn;
    faxxx;
    @api recordId;
    accounid;
    showModalBox() {  
        this.isShowModal = true;
    }

    hideModalBox() {  
        this.isShowModal = false;
    }
    lnamechn(event)
    {
        this.lname = event.target.value;
        
    }
    fnamechn(event)
    {
        this.fname = event.target.value;
    }

    
    faxchange(event)
    {
        this.faxxx = event.target.value;
    }


    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Contact Created',
            message: 'Contact Creation sucessful',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
       
    }

   
    saveContact()
    {
        const fields ={'LastName':this.lname , 'AccountId': this.recordId, 'FirstName':this.fname, 'Fax':this.faxxx};

        //step - 2 Create API object + fields
        const recordData1 ={apiName:'Contact',fields};
        
      
        //step - 3 use in imperation
        createRecord(recordData1)
        .then(this.showSuccessToast()).catch(
          //  alert('Error')
        );
        this.hideModalBox();
        
    }
}