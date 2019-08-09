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
     <#list results as result>
        <table class="header" style="width: 100%;">
            <tr>
                <td rowspan="3"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin-right: 7px;margin-top: 0px;width: 140px;height: 50px;" /> </#if> <span class="nameandaddress"><br/>${companyInformation.companyName}</span><br /><span class="nameandaddress">support@meridianbusiness.com<br/> 913.481.7309</span></td>
                <td align="right"><span class="title">${result.customer}</span></td>
            </tr>
            <tr>
                <td align="right"><span class="number">${result.formulatext_3}</span></td>
            </tr>
            <tr>
                <td align="right"><span class="subtitle">Project Duration: ${result.startdate} to ${result.custentity_mbs_target_golive}</span></td>
            </tr>
        </table>
     <#break>
     </#list>
        </macro>
        <macro id="nlfooter">
            <table class="footer" style="width: 100%;"><tr>
	<td align="right"><pagenumber/> of <totalpages/></td>
	</tr></table>
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
			table-layout: auto;
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
		td p { align:left; }
      	p {align: left;}
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
      tr.phase_header {
        	background-color:#003366;
        	color:#ffffff;
            border-bottom: 1pt solid white;
      }
      tr.overdue {
        	color:#ff0000;
      }
      tr.duesoon {
        	color:#ffa500;
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
            font-size: 28pt;
            padding-top: 20px;
            background-color: #e3e3e3;
        }
      	td.excellent_status {
            padding-top: 10px;
            background-color: #0B6623;
            color:#ffffff;
        }
        td.good_status {
            padding-top: 10px;
            background-color: LightGreen;
            color:#ffffff;
        }
        td.behind_status {
            padding-top: 10px;
            background-color: DarkOrange;
            color:#ffffff;
        }
        td.bad_status {
            padding-top: 10px;
            background-color: DarkRed;
            color:#ffffff;
        }
        td.customer_status {
            padding-top: 10px;
            background-color: #003366;
            color:#ffffff;
        }
        td.totalboxbot {
            background-color: #e3e3e3;
            font-weight: bold;
        }
        span.number {
            font-size: 12pt;
        }
      span.title {
            font-size: 14pt;
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
        .itemtable td {
            padding: 4px 6px;
            border-bottom: .5pt solid #D3D3D3;
        }
        .taskmessage {
            font-size: 7pt;
        }
</style>
</head>
<body header="nlheader" header-height="10%" footer="nlfooter" footer-height="20pt" padding="0.5in 0.5in 0.5in 0.5in" size="Letter-landscape">
  <#list results as result>
    <table style="width: 100%; margin-top: 10px;"><tr>
	<td class="addressheader" colspan="3"><b>Project Lead</b></td>
	<td class="addressheader" colspan="3"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
      <#assign class_status=''>
        <#if customer_copy == false>
            <#if result.custentity_mbs_project_health=='1-Excellent'>
            <#assign class_status='class="excellent_status"'>
                </#if>
            <#if result.custentity_mbs_project_health== '2-Good'>
            <#assign class_status='class="good_status"'>
            </#if>
            <#if result.custentity_mbs_project_health== '3-Behind'>
            <#assign class_status='class="behind_status"'>
            </#if>
            <#if result.custentity_mbs_project_health== '4-Needs Executive Assistance'>
            <#assign class_status='class="bad_status"'>
            </#if>
        <#else>
            <#assign class_status='class="customer_status"'>
        </#if>
	<td ${class_status} colspan="6"><b><span style="color:#ffffff;">Project Status</span></b></td>
	</tr>
	<tr>
	<td class="address" colspan="3">${result.custentity_accountmanager}</td>
	<td class="address" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <#assign health=''>
    <#if result.custentity_mbs_project_health?length gt 2>
        <#assign health=result.custentity_mbs_project_health?substring(2)>
    </#if>
      
    <#assign status=''>
    <#if result.entitystatus?length gt 3>
        <#assign status=result.entitystatus?substring(3)>
    </#if>
	<td align="right" ${class_status} colspan="6" rowspan="4" >
        <span style="font-size:22px;font-weight: bold">${status} </span>
        <br/>
        <#if customer_copy==false>
            <span style="font-size:16px;" align="right">${health}</span>
        </#if>
        <br/>
        <span style="font-size:13px;font-weight: bold" align="right">Target Go Live: ${result.custentity_mbs_target_golive?string.long}</span></td>
	</tr>
     <tr>
      <td class="address" align="left"><b>Next 3 Project Action Items</b></td>
	</tr>
    <tr>
      <td class="address" align="left">${result.custentity_mbs_next_action1}</td>
	</tr>
      <tr>
      <td class="address" align="left">${result.custentity_mbs_next_action2}</td>
	</tr>
      <tr>
      <td class="address" align="left"> ${result.custentity_mbs_next_action3}</td>
	</tr>
    </table>
    <p align="right" style="font-size:18px;font-weight: bold; text-align:right;margin:3px;">
      Project Time Status:&nbsp;&nbsp;${result.actualtime?round} hours&nbsp;&nbsp;/&nbsp;&nbsp;${result.custentity_sowhours?round} hours
      &nbsp;&nbsp;=&nbsp;&nbsp;${(result.actualtime/result.custentity_sowhours*100)?round}%
    </p>
	<#break>
  </#list>



<table class="itemtable" style="width: 100%; margin-top: 10px;">
  <thead>
	<tr>
	<th><p>Task Title</p></th>
    <th><p>In Scope</p></th>
     <th><p>Status</p></th>
	<th><p>Est. Work</p></th>
	<th><p>Actual Work</p></th>
    <th><p>Est. % Comp</p></th> 
    <th><p>Assignee #1</p></th>
    <th><p>Assignee #2</p></th>
	<th><p>Start Date</p></th>
	<th><p>End Date</p></th>
      <th><p>Days Rem.</p></th>
	</tr>
</thead>
  <#assign prev_task=''>
  <!-- start items -->
    <#list results as task>
        <#if task.title != prev_task && task.title?has_content>
            <#if task.custevent_mbs_task_assign1!="" && task.estimatedwork gt 0> 
                <#assign completed=''>
                <#if (task.status=='Completed')>
                    <#assign completed=' style="text-decoration: line-through;"'>
                </#if>
                <#if task.title?contains(" : ") == false>
                    <tr class="phase_header">
                <#elseif (task.formulanumeric <=0 && task.status!="Completed") && (task.custevent_mbs_task_start_date?has_content)>
                    <tr class="overdue">
                <#elseif (task.formulanumeric <=7 && task.status!="Completed") && (task.custevent_mbs_task_start_date?has_content)>
                    <tr class="duesoon">
                <#else>
                    <tr>
                </#if>
                    <#if customer_copy==true>
                        <#if (task.formulatext?contains(".") && !task.formulatext?contains(")")) || (task.formulatext?contains(")") && task.formulatext?contains("(")) || task.formulatext?contains(".")>
                            <td><p ${completed}>${task.formulatext?keep_after_last(".")}</p></td>
                        <#elseif task.formulatext?contains(")")>
                            <td><p ${completed}>${task.formulatext?keep_after(") ")}</p></td>
                        <#else>
                            <td><p ${completed}>${task.formulatext}</p></td>
                        </#if>
                    <#else>
                        <td><p ${completed}>${task.formulatext}</p></td>
                    </#if>
                    <td><p ${completed}>${task.formulatext_2}</p></td>
                    <td><p ${completed}>${task.status}</p></td>
                    <td><p>${task.estimatedwork}</p></td>
                    <td><p>${task.actualwork}</p></td>
                    <td><p>${task.formulapercent}</p></td>
                    <td><p ${completed}>${task.custevent_mbs_task_assign1}</p></td>
                    <td><p ${completed}>${task.custevent_mbs_task_assign2}</p></td>
                    <td><p ${completed}>${task.custevent_mbs_task_start_date}</p></td>
                    <td><p ${completed}>${task.custevent_mbs_task_end_date}</p></td>
                    <td><p ${completed}>
                    <#if task.formulanumeric gt 0>
                        ${task.formulanumeric}
                    </#if>
                    </p></td>
                    <#assign prev_task=task.title>
                </tr>
            </#if>
        </#if>
    </#list><!-- end items -->
</table>

<pbr/>
  
  


  
  <p>
    <span class="title" align="center" style="font-size: 24px; text-align:center;">Customer Tasks</span>
  </p>
<table class="itemtable" style="width: 75%; margin-top: 10px;">
  <thead>
	<tr>
	<th><p>Due Date</p></th>
    <th><p>Status</p></th>
    <th><p>Assignee</p></th>
     <th><p>Task Title</p></th>
	 <th><p>Task Details</p></th>
     <th><p>Associated Project Step</p></th> 
      
	</tr>
</thead>
  <!-- start items --><#list results as task>
    <#if task.title_1?has_content>
      <tr>
        <td><p>${task.duedate}</p></td>
        <td><p>${task.status_1}</p></td>
        <td><p>${task.contact}</p></td>
        <td><p>${task.title_1}</p></td>
        <td><p>${task.message}</p></td>
        <td><p>${task.formulatext}</p></td>
      </tr>
    </#if>

	</#list><!-- end items --></table>
  
    <pbr/>
 <#if customer_copy == false> 
  <p>
    <span class="title" align="center" style="font-size: 24px; text-align:center;">Detailed Task View</span>
  </p>
<table class="itemtable" style="width: 100%; margin-top: 10px; height: 100%;">
  <thead>
	<tr>
	<th><p>Task Title</p></th>
    <th><p>In Scope</p></th>
     <th><p>Status</p></th>
	<th><p>Est. Work</p></th>
	<th><p>Actual Work</p></th>
    <th><p>Assignee #1</p></th>
    <th><p>Assignee #2</p></th>
	<th><p>Start Date</p></th>
	<th><p>End Date</p></th>
      <th><p>Days Rem.</p></th>
	</tr>
</thead>
  <#assign prev_task=''>
  <!-- start items --><#list results as task>
  <#if task.title != prev_task && task.title?has_content>
		<#assign completed=''>
        <#if (task.status=='Completed')>
          <#assign completed=' style="text-decoration: line-through;"'>
        </#if>
        <#if task.title?contains(" : ") == false>
          <tr class="phase_header">
        <#elseif (task.formulanumeric <=0 && task.status!="Completed") && (task.custevent_mbs_task_start_date?has_content)>
          <tr class="overdue">
        <#elseif (task.formulanumeric <=7 && task.status!="Completed") && (task.custevent_mbs_task_start_date?has_content)>
          <tr class="duesoon">
        <#else>
          <tr>
        </#if>
          <td>
            <p ${completed}>
                ${task.formulatext}
            </p>
          </td>
          <td><p ${completed}>${task.formulatext_2}</p></td>
          <td><p ${completed}>${task.status}</p></td>
          <td><p>${task.estimatedwork}</p></td>
          <td><p>${task.actualwork}</p></td>
          <td><p ${completed}>${task.custevent_mbs_task_assign1}</p></td>
          <td><p ${completed}>${task.custevent_mbs_task_assign2}</p></td>
          <td><p ${completed}>${task.custevent_mbs_task_start_date}</p></td>
          <td><p ${completed}>${task.custevent_mbs_task_end_date}</p></td>
          <td><p ${completed}>${task.formulanumeric}</p></td>
      </tr>
      <#assign prev_task=task.title>
	</#if>
	</#list><!-- end items --></table>
</#if>

</body>
</pdf>