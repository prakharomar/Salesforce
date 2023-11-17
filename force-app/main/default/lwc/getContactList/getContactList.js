import { api, LightningElement, wire,track } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';



import GetContact from '@salesforce/apex/CL_Get_Contacts_LWC.getRecord';

export default class GetContactList extends LightningElement {

    data1 ='';
    error ='';

    @api recordId;

    closeModal() {
      this.dispatchEvent(new CloseActionScreenEvent());
      }

    @wire(GetContact , { recordId: '$recordId' })
    wiredRecordsMethod({ error, data }) {
      if (data) 
      {
        this.data1 = data;
      } 
      else if (error)
      {
        this.error = error;
      }
    }
    @track isShowModal = false;

    showModalBox() {  
        this.isShowModal = true;
    }

    hideModalBox() {  
        this.isShowModal = false;
    }
    handlePDF(){
    	window.print();
	  }
}