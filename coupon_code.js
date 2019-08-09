/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define(["N/https", "N/url"],

    function(https, url) {

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
            var restletUrl = url.resolveScript({
                scriptId : "customscript_sdr_rl_coupon_code",
                deploymentId : "customdeploy_sdr_rl_coupon_code"
            });

            var response = https.get({
                url : restletUrl + "&sdr_coupon_code=" + couponCode
            });

            if (coupon == true && couponCode) {
                
                if (response.body == "invalid" ) {
                    alert("Invalid coupon code.");
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