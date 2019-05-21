/**
 * @NApiVersion 2.0
 * @NScriptType UserEventScript
 */

 define(["N/record"],
    function(record){

        function beforeSubmit(context) {
            var customer = context.currentRecord;

            if (context.type == context.UserEventType.CREATE) {
                var salesRep = customer.getValue("salesrep");

                if (!salesRep) {
                    throw "Save failed. Please make sure that the Sales Rep field is not empty.";
                }
            }
        }

        function afterSubmit(context) {
            var customer = context.currentRecord;

            var event = record.create({
                type: record.Type.EVENT,
            });

            event.setValue({
                "title" : "Welcome Conversation with " + customer.id,
                "remindertype" : "Email",
                "company" : customer.id,
                
            })
        }

        return {
            beforeSubmit : beforeSubmit
        }
    })