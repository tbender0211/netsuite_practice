/**
 * @NApiVersion 2.0
 * @NScriptType scheduledscript
 */

define (["N/search"],
    function(search) {

        // var caseSearch = search.load({
        //     id : "customsearch_sdr_escalated_searches"
        // });

        return {
            execute : function(context) {

                var caseSearch = search.create({
                    type: search.Type.SUPPORT_CASE,
                    filters : [
                        search.createFilter({
                            name : "status",
                            operator : search.operator.ANYOF,
                            values : 3 //3 - escalated internal ID
                        }),
                        search.createFilter({
                            name : "title",
                            join : "employee",
                            operator : search.operator.CONTAINS,
                            values: "Support"
                        })
                    ],
                    columns : [
                        search.createColumn({name : "title"}),
                        search.createColumn({name : "startdate"}),
                        search.createColumn({name : "assigned"}),
                        search.createColumn({name : "status"}),
                        search.createColumn({name : "department", join : "employee"}),
                        search.createColumn({name : "title", join : "employee"})
                    ]
                })
        
                var searchResults = caseSearch.run().getRange({
                    start : 0,
                    end : 9
                });
        
                for (var i=0; i < searchResults.length; i++) {
                    var subject = searchResults[i].getValue("title");
                    var assignedTo = searchResults[i].getText("assigned");
                    var status = searchResults[i].getValue("status")
                    var department = searchResults[i].getValue({
                        name : "department",
                        join : "employee"
                    });
                    var jobTitle = searchResults[i].getValue({
                        name : "title",
                        join : "employee"
                    });
        
                    log.debug("Case Info", "Subject: " + subject + "\n" +
                                           "Status: " + status + "\n" +
                                           "Job Title: " + jobTitle + "\n"
                    );
            };
        }

    };

});