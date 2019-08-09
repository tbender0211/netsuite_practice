<?xml version="1.0"?>
<!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
	<link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
	<#if .locale == "zh_CN">
		<link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
	<#elseif .locale == "zh_TW">
		<link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
	<#elseif .locale == "ja_JP">
		<link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
	<#elseif .locale == "ko_KR">
		<link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
	<#elseif .locale == "th_TH">
		<link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
	</#if>
    <macrolist>
        <macro id="nlheader">
            <table class="header" style="width: 100%;">
                <tr>
                    <td rowspan="2">
                        <#if record.custbody_formname=="Federal Ag Product Invoice (Swine)">
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=822&amp;c=4922271&amp;h=fa68d97433f853a2783d" style="float: left; margin: 7px" /> 
                        <#elseif record.custbody_formname=="Federal Ag Product Invoice (Beef)"> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=823&amp;c=4922271&amp;h=1d3ecd98da559d9b44a3" style="float: left; margin: 7px" /> 
                        <#elseif record.custbody_formname=="Federal Ag Product Invoice (Stockade)"> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=108153&amp;c=4922271&amp;h=731ae9783241968899a4" style="float: left; margin: 7px" /> 
                        <#else> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=384&amp;c=4922271&amp;h=d6a8061a8161cfe4be16" style="float: left; margin: 7px" /> 
                        </#if>
                    </td>
                    <td align="right">
                        <span class="title">Deposit Invoice </span>
                    </td>
	            </tr>
                <tr>
                    <td>
                        <table class="total" style="width: 100%; margin-top: 10px;">
                            <tr>
                                <td align="right" style="width: 30%;"><b>INV#: </b></td>
                                <td align="right" style="width: 70%;">${record.tranid}</td>
                            </tr>
                            <tr>
                                <td align="right"><b>TITLE: </b></td>
                                <td align="right">${record.custbody_tc_title}</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </macro>
        <macro id="nlfooter">
            <table class="footer" style="width: 100%;">
                <tr>
                    <td><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
                    <td align="right"><pagenumber/> of <totalpages/></td>
                </tr>
            </table>
        </macro>
    </macrolist>
    <style type="text/css">* {
		<#if .locale == "zh_CN">
			font-family: NotoSans, NotoSansCJKsc, sans-serif;
		<#elseif .locale == "zh_TW">
			font-family: NotoSans, NotoSansCJKtc, sans-serif;
		<#elseif .locale == "ja_JP">
			font-family: NotoSans, NotoSansCJKjp, sans-serif;
		<#elseif .locale == "ko_KR">
			font-family: NotoSans, NotoSansCJKkr, sans-serif;
		<#elseif .locale == "th_TH">
			font-family: NotoSans, NotoSansThai, sans-serif;
		<#else>
			font-family: NotoSans, sans-serif;
		</#if>
		}
		table {
			font-size: 9pt;
			table-layout: fixed;
		}
        th {
            font-weight: bold;
            font-size: 8pt;
            vertical-align: middle;
            padding: 5px 6px 3px;
            background-color: #e3e3e3;
            color: #333333;
        }
        td {
            padding: 4px 6px;
        }
		td p { align:left }
        b {
            font-weight: bold;
            color: #333333;
        }
        table.header td {
            padding: 0px;
            font-size: 10pt;
        }
        table.footer td {
            padding: 0px;
            font-size: 8pt;
        }
        table.itemtable th {
            padding-bottom: 10px;
            padding-top: 10px;
        }
        table.body td {
            padding-top: 2px;
        }
        table.total {
            page-break-inside: avoid;
        }
        tr.totalrow {
            background-color: #e3e3e3;
            line-height: 200%;
        }
        td.totalboxtop {
            font-size: 12pt;
            background-color: #e3e3e3;
        }
        td.addressheader {
            font-size: 8pt;
            padding-top: 6px;
            padding-bottom: 2px;
        }
        td.address {
            padding-top: 0px;
        }
        td.totalboxmid {
          	font-size: 28px;
            background-color: #e3e3e3;
        }
        td.totalboxbot {
            background-color: #e3e3e3;
            font-weight: bold;
        }
        span.title {
            font-size: 28pt;
        }
        span.number {
            font-size: 16pt;
        }
        span.itemname {
            font-weight: bold;
            line-height: 150%;
        }
        hr {
            width: 100%;
            color: #d3d3d3;
            background-color: #d3d3d3;
            height: 1px;
        }
    </style>
</head>
<body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <table style="width: 100%; margin-top: 10px;">
        <tr>
            <td class="addressheader" colspan="3"><b>${record.billaddress@label}</b></td>
            <td class="addressheader" colspan="3"><b>${record.shipaddress@label}</b></td>
            <td class="totalboxtop amountsummary" colspan="2"><b>Deposit Due</b></td>
            <td align="right" class="totalboxmid" colspan="3">${record.custbody_fedag_depositamt}</td>
        </tr>
        <tr>
            <td class="address" colspan="3" rowspan="2">${record.billaddress}</td>
            <td class="address" colspan="3" rowspan="2">${record.shipaddress}</td>
            <td class="totalboxbot" colspan="3"><b>Deposit Due by Date</b></td>
            <td align="right" class="totalboxbot" colspan="2">${record.custbody_fedag_duedate}</td>
        </tr>
        <tr>
            <td class="totalboxbot" colspan="3">Amount Due after Deposit</td>
            <td align="right" class="totalboxbot" colspan="2">
                ${(((record.subtotal?keep_after('$'))?replace(",", ""))?number - record.custbody_fedag_depositamt)}
            </td>
        </tr>
    </table>

    <table class="body" style="width: 100%; margin-top: 10px;">
        <tr>
            <th style="width: 15%">Invoice Date</th>
            <th style="width: 25%">Terms (1)</th>
            <th style="width: 25%">Terms (2)</th>
            <th style="width: 35%">PO #</th>
        </tr>
        <tr>
            <td>${record.trandate}</td>
            <td>${record.custbody_tc_termsdefinition}</td>
            <td>${record.custbody_tc_termsdef2}</td>
            <td>${record.otherrefnum}</td>
        </tr>
    </table>

    <#if record.item?has_content>
    
        <table class="itemtable" style="width: 100%; margin-top: 10px;">
        <!-- start items -->
        <#assign shipCost=0>
        <#assign tariff=0>
        <#assign duties=0>
        <#assign commission=0>

        <#assign newItemRate=0>
        <#assign newItemAmount=0>

        <#assign newSubtotal=0>
        <#assign operator=0>

        <#list record.item as item>

            <!--Variables necessary for calculations-->


            <#if item.item?? && item.item =="*Shipping">
                <#assign shipCost += (((item.amount?keep_after('$')?replace(",", "")))?number)>
            </#if>
            
            <#if item.item?? && item.item == "*Tariff">
                <#assign tariff += (((item.amount?keep_after('$')?replace(",", "")))?number)>
            </#if>
            <#if item.item?? && item.item == "Customs Duties">
                <#assign duties += (((item.amount?keep_after('$')?replace(",", "")))?number)>
            </#if>
            <#if item.item?? && item.item == "Dealer Commission">
                <#assign commission += (((item.amount?keep_after('$')?replace(",", "")))?number)>
            </#if>

            <#assign newSubtotal = ((((record.subtotal?keep_after('$'))?replace(",", ""))?number) - (shipCost + tariff + duties + commission))>

        </#list>

<#list record.item as item>
            

            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
            </#if>

            <!--Only rolling up one of the costs-->
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission ==false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission>
            </#if>

            <!--Rolling up three of the costs-->
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
            </#if>


            <!---Rolling up two of the costs-->
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
            </#if>
            <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
            </#if>

            <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false>
                <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number)>
            </#if>

            <#assign newItemRate = newItemAmount / item.quantity>

                <#if item_index==0>
                    <thead>
                        <tr>
                            <th align="center" colspan="3">${item.quantity@label}</th>
                            <th colspan="12">${item.item@label}</th>
                            <th colspan="3">${item.options@label}</th>
                            <th align="right" colspan="4">${item.rate@label}</th>
                            <th align="right" colspan="4">${item.amount@label}</th>
                        </tr>
                    </thead>
                </#if>
                <#if item.item != "*Shipping" && item.item != "*Tariff" && item.item != "Customs Duties" && item.item != "Dealer Commission">
                    <tr>
                        <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
                        <td colspan="12"><span class="itemname">${item.item}</span><br />${item.description}</td>
                        <td colspan="3">${item.options}</td>

                        <#if (((item.amount?keep_after('$')?replace(",", "")))?number) != 0>
                            <td align="right" colspan="4">${newItemRate?string.currency}</td>
                            <td align="right" colspan="4">${newItemAmount?string.currency}</td>
                        <#else>
                            <td align="right" colspan="4">${item.rate}</td>
                            <td align="right" colspan="4">${item.amount}</td>
                        </#if>
                    </tr>
                <#elseif (item.item == "*Shipping" && record.custbody_fedag_rollshippingcost == false) ||  (item.item == "*Tariff" && record.custbody_fedag_rolltariffcost == false) || (item.item == "Customs Duties" && record.custbody_fedag_rollduties == false) || (item.item == "Commission" && record.custbody_fedag_rollcommission == false)>
                    <tr>
                        <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
                        <td colspan="12"><span class="itemname">${item.item}</span><br />${item.description}</td>
                        <td colspan="3">${item.options}</td>
                        <td align="right" colspan="4">${item.rate}</td>
                        <td align="right" colspan="4">${item.amount}</td>
                    </tr>

                </#if>
        </#list>
        <!-- end items -->
        </table>

        <hr />
    </#if>
    
    <table class="total" style="width: 100%; margin-top: 10px;">
        <tr>
            <td style="width: 50%">&nbsp;</td>
            <td align="right" style="width: 35%"><b>Subtotal</b></td>
            <td align="right" style="width: 15%">${record.subtotal}</td>
        </tr>

        <#if record.discountitem?has_content>
            <tr>
                <td>&nbsp;</td>
                <td align="right"><b>Discount Total (${record.discountitem})</b></td>
                <td align="right">${record.discounttotal}</td>
            </tr>
        </#if>
        <tr>
            <td>&nbsp;</td>
            <td align="right"><b>Deposit Due</b></td>
            <td align="right">${record.custbody_fedag_depositamt}</td>
        </tr>
    
        <tr>
            <td>&nbsp;</td>
            <td align="right"><b>Final Invoice Amount</b></td>
            <td align="right">
                ${(((record.subtotal?keep_after('$'))?replace(",", ""))?number - record.custbody_fedag_depositamt)}
            </td>
        </tr>

    </table>

    <p>Make funds payable to Federal Ag Supply and mail as follows:
        <br />Federal Ag Supply
        <br />Attn: Ron Seibert
        <br />13959 W 107th St
        <br />Lenexa, KS 66215
        <br />THANK YOU FOR THE BUSINESS
    </p>
</body>
</pdf>