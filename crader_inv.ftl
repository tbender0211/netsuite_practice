<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
  <head>
    <#if .locale == "ru_RU">
      <link name="verdana" type="font" subtype="opentype" src="${nsfont.verdana}" src-bold="${nsfont.verdana_bold}" bytes="2" />
      </#if>
    <macrolist>
      <macro id="nlheader">
        <table class="header" style="width: 100%;"><tr>
          <td colspan="4" style="margin:15px;"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left;" /> </#if></td>
          <td colspan="4" style="padding-top: 12px;margin:12px;"><span><b>Remit To:</b></span><br /><span class="nameandaddress">Crader Distributing<br/>808 Highway 34 West<br/>Marble Hill, MO 63764</span></td>
          <td class="titlesize" style="padding-top: 12px;" colspan="4"><img class="imgsize" src="https://4850262-sb1.app.netsuite.com/core/media/media.nl?id=23208&amp;c=4850262_SB1&amp;h=33dfb2197b68996664d2" style="float: right;padding-top: 12px;"/><br/><br/><br/><br/><b>${record@title}:</b>${record.tranid}<br/><b>Date:</b> ${record.trandate}</td>

          </tr>
          <tr><td class="fontsize"  colspan="4">&nbsp;&nbsp;<b>CDC</b>:(573)238-2675</td></tr>
          <tr><td class="fontsize"  colspan="4">&nbsp;&nbsp;<b>BME</b>:(972)548-9045</td>
            <td  colspan="4"></td>
          </tr></table>
      </macro>
      <macro id="nlfooter">
        <table class="footer" style="width: 100%;"><tr>
          <td><barcode codetype="code128" showtext="true" value="${record.tranid}"/></td>
          <td align="right"><pagenumber/> of <totalpages/></td>
          </tr></table>
      </macro>
    </macrolist>
    <style type="text/css">table {
      <#if .locale == "zh_CN">
      font-family: stsong, sans-serif;
      <#elseif .locale == "zh_TW">
      font-family: msung, sans-serif;
      <#elseif .locale == "ja_JP">
      font-family: heiseimin, sans-serif;
      <#elseif .locale == "ko_KR">
      font-family: hygothic, sans-serif;
      <#elseif .locale == "ru_RU">
      font-family: verdana;
      <#else>
      font-family: sans-serif;
      </#if>
      font-size: 9pt;
      table-layout: fixed;
      }
      td.titlesize {
        font-size: 12pt;
      }

      td.fontsize {
        font-size: 8pt;
      }

      img.imgsize {
        width: 150px;
        height: 60px;
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
        /*padding: 4px 6px;*/
      }
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
        font-size: 10pt;
        /*padding-top: 20px;*/
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
      td p {
        text-align: left;
      }
      th p {
        text-align: left;
      }
    </style>
  </head>
  <body header="nlheader" header-height="17%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
    <table style="width: 100%; margin-top: 10px;">

      <tr>
        <td class="addressheader" colspan="3"><b>${record.billaddress@label}</b></td>
        <td class="addressheader" colspan="3"><b>${record.shipaddress@label}</b></td>
        <td class="totalboxtop" colspan="2"><b>${record@title?upper_case}</b></td>
        <td class="totalboxtop" colspan="2"><b>${record.duedate@label?upper_case}</b></td>
        <td class="totalboxtop" colspan="2"><b>Amount</b></td>
      </tr>
      <tr><td colspan="3"><b>Customer #:</b> ${record.entity.entityid}</td><td colspan="3"><b>Customer #:</b> ${record.entity.entityid}</td><td class="totalboxmid" colspan="3"></td><td class="totalboxmid" colspan="3"></td>
      </tr>
      <tr>

        <td class="address" colspan="3" rowspan="2">${record.billaddress}</td>
        <td class="address" colspan="3" rowspan="2">${record.shipaddress}</td>
        <td class="totalboxmid" colspan="2">${record.tranid}</td>
        <td class="totalboxmid" colspan="2">${record.duedate}</td>
        <td class="totalboxmid" colspan="2">${record.total}</td>
      </tr>
      <tr></tr></table>

    <table class="body" style="width: 100%; margin-top: 10px;"><tr>
      <th>Order #</th>
      <th>${record.terms@label}</th>
      <th>${record.duedate@label}</th>
      <th>${record.otherrefnum@label}</th>
      <th>${record.salesrep@label}</th>
      <th>${record.shipmethod@label}</th>
      </tr>
      <tr>
        <td>${record.tranid}</td>
        <td>${record.terms}</td>
        <td>${record.duedate}</td>
        <td>${record.otherrefnum}</td>
        <td>${record.salesrep}</td>
        <td align="center">${record.shipmethod}</td>
      </tr></table>
    <#if record.item?has_content>

      <table class="itemtable" style="width: 100%; margin-top: 10px;">
      <!-- start items -->
      <#list record.item as item>
            <#if item_index==0>
                <thead>
                    <tr>
                        <th align="left" colspan="3">Qty. Ordered</th>
                        <th align="left" colspan="3">Qty. Shipped</th>
                        <th align="left" colspan="10">${item.item@label}/${item.description@label}</th>
                        <th align="right" colspan="4">Suggested List</th>
                        <th align="right" colspan="4">Dealer Cost</th>
                        <th align="right" colspan="3">${item.amount@label}</th>
                    </tr>
                </thead>
            </#if>
            <tr>
                <td align="center" colspan="3" line-height="150%">${item.quantityordered}</td>
                <td align="center" colspan="3" line-height="150%">${item.quantity}</td>
                <td align="left" colspan="10">
                    <span class="itemname">
                        <#if item.item?contains(' - CDC')>
                            ${item.item?keep_before(' - CDC')}
                        <#elseif item.item?contains(' - BME')>
                            ${item.item?keep_before(' - BME')}
                        <#else>
                            ${item.item}
                        </#if>
                    </span>
                    <br />${item.description}
                </td>
                <td align="right" colspan="4">${item.custcol_so_srp}</td>
                <td align="right" colspan="4">${item.rate}</td>
                <td align="right" colspan="3">${item.amount}</td>
            </tr>
            <#if item.custcol_line_notes != ''>
                <tr style="padding-bottom:2px;">
                    <td colspan="26" style="font-size: 8pt">
                        <b>Line Comments:</b>   ${item.custcol_line_notes}
                    </td>
                </tr>
            </#if>
        	<#if item.custcol_serials_1 != ''>
                <tr style="padding-bottom:2px;">
                    <td colspan="26" style="font-size: 8pt">
                        <b>SN:	</b>${item.custcol_serials_1?split(',')?join('	')}
                        <#if item.custcol_serials_2?? && item.cutcol_serials_2 != ''>
                                ${item.custcol_serials_2?split(',')?join('	')}
                        </#if>
                    </td>
                </tr>
            </#if>
        </#list>
        <!-- end items -->
        </table>

        <hr />
    </#if>

    <#if record.installment?has_content>

      <table class="installment-table" style="width: 100%; margin-top: 10px;">
      <!-- start items -->
      <#list record.installment as installment>
            <#if installment_index==0>
                <thead>
                    <tr>
                        <th colspan="10">${installment.duedate@label}</th>
                        <th colspan="4">${installment.amount@label}</th>
                    </tr>
                </thead>
            </#if>
            <tr>
                <td colspan="10">${installment.duedate}</td>
                <td colspan="4">${installment.amount}</td>
            </tr>
        </#list>
        <!-- end items -->
        </table>

        <hr />
    </#if>
    <#if record.custbody_so_order_comments != ''>
        <p style="font-family: sans-serif; font-size: 10pt;"><b>Order Comments:  </b>
        ${record.custbody_so_order_comments}</p>
    </#if>
    <table class="total" style="width: 100%; margin-top: 10px;">
        <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right" colspan="4"><b>${record.subtotal@label}</b></td>
            <td align="right">${record.subtotal}</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right" colspan="4"><b>${record.taxtotal@label} (${record.taxrate}%)</b></td>
            <td align="right">${record.taxtotal}</td>
      </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
            <td align="right" colspan="4"><b>Freight Total</b></td>
            <td align="right">${record.shippingcost}</td>
        </tr>
        <tr class="totalrow">
            <td background-color="#ffffff" colspan="4">&nbsp;</td>
            <td align="right" colspan="4"><b>${record.total@label}</b></td>
            <td align="right">${record.total}</td>
        </tr>
      </table>
  </body>
</pdf>