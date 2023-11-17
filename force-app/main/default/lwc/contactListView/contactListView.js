import { LightningElement, wire, track} from 'lwc';
import getContacts from '@salesforce/apex/createListViewHelper.getConatcts';
import deleteContacts from '@salesforce/apex/createListViewHelper.deleteContacts';
import getSearchResult from '@salesforce/apex/createListViewHelper.getSearchResult';
import getContactsById from '@salesforce/apex/createListViewHelper.getContactsById';
import createContact from '@salesforce/apex/createListViewHelper.createContact';
import { NavigationMixin } from 'lightning/navigation';
import { CurrentPageReference } from 'lightning/navigation';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const ACTIONS = [
                    {label :'Delete', name:'delete'},
                    {label :'Edit', name:'edit'},
                    {label :'Details', name:'details'}
                ]

const COLS = [
            {label: 'Name', fieldName: 'link', type: 'url', typeAttributes : {label: {fieldName: 'FullName'}}, sortable: "true"},
            {label: 'Email', fieldName: 'Email',sortable: "true" },
            {label: 'Account', fieldName: 'accountlink', type: 'url', typeAttributes : {label: {fieldName: 'AccountName'}},sortable: "true"},
            {label: 'Mailing Address', fieldName: 'MailingAddress', sortable: "true"},
            {fieldName: "actions", type: 'action', typeAttributes : {rowActions : ACTIONS}}
            ]

export default class ContactListView extends NavigationMixin(LightningElement) {
    cols = COLS;
    contacts;
    wiredresult;
    selectedContacts;
    @track sortBy= 'FullName';
    @track sortDirection = 'asc';
    isShowModal = false;
    isShowModal2 = false;
    contactValueinModal =[];
    @track accountName;  
    @track accountRecordId;  
    currentContactId;

    checkForMaillingAddress = false;
    firstname;
    lastname;
    email;
    mailingAddress;
    accountName;
    currentModalAccountId;
    mailingStreet;
    mailingState;
    mailingCountry;
     currentPageReference = null; 
    urlStateParameters = null;

    get selectedContactLen(){
        if(this.selectedContacts == undefined) return 0;
        return this.selectedContacts.length;
    }

    recContact ={
        FirstName :  this.firstname,
        LastName : this.lastname,
        Email : this.email,
        AccountId : this.accountRecordId,
        MailingStreet : this.mailingStreet,
        MailingState :  this.mailingState,
        MailingCountry : this.mailingCountry,
        Id : this.currentContactId
    }
 @wire(CurrentPageReference)
    getPageReferenceParameters(currentPageReference) {
       if (currentPageReference) {
          console.log(currentPageReference);
          this.recordId = currentPageReference.attributes.recordId || null;
          let attributes = currentPageReference.attributes;
          let states = currentPageReference.state;
          let type = currentPageReference.type;
          console.log('type',type);
       }
    }
   @wire(getContacts)
    contactsWire(result){
        this.wiredContacts = result;
        if(result.data){
            this.contacts = result.data.map((row) => {
                return this.mapContacts(row);
            })
            
        }
        if(result.error){
            console.error(result.error);
        }
    }

    mapContacts(row){
     //   console.log(row)
        var name ='';
        var accName ='';
        var accLink ='';
        if(row.FirstName != undefined){
                name =  row.FirstName +' '+ row.LastName;
        }
        if(row.FirstName == undefined){
            name = `${row.LastName}`
        }

        if(row.AccountId != null){
            accName =  `${row.Account.Name}`;
            accLink = `/${row.AccountId}`;
        }

        var street = row.MailingStreet;
        if(row.MailingStreet == undefined){
            street ='';
        }
        var city = row.MailingCity;
        if(row.MailingCity == undefined){
            city ='';
        }
        var state = row.MailingState;
        if(row.MailingState == undefined){
            state ='';
        }
        var country = row.MailingCountry;
        if(row.MailingCountry == undefined){
            country ='';
        }
        var postalCode = row.MailingPostalCode;
        if(row.MailingPostalCode == undefined){
            postalCode ='';
        }


        return {...row,
          
             FullName: name,  
            link: `/${row.Id}`,
            AccountName :  accName,
            accountlink : accLink,
            MailingAddress : street +' '+city+' '+state+' '+ country+' '+ postalCode
            
        };
    }

    handleRowSelection(event){
        this.selectedContacts = event.detail.selectedRows;
    }
    
    navigateToNewPage(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
        });
    }
    handleRowAction(event) {
        console.log(event.detail.action.name);
        console.log(event.detail.row);
        if(event.detail.action.name == 'delete'){
             deleteContacts({contactIds : [event.detail.row.Id]})
             .then((result) => {
            refreshApex(this.wiredContacts);
            })
            .catch(error => {
                 console.log('error: ', error);
                    const evt = new ShowToastEvent({
                title: 'Bhenchoo maat kr delete',
                message: error.body.pageErrors[0].message,
                variant: 'error',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);              
            });
        }
        else if(event.detail.action.name == 'edit'){
         /*    this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                recordId: event.detail.row.Id,
                objectApiName: 'Contact',
                actionName: 'edit'
            },
        });*/
        this.isShowModal = true;
            getContactsById({contactIds : [event.detail.row.Id]})
            .then(result =>{
            
          console.log('result'+ result);
          console.log('result'+ JSON.stringify(result));
          this.contactValueinModal = result;
          this.recContact.FirstName = this.contactValueinModal[0].FirstName;
          this.recContact.LastName = this.contactValueinModal[0].LastName;
          this.recContact.Email = this.contactValueinModal[0].Email;
          this.recContact.MailingStreet = this.contactValueinModal[0].MailingStreet;
          this.recContact.MailingState = this.contactValueinModal[0].MailingState;
          this.recContact.MailingCountry = this.contactValueinModal[0].MailingCountry;
          this.accountName = this.contactValueinModal[0].Account.Name ;
          this.recContact.AccountId = this.contactValueinModal[0].AccountId;
          this.recContact.Id = event.detail.row.Id;
          console.log('Account Id'+this.contactValueinModal[0].AccountId );
       //   console.log('Email'+this.contactValueinModal[0].MailingCity );
            })
        }
        /// this will naviagte to open record in a new page 
        // that's why using gerernate Url in this case
        else if(event.detail.action.name == 'details'){
           this[NavigationMixin.GenerateUrl]({ 
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.row.Id,
                objectApiName: 'Contact',
                actionName: 'view'
            }
        }).then(url => {
        window.open(url, "_blank");
            });
        
        }
    }
    handleFirstNameChange(event){
        console.log('value in modal'+ event.target.value);
        this.recContact.FirstName = event.target.value;
    }
    handleLastNameChange(event){
         console.log('value in modal'+ event.target.value);
        this.recContact.LastName = event.target.value;
    }
    handleEmailChange(event){
        console.log('value in modal'+ event.target.value);
        this.recContact.Email = event.target.value;
    }
    handleStreetChange(event){
        console.log('value in modal'+ event.target.value);
        this.recContact.MailingStreet = event.target.value;
    }
    handleStateChange(event){
        console.log('value in modal'+ event.target.value);
        this.recContact.MailingState = event.target.value;
    }
    handleCountryChange(event){
        console.log('value in modal'+ event.target.value);
        this.recContact.MailingCountry = event.target.value;
    }

   onAccountSelection(event){  
        this.accountName = event.detail.selectedValue;  
        this.recContact.AccountId = event.detail.selectedRecordId;  
        console.log('this.accountName'+this.accountName);
        console.log('this.accountRecordId'+this.accountRecordId);
    }  
    
    handleAccountSelection(event){
        console.log("the selected record id is"+event.detail);
    }

    deleteSelectedContacts(){
        console.log('here in function');
        var idList = this.selectedContacts.map(row => { return row.Id});
        
        console.log('idList'+idList);
        deleteContacts({contactIds : idList})
        .then(() => {
          refreshApex(this.wiredContacts);
        })
        .catch(error => {
                 console.log('error: ', error);
                    const evt = new ShowToastEvent({
                title: 'Bhenchoo maat kr delete',
                message: error.body.pageErrors[0].message,
                variant: 'error',
                mode: 'dismissable'
            });
            this.dispatchEvent(evt);              
            });
        this.template.querySelector('lightning-datatable').selectedRows = [];
        this.selectedContacts = undefined;
    }
    
    handleSearch(event){
        
        getSearchResult({searchValue: event.target.value})
        .then(result =>{
            this.contacts = result.map((row) => {
                return this.mapContacts(row);
            })
        })

    }

    saveButton(){
        console.log("Record"+ this.recContact);
        console.log("Record"+ JSON.stringify(this.recContact));
        console.log("Herer"+ this.currentContactId);
        createContact({c : this.recContact})
        .then(() =>{
            console.log("Success");
            refreshApex(this.wiredContacts);
            window.location.reload();
        })
        .catch(error =>{
            console.log("error"+ JSON.stringify(error));
        });
        this.hideModalBox2();

    }

    doSorting(event) {
        
    let fieldName = event.detail.fieldName;
    fieldName = fieldName == 'link' ? 'FullName' : fieldName;
    fieldName = fieldName == 'accountlink' ? 'AccountName' : fieldName;
    let sortDirection = event.detail.sortDirection;
    this.sortBy = fieldName;
    this.sortDirection = sortDirection
    console.log('this.sortBy'+ fieldName);
    console.log('this.sortBy'+ sortDirection);
    
    let reverse = sortDirection !== "asc";
    let data_clone = JSON.parse(JSON.stringify(this.contacts));
    this.contacts = data_clone.sort(this.sortData(fieldName, reverse));
    // keep this line at the end to reset the name field back to url so we get the sort diections.
    this.sortBy = event.detail.fieldName;;
    
    }
 
 sortData(field, reverse, primer) {
    var key = function (x) {
      return primer ? primer(x[field]) : x[field];
    };
    return function (a, b) {
      var A = key(a),
        B = key(b);
      if (A === undefined) A = "";
      if (B === undefined) B = "";
      return (A < B ? -1 : A > B ? 1 : 0) * [1, -1][+!!reverse];
    };
 }
     

    hideModalBox() {  
        this.isShowModal = false;
    }
    test() {  
        this.isShowModal2 = true;
        this.hideModalBox();
    }

    hideModalBox2() {  
        this.isShowModal2 = false;
    }

    handleInput(event){

        if(this.template.querySelector('[data-id="input1"]').checked == true){
            this.checkForMaillingAddress = true;
        }
        else{
            this.checkForMaillingAddress = false;
        }

    }

}