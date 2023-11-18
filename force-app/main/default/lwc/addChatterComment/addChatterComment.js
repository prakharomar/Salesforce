import { LightningElement, api } from 'lwc';
import addComment from '@salesforce/apex/AccountFetech.addComment';

export default class AddChatterComment extends LightningElement {

    comment;
    @api recordId;

    handleChange(event){
        this.comment = event.target.value;
    }

    handleClick(event){

        addComment({recordId : this.recordId, comment: this.comment})
        .then(result =>{
            console.log('Result', result);
        });
    }

}