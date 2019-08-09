/**
 * @NApiVersion 2.x
 * @NScriptType Restlet
 */

 define([],
    function() {

        function get(params) {
            var couponCode = params.sdr_coupon_code;

            if (couponCode == "ABC12") {
                return "valid";
            }
            return invalid;
        };

        return {
            get : get
        }
    });