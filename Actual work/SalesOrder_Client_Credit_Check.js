/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

define(['N/ui/dialog'], 
function(dialog) {
	function saveRecord(context) {
		var salesOrder = context.currentRecord;

		var creditLimit = salesOrder.getValue('custbody_creditlimit');
		var creditBalance = salesOrder.getValue('custbody_balance');
		var overdueBalance = salesOrder.getValue('custbody_overdue_balance');
		var orderTotal = salesOrder.getValue('total');
		var unbilled = salesOrder.getValue('custbody_unbilled_orders');

		var crOverride = salesOrder.getValue('custbody_creditoverride');
		var spOverride = salesOrder.getValue('custbody_ar_sp_override');

		var totalBalance = (creditBalance + orderTotal + unbilled).toFixed(2);
		var creditDiff = (totalBalance - creditLimit).toFixed(2);

		function success(result) {
			if (result === 'ok') {
				return true;
			} else return false;
		}
	
		function failure(reason) {
			console.log("Failure: " + reason);
		}
	
			if (
				totalBalance > creditLimit &&
				overdueBalance > 0 &&
				spOverride == false &&
				crOverride == false
			) {
				salesOrder.setValue({
					fieldId: 'custbody_limitexceeded',
					value: true
				});
				salesOrder.setValue({
					fieldId: 'custbody_slowpay_hold',
					value: true
				});
				
				dialog.confirm({
					title : "Hold Warning",
					message : 	'Credit Limit exceeded by ' +
								creditDiff +
								' and overdue balance of ' +
								overdueBalance +
								'. Both a Slow Pay Hold and a Credit Limit Hold will be placed on this account.'
				}).then(success).catch(failure);
			} else if (overdueBalance > 0 && spOverride == false) {
				salesOrder.setValue({
					fieldId: 'custbody_slowpay_hold',
					value: true
				});
				dialog.confirm({
					title : "Hold Warning",
					message : 'Overdue balance of ' +
								overdueBalance +
								'. A Slow Pay Hold will be placed on this customer account'
				}).then(success).catch(failure);
			} else if (totalBalance > creditLimit && crOverride == false) {
				salesOrder.setValue({
					fieldId: 'custbody_limitexceeded',
					value: true
				});

				dialog.confirm({
					title : 'Hold Warning',
					value : 'Credit limit exceeded by ' +
								creditDiff +
								'. A Credit Limit Hold will be placed on this customer account'
				}).then(success).catch(failure);
			} else
				salesOrder.setValue({
					fieldId: 'custbody_limitexceeded',
					value: false
				});
				salesOrder.setValue({
					fieldId: 'custbody_slowpay_hold',
					value: false
				});
				return true;
	}
	return {
		saveRecord: saveRecord
	};
});
