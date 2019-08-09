/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define([],
    function(){

        function pageInit(context) {
            var customer = context.currentRecord;

            var prefCount = customer.getLineCount({
                sublistId : "recmachcustrecord_sdr_prod_pref_customer"
            });

            var message = "This customer has " + prefCount + " product preferences.";

            alert(message);

        };

        function lineInit(context) {
            var customer = context.currentRecord;

            customer.setCurrentSublistValue({
                sublistId : "recmachcustrecord_sdr_prod_pref_customer",
                fieldId : "custrecord_sdr_prod_pref_qty",
                value : 1
            });
        };

        function validateLine(context) {
            var customer = context.currentRecord;

            var prefQty = customer.getCurrentSublistValue({
                sublistId : "recmachcustrecord_sdr_prod_pref_customer",
                fieldId : "custrecord_sdr_prod_pref_qty"
            });

            if (prefQty > 10) {
                alert("Preferred quantity for a single item cannot exceed 10.")
                return false;
            };

            return true;
        };

        function saveRecord(context) {
            var customer = context.currentRecord;

            var prefCount = customer.getLineCount({
                sublistId : "recmachcustrecord_sdr_prod_pref_customer"
            });

            var prefQtyTotal = 0;

            for (var i=0; i < prefCount; i++) {
                var prefQty = customer.getCurrentSublistValue({
                    sublistId : "recmachcustrecord_sdr_prod_pref_customer",
                    fieldId : "custrecord_sdr_prod_pref_qty",
                    line : i
                });

                prefQtyTotal += prefQty;
            };

            if (prefQtyTotal > 25) {
                alert("Total product preference quantities across all items cannot exceed 25")
                return false;
            };

            return true;
        };

        return {
            pageInit : pageInit,
            lineInit : lineInit,
            validateLine : validateLine,
            saveRecord : saveRecord
        };


    });