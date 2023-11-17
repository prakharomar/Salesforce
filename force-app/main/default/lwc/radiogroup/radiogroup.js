import { LightningElement, track } from 'lwc';
export default class Radiogroup extends LightningElement {
    @track options = [
        {label: 'a', value: 'a1'},
        {label: 'b', value: 'b1'},
        {label: 'c', value: 'c1'},
    ];
    @track value;

    handleCaseTypeChange(event) {
        console.log(event.target.value);
        this.value = event.target.value;
    }

    handleResetClick() {
        this.value = undefined;
    }
    clearValues(event){
        console.log('=:event.detail:=', event);
        console.log('=:event.target:=', event.target);
        console.log('=:event.target Details:=', event.detail);
        console.log('=DataSetId='+event.currentTarget.dataset.id);
        console.log('=Tag Id='+event.target.id);
        console.log('=Tag Name='+event.target.name);
        console.log('Event Name =', event.target);
        console.log('allFilters before Clear-->', this.allFilters); 
        //let target = this.template.querySelector('[data-id="Case Contact"]');
        console.log('=:this.filterMap In Clear:=', this.filterMap); 
        console.log('=Cleared this.allFilters =-->'+this.allFilters); 
        console.log('====this.value'+this.value);
        this.value = undefined;
        
        console.log('====this.value 1'+this.value);
    }
}