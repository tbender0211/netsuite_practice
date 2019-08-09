/**
 * @NApiVersion 2.x
 * @NScriptType UserEventScript
 */

 define(["N/redirect"],
    function (redirect) {
        function afterSubmit(context) {
            var itemRecord = context.newRecord;

            redirect.toSuitelet({
                scriptId : "customscript_update_item_values",
                deploymentId : "customdeploy_update_item_values",
                parameters : {
                    st_itemId : itemRecord.getValue("itemid")
                }
            });
        }
        return {
            afterSubmit : afterSubmit
        }
    });