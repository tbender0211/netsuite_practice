/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define([],

    function() {

        function fieldChanged(context) {
            var customer = context.currentRecord;
            var couponCode = customer.getField("custentity_sdr_coupon_code");
            var coupon = customer.getValue("custentity_sdr_apply_coupon");

            if (coupon == false) {
                couponCode.isDisabled = true;
            } else {
                couponCode.isDisabled = false;
            };


        };

        function pageInit(context) {
            var customer = context.currentRecord;
            var couponCode = customer.getField("custentity_sdr_coupon_code");
            var coupon = customer.getValue("custentity_sdr_apply_coupon");

            if (coupon == false) {
                couponCode.isDisabled = true;
            } else {
                couponCode.isDisabled = false;
            };
        };

        function validateField(context) {
            var customer = context.currentRecord;
            var couponCode = customer.getText("custentity_sdr_coupon_code");
            var coupon = customer.getValue("custentity_sdr_apply_coupon");

            if (coupon == true) {
                
                if (couponCode.length != 5) {
                    alert("Coupon code must be 5 characters.");
                    return false;
                };

                return true;
            };
            
        };

        return {
            fieldChanged : fieldChanged,
            pageInit : pageInit,
            validateField : validateField
        };
    });