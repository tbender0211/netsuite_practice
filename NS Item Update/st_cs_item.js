/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define(["N/currentRecord", "N/record"],

    function(currentRecord, record) {

        function getCustomSubtab(context) {
            var customFields = ["salesdescription", "storedetaileddescription"];
            var itemRecord = currentRecord.get();
            var itemId = itemRecord.getValue({fieldId : "internalid"});
            var item = record.load({
                type : record.Type.INVENTORY_ITEM,
                id : itemId
            });
            var objectArray = [];

            for (i=0; i < customFields.length; i++) {
                var values = "";
                

                console.log(customFields[i]);

                var value = item.getText({
                    fieldId: customFields[i],
                });

                values = {
                    "fieldId" : customFields[i],
                    "fieldValue" : value
                }
                console.log(values);
                objectArray.push(values);
                
            };
            console.log(objectArray);
            
            var jsonObject = JSON.stringify(objectArray);

            console.log(jsonObject);

        }
        return {
            pageInit :  function () {
                return true;
            },
            getCustomSubtab : getCustomSubtab
        }
    });