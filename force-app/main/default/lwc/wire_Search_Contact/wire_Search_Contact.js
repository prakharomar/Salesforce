import { LightningElement, wire } from 'lwc';
import bringcon from '@salesforce/apex/search_contact.getContacts';



export default class Wire_Search_Contact extends LightningElement 
{
     /* wire a property */
 
    input ;
    inputtext(event)
    {
        this.input = event.target.value;
    }
    @wire(bringcon,{searchkey:'$input'}) prak;


    /* wire a function */
    mydata ;
    myerror ;
    

    @wire(bringcon,{searchkey:'$input'})  funrup({error, data})
                                                    {
                                                        if(data)
                                                        {
                                                            this.mydata = data;
                                                        }
                                                        else
                                                        {
                                                            this.myerror = error;
                                                        }
                                                    }
}