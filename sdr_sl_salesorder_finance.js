/**
 * @NApiVersion 2.x
 * @NScriptType Suitelet
 */

 define(["N/record", "N/redirect", "N/ui/serverWidget"], 
    function (record, redirect, serverWidget) {
        
        function onRequest(context) {
            var request = context.request;
            var response = context.response;

            if (request.method == "GET") {

                var orderNum = request.parameters.sdr_ordernum;
                var customer = request.parameters.sdr_cust;
                var total = request.parameters.sdr_total;
                var financing = request.parameters.sdr_financing;

                var form = serverWidget.createForm({
                    title : "Sales Order Financing"
                });

                var financeFld = form.addField({
                    id : "custpage_sdr_financing_help",
                    type : serverWidget.FieldType.HELP,
                    label: "Please assign a price to the financing of this sales order, then click Submit Financing."
                });

                var financePriceFld = form.addField({
                    id : "custpage_sdr_financing_price",
                    type : serverWidget.FieldType.TEXT,
                    label : "Finance Price"
                });

                var orderFld = form.addField({
                    id : "custpage_sdr_order_id",
                    type : serverWidget.FieldType.TEXT,
                    label : "Order ID"
                });

                var custFld = form.addField({
                    id : "custpage_sdr_customer",
                    type : serverWidget.FieldType.TEXT,
                    label : "Customer"
                });

                var totalFld = form.addField({
                    id : "custpage_sdr_order_total",
                    type : serverWidget.FieldType.CURRENCY,
                    label : "Order Total"
                });


                form.addSubmitButton("Save Finance Info");

                orderFld.defaultValue = orderNum;
                custFld.defaultValue = customer;
                totalFld.defaultValue = total;
                financeFld.defaultValue = financing;

                orderFld.updateDisplayType({
                    displayType : serverWidget.FieldDisplayType.INLINE
                });

                custFld.updateDisplayType({
                    displayType : serverWidget.FieldDisplayType.INLINE
                });

                totalFld.updateDisplayType({
                    displayType : serverWidget.FieldDisplayType.INLINE
                });

                response.writePage(form);
            } else {

                financePrice = request.parameters.custpage_sdr_financing_price;
                orderId = request.parameters.custpage_sdr_order_id;

                var salesOrder = record.load({
                    type: record.Type.SALES_ORDER,
                    id : orderId
                });

                salesOrder.setValue("custbody_sdr_financing_price", financePrice);
                salesOrder.save();

                redirect.toRecord({
                    type : record.Type.SALES_ORDER,
                    id : orderId
                })
            }

            
        };

        return {
            onRequest : onRequest
        }
    });