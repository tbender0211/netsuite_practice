/**
 * @NApiVersion 2.x
 * @NScriptType MapReduceScript
 */

 define(["N/search"],
    function(search){
        function getInputData() {
            return {
                type: "search",
                id : 152
            }
        };

        function map(context) {
            var searchResult = JSON.parse(context.value);

            log.debug(searchResult);

            var customer = searchResult.values.entity.text;
            var amount = searchResult.values.amount;

            context.write({
                key : customer,
                value : amount
            })
        };

        function reduce(context) {
            var total = 0;

            for (var i in context.values) {
                total += parseFloat(context.values[i]);
            };

            log.debug("Totals", "Customer: " + context.key + " \n" +
            "Total: " + total);
        };

        function summarize(summary) {
            log.audit("Usage Consumed", summary.usage);
            log.audit("Number of queues", summary.concurrency);
            log.audit("Number of yields", summary.yields);
        }

        return {
            getInputData : getInputData,
            map : map,
            reduce : reduce,
            summarize : summarize
        }
    });