/**
 * @NApiVersion 2.x
 * @NScriptType workflowactionscript
 */

 define(['N/record', 'N/search'], 
    
    function(search){
     function onAction(context) {
        var customer = runtime.getCurrentScript().getParameter({
            name : 'custscript_dealer_id'
        });

        var unbilledSearch = search.load({
            id : 'customsearch_mbs_unbilled_no_lc',
            filters : [
                ['entity', 'is', customer]
            ]
        });

        var results = unbilledSearch.run();
        console.log(results);

        var unbilledTotal = results.getValue()

     }
     return {
         onAction : onAction
     }
 })