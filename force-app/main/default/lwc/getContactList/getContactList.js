import { api, LightningElement, wire } from 'lwc';

import GetContact from '@salesforce/apex/CL_Get_Contacts_LWC.getRecord';

export default class GetContactList extends LightningElement {

    data1 ='';
    error ='';

    @api recordId;

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
}