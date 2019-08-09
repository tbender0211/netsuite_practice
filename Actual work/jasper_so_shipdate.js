/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define([],
    function() {
        function fieldChanged(context) {
            var currRec = context.currentRecord;
            var requestedShipFld = 'custbody_jasper_requestedshipdate_1';
            var scheduledShipFld = 'custbody_jasper_scheduledshipdate';

            if (context.fieldId == requestedShipFld) {
                var reqShipDate = currRec.getValue(requestedShipFld);

            } else if (context.fieldId == scheduledShipFld) {
                var schedShipDate = currRec.getValue(scheduledShipFld);
            }

        };

        function validateLine(context) {
            var currRec = context.currentRecord;
            var requestedShip = currRec.getValue('custbody_jasper_requestedshipdate_1');
            var scheduledShip = currRec.getValue('custbody_jasper_scheduledshipdate');

        };
        
        function saveRecord(context) {
            var currRec = context.currentRecord;
            var requestedShip = currRec.getValue('custbody_jasper_requestedshipdate_1');
            var scheduledShip = currRec.getValue('custbody_jasper_scheduledshipdate');

        };

        return {
            fieldChanged : fieldChanged,
            validateLine : validateLine,
            saveRecord : saveRecord
        }
    })