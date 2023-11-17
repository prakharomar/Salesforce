import { LightningElement, api, wire } from 'lwc';

import GetContact from '@salesforce/apex/GetAccount.getRecord';

export default class GetAccountInfo extends LightningElement 
{
    @api recordId;

    data1 ='';
    error ='';

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