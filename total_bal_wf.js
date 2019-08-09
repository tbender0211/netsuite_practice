/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

define(['N/record'], 
    function(record) {

        function saveRecord(context) {
            var salesOrder = context.currentRecord;
            var dealerId = salesOrder.getValue('entity');

            console.log(dealerId);

            var dealer = record.load({
                type: record.Type.CUSTOMER,
                id: dealerId
            });

            var unbilledChild = salesOrder.getValue('custbody_unbilled_orders');
            var consolUnbilled = dealer.getValue('consolunbilledorders');
            var unbilledParent = consolUnbilled - unbilledChild;

            var balanceChild = salesOrder.getValue('custbody_balance');
            var balanceParent = dealer.getValue('custentity_cust_parent_bal');

            var orderTotal = salesOrder.getValue('total');
            var directBill = salesOrder.getValue('custbody_direct_bill_code');
            var partsTotal = salesOrder.getValue('custbody_parts_total');
            var orderType = salesOrder.getValue('custbody_ge_order_type');

            if (context.mode === 'create') {

                if (!directBill || (directBill == 'TA' && partsTotal < 350)) {
                    var totalBal = unbilledChild + balanceChild + orderTotal;

                    salesOrder.setValue('custbody_total_balance', totalBal);
                };

                if (
                    (directBill && directBill != 'TA') ||
                    (directBill == 'TA' && orderType == 1 && partsTotal >= 350) ||
                    (directBill == 'TA' && orderType == 2)
                ) {
                    var totalBal = unbilledParent + balanceParent + orderTotal;

                    salesOrder.setValue('custbody_total_balance', totalBal);
                };
            };
        };

        function validateInsert(context) {
            var salesOrder = context.currentRecord;
            var sublistName = context.sublistId;

            if (sublistName === 'item' && context.mode === 'edit') {
                var oldBalance = salesOrder.getValue('custbody_total_balance');
                var itemPrice = salesOrder.getCurrentSublistValue({
                    sublistId : sublistName,
                    fieldId : ''
                })
                var newBalance = 
            }
        };
        return {
            saveRecord : saveRecord,
            validateInsert : validateInsert
        };
    }
);
