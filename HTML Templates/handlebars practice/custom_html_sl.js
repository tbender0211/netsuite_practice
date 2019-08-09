/**
 * @NApiVersion 2.x
 * @NScriptType Suitelet
 */

 define(["N/file", "N/render", "N/search", "./handlebars-v4.1.2.js"], 

 function (file, render, search) {

     function onRequest(context) {
        var request = context.request;
        var response = context.response;

        var pageRenderer = render.create();
        var templateFile = file.load({id : "Handlebars Practice/index.handlebars"});
        var compiled = Handlebars.precompile(templateFile.getContents());
        
        pageRenderer.templateContent = compiled;

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

        var bootstrapCSS = file.load({
            id : "Handlebars Practice/bootstrap.min.css"
        });

        var bootstrapJS = file.load({
            id : "Handlebars Practice/bootstrap.min.js"
        });

        var jqueryJs = file.load({
            id : "Handlebars Practice/jquery-3.4.1.min.js"
        });

        var serviceItemDS = {
            bootstrapcss : bootstrapCSS.url,
            bootstrapjs : bootstrapJS.url,
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