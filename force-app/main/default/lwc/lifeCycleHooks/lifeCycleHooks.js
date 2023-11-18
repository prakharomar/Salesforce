import { LightningElement } from 'lwc';
export default class LifeCycleHooks extends LightningElement {

    constructor(){
        super();
        // Initialization logic here
    }

    connectedCallback() {
        // DOM is ready
        // Fetch data or setup here
    }

    renderedCallback(){
        // Executed after the component's DOM has been updated
    }

    disconnectedCallback() {
        // Cleanup tasks when the component is removed
    }

    errorCallback(error, stack) {
        // Handle or log error that occured during the lifecycle
    }

}