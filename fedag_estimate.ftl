<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
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
        <macro id="nlfooter">
            <table class="footer" style="width: 100%;">
                <tr>
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
            padding: 0;
            font-size: 10pt;
        }
        table.footer td {
            padding: 0;
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
            padding-top: 0;
        }
        td.totalboxmid {
            font-size: 28pt;
            padding-top: 20px;
            background-color: #e3e3e3;
        }
        td.totalboxbot {
            background-color: #e3e3e3;
            font-weight: bold;
        }

        td.item {
            border-right: .5px  #e3e3e3 solid;
            border-left: .5px  #e3e3e3 solid;
        }
        span.title {
            font-size: 20pt;
            font-weight: bold;
        }
        span.number {
            font-size: 12pt;
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
        .disclaimer {
            font-size: 8pt;
        }
</style>
</head>
<body footer="nlfooter" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">

<table class="header" style="width: 100%;">
                <tr>
                    <td rowspan="3" colspan="12" align="left">
                    <#if record.customform=="Federal Ag Estimate (Swine)">
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=822&amp;c=4922271&amp;h=fa68d97433f853a2783d" style="width: 300px; height: 75px; position: fixed; top: 0" /> 
                        <#elseif record.customform=="Federal Ag Estimate (Beef)"> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=823&amp;c=4922271&amp;h=1d3ecd98da559d9b44a3" style="width: 300px; height: 75px; position: fixed; top: 0" /> 
                        <#elseif record.customform=="Federal Ag Estimate (Stockade)"> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=108153&amp;c=4922271&amp;h=731ae9783241968899a4" style="width: 300px; height: 75px; position: fixed; top: 0" /> 
                        <#else> 
                            <img src="https://system.na3.netsuite.com/core/media/media.nl?id=384&amp;c=4922271&amp;h=d6a8061a8161cfe4be16" style="width: 300px; height: 75px; position: fixed; top: 0" /> 
                    </#if>
                    </td>
                    <td align="left" rowspan="1" colspan="12"><span class="title">${record@title}</span></td>
                </tr>
                <tr style="padding-bottom: 20px">
                    <td align="left" colspan="12" rowspan="1"><span class="number">#${record.tranid}</span></td>
                </tr>
                <tr>
                    <td align="left" colspan="6"><b>Proposal Date</b></td>
                    <td align="left" colspan="6" rowspan="1">${record.trandate}</td>
                </tr>
                <tr>
                    <td class="address" colspan="6"><br/>${companyInformation.addressText}</td>
                    <td colspan="6">&nbsp;</td>
                    <td colspan="6">&nbsp;</td>
                    <td colspan="6">&nbsp;</td>
                </tr>
                <tr style="padding-bottom: 10px">
                    <td colspan="6">&nbsp;</td>
                    <td colspan="6">&nbsp;</td>
                    <td align="left" colspan="6"><b>Terms (1)</b></td>
                    <td align="left" colspan="6" rowspan="1">${record.custbody_tc_termsdefinition}</td>
                </tr>
                <tr style="padding-bottom: 10px">
                    <td colspan="6">&nbsp;</td>
                    <td colspan="6">&nbsp;</td>
                    <td align="left" colspan="6"><b>Terms (2)</b></td>
                    <td align="left" colspan="6" rowspan="1">${record.custbody_tc_termsdef2}</td>
                </tr>
                <tr>
                    <td colspan="6">&nbsp;</td>
                    <td colspan="6">&nbsp;</td>
                    <td align="left" colspan="6"><b>${record.shipmethod@label}</b></td>
                    <td align="left" colspan="6" rowspan="1">${record.shipmethod}</td>
                </tr>
            </table>
    <table style="width: 45%;">
        <tr>
            <td class="addressheader" colspan="4"><b>${record.billaddress@label}</b></td>
            <td class="addressheader" colspan="4"><b>${record.shipaddress@label}</b></td>
        </tr>
        <tr>
            <td class="address" colspan="4" rowspan="2">${record.billaddress}</td>
            <td class="address" colspan="4" rowspan="2">${record.shipaddress}</td>
        </tr>
    </table>

<#if record.item?has_content>

<table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start items -->

<#assign shipCost=0>
<#assign tariff=0>
<#assign duties=0>
<#assign commission=0>
<#assign discount=0>

<#assign newItemRate=0>
<#assign newItemAmount=0>
<#assign newSubtotal=0>
<#assign operator=0>

<#list record.item as item>
<!--Variables necessary for calculations-->
    <#if item.item?? && item.item =="Shipping">
        <#assign shipCost += (((item.amount?keep_after('$')?replace(",", "")))?number)>
    </#if>
    <#if item.item?? && item.item == "US Tariff">
        <#assign tariff += (((item.amount?keep_after('$')?replace(",", "")))?number)>
    </#if>
    <#if item.item?? && item.item == "Customs Duties">
        <#assign duties += (((item.amount?keep_after('$')?replace(",", "")))?number)>
    </#if>
    <#if item.item?? && item.item == "Dealer Commission">
        <#assign commission += (((item.amount?keep_after('$')?replace(",", "")))?number)>
    </#if>
    <#if item.item?? && item.item == "Sales Discount">
        <#assign discount += ((((item.amount?keep_after('$')?replace(",", "")))?keep_before(")"))?number)>
    </#if>
        <#assign newSubtotal = ((((record.subtotal?keep_after('$'))?replace(",", ""))?number) - (shipCost + tariff + duties + commission - discount))>

</#list>

    <#list record.item as item>

    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
    </#if>

    <!--Only rolling up one of the costs-->
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission ==false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission>
    </#if>

    <!--Rolling up three of the costs-->
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
    </#if>

    <!---Rolling up two of the costs-->
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == true && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * tariff + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == true && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * commission)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == true && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == true && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number) + ((((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * shipCost + (((item.amount?keep_after('$'))?replace(",", ""))?number / newSubtotal) * duties)>
    </#if>
    <#if record.custbody_fedag_rollshippingcost == false && record.custbody_fedag_rolltariffcost == false && record.custbody_fedag_rollduties == false && record.custbody_fedag_rollcommission == false && item.item != "Sales Discount">
        <#assign newItemAmount = (((item.amount?keep_after('$')?replace(",", "")))?number)>
    </#if>

    <#if item.quantity != 0>
        <#assign newItemRate = newItemAmount / item.quantity>
    </#if>
        
<#if item_index==0>
<thead>
	<tr>
    <th align="left" colspan="4">${item.item@label}</th>
	<th align="center" colspan="3">${item.quantity@label}</th>
	<th colspan="9">${item.description@label}</th>
	<th align="right" colspan="4">${item.rate@label}</th>
	<th align="right" colspan="4">${item.amount@label}</th>
    <th colspan="3">Total<br/>Weight</th>
	</tr>
</thead>
</#if>

<#if item.item != "Shipping" && item.item != "US Tariff" && item.item != "Customs Duties" && item.item != "Dealer Commission" && item.item != "Sales Discount"><tr>
        
        <td align="left" colspan="4" class="item">${item.item}</td>
        <td align="center" colspan="3" line-height="150%" class="item">${item.quantity}</td>
        <td colspan="9" class="item">${item.description}</td>
	
	<#if (((item.amount?keep_after('$')?replace(",", "")))?number) != 0>
        <td align="right" colspan="4" class="item">${newItemRate?string.currency}</td>
        <td align="right" colspan="4" class="item">${newItemAmount?string.currency}</td>
	<#else>
        <td align="right" colspan="4" class="item">${item.rate}</td>
        <td align="right" colspan="4" class="item">${item.amount}</td>
	</#if>

    <td colspan="3" class="item">${item.custcol_tc_totalweight}</td>
    </tr>
	<#elseif (item.item == "Shipping" && record.custbody_fedag_rollshippingcost == false) ||  (item.item == "US Tariff" && record.custbody_fedag_rolltariffcost == false) || (item.item == "Customs Duties" && record.custbody_fedag_rollduties == false) || (item.item == "Dealer Commission" && record.custbody_fedag_rollcommission == false) || (item.item == "Sales Discount")>
	<tr>
    <td align="left" colspan="4" class="item">${item.item}</td>
	<td align="center" colspan="3" line-height="150%" class="item">${item.quantity}</td>
	<td colspan="9" class="item">${item.description}</td>
	
	<td align="right" colspan="4" class="item">${item.rate}</td>
	<td align="right" colspan="4" class="item">${item.amount}</td>
    <td colspan="3" class="item">${item.custcol_tc_totalweight}</td>
	</tr>
	</#if></#list><!-- end items --></table>

<hr /></#if>
<table class="total" style="width: 100%; margin-top: 10px;">
	<tr>
	<td background-color="#ffffff" colspan="4">&nbsp;</td>
	<td align="right"><b>${record.total@label}</b></td>
	<td align="right">${record.total}</td>
	</tr></table>

<p class="disclaimer">
SHIPPING INSTRUCTIONS: The above prices include shipping cost to the above shipping address. OTHER CHARGES: Prices do not include sales
taxes of the area of destination. Customer agrees to pay taxes applicable to their area if assessed by the local or federal authorities and any new taxes,
tariffs, duties, or other government impositions becoming affective after the Proposal Date above. NOTE: Proposal is valid for 30 days from the
original issue date. SECURITY AGREEMENT: Buyer grants to Seller a purchase money security interest in and to all equipment sold to Buyer
pursuant to this Proposal for the purpose of collateralizing any and all sums owed by Buyer to Seller as a result of the sale. This Security Agreement
between Seller and Buyer incorporates by reference the provisions of the Uniform Commercial Code, as adopted by the State of Kansas, and Seller
shall have all rights and remedies of a secured party set forth in those provisions, including any and all rights and remedies applicable in the event of
Buyer’s non-performance and/or breach of one or more of the terms and conditions of sale set forth herein. Buyer authorizes Seller to file a UCC
Financing Statement for all equipment sold pursuant to this Proposal. Customer agrees and acknowledges the quantities and parts are correct as listed
herein and that all listed items will be used in an agricultural or horticultural pursuit. PLEASE SIGN HERE, FORWARD CERTIFIED FUNDS AS PER
THE ABOVE TERMS, AND RETURN TO US FOR ORDER PROCESSING. IF ACCEPTED BY SIGNING BELOW, THIS PROPOSAL BECOMES A
BINDING, NON-CANCELLABLE CONTRACT.
<br/>
<br/>
ACCEPTED:
X______________________________________________Date: ______________________
</p>
</body>
</pdf>