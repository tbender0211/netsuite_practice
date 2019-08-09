/**
 * @NApiVersion 2.x
 * @NScriptType MassUpdateScript
 */

 define(['N/record'], function(record) {
     function each(params) {
         var itemRec = record.load({
             type : params.type,
             id : params.id
         });

         var discountRecID = itemRec.getValue('custitem_item_qty_break_class');
         var basePrice = itemRec.getSublistValue({
            sublistId : 'price',
            fieldId : 'price_1_',
            line : 0
        });

        if (basePrice != '' && discountRecID != '' ) {
            
            try {
                var discountRec = record.load({
                    type : 'customrecord_qty_discount_pricing',
                    id : discountRecID,
                    isDynamic : true
                });
        
                var qtyBreaks = [];
        
                for (i=1; i < 7; i++) {
        
                    qtyBreaks.push(
                        {
                            'quantity' : discountRec.getValue('custrecord_qty_discount_break_' + i),
                            'discount' : discountRec.getValue('custrecord_qty_discount_percent_' + i)
                        }
                    );
        
                };
        
                function findLowestBreak(array, attr, value) {
                    for (var i = 0; i < array.length; i++) {
                        if(array[i][attr] === value) {
                            return i;
                        }
                    }
                    return -1;
                }
        
                var index = findLowestBreak(qtyBreaks, 'quantity', 1);
        
                var lowestDisc = qtyBreaks[index]['discount'];
        
                var salesPrice = (basePrice - ((lowestDisc / 100 ) * basePrice)).toFixed(2);
        
                itemRec.setValue('custitem_sales_price', salesPrice);
                var itemId = itemRec.save();
                log.debug("Updated Item: ", itemId);
            } catch (e) {
                log.error("Error Updating" + params.type + ' ' + params.id, e);
            }
        };
        
     }
     return {
         each : each
     }
 })