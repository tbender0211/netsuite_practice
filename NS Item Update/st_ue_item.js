/**
 * @NApiVersion 2.x
 * @NScriptType UserEventScript
 */

 define([],
    function() {
        function beforeLoad(context) {
            
           const clientScriptPath = "SuiteScripts/SuiteDreams/st_cs_item.js";
            context.form.clientScriptModulePath = clientScriptPath;

            context.form.addButton({
                id : "custpage_download_custom",
                label : "Get Custom Subtab",
                functionName : "getCustomSubtab"
            });
            context.form.addButton({
                id : "custpage_download_specs",
                label : "Get Spec Subtab",
                functionName : "getSpecSubtab"
            });
        }
        return {
            beforeLoad : beforeLoad
        }
    })