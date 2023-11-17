<<<<<<< HEAD
import { LightningElement, wire, track,api} from 'lwc';
import pasdata from '@salesforce/apex/CL_BringAllCon.pasdata';
import getContactRecords from '@salesforce/apex/ContactController.getContactRecords';
import getAccount from '@salesforce/apex/ContactController.getAccount';
import getTask from '@salesforce/apex/ContactController.gettask';
import internationalizationPropertyName from '@salesforce/i18n/internationalizationProperty';

export default class HelloWorld extends LightningElement
{

  
  currentPageReference = null; 
    urlStateParameters = null;
    limitrec =[];
    type;
    currentUrl;
    @track res ;
    greeting = 'World';
    test = true;
    pasname;
    value ;
    pasObj ={};
    rec;
    changeHandler(event) {
      this.greeting = event.target.value;
    }

   options = {
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true, // Use 12-hour format with AM/PM
        };
    connectedCallback() {
      sessionStorage.setItem('myData','this.value');
      //this.rec = JSON.stringify(this.recordId);
      // console.log('type of', typeof (this.recordId));
      // console.log('type of json', typeof (this.rec));
      // console.log('type of parse', typeof (JSON.parse(this.recordId)));
      //   if(this.type=='standard__namedPage'){
      //         console.log('Named Page connectedcall');
      //       }
      //       else{
      //         console.log('Not Named Page connectedcall');
      //       }
    }

    handleClick(event){
      console.log('Hello there in utlity bar');
     // window.location.reload();
     const value = 'Hello from LWC';
     const valueChangeEvent = new CustomEvent('valuechange') ;
     console.log('Ready to dispatch');
     this.dispatchEvent(valueChangeEvent);
     this.currentUrl = window.location.href;
     if(this.currentUrl.includes('popout')){
        window.close();
     }
     
    }
    handleNewClick(event){
    
       const inputElement = this.template.querySelector('.tst');

        // Clear the input field by setting its value to an empty string
        inputElement.value = '';
    }

    @wire(pasdata)
    wiredDa({ error, data }) {
      if (data) {
        this.pasObj = data;
        this.pasname = data.Name;
       console.log('this.pasObj', this.pasObj);
        console.log('Data', data);
      } else if (error) {
        console.error('Error:', error);
      }
    }

    columns = [
        { label: 'Created Date', fieldName: 'accLink', 
           type: 'url',
           typeAttributes: {label: { fieldName: 'CreatedDate' }}
        },
            

       // { label: 'Subject', fieldName: 'Subject', type: 'text' },
        { label: 'OwnerName', fieldName: 'OwnerName', type: 'text' },
       // { label: 'OwnerUserName', fieldName: 'OwnerUsername', type: 'text' },
    ];

    @api recordId; 
    contactList;

    // @wire(getContactRecords)
    // contactListRec({data,error}){
        
    //     if(data){
    //         console.log('data : ',data);
            
    //         this.contactList = data.map(value=>{
    //             return{...value,OwnerName:value.Owner.Name,OwnerUsername:value.Owner.Username}
    //         });
    //         console.log('this.contactList ' ,JSON.stringify(this.contactList));
    //     }else if(error){
    //         console.log('error',error);
    //     }
    // }
formattedDate;
    @wire(getTask)
    contactListRec({data,error}){
        
        if(data){
            console.log('data : ',data);
            
            // this.contactList = data.slice(0,1);
            console.log('before' , this.contactList);
            this.contactList = data.map(value=>{
              let d = new Date(value.CreatedDate);
               console.log('Date -->', d);
             
                 console.log('d.toLocaleDateString(); -->', d.toLocaleDateString());
                  console.log('d.getMonth(); -->', d.getMonth() + 1);
                  console.log('d.getDay() -->', d.getDate());
                   console.log('d.getFullYear(); -->', d.getFullYear());
                    let month = String(d.getMonth() + 1).padStart(2, '0');
            let day = String(d.getDate()).padStart(2, '0');
            let year = d.getFullYear();
                   let hours = String(d.getHours()).padStart(2, '0');
               let minutes = String(d.getMinutes()).padStart(2, '0');
            let ampm = d.getHours() >= 12 ? 'PM' : 'AM';
              let formattedDate = `${month}/${day}/${year}, ${hours}:${minutes} ${ampm}`;

                    console.log('this.formattedDate',formattedDate);
                let dateString = d.getMonth() + 1 +'-'+d.getDate()+'-'+d.getFullYear();

                return{...value,OwnerName:value.Owner.Name,accLink: '/' + value.Id,CreatedDate:formattedDate}
            });
          //  this.contactList = data.map(value=>{
              
          //      console.log('Date -->',value.CreatedDate);
          //       //return{...value, CreatedDate: new Intl.DateTimeFormat(['ban', 'id']).format(CreatedDate)}
          //   });
              console.log('after' , this.contactList);
            if(this.type=='standard__namedPage'){
              console.log('Named Page');
            }
            else{
              console.log('Not Named Page');
            }

            // let Subject;
            // this.contactList = data.map(row => { 
            //     Subject = `/${row.Id}`;
            //     return {...row , Subject} 
            // })
            console.log('this.contactList ' ,JSON.stringify(this.contactList));
        }else if(error){
            console.log('error',error);
        }
    }
    accountrec ;
    
    // recordIdString = this.recordId.toString();
    
  
=======
import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement 
{
    greeting = 'World';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
>>>>>>> f4d970963077af1170b3d65d2a43c50573f0d34b
}