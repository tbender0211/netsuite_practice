/**
 * @NApiVersion 2.x
 * @NScriptType UserEventScript
 */

 define(["N/redirect"],
     function(redirect) {

        function afterSubmit(context) {
            var salesOrder = context.newRecord;

            redirect.toSuitelet({
                scriptId : "customscript_sdr_sl_salesorder_finance",
                deploymentId : "customdeploy_sdr_sl_salesorder_finance",
                parameters : {
                    sdr_ordernum : salesOrder.getValue("tranid"),
                    sdr_cust : salesOrder.getValue("entity"),
                    sdr_total : salesOrder.getValue("total"),
                    sdr_financing : salesOrder.getValue("custbody_sdr_financing_price"),
                    sdr_orderintid : salesOrder.getValue("salesorder")
                }
            });
        };

        return {
            afterSubmit : afterSubmit
     }
 })