/*
* @Author: Meridian Business Services
* @Date: 2018-03-27 18:00:40
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2019-04-29 09:47:54
*/

/**
*@NApiVersion 2.x
*@NScriptType Suitelet
*@NModuleScope Public
*/

define([
    'N/record',
    'N/ui/serverWidget'
], 
function(record, ui) {
    const importType = 'DSI Pref Packages'
    const pageTitle = 'Import ' + importType;
    const csPath = 'SuiteScripts/AddAllApps_Client.js';
    function createPackages(packages) {
        var results = {
            updated: [],
            errors: [],
        };
        for (var p in packages) {
            var packageRec = record.create({
                type: 'customrecord_dsi_app_pref_boxdims',
            });
            for (var key in packages[p]) {
                packageRec.setValue({
                    fieldId: key,
                    value: packages[p][key],
                })
            }
            packageRec.setValue({
                fieldId: 'custrecord_dsi_app_config_carrierpackage',
                value: 'other',
            });
            try {
                var internalId = packageRec.save();
                results.updated.push({
                    internalId: internalId,
                    name: packageRec.getValue('name'),
                });
                log.debug('Record ' + packageRec.getValue('name') + ' saved successfully');
            } catch (error) {
                results.errors.push({
                    type: 'ERROR_SAVING_RECORD',
                    error: error,
                });
                log.error('Error saving record.', error);
            }
        }
        return results;
    }

    function onRequest(context) {
        if (context.request.method === 'GET') {
            var form = ui.createForm({ title: pageTitle });
            form.clientScriptModulePath = csPath;
            form.addFieldGroup({
                id: 'main',
                label: 'Primary Information'
            });

            var importFile = form.addField({
                id: 'csv_import_file',
                type: ui.FieldType.FILE,
                label: 'Spreadsheet File Upload',
                align: ui.LayoutJustification.LEFT
            });

            importFile.isMandatory = true;
            importFile.setHelpText({
                help:
                'CSV file of ' + importType + ' to import - Must be CSV file matching style provided.'
            });
            // Buttons
            form.addSubmitButton({
                label: 'Import'
            });
            form.addResetButton({
                label: 'Reset'
            });
            form.addButton({
                id: 'cancelButton',
                label: 'Cancel',
                functionName: 'goBack'
            });
            context.response.writePage(form);
        } else {
            var startTime = Date.now();
            var sheet = context.request.files.csv_import_file;
            var iterator = sheet.lines.iterator();
            // Skip the first row in the CSV (Column Headings)
            var columnLabels = null;
            var fieldIds = null;
            var j = 0;
            iterator.each(function(line) { 
                if(j === 0) {
                    fieldIds = line.value.split(',');
                    j++;
                    return true;
                } else {
                    columnLabels = line.value.split(',');
                    return false; 
                }
            });
            log.debug('fieldIds', fieldIds);

            var items = [];
            iterator.each(function(line) {
    
                return true;
            });
  
            var results = createPackages(items);
            log.debug('Results', results);
            //create output page form
            var form = ui.createForm({ title: pageTitle });
            form.clientScriptModulePath = csPath;
            var successMessageField = form.addField({
                id: 'success_message',
                label: 'Success Message',
                type: ui.FieldType.INLINEHTML,
            });
            var messageTitle = 'Successfully imported ' + 
                results.updated.length + 
                ' packages. ' + results.errors.length + ' errors.';

            var executionTime = (Date.now() - startTime) / 1000;
            
            successMessageField.defaultValue = 
            '<!-- Declare HTML5 DOCTYPE. This is needed because Bootstrap will no work if the DOCTYPE isn\'t HTML5 -->' +
            '<!DOCTYPE html>' +
            '<html>' +
            '<head>' +
                '<link href="https://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">' +
            '</head>' +
            '<body>' +
                '<div id="main_section" class="container">' +
                    '<div class="page-header">' +
                        '<h2>' + messageTitle + '</h2>' +
                        '<p>Script Execution Time: ' + executionTime + 's</p>' +
                        '<pre>' + 
                            '<code style="max-width: 80vw; margin: 0 auto;">' +
                                JSON.stringify(results) +
                            '</code>' +
                        '</pre>' +
                    '</div>' +
                '</div>' +
                '<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>' +
                '<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>' +
            '</body>' +
            '</html>';
            form.addButton({
                id: 'home',
                label: 'Home',
                functionName: 'goHome'
            });
            form.addButton({
                id: 'more',
                label: 'Import More',
                functionName: 'goBack'
            });
            context.response.writePage(form);
        }
    }
    return {
        onRequest: onRequest
    };
});