/**
 * @NApiVersion 2.x
 * @NScriptType Suitelet
 */

 define(["N/file", "N/render", "N/search"], 

 function (file, render, search) {

     function onRequest(context) {
        var request = context.request;
        var response = context.response;

        var pageRenderer = render.create();
        var templateFile = file.load({id : "SuiteScript Practice/index.html"});
        
        var htmlString = templateFile.getContents();
        pageRenderer.templateContent = htmlString;

        var servItemSearch = search.create({
            type : search.Type.SERVICE_ITEM,
            filters : [['parent', search.Operator.ANYOF, '@NONE@']],
            columns : ['itemid', 'storedisplayimage', 'storedescription']
        });

        var searchResults = servItemSearch.run().getRange({
            start : 0,
            end : 1000
        });

        pageRenderer.addSearchResults({
            templateName  : 'serviceItems',
            searchResult : searchResults
         });

        var mainCss = file.load({
            id : "SuiteScript Practice/style.css"
        });

        var jqueryJs = file.load({
            id : "SuiteScript Practice/jquery.min.js"
        });

        var serviceItemDS = {
            css : mainCss.url,
            jquery : jqueryJs.url,
        };

        pageRenderer.addCustomDataSource({
            format : render.DataSource.OBJECT,
            alias : "serviceItemDS",
            data : serviceItemDS
        });

        var renderedPage = pageRenderer.renderAsString();

        response.write(renderedPage);
     }
     return {
         onRequest : onRequest
     };
 });