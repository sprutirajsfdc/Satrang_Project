({
    doInit: function(component, event, helper) {
        // Initialize the component
        var action = component.get("c.getarticle");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reso", response.getReturnValue());
            } else {
                // Handle error state or display an error message
            }
        });
        $A.enqueueAction(action);
    },
    handleRadioChange: function(component, event, helper) {
        var selectedValue = event.getSource().get("v.value");
        component.set("v.selectedRecordType", selectedValue);
    },
    searchKeyChange: function(component, event, helper) {
        // Handle search key change event
        var searchKey = event.getParam("searchKey");
        var action = component.get("c.Findgetarticle");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.reso", response.getReturnValue());
            } else {
                // Handle error state or display an error message
            }
        });
        $A.enqueueAction(action);
    }
})