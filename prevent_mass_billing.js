/**
 * @NApiVersion 2.x
 * @NScriptType UserEventScript
 */

define(['N/error'], function(error) {
	function beforeSubmit(context) {
		var invoice = context.newRecord;

		var holdCode = invoice.getText('custbody_so_hold_code');
		var salesOrder = invoice.getValue('createdfrom');

		if (salesOrder) {

			log.debug('Sales Order: ' + salesOrder + '\n' +
						'Hold Code: ' + holdCode);

			function preventInvoicing() {
				var submitError = error.create({
					name: 'INVOICING_ERROR',
					message: 'Hold code of ' + holdCode + ' placed on ' + salesOrder + '. Invoice cannot be created.',
					notifyOff: true
				});
				
				log.debug('Error: ' + submitError);
				
				throw submitError.message;
				
			};

			if (context.type == context.UserEventType.CREATE && holdCode != '') {
				preventInvoicing();
			};
		}
	}
	return {
		beforeSubmit: beforeSubmit
	};
});
