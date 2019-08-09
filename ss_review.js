/**
 * @NApiVersion 2.x
 * @NScriptType UserEventScript
 */

 define(["N/record", "N/email", "N/runtime"],
    function(record, email, runtime) {

        function afterSubmit(context) {
            var customer = context.newRecord;
            var user = runtime.getCurrentUser();
            var sender = user.getValue("entityid");
            var recipient = customer.getValue("entityid");

            if (context.type == context.UserEventType.CREATE) {

                email.send({
                    author: sender,
                    recipient : recipient,
                    subject : "Welcome to SuiteDreams",
                    body : "Welcome! We are glad for you to be a customer of SuiteDreams."
                })
            };



        };

        return {
            afterSubmit : afterSubmit
        };
    })