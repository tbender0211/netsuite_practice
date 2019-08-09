/**
 * @NApiVersion 2.x
 * @NScriptType WorkflowActionScript
 */

 define(['N/search'], 
    
    function(search){
     function onAction(context) {
        var currRec = context.newRecord;
        var customer = currRec.getValue('entity');

        log.debug('Dealer: ', customer);
        

        if (customer != '') {

            var unbilledSearch = search.load({
                id : 'customsearch_mbs_unbilled_no_lc'
            });

            var defaultFilters = unbilledSearch.filters;
            var totalUnbilled = 0;

            var customFilter = search.createFilter({
                            name : 'entity', 
                            operator : search.Operator.ANYOF,
                            values : customer
                            });

            defaultFilters.push(customFilter);

            unbilledSearch.filters = defaultFilters;

            unbilledSearch.run().each(function(result) {
                var unbilled = result.getValue({
                    'name' : 'amountunbilled',
                    'summary' : 'SUM'
                });

                log.debug('Unbilled Excl. LT/LO: ', unbilled);
                
                totalUnbilled += unbilled;
                
            })
            return totalUnbilled;
        }
        
        
        
     }
     return {
         onAction : onAction
     }
 });