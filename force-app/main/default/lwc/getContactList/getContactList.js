<<<<<<< HEAD
import { api, LightningElement, wire,track } from 'lwc';
import { CloseActionScreenEvent } from 'lightning/actions';


=======
import { api, LightningElement, wire } from 'lwc';
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b

import GetContact from '@salesforce/apex/CL_Get_Contacts_LWC.getRecord';

export default class GetContactList extends LightningElement {

    data1 ='';
    error ='';

    @api recordId;

<<<<<<< HEAD
    closeModal() {
      this.dispatchEvent(new CloseActionScreenEvent());
      }

=======
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
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
<<<<<<< HEAD
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
=======
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
}