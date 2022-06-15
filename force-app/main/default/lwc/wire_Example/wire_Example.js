import { LightningElement, wire, api } from 'lwc';
import showacc from '@salesforce/apex/Wire_Data_Display.getAcc' ;

const col = [
    { label: 'Label', fieldName: 'Name', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'phone', editable: true },
    { label: 'Industry', fieldName: 'Industry', type: 'text', editable: true },
    { label: 'Rating', fieldName: 'Rating', type: 'picklist',editable: true },
];


export default class Wire_Example extends LightningElement 
{
    columnnnn =col;
    @wire(showacc) mydata;

}