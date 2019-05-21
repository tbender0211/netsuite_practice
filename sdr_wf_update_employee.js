/**
 * @NApiVersion 2.x
 * @NScriptType workflowactionscript
 */

 define(["N/record", "N/runtime"],
    function(record, runtime){

        function onAction(context){
            var workflowTotal = runtime.getCurrentScript().getParameter({
                name : "custscript_sdr_workflow_total"
            });

            var expRep = context.newRecord;
            var expCount = expRep.getLineCount({sublistId : "expense"});
            var empId = expRep.getValue("entity");
            var notes = "Workflow Total: " + workflowTotal + "\n" +
                        "Expense Count: " + expCount;

            var employee = record.load({
                type : record.Type.EMPLOYEE,
                id : empId
            });

            employee.setValue("comments", notes);
            empId = employee.save();

            if (!empId) {
                return "failed";
            }
            
            return "success";
        };

        return {
            onAction : onAction
        }
    })