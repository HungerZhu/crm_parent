<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CRM 管理中心 - 添加客户</title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="__GROUP__/Category/categoryList">客户列表</a></span>
    <span class="action-span1"><a href="__GROUP__">CRM 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 添加客户 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <s:form action="customer_save">
        <table width="100%" id="general-table">
            <tr>
                <td class="label">客户名称:</td>
                <td>
                  <%--  <s:textfield name="custName"/>  <font color="red"><s:fielderror fieldName="custName"/>*</font> --%>
                  <s:textfield name="custName"/>  <font color="red"><s:property value="fieldErrors.custName[0]"/>*</font>
                </td>
            </tr>
            <tr>
                <td class="label">客户信息来源:</td>
                <td>
                	<s:select name="custSource" list="{'电话营销','网络营销'}"/>
                </td>
            </tr>
            <tr>
                <td class="label">客户所属行业:</td>
                <td>
                	<s:select name="custIndustry" list="{'教育培训','高新科技','金融保险','工业制造'}"/>
                </td>
            </tr>
            
            <tr>
                <td class="label">客户级别:</td>
                <td>
                	<s:radio name="custLevel" list="{'1','2','3'}"></s:radio>
                <font color="red"><s:property value="fieldErrors.custLevel[0]"/>*</font>
                </td>
            </tr>
             <tr>
                <td class="label">客户固定电话:</td>
                <td>
                    <s:textfield name="custPhone"/>
                </td>
            </tr>
             <tr>
                <td class="label">客户移动电话:</td>
                <td>
                   <s:textfield name="custMobile"/><font color="red"><s:property value="fieldErrors.custMobile[0]"/>*</font>
                </td>
            </tr>
        </table>
        <div class="button-div">
            <input type="submit" value=" 确定 " />
            <input type="reset" value=" 重置 " />
        </div>
    </s:form>
</div>

<div id="footer">
共执行 3 个查询，用时 0.162348 秒，Gzip 已禁用，内存占用 2.266 MB<br />
版权所有 &copy; 2005-2012 上海商派网络科技有限公司，并保留所有权利。</div>

</body>
</html>
