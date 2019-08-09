/*
 * @Author: Meridian Business Services
 * @Date: 2019-03-29 10:43:16
 * @Last Modified time: 2019-03-29 10:43:16
 */
/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */
/* 'Add All Apps' button function */
define([
    'N/currentRecord',
    'N/search',
	'N/record',
	'N/url',
],
function(
	currentRecord,
	search,
	record,
	url
) {
	var hasAddedApps = false;
	
	function App(name, id, include) {
		this.name = name;
		this.id = id;
		this.include = include || true;
	}
	const appConfigurationId = 5;
	const honeyCombConfig = 1;

	const appsToAdd = [	];

	function goBack() {
		window.history.back();
	}

	function createURL(path) {
		path = path ? path : '';
		const hostURL = url.resolveDomain({
			hostType: url.HostType.APPLICATION
		});
		return 'https://' + hostURL + path;
		
	}
	function goHome() {
		window.location = createURL("/app/center/card.nl?sc=-29&whence=");
	}

	function importPackages() {
		window.location = createURL('/app/site/hosting/scriptlet.nl?script=customscript_pref_packages_import&deploy=1');
	}

	function loadPackages() {
		// const scriptTask = task.create({taskType: task.TaskType.SCHEDULED_SCRIPT});
		// scriptTask.scriptId = 'customscript_load_all_packages';
		// scriptTask.deploymentId = 'customdeploy_load_all_packages';
		// try {
		// 	const scriptTaskId = scriptTask.submit();
		// 	console.log('Successfully scheduled task: ' + scriptTaskId);
		// } catch(e)  {
		// 	console.error('Error scheduling Load Packages.', e);
		// }
	}

	function addAllApps() {
		if(!hasAddedApps) {
			hasAddedApps = true;
			if(appsToAdd.length < 1) {
				var customrecord_dsi_installedappsSearchObj = search.create({
					type: 'customrecord_dsi_installedapps',
					filters: [
						[
							'isinactive', 
							'is', 
							'F'
						]
					],
					columns: [
						'name',
						'internalid',
					]
				});
				customrecord_dsi_installedappsSearchObj.run().each(function(result){
					var appName = result.getValue('name');
					var appId = Number(result.getValue('internalid'));
					appsToAdd.push(new App(appName, appId));
					return true;
				});
			}
			console.log('All Apps List', appsToAdd);
			var currRec = currentRecord.get();
			var dsiUser = currRec.id;
	
			// (employee username)
			var dsiUserName = currRec.getText({
				fieldId: 'custrecord_dsi_config_users_user',
			});
			
			// (employee)
			var dsiUserUser = currRec.getValue({
				fieldId: 'custrecord_dsi_config_users_user',
			});
			
			if (!dsiUser || !dsiUserName) {
				alert('Failed to add apps. Please try again later.');
				return;
			}
	
			// search for all existing DSI user preferences sub-records
			var existingApps = [];
			search
				.create({
					type: 'customrecord_dsi_app_config_users_pref',
					filters: [
						['custrecord_dsi_users_pref_user', 'anyof', dsiUser],
						'AND',
						[
							'custrecord_dsi_user_configuration',
							'anyof',
							appConfigurationId,
						]
					],
					columns: [
						search.createColumn({
							name: 'custrecord_dsi_users_configuration',
						}),
						search.createColumn({
							name: 'custrecord_dsi_user_configuration',
						}),
						search.createColumn({
							name: 'custrecord_dsi_user_employeeid',
						}),
						search.createColumn({
							name: 'custrecord_dsi_user_app',
						}),
					],
				})
				.run()
				.each(function(res) {
					var data = JSON.parse(JSON.stringify(res))['values'];
					var app = data['custrecord_dsi_user_app'][0]['value'];
					log.debug('App', app)
					existingApps.push(parseInt(app));
					return true;
				});
			
					
			existingApps = existingApps.map(function(id) {
				return parseInt(id);
			})
			console.log('Existing Apps: ', existingApps);
			var appCount = 0;
			appsToAdd.forEach(function(app) {
	
				log.debug('Includes App', existingApps.includes(app.id) + ' ' + app.id)
				if (!existingApps.includes(app.id) && app.include && app.id !== 12 && app.id !== 27) {
	
					// create new DSI User Preference record for that app
					var newPreference = record.create({
						type: 'customrecord_dsi_app_config_users_pref',
					});
	
					// set 'Configuration' to HoneyComb
					newPreference.setValue({
						fieldId: 'custrecord_dsi_users_configuration',
						value: honeyCombConfig,
					});
	
					// set DSI User to header record
					newPreference.setValue({
						fieldId: 'custrecord_dsi_users_pref_user',
						value: dsiUser,
					});
	
					// User Configuration to 'Apps'
					newPreference.setValue({
						fieldId: 'custrecord_dsi_user_configuration',
						value: appConfigurationId,
					});
	
					// User/employee to header employee
					newPreference.setValue({
						fieldId: 'custrecord_dsi_user_employeeid',
						value: dsiUserUser,
					});
	
					// set actual app
					newPreference.setValue({
						fieldId: 'custrecord_dsi_user_app',
						value: app.id,
					});
					try {
						newPreference.save();
						appCount++;
						console.log('Added App: ' + app.name);
					} catch (e) {
						console.error(app.name, e);
					}
				}
			});
			if(appCount > 0) {
				alert('Successfully added ' + appCount + ' apps to ' + dsiUserName + '.');
			} else {
				alert('All apps have already been added to ' + dsiUserName + '.');
			}
		} else {
			console.log('The apps have already been added to' + dsiUserName + '.');
		}
	}
	return {
		addAllApps: addAllApps,
		importPackages: importPackages,
		loadPackages: loadPackages,
		goHome: goHome,
		goBack: goBack,
		saveRecord: function() {
			return true;
		},
	};
});
