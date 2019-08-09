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
        <macro id="nlheader">
            <table class="header" style="width: 100%;">
                <tr>
                    <td rowspan="3">
                        <#if companyInformation.logoUrl?length != 0>
                            <img src="${companyInformation.logoUrl}" style="float: left; margin: 7px; width: 250px; height: 125px;" /> 
                        </#if> 
                    </td>
                    <td align="right">&nbsp;</td>
                </tr>
                <tr>
                <td align="right"><span class="nameandaddress">${companyInformation.companyName}</span><br /><span class="nameandaddress">${companyInformation.addressText}</span></td>
                </tr>
                <tr>
                    <td align="right"><b>"Proudly Serving Customers for 50 Years"</b></td>
                </tr>
            </table>
        </macro>
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
    <table style="width: 100%; margin-top: 10px; padding-top:40px;">
        <tr>
            <td colspan="6">Date: ${record.trandate}</td>
            <td colspan="10" align="right">Quote #: ${record.tranid}</td>
        </tr>
        <tr>
            <td class="addressheader" colspan="6"><b>To: </b></td>
            <td colspan="5"><b>&nbsp;</b></td>
        </tr>
        <tr>
            <td class="address" colspan="6" rowspan="2">${record.billaddress}</td>
            <td align="right" colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="5">&nbsp;</td>
            <td align="right" colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6"><b>Phone:</b> ${record.entity.phone}</td>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="5"><b>From:</b> ${record.custbody10}</td>
            <td colspan="8" align="left"><b>Email:</b> ${record.custbody11}</td>
        </tr>
    </table>
  	<#if record.custbody8 != ''>
    <p>${record.custbody8}</p>
    </#if>
<#assign itemCount=1>
<#if record.item?has_content>

    <table class="itemtable" style="width: 100%; margin-top: 10px;"><!-- start items -->
        <#list record.item as item>
            <#if item_index==0>
                <thead>
                    <tr>
                        <th colspan="2">Item</th>
                        <th align="center" colspan="3">${item.quantity@label}</th>
                        <th colspan="12">${item.item@label}</th>
                        <th align="right" colspan="4">Unit Price</th>
                        <th align="right" colspan="4">Total</th>
                    </tr>
                </thead>
            </#if>
            <tr>
                <td colspan="2">${itemCount}</td>
                <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
                <td colspan="12"><span class="itemname">${item.item}</span><br />${item.description}</td>
                <td align="right" colspan="4">${item.rate}</td>
                <td align="right" colspan="4">${item.amount}</td>
            </tr>
            <#assign itemCount += 1>
        </#list><!-- end items -->
    </table>

<hr />
</#if>

<table class="total" style="width: 100%; margin-top: 10px;">
    <tr>
        <td colspan="4">&nbsp;</td>
        <td align="right"><b>${record.subtotal@label}</b></td>
        <td align="right">${record.subtotal}</td>
	</tr>
	<tr>
        <td colspan="4">&nbsp;</td>
        <td align="right"><b>${record.altshippingcost@label}</b></td>
        <td align="right">${record.altshippingcost}</td>
	</tr>
	<tr>
        <td colspan="4">&nbsp;</td>
        <td align="right"><b>${record.taxtotal@label} (${record.taxrate}%)</b></td>
        <td align="right">${record.taxtotal}</td>
	</tr>
	<tr class="totalrow">
        <td background-color="#ffffff" colspan="4">&nbsp;</td>
        <td align="right"><b>${record.total@label}</b></td>
        <td align="right">${record.total}</td>
	</tr>
</table>

  	<#if record.custbody9 != ''>
    <p>${record.custbody9}</p>
    </#if>
  
</body>
</pdf>