import { LightningElement,wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getRecords from '@salesforce/apex/RelatedListController.getRecords';
import getAllRecords from '@salesforce/apex/RelatedListController.getAllRecords';
import getContactList from '@salesforce/apex/RelatedListController.getContactList';

const columns = [
    { label: 'Account Name', fieldName: 'linkAccount', type: 'url', 
        typeAttributes: {
            label: { fieldName: 'Name' },
            target: '_blank' , sortable: "true",
        } 
    },
    { label: 'Account Number', fieldName: 'AccountNumber', type: 'text'},
    { label: 'Phone', fieldName: 'Phone', type: 'text'},
    { label: 'Created Date', fieldName: 'CreatedDate', type: 'text'}
];
 
export default class CustomDatatableDemo extends NavigationMixin( LightningElement ) {
    columns = columns;
    data = [];
    error;
    totalNumberOfRows = 0; // stop the infinite load after this threshold count
    // offSetCount to send to apex to get the subsequent result. 0 in offSetCount signifies for the initial load of records on component load.
    offSetCount = 0;
    loadMoreStatus;
    targetDatatable; // capture the loadmore event to fetch data and stop infinite loading

    contacts;
    error;
            @wire(getContactList)
        wiredContacts({ error, data }) {
        if (data) {
                    console.log('data: ', data.length);
                    this.totalNumberOfRows = data.length;
                    this.contacts = data;
                    console.log('this.contacts: ', this.contacts);
                    this.error = undefined;
                } else if (error) { 
                console.log('error ', error);
                    this.error = error; 
                console.log('this.error: ', this.error); 
                this.contacts = undefined;
                }
            }
     doSorting(event) {
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
        this.sortData(this.sortBy, this.sortDirection);
    }

    sortData(fieldname, direction) {
        let parseData = JSON.parse(JSON.stringify(this.data));
        // Return the value stored in the field
        let keyValue = (a) => {
            return a[fieldname];
        };
        // cheking reverse direction
        let isReverse = direction === 'asc' ? 1: -1;
        // sorting data
        parseData.sort((x, y) => {
            x = keyValue(x) ? keyValue(x) : ''; // handling null values
            y = keyValue(y) ? keyValue(y) : '';
            // sorting values based on direction
            return isReverse * ((x > y) - (y > x));
        });
        this.data = parseData;
    }   
    connectedCallback() {
        //Get initial chunk of data with offset set at 0
        console.log('here');
        this.getRecords();
        const data = sessionStorage.getItem('myData');
        console.log('session storage',data);
        sessionStorage.removeItem('myData');
          const data1 = sessionStorage.getItem('myData');
        console.log('session storage 2',data1);
    }
 
    getRecords() {
        getRecords({offSetCount : this.offSetCount})
            .then(result => {
                // Returned result if from sobject and can't be extended so objectifying the result to make it extensible
                result = JSON.parse(JSON.stringify(result));
                result.forEach(record => {
                    record.linkAccount = '/' + record.Id;
                });
                this.data = [...this.data, ...result];
                this.error = undefined;
                this.loadMoreStatus = '';
                if (this.targetDatatable && this.data.length >= this.totalNumberOfRows) {
                    //stop Infinite Loading when threshold is reached
                    this.targetDatatable.enableInfiniteLoading = false;
                    //Display "No more data to load" when threshold is reached
                    this.loadMoreStatus = 'No more data to load';
                }
                //Disable a spinner to signal that data has been loaded
                if (this.targetDatatable) this.targetDatatable.isLoading = false;
            })
            .catch(error => {
                this.error = error;
                this.data = undefined;
                console.log('error : ' + JSON.stringify(this.error));
            });
    }
 
    // Event to handle onloadmore on lightning datatable markup
    handleLoadMore(event) {
        event.preventDefault();
        // increase the offset count by 20 on every loadmore event
        this.offSetCount = this.offSetCount + 10;
        //Display a spinner to signal that data is being loaded
        event.target.isLoading = true;
        //Set the onloadmore event taraget to make it visible to imperative call response to apex.
        this.targetDatatable = event.target;
        //Display "Loading" when more data is being loaded
        this.loadMoreStatus = 'Loading';
        // Get new set of records and append to this.data
        this.getRecords();
    }
}