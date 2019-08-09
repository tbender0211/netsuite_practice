/**
 *@NApiVersion 2.x
 *@NScriptType ScheduledScript
 */
define(
	[
		'N/search',
		'N/record',
		'N/runtime',
		'N/task',
	],
	function (search, record, runtime, task) {

		function execute(ctx) {
			const CONFIG_ID = 1;
			const RECORD_TYPE = 'customrecord_dsi_app_config_packages';
			// const APPS = [ 3, ];
			const PACK_APP = 3;

			const packagesField = 'custrecord_dsi_app_apppref_boxdims';
			const configField = 'custrecord_dsi_app_appsconfiguration';
			const appIdField = 'custrecord_dsi_appid';

            const curScript = runtime.getCurrentScript();
            
			function rescheduleScript() {
				log.debug('rescheduling', 'rescheduling');
				const scriptTask = task.create({
                    taskType: task.TaskType.SCHEDULED_SCRIPT,
                });
				scriptTask.scriptId = curScript.id;
				scriptTask.deploymentId = curScript.deploymentId;
				try {
                    const scriptTaskId = scriptTask.submit();
                    log.debug('Successfully Rescheduled Task: ' + scriptTaskId, 'Successfully Rescheduled Task: ' + scriptTaskId);
				} catch(e) {
					log.error('Error scheduling Load Packages.', e);
				}
			}

			function getPackages() {
				const data = {
					packages: [],
					error: false,
					count: 0,
				};
				const packagesSearch = search.create({
					type: "customrecord_dsi_app_pref_boxdims",
					filters: [ ['isinactive', 'is', 'F']],
					columns: [ "internalid" ]
				});
				data.count = packagesSearch.runPaged().count;
				packagesSearch.run().each(function(result){
					const res = parseData(result);
					if(Array.isArray(res.values.internalid) && res.values.internalid.length > 0) {
						data.packages.push(res.values.internalid[0].value);
					}
					return true;
				});
				return data;
			}

			function getExistingPackages(appId) {
				const data = {
					packages: [],
					count: 0,
					error: false,
				};
				const existingPackagesSearch = search.create({
					type: "customrecord_dsi_app_config_packages",
					filters:
					[
					   ["custrecord_dsi_appid","anyof", appId]
					],
					columns:
					[
						search.createColumn({
							name: "internalid",
							join: "CUSTRECORD_DSI_APP_APPPREF_BOXDIMS"
						 })
					]
				});
				data.count = existingPackagesSearch.runPaged().count;
				existingPackagesSearch.run().each(function(result){
					const res = parseData(result);
					if(
						Array.isArray(
							res.values['CUSTRECORD_DSI_APP_APPPREF_BOXDIMS.internalid']
						) 
						&& res.values['CUSTRECORD_DSI_APP_APPPREF_BOXDIMS.internalid'].length > 0
					) {
                        data.packages.push(res.values['CUSTRECORD_DSI_APP_APPPREF_BOXDIMS.internalid'][0].value);
					}
					return true;
				});
				return data;
			}

			function parseData(data) {
				return JSON.parse(JSON.stringify(data));
            }
            
			var packages = [];
            var existingPackages = [];
            
			const packageSearch = getPackages();
			const existingSearch = getExistingPackages(PACK_APP);

            const results = {
                success: [],
                rejected: [],
                errors: [],
                error: false,
            };

			if(!packageSearch.error && !existingSearch.error) {
				packages = packageSearch.packages;
				existingPackages = existingSearch.packages;

				for (var i in packages) {
					if(curScript.getRemainingUsage() < 100) {
						return rescheduleScript();
                    }
                    var packageId = packages[i];
                    log.debug('Package ID: ' + packageId)
					if(existingPackages.indexOf(packageId) === -1) {
						var dsiAppPackage = record.create({
							type: RECORD_TYPE
						});
						dsiAppPackage.setValue({
							fieldId: appIdField,
							value: PACK_APP
						});
						dsiAppPackage.setValue({
							fieldId: configField,
							value: CONFIG_ID
						});
						dsiAppPackage.setValue({
							fieldId: packagesField,
							value: packageId
						});
						try {
                            var recId = dsiAppPackage.save();
                            results.success.push(packageId);
							log.debug(
								'Successfully saved App Package: ' + recId,
								'Successfully saved App Package: ' + recId
							);
						} catch(e) {
                           results.errors.push(packageId);
							  log.error('Error saving App Package', e);
						}
					} else {
                        results.rejected.push(packageId);
						log.debug('App Package already exists! ' + packageId , 'App Package already exists! ' + packageId);
					}	
				}
            }
            log.debug('RESULTS:', results);
            return results;
		}
		return {
			execute: execute
		};
	});
