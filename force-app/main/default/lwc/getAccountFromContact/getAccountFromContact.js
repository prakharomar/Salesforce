import { LightningElement, wire, api } from 'lwc';

import show from '@salesforce/apex/CL_1404_LWC_Account.getAccount';


export default class GetAccountFromContact extends LightningElement 
{
    @api recordId;
    data1 ='';
    error ='';
    
    @wire(show , { recordId: '$recordId' })
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