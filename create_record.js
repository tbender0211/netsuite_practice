/**
 * @NApiVersion 2.0
 * @NScriptType UserEventScript
 */

 define(["N/record"],
  /**
  * 
  * @param {record} record 
  */
    function(record) {
        
        return {
            afterSubmit : function(context) {
                var customer = context.newRecord;
                var salesRep = customer.getText("salesrep");
                
                if(context.type == context.UserEventType.CREATE) {
                    var task = record.create({
                        type: record.Type.TASK                        
                    });
                };

                task.setValue("title", "New Customer Follow-up");
                task.setValue("message", "Please take care of this customer and follow-up with them soon.");
                task.setValue("priority", "High");
                task.setValue("company", customer.id);
                task.setValue("assigned", salesRep);
                task.save();
            }
        }
 })

 