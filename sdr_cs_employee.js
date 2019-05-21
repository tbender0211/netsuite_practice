/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define(["N/runtime"],
    function(runtime) {


        // function fieldChanged(context) {
        //     var customer = context.currentRecord;
        //     var couponCode = customer.getField("custentity_sdr_coupon_code");
        //     var coupon = customer.getValue("custentity_sdr_apply_coupon");

        //     if (coupon.isDisabled == false) {
        //         couponCode.setValue(false);
        //     } else {
        //         couponCode.setValue(true);
        //     }



        // };

        function pageInit(context) {
            var employee = context.currentRecord;

            var perfRevCount = employee.getLineCount({
                sublistId : "recmachcustrecord_sdr_perf_subordinate"
            });

            var notes = ("This employee has " + perfRevCount + " performance reviews.");

            var fRatingCount = 0;

            for (var i=0; i < perfRevCount; i++) {
                var ratingCode = employee.getSublistValue({
                    sublistId : "recmachcustrecord_sdr_perf_subordinate",
                    fieldId : "custrecord_sdr_perf_rating_code",
                    line : i
                });

                if (ratingCode == "F") {
                    fRatingCount += 1;
                };
            };

            notes += "This employee has " + fRatingCount + " F-rated reviews."
        //     alert(notes);

            var empCode = employee.getValue("custentity_sdr_employee_code");

            if (!empCode) {
                var defaultEmpCode = runtime.getCurrentScript().getParameter({
                    name : "custscript_sdr_default_emp_code"
                });

                employee.setValue("custentity_sdr_employee_code", defaultEmpCode);
            };
        };

        // function lineInit(context) {
            // var employee = context.currentRecord;

            // if (context.sublistId == "recmachcustrecord_sdr_perf_subordinate") {
            //     var reviewType = employee.getCurrentSublistValue({
            //         sublistId : "recmachcustrecord_sdr_perf_subordinate",
            //         fieldId : "custrecord_sdr_perf_review_type"
            //     });

            //     if (!reviewType) {
            //         employee.setCurrentSublistValue({
            //             sublistId : "recmachcustrecord_sdr_perf_subordinate",
            //             fieldId : "custrecord_sdr_perf_review_type",
            //             value : 1
            //         });
            //     };
            // };
        // };

        // function validateLine(context) {
        //     var employee = context.currentRecord;

        //     if (context.sublistID == "recmachcustrecord_sdr_perf_subordinate") {
        //         var increaseAmount = employee.getCurrentSublistValue({
        //             sublistId : "recmachcustrecord_sdr_perf_subordinate",
        //             fieldId : "custrecord_sdr_perf_sal_incr_amt"
        //         });

        //         if (increaseAmount > 5000) {
        //             alert("Salary increase amount cannot be greater than 5,000.");
        //             return false;
        //         }
        //     }

        //     return true;
        // }

        // function saveRecord(context) {
        //     var employee = context.currentRecord;
        //     var employeeCode = employee.getValue("custentity_sdr_employee_code");

            // if (employeeCode == "x") {
            //     alert("Invalid Employee Code value. Please try again.");
            //     return false;
            // };

            // return true;
        // };

        // function validateField(context) {
        //     var employee = context.currentRecord;
            
        //     if (context.fieldId == "custentity_sdr_employee_code") {
        //         var empCode = employee.getValue("custentity_sdr_employee_code");

        //         if (empCode == "x") {
        //             alert("Invalid Employee Code value. Please try again.");
        //             return false;
        //         };
    
        //         return true;
        //     }
        // };

        return {
            pageInit : pageInit
        //     lineInit : lineInit,
        //     validateLine : validateLine
            // fieldChanged : fieldChanged
            // saveRecord : saveRecord
            // validateField : validateField
        };
    });