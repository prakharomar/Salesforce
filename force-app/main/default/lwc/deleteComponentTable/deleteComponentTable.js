import { LightningElement, wire , track} from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';


export default class DeleteComponentTable extends LightningElement 
{
   // @wire(displayAcc) acc ; 
    @track recordId;

    
}