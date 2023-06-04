({
    goToScreen2: function(component, event, helper) {
        // Validate if a record type is selected
        var selectedRecordType = component.get("v.selectedRecordType");
        if (selectedRecordType) {
            // Hide Screen 1 and show Screen 2
            component.set("v.showScreen1", false);
            component.set("v.showScreen2", true);
        } else {
            // Show an error message or perform appropriate validation handling
            alert("Please select a record type.");
        }
    },

    saveArticle: function(component, event, helper) {
        // Create a new record in the Knowledge object
        var createRecordEvent = $A.get("e.force:createRecord");
        var recordType = component.get("v.selectedRecordType");
        var recordTypeId;

        if (recordType === "FAQs") {
            recordTypeId = "0125i00000160HUAAY";
        } else if (recordType === "How-Tos") {
            recordTypeId = "0125i00000160HeAAI";
        }
       

        createRecordEvent.setParams({
            entityApiName: "Knowledge__kav",
            recordTypeId: recordTypeId,
            defaultFieldValues: {
                Title: component.get("v.title"),
                Question__c: component.get("v.question"),
                Answer__c: component.get("v.answer"),
                Summary__c: component.get("v.summary"),
                Environment__c: component.get("v.environment"),
                Content__c: component.get("v.content"),
                Internal_Resolution__c: component.get("v.internalResolution")
            }
        });

        createRecordEvent.fire();
    }
})