/**
 * @NApiVersion 2.0
 * @NScriptType UserEventScript
 */

 define(["N/record", "N/redirect"],
    function(record, redirect) {

        return {
            afterSubmit : function(context) {
                var employee = context.newRecord;

                if (context.type == context.UserEventType.CREATE) {

                    var event = record.create({
                        type: record.Type.EVENT,
                        isDynamic : true
                    });
                    event.setValue("title", "Welcome meeting with supervisor");

                    event.selectNewLine({
                        sublistId : "attendee"
                    });
                    event.setCurrentSublistValue({
                        sublistId : "attendee",
                        fieldId : "attendee",
                        value : employee.id
                    });
                    event.commitLine({
                        sublistId : "attendee"
                    });


                    event.selectNewLine({
                        sublistId : "attendee",
                    });
                    event.setCurrentSublistValue({
                        sublistId : "attendee",
                        fieldId : "attendee",
                        value : employee.getValue("supervisor")
                    });
                    event.commitLine({
                        sublistId : "attendee"
                    });

                    event.save();
                };

                redirect.toSuitelet({
                    scriptId : "customscript_sdr_sl_update_emp_notes",
                    deploymentId : "customdeploy_sdr_sl_update_emp_notes",
                    parameters : {
                        sdr_name : employee.getValue("entityid"),
                        sdr_notes : employee.getValue("comments"),
                        sdr_empid : employee.id
                    }
                });
            }
        };
    });

