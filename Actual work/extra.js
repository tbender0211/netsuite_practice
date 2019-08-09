function fieldChanged(context) {
    var salesOrder = context.currentRecord;
    var field = context.fieldId;

    var creditLimit = salesOrder.getValue('custbody_creditlimit');
    var creditBalance = salesOrder.getValue('custbody_balance');
    var override = salesOrder.getValue('custbody_creditoverride');
    var unbilled = salesOrder.getValue('unbilledorders');
    var overdueBalance = salesOrder.getValue('custbody_overdue_balance');

    var totalBalance = (creditBalance + unbilled);

    var spHold = salesOrder.getValue('custbody_slowpay_hold');

    //Function that checks if a hold needs to be placed on an account
    function holdCheck() {
        if (overdueBalance > 0) {
            salesOrder.setValue({
                fieldId: 'custbody_slowpay_hold',
                value: true
            });

            alert('There is a Slow Pay Hold on this Customer account.');
        } else if (totalBalance > creditLimit) {
            salesOrder.setValue({
                fieldId: 'custbody_limitexceeded',
                value: true
            });

            alert('There is a Credit Limit Hold on this Customer account.');
        } else return true;
    };

    //Function to clear hold checkboxes
    function resetHolds() {
        salesOrder.setValue({
            fieldId: 'custbody_slowpay_hold',
            value: false
        });

        salesOrder.setValue({
            fieldId: 'custbody_limitexceeded',
            value: false
        });
    };

    //Calling our hold check function when customer field is changed
    if (field === 'entity' && override === false) {
        resetHolds();
        holdCheck();
    };

    //Unchecks the hold checkboxes if AR override is checked
    if (field === 'custbody_creditoverride') {
        if (override === true) {
            resetHolds();
            //Calling our hold check function when the AR override is toggled to off
        } else {
            holdCheck();
        }
        return true;
    };
};






define([], function() {
   
    function saveRecord(context) {
        var salesOrder = context.currentRecord;

        var creditLimit = salesOrder.getValue('custbody_creditlimit');
        var creditBalance = salesOrder.getValue('custbody_balance');
        var overdueBalance = salesOrder.getValue('custbody_overdue_balance');
        var override = salesOrder.getValue('custbody_creditoverride');
        var orderTotal = salesOrder.getValue('total');
        var unbilled = salesOrder.getValue('unbilledorders');

        const totalBalance = (creditBalance + orderTotal + unbilled);
        const creditDiff = (totalBalance - creditLimit);

        if (overdueBalance > 0) {
            salesOrder.setValue({
                fieldId: 'custbody_slowpay_hold',
                value: true
            });

            alert('Overdue balance, slowpay hold')
        } else if (totalBalance > creditLimit) {
            salesOrder.setValue({
                fieldId : 'custbody_limitexceeded',
                value : true
            });

            alert('balance exceeds credit limit, CR hold')
        };

        return true;
    }
    return {
        saveRecord: saveRecord
    };
});