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
    <style type="text/css">* {
		<#if .locale == "zh_CN">
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		<#elseif .locale == "zh_TW">
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		<#elseif .locale == "ja_JP">
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		<#elseif .locale == "ko_KR">
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		<#elseif .locale == "th_TH">
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		<#else>
			font-family: Courier New,Courier, monospace;
            font-size: 11pt;
		</#if>
		}
        .check table, .voucher1 table, .voucher2 table {
            position: relative;
            overflow: hidden;
            font-size: 11pt;
            padding: 0;
        }
		td p { align:left }
</style>
</head>
<body padding="0.15in 0.15in 0.15in 0.15in" size="Letter">
    <#list records as check>

        <#assign vendorNum = check.entity?keep_before(r"\s", "r")>
        <#if check.entity?contains(" : ")>
            <#assign vendor = check.entity?keep_after(r"\s*:\s*", "r")>
        <#else>
            <#assign vendor = check.entity>
        </#if>
        <#assign totalGross = 0>
        <#assign totalDisc = 0>
        <#assign totalNet = 0>

        <div style="position: relative;font-family: Courier New,Courier, monospace; top= -11pt;height: 250pt;width: 612pt;page-break-inside: avoid;">
            <table style="position: absolute;overflow: hidden;left: 300pt;top: 110pt;height: 18pt;width: 300pt;">
                <tr>
                    <td style="width: 20pt" align="right"><span style="font-family:Courier New,Courier,monospace;">${check.checknumber}</span></td>
                    <td style="width: 30pt" align="right"><span style="font-family:Courier New,Courier,monospace;">${check.trandate}</span></td>
                    <td style="width: 40pt">
                        ***********
                        <#if (check.usertotal?length > 0)>
                            ${check.usertotal}
                        <#else>
                            ${check.total}
                        </#if>
                    </td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;left: 25pt;top: 125pt;height: 18pt;width: 572pt;">
                <tr>
                    <td><span style="font-family:Courier New,Courier,monospace;">${check.totalwords?upper_case}</span></td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;left: 41pt;top: 148pt;height: 80pt;width: 537pt;">
                <tr>
                    <td style="height: 92px;">
                    <#if check.address??>
                        ${check.address?upper_case}
                    <#else>
                        ${check.entity?upper_case}
                    </#if>
                    </td>
                </tr>
            </table>
        </div>

        <div style="position: relative;font-family: Helvetica,sans-serif;height: 250pt;width: 612pt;page-break-before: avoid;">
            <table style="position: absolute;left: 482pt;top: 18pt;height: 7pt;width: 40pt;">
                <tr>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace; padding: 0;">Check</span></td>
                </tr>
                <tr>
                    <td align="left" style="vertical-align: top; padding: 0;"><span style="font-family:Courier New,Courier,monospace;">${check.checknumber}</span></td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;left: 175pt;top: 18pt;height: 7pt;width: 300pt;">
                <tr>
                    <td style="width: 100pt;" align="left"><span style="font-family:Courier New,Courier,monospace;">Vendor No.</span></td>
                    <td style="width: 200pt;" align="left"><span style="font-family:Courier New,Courier,monospace;">Vendor Name</span></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>${check.entity}</td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;top: 53pt;width: 95%;">
                <tr style="border-top: solid black .1px; border-bottom: solid black .1px;">
                    <th colspan="3" align="left"><span style="font-family:Courier New,Courier,monospace;">Date</span></th>
                    <th colspan="3" align="left"><span style="font-family:Courier New,Courier,monospace;">Reference</span></th>
                    <th colspan="1" align="left"><span style="font-family:Courier New,Courier,monospace;">PO No.</span></th>
                    <th colspan="1" align="right"><span style="font-family:Courier New,Courier,monospace;">Gross Amount</span></th>
                    <th colspan="3" align="right"><span style="font-family:Courier New,Courier,monospace;">Discount</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Net Amount</span></th>
                </tr>
            
                <#if check.item?has_content || check.expense?has_content || check.apply?has_content>
                        <#assign lineCount = 0>
                        <#list check.expense as expense>

                            <#assign totalGross += expense.amount>
                            <#assign totalNet += expense.amount>
                            <#assign disc = expense.disc?string>
                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${expense.date}</td>
                                    <td colspan="3">${expense.refnum}</td>
                                    <td colspan="1">&nbsp;</td>
                                    <td colspan="1" align="right">${expense.amount}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${expense.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${expense.amount}</td>
                                </tr>
                            </#if>
                        </#list>
                        <#list check.item as item>

                            <#assign lineGross = item.rate * item.quantity>
                            <#assign totalGross += lineGross>
                            <#assign totalNet += item.amount>
                            <#assign disc = item.disc?string>

                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${item.date}</td>
                                    <td colspan="3">${item.refnum}</td>
                                    <td colspan="1">${item.custcol_atlas_rc_so}</td>
                                    <td colspan="1" align="right">${lineGross?string.currency}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${item.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${item.amount}</td>
                                </tr>
                            </#if>
                        </#list>
                        <#list check.apply as apply>
                            <#assign totalGross += apply.total>
                            <#assign totalNet += apply.amount>
                            <#assign disc = apply.disc?string>
                            <#assign totalDisc += apply.disc>
                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${apply.applydate}</td>
                                    <td colspan="3">${apply.refnum}</td>
                                    <td colspan="1">${apply.memo}</td>
                                    <td colspan="1" align="right">${apply.total}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${apply.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${(apply.total - apply.disc)?string.currency}</td>
                                </tr>
                            </#if>
                        </#list>
                </#if>
            </table>

        </div>

        <div style="position: relative;height: 250pt;width: 612pt;page-break-before: avoid;">

            <table style="position: absolute;overflow: hidden;left: 0pt;top: -70pt;height: 250pt;width: 300pt;">
                <tr>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace;">Acct. No.</span></td>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace;">${check.account}</span></td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;top: -43pt;width: 95%;">
                <tr style="border-top: solid black .1px; border-bottom: solid black .1px;">
                    <th colspan="2" align="left"><span style="font-family:Courier New,Courier,monospace;">Check Date</span></th>
                    <th colspan="2" align="left"><span style="font-family:Courier New,Courier,monospace;">Check No.</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Total Gross</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Total Disc.</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Check Amount</span></th>
                </tr>
                <tr>
                    <td colspan="2">${check.trandate}</td>
                    <td colspan="2">${check.tranid}</td>
                    <td colspan="2" align="right">${totalGross?string.currency}</td>
                    <td colspan="2" align="right">${totalDisc?string.currency}</td>
                    <td colspan="2" align="right">
                        <#if (check.usertotal?length > 0)>
                            ${check.usertotal}
                        <#else>
                            ${check.total}
                        </#if>
                    </td>
                </tr>
            </table>
        </div>
        <div style="position: relative;font-family: Helvetica,sans-serif;height: 250pt;width: 612pt;page-break-before: avoid;">
            <table style="position: absolute;left: 482pt;top: -200pt;height: 7pt;width: 40pt;">
                <tr>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace; padding: 0;">Check</span></td>
                </tr>
                <tr>
                    <td align="left" style="vertical-align: top; padding: 0;"><span style="font-family:Courier New,Courier,monospace;">${check.checknumber}</span></td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;left: 175pt;top: -200pt;height: 7pt; width: 300pt;;">
                <tr>
                    <td style="width: 100pt" align="left"><span style="font-family:Courier New,Courier,monospace;">Vendor No.</span></td>
                    <td style="width: 200pt" align="left"><span style="font-family:Courier New,Courier,monospace;">Vendor Name</span></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>${check.entity}</td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;top: -160pt;width: 95%;">
                <tr style="border-top: solid black .1px; border-bottom: solid black .1px;">
                    <th colspan="3" align="left"><span style="font-family:Courier New,Courier,monospace;">Date</span></th>
                    <th colspan="3" align="left"><span style="font-family:Courier New,Courier,monospace;">Reference</span></th>
                    <th colspan="1" align="left"><span style="font-family:Courier New,Courier,monospace;">PO No.</span></th>
                    <th colspan="1" align="right"><span style="font-family:Courier New,Courier,monospace;">Gross Amount</span></th>
                    <th colspan="3" align="right"><span style="font-family:Courier New,Courier,monospace;">Discount</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Net Amount</span></th>
                </tr>
            
                <#if check.item?has_content || check.expense?has_content || check.apply?has_content>
                        <#assign lineCount = 0>
                        <#list check.expense as expense>

                            <#assign totalGross += expense.amount>
                            <#assign totalNet += expense.amount>
                            <#assign disc = expense.disc?string>
                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${expense.date}</td>
                                    <td colspan="3">${expense.refnum}</td>
                                    <td colspan="1">&nbsp;</td>
                                    <td colspan="1" align="right">${expense.amount}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${expense.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${expense.amount}</td>
                                </tr>
                            </#if>
                        </#list>
                        <#list check.item as item>

                            <#assign lineGross = item.rate * item.quantity>
                            <#assign totalGross += lineGross>
                            <#assign totalNet += item.amount>
                            <#assign disc = item.disc?string>

                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${item.date}</td>
                                    <td colspan="3">${item.refnum}</td>
                                    <td colspan="1">${item.custcol_atlas_rc_so}</td>
                                    <td colspan="1" align="right">${lineGross?string.currency}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${item.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${item.amount}</td>
                                </tr>
                            </#if>
                        </#list>
   <#list check.apply as apply>
                            <#assign totalGross += apply.total>
                            <#assign totalNet += apply.amount>
                            <#assign disc = apply.disc?string>
                            <#assign totalDisc += apply.disc>
                            <#if lineCount < 6>
                                <#assign lineCount++>
                                <tr>
                                    <td colspan="3">${apply.applydate}</td>
                                    <td colspan="3">${apply.refnum}</td>
                                    <td colspan="1">${apply.memo}</td>
                                    <td colspan="1" align="right">${apply.total}</td>
                                    <td colspan="3" align="right">
                                        <#if disc != "">${apply.disc}<#else>${0?string.currency}</#if>
                                    </td>
                                    <td colspan="2" align="right">${(apply.total - apply.disc)?string.currency}</td>
                                </tr>
                            </#if>
                        </#list>
                </#if>
            </table>

            <table style="position: absolute;overflow: hidden;left: 0pt;top: -33pt;height: 250pt;width: 300pt;">
                <tr>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace;">Acct. No.</span></td>
                    <td align="left"><span style="font-family:Courier New,Courier,monospace;">${check.account}</span></td>
                </tr>
            </table>

            <table style="position: absolute;overflow: hidden;top: -10pt;width: 95%;">
                <tr style="border-top: solid black .1px; border-bottom: solid black .1px;">
                    <th colspan="2" align="left"><span style="font-family:Courier New,Courier,monospace;">Check Date</span></th>
                    <th colspan="2" align="left"><span style="font-family:Courier New,Courier,monospace;">Check No.</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Total Gross</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Total Disc.</span></th>
                    <th colspan="2" align="right"><span style="font-family:Courier New,Courier,monospace;">Check Amount</span></th>
                </tr>
                <tr>
                    <td colspan="2">${check.trandate}</td>
                    <td colspan="2">${check.tranid}</td>
                    <td colspan="2" align="right">${check.total}</td>
                    <td colspan="2" align="right">${totalDisc?string.currency}</td>
                    <td colspan="2" align="right">
                        <#if (check.usertotal?length > 0)>
                            ${check.usertotal}
                        <#else>
                            ${check.total}
                        </#if>
                    </td>
                </tr>
            </table>
        </div>

    </#list>
</body>
</pdf>