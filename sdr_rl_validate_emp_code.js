/**
 * @NApiVersion 2.x
 * @NScriptType Restlet
 */

define([],
function() {
        
        function get(requestParams) {
            var employeeCode = requestParams.sdr_emp_code;

            if (employeeCode == "x") {
                return "invalid";
            };

            return "valid";
        };

        return {
            get : get
        };
 });