/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define (["N/ui/message"],

     function (message) {

         function pageInit(context) {
             
            var message =  message.create({
                type : message.Type.CONFIRMATION,
                title : "On-boarding Process Complete",
                message : "The new employee has now been properly set up. You can use this form for another new employee."
            });
            
            var form = context.currentRecord;
            var checked = form.getValue("custpage_submit_checkbox");

            if (checked == true) {

                message.show({duration : 1000});

            }
            
         };

         function saveRecord(context) {

         };
 
    return {
        pageInit : pageInit,
        saveRecord : saveRecord
    }
});