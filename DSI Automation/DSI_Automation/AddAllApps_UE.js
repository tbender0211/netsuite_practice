/*
 * @Author: Meridian Business Services
 * @Date: 2019-03-29 10:43:16
 * @Last Modified time: 2019-03-29 10:43:16
 */
/**
 *@NApiVersion 2.x
 *@NScriptType UserEventScript
 */
/* Add 'Add All Apps' button to DSI User Preference */
define([
	'N/runtime',
	'N/ui/serverWidget'
], function (runtime, ui) {
	
	const clientScriptPath = 'SuiteScripts/AddAllApps_Client.js';
	function App(name, id, include) {
		this.name = name;
		this.id = id;
		this.include = include || true;
	}

	function beforeLoad(context) {
		var script = runtime.getCurrentScript();
		log.debug('deployment id', script.deploymentId);
		var deployment = script.deploymentId.split('_').reverse()[0];
		if(deployment === 'config') {
			context.form.clientScriptModulePath =
				clientScriptPath;		
			context.form.addButton({
				id: 'custpage_import_pref_packages',
				label: 'Import Pref Packages CSV',
				functionName: 'importPackages'
			});
			context.form.addButton({
				id: 'custpage_load_packages',
				label: 'Load Packages (New)',
				functionName: 'loadPackages'
			});
		}
		if (deployment === 'users' && context.type === 'edit') {
			context.form.clientScriptModulePath =
				clientScriptPath;			
			context.form.addButton({
				id: 'custpage_addAllApps',
				label: 'Add All Apps',
				functionName: 'addAllApps',
			});
			// var select = context.form.addField({
			// 	id: "custpage_appList",
			// 	label: "DSI Apps",
			// 	type: ui.FieldType.MULTISELECT
			// });

			// for (var i in apps) {
			// 	var curApp = apps[i];
			// 	select.addSelectOption({
			// 		value: curApp.id,
			// 		text: curApp.name,
			// 	});
			// }
		}
	}
	return {
		beforeLoad: beforeLoad
	};
});

// const apps = [
	
// 	new App('Bin Putaway', 19),
// 	new App('Bin Transfer', 11, false),
// 	new App('Bin Transfer - Scan', 15),

// 	new App('Inventory Adjustment', 1, false),

// 	new App('Inventory Count Creation', 7, false),
// 	new App('Inventory Count Entry', 5),
// 	new App('Inventory Count Review', 6, false),

// 	new App('Inventory Inquiry', 2),
	
// 	new App('Location Transfer', 12),

// 	new App('Order Receipt', 14),

// 	new App('Order Pack', 3, false),
	
// 	// Deprecated App
// 	new App('Order Pick', 27, false),

// 	new App('Order Pick - Directed', 17),
// 	new App('Order Pick - Tote', 21),
// 	new App('Order Pick - Transfer', 22),
// 	new App('Order Pick - Wave', 25),

// 	new App('Pick Management', 26),

// 	new App('Ship Confirm', 16),
	
// 	// Work Order Apps
// 	new App('Work Order Complete', 18, false),
// 	new App('Work Order Issue', 20, false),
	
// ];