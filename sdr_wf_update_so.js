/**
 * @NApiVersion 2.x
 * @NScriptType workflowactionscript
 */

 define(["N/record", "N/runtime"],
    function(record, runtime) {
        
        function onAction(context) {
            var orderDate = runtime.getCurrentScript().getParameter({
                name : "custscript_sdr_order_date"
            });

            var salesOrder = context.newRecord;
            var itemsOrdered = salesOrder.getLineCount({sublistId : "item"});
            var notes = "Last Order Date: " + orderDate + "\n" +
                        "Unique Items Ordered: " + itemsOrdered;
            var customerId = salesOrder.getValue("entity");
            
            var customer = record.load({
                type : record.Type.CUSTOMER,
                id : customerId
            });

            customer.setValue("comments", notes);
            customerId = customer.save();

            if (!customerId) {
                return "failed";
            };

            return "success";
        };

        return {
            onAction : onAction
        }
    })