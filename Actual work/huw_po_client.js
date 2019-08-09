/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define(['N/ui/dialog', 'N/record'],
    function(dialog, record) {

        function validateLine(context) {
            var currRec = context.currentRecord;
            var sublist = context.sublistId;

            var vendorPO = currRec.getValue('entity');
            console.log(vendorPO);

            if (vendorPO != '') {

                if (sublist == 'item') {

                    var itemType = currRec.getCurrentSublistValue({
                        sublistId : 'item',
                        fieldId: 'itemtype'
                    });
                    console.log(itemType);

                    if (itemType == 'InvtPart') {

                        var item = currRec.getCurrentSublistValue({
                            sublistId : 'item',
                            fieldId: 'item'
                        });

                        console.log(item);

                        var itemRec = record.load({
                            type : record.Type.INVENTORY_ITEM,
                            id : item,
                            isDynamic : true
                        });

                        var vendorCount = itemRec.getLineCount('itemvendor');
                        var vendorList = [];

                        for (i=0; i < vendorCount; i++) {
                            var itemVendorId = itemRec.getSublistValue({
                                sublistId : 'itemvendor',
                                fieldId : 'vendor',
                                line : i
                            });

                            vendorList.push(itemVendorId);
                            console.log(vendorList);

                            if (itemVendorId === vendorPO) {
                                return true;
                            } else {
                                dialog.alert({
                                    title : 'Not a Vendor',
                                    message : 'Vendor is not a primary or secondary vendor of this item.'
                                });
                                return true;
                            }
                            

                        };

                    }
    
                }
            }
        }
        return {
            validateLine : validateLine
        }
    });