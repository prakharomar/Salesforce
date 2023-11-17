import { LightningElement, api,wire } from 'lwc';
import gettemp from "@salesforce/apex/TestweatherLWC.gettemp";

export default class TestweatherLWC extends LightningElement 
{
    @api recordId;

    @wire(gettemp,{ recordId: '$recordId' }) val;
    /*
    get getTempInCelsius() {
        if (this.val) {
           return (this.val.data - 273 );
        } else {
            return '---'
        }
    }
    */
   get getCountry()
   {
        if(this.val.data)
        return this.val.data.country == "GB";
        else
        return false;
   }
   get getCityName()
   {
        if(this.val.data)
        return this.val.data.cityName;
        else
        return 'Error in cityName';
   }
   get gettempInCelsius()
   {
       if(this.val.data)
        return this.val.data.cityTemp - 273;
        else
         return 'Error in Temp';
   }

   get getpressure()
   {
       if(this.val.data)
       return (this.val.data.pressure);
       else
        return 'Error in Pressure';
   }

   get getMinTemp()
   {
       if(this.val.data)
       return (this.val.data.temp_min - 273);
       else
        return 'Error in Temp Min';
   }
   get getMaxTemp()
   {
       if(this.val.data)
       return (this.val.data.temp_max - 273);
       else
        return 'Error in Temp Max';
   }

   get getSunrise()
   {
       if(this.val.data)
       return (this.val.data.sunrise);
       else
        return 'Error in Sunrise';
   }
   get getSunset()
   {
       if(this.val.data)
       return (this.val.data.sunset);
       else
        return 'Error in Sunset';
   }

}