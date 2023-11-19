import { LightningElement,wire } from 'lwc';
import fetchRecords from '@salesforce/apex/AccountFetech.fetchRecords' ;

export default class WireManualCall extends LightningElement {

    componentStatus = 'loading';

    // Send a dummy variable to apex method as a param
    // apex will rececive the parameter
    // and will do anything with it
    @wire(fetchRecords, { componentName: this.componentStatus })
    fetchedRecordList({ error, data }) {

      if (data) {
          // post processing 
      } 

      else if (error) {
         // post error
      }
    }

    handleClick(event){
        // mutate the variable, because of reactivity
        // it will reinvoke the wire method
        this.componentStatus = 'reRender';
    }

}