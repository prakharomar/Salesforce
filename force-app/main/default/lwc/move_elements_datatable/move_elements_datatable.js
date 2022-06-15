import { LightningElement, wire } from 'lwc';

import getcontacts from '@salesforce/apex/CL_BringAllCon.allCon'

const coool=[
        {label: 'First Name' ,fieldName :'FirstName'},
        {label: 'Last Name' ,fieldName :'LastName'},
        {label: 'Email' ,fieldName :'Email'},
        {label: 'Phone' ,fieldName :'Phone'}
];

export default class Move_elements_datatable extends LightningElement 
{
    contactdata1;
    contactdata2 = [];
    error;
    col =coool;
    initallength = 0;

    @wire(getcontacts) result({error,data})
    {
                if(data)
                {
                    this.contactdata1 = data;
                    this.initallength = this.contactdata1.length;
                    this.error = undefined;
                }
                if(error)
                {
                    this.error = error;
                }
    }

    handlechange(event)
    {
        var selected = event.detail.selectedRows;
        var temp;

        if(!selected.length)
        {
            return;
        }

        else if(event.detail.selectedRows.length == this.initallength )
        {
            this.contactdata2 = event.detail.selectedRows;
            this.contactdata1 =[];   
            return;
        }
        else
        {
            temp = Object.assign([], this.contactdata2);

            let obj2 = Object.assign({},selected[0]);
            temp[temp.length] = obj2;
            this.contactdata2 = temp;

            temp = Object.assign([], this.contactdata1);
            temp.splice(this.contactdata1.findIndex(row=>row.Id== selected[0].Id),1);
            this.contactdata1 = temp;
        }

    }
}