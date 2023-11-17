import { LightningElement } from 'lwc';
export default class LightningRecordPicker extends LightningElement {
    
    id;
    
    //on type we do search record according below marching where clouse
    matchingInfo = {
        primaryField: { fieldPath: "Name" },
        additionalFields: [{ fieldPath: "Email" }],
    };
    // shows field in the display list
    displayInfo = {
        additionalFields: ["Email"],
    };

    // filter Contacts having email
    filter = {
        criteria: [
            {
                fieldPath: "Email",
                operator: "ne",
                value: "",
            }
        ],
    };

    handleChange(event) {
        console.log(`Selected record: ${event.detail.recordId}`);
        this.id = event.detail.recordId;
    }

}