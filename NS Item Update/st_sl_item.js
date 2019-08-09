/**
 * @NApiVersion 2.x
 * @NScriptType Suitelet
 */

define(["N/ui/serverWidget", "N/record", "N/redirect"], 
    function(ui, record, redirect) {

        const importType = "Item Values";
        const pageTitle = "Import " + importType;
        const csPath = "SuiteScripts/SuiteDreams/st_cs_item.js";

        function updateFields(fields) {
            var results = {
                updated : [],
                errors : []
            };
            //Update this with the internal ID of the new version of the item

            var newItem = record.load({
                type : record.Type.INVENTORY_ITEM,
                id : 252
            });

            for (var key in fields) {
                newItem.setValue({
                    fieldId : key,
                    value : fields
                })
            }
            return results;
        };

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
                    } if (j===1) {
                        columnLabels = line.value.split(',');
                        j++;
                        return true; 
                    } if (j === 2) {
                        finalLabels = line.value.split(',');
                        j++;
                        return true;
                    }
                });
                log.debug('fieldIds', fieldIds);
                log.debug("columnLabels", columnLabels);
    
                var items = [];
                iterator.each(function(line) {
        
                    return true;
                });
      
                var results = updateFields(items);
                log.debug('Results', results);
                //create output page form
                var form = ui.createForm({ title: pageTitle });

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
            };

        }
        return {
            onRequest : onRequest
        }
    }
);