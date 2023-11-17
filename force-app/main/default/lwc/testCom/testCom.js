import { LightningElement, wire } from 'lwc';
import getPas from '@salesforce/apex/Wire_Data_Display.getPas';
export default class TestCom extends LightningElement {

    mydata ;
    myerror ;
    

    @wire(getPas) 
     funrup({error, data})
                                                    {
                                                        if(data)
                                                        {
                                                            this.mydata = data;
                                                            console.log('adat'+JSON.stringify(data));
                                                        }
                                                        else
                                                        {
                                                            this.myerror = error;
                                                            console.log('er111ror'+error);
                                                        }
                                                    }
}