/**
 * @NApiVersion 2.x
 * @NScriptType ClientScript
 */

define(['N/search', 'N/ui/dialog', '/SuiteScripts/MBS_Helpers'], function(search, dialog) {
	//Item restriction code check
	function validateLine(context) {
        var currRec = context.currentRecord;
        var sublist = context.sublistId;

        var cust = currRec.getValue('entity');

        var custRestrict = search.lookupFields({
            type : search.Type.CUSTOMER,
            id : cust,
            columns: 'custentity_cust_prod_restriction'
        });
        console.log(custRestrict);

        var custRestrictArray = [];

        for (i=0; i < custRestrict['custentity_cust_prod_restriction'].length; i++) {
            custRestrictArray.push(custRestrict['custentity_cust_prod_restriction'][i]['text']);
        };
        console.log('Cust. Restrictions: ' + custRestrictArray);

        if (sublist == 'item' && custRestrict != '') {
            var item = currRec.getCurrentSublistValue({
                sublistId: sublist,
                fieldId: 'item'
            });
            console.log('Item Id: ' + item);

            var itemRestrict = search.lookupFields({
                type : search.Type.INVENTORY_ITEM,
                id : item,
                columns: 'custitem_item_prod_restriction_code'
            });
            console.log(itemRestrict);
            
            var itemRestrictArray = [];

            for (i=0; i < itemRestrict['custitem_item_prod_restriction_code'].length; i++) {
                itemRestrictArray.push(itemRestrict['custitem_item_prod_restriction_code'][i]['text']);
            };

            console.log('Item Restrictions: ' + itemRestrictArray);
            if (itemRestrictArray != '') {

                    for (i = 0; i < itemRestrictArray.length; i++) {

                        if  (custRestrictArray.includes(itemRestrictArray[i], 0)) {

                            console.log('Restriction Match!');
                            if (itemRestrictArray[i] == 'IMOW') {
                                return true;
                            } else {
                                dialog
                                    .alert({
                                        title: 'Failed to add item:',
                                        message:
                                            'Dealer restriction code(s) prevent purchase of this item.'
                                    })
                                    return false;
                            };
                        } else if (!(custRestrictArray.includes(itemRestrictArray[i], 0))) {
                            return true;
                        };
                    };

                
            } else return true;
        }
    };
	return {
		validateLine: validateLine
	};
});
