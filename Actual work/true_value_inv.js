/**
 * @NApiVersion 2.x
 * @NScriptType WorkflowActionScript
 */

 define([],
    function(search, record, runtime) {
        function onAction(context) {

            var invoice = context.newRecord;
            var shipAdd = invoice.getValue('shippingaddress');

            log.debug('Old Shipping Address: ', shipAdd)

            invoice.setValue('entity', '1338');
            invoice.setValue('shippingaddress', shipAdd);

            var newAdd = invoice.getValue('shippingaddress');
            log.debug('New Shipping Address: ', newAdd);

            invId = invoice.save();

            if (!invId) {
                return 'failed';
            }

            return 'success';

        }
        return {
            onAction : onAction
        }
    })