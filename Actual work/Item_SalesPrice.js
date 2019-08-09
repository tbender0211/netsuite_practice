/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

 define(['N/record'], function(record) {

    //Function to return the index of a specific value in an object array
    function findLowestBreak(array, attr, value) {
        for (var i = 0; i < array.length; i++) {
            if(array[i][attr] === value) {
                return i;
            }
        }
        return -1;
    };

     //Updating Sales Price if the Qty Break Class was changed
    function fieldChanged(context) {
        var item = context.currentRecord;
        
        //Gets id of Qty Break Class record
        var qtyBreakClass = item.getValue('custitem_item_qty_break_class');

        //Only perform if item has base price and field changed is Qty Break Class
        if (context.fieldId === 'custitem_item_qty_break_class' && basePrice != '') {
            

            //Gets base price of the item from Pricing sublist
            var basePrice = item.getSublistValue({
                sublistId : 'price',
                fieldId : 'price_1_',
                line : 0
            });
    
            //Loads custom record for Qty Break Class
            var qtyBreakRec = record.load({
                type : 'customrecord_qty_discount_pricing',
                id : qtyBreakClass,
                isDynamic : true
            });
    
            var qtyBreaks = [];
        
            //Adds all quantity break values to an object array
            for (i=1; i < 7; i++) {
    
                qtyBreaks.push(
                    {
                        'quantity' : qtyBreakRec.getValue('custrecord_qty_discount_break_' + i),
                        'discount' : qtyBreakRec.getValue('custrecord_qty_discount_percent_' + i)
                    }
                );
    
            };

    
            //Searches for the index where the quantity discount break is equal to 1
            var index = findLowestBreak(qtyBreaks, 'quantity', 1);

            //Grabs the value of the discount associated with a qty break of 1
            var lowestDisc = qtyBreaks[index]['discount'];
    
            //Calculates discount using the base price of the item and lowest discount percentage
            var salesPrice = (basePrice - ((lowestDisc / 100 ) * basePrice)).toFixed(2);

            //Sets the value of the custom field Sales Price 
            item.setValue('custitem_sales_price', salesPrice);

            return;

        }
            
     }

    //Updating Sales Price if the Base Price of the item was changed
     function sublistChanged(context) {
        var item = context.currentRecord;

        var qtyBreakClass = item.getValue('custitem_item_qty_break_class');

        var sublist = context.sublistId;
        
        if (sublist === 'price') {
             //Gets base price of the item from Pricing sublist
             var basePrice = item.getSublistValue({
                sublistId : 'price',
                fieldId : 'price_1_',
                line : 0
            });

            if (basePrice != '') {

                //Loads custom record for Qty Break Class
                var qtyBreakRec = record.load({
                    type : 'customrecord_qty_discount_pricing',
                    id : qtyBreakClass,
                    isDynamic : true
                });
        
                var qtyBreaks = [];
            
                //Adds all quantity break values to an object array
                for (i=1; i < 7; i++) {
        
                    qtyBreaks.push(
                        {
                            'quantity' : qtyBreakRec.getValue('custrecord_qty_discount_break_' + i),
                            'discount' : qtyBreakRec.getValue('custrecord_qty_discount_percent_' + i)
                        }
                    );
        
                };
        
                //Searches for the index where the quantity discount break is equal to 1
                var index = findLowestBreak(qtyBreaks, 'quantity', 1);
    
                //Grabs the value of the discount associated with a qty break of 1
                var lowestDisc = qtyBreaks[index]['discount'];
        
                //Calculates discount using the base price of the item and lowest discount percentage
                var salesPrice = (basePrice - ((lowestDisc / 100 ) * basePrice)).toFixed(2);
    
                //Sets the value of the custom field Sales Price 
                item.setValue('custitem_sales_price', salesPrice);
    
                return;
            }
        }
     }
     return {
        fieldChanged : fieldChanged,
        sublistChanged : sublistChanged
     }
 })