<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CRM 管理中心 - 客户列表 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="${pageContext.request.contextPath}/views/main/customer/input.jsp">新增客户</a></span>
    <span class="action-span1"><a href="__GROUP__">CRM 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 客户列表 </span>
    <div style="clear:both"></div>
</h1>
<!--  搜索框:开始 -->
<div class="form-div">
    <s:form action="customer_listPage">
        <img src="././Images/icon_search.gif" width="26" height="22" border="0" alt="search" />
       	 客户来源：<s:select name="custSource" list="{'电话营销','网络营销'}" headerKey="" headerValue="--全部--"/>
      	所属行业：<s:select name="custIndustry" list="{'教育培训','高新科技','金融保险','工业制造'}" headerKey="" headerValue="--全部--"/>
                    客户级别：<s:select name="custLevel" list="{'1','2','3'}" headerKey="" headerValue="--全部--"/>
        <!-- 关键字 -->
        关键字：<s:textfield name="keyword" value="%{#parameters.keyword}"/>
        <input type="submit" value=" 搜索 " class="button" />
    </s:form>
</div>
<!--  搜索框 :结束-->

<form method="post" action="" name="listForm">
    <div class="list-div" id="listDiv">
        <table width="100%" cellspacing="1" cellpadding="2" id="list-table">
            <tr>
                <th>序号</th>
                <th>客户名称</th>
                <th>客户信息来源</th>
                <th>客户所属行业</th>
                <th>客户级别</th>
                <th>客户固定电话</th>
                <th>客户移动电话</th>
                <th>操作</th>
            </tr>
            <%--
            	1）带var：会把遍历过程中的每个对象放入context 
            	2）不带var：会把遍历过程中的每个对象放入root
             --%>
            <s:iterator value="pagination.resultList">
            <tr align="center" class="0">
            	<td align="left" >
                	<s:property value="custId"/>
                </td>
                <td align="left" >
                	<s:property value="custName"/>
                </td>
                 <td align="left" >
                	<s:property value="custSource"/>
                </td>
                   <td align="left" >
                	<s:property value="custIndustry"/>
                </td>
                <td align="left" >
                	<s:property value="custLevel"/>
                </td>
                <td align="left" >
                	<s:property value="custPhone"/>
                </td>
                 <td align="left" >
                	<s:property value="custMobile"/>
                </td>
                <td width="30%" align="center">
                <a href="${pageContext.request.contextPath}/customer_get?id=<s:property value='custId'/>">编辑</a> |
                <a href="javascript:void()" title="移除" onclick="del('<s:property value="custId"/>')">移除</a>
                </td>
            </tr>
            </s:iterator>
        </table>
        
        <!-- 分页开始 -->
	        <table id="page-table" cellspacing="0">
	            <tr>
	                <td width="80%">&nbsp;</td>
	                <td align="center" nowrap="true">
	                	<s:if test="pagination.page>1">
	                		<s:a value="/customer_listPage?page=1%{pagination.parameterStr}">首页</s:a>&nbsp;
	                    	<s:a value="/customer_listPage?page=%{pagination.page-1}%{pagination.parameterStr}">上一页</s:a>&nbsp;
	                	</s:if>
	                	
	                	<s:if test="pagination.page<pagination.totalPage">
	                		 <s:a value="/customer_listPage?page=%{pagination.page+1}%{pagination.parameterStr}"> 下一页</s:a>&nbsp;
	                    	<s:a value="/customer_listPage?page=%{pagination.totalPage}%{pagination.parameterStr}">末页</s:a>&nbsp;
	                	</s:if>
	                    
	                    当前第<s:property value="pagination.page"/>页/共<s:property value="pagination.totalPage"/>页,
	                    共<s:property value="pagination.totalCount"/>条数据，每页显示<s:property value="pagination.pageSize"/>条
	                </td>
	            </tr>
	        </table>
	    <!-- 分页结束 -->
    </div>
</form>
<div id="footer">
共执行 1 个查询，用时 0.055904 秒，Gzip 已禁用，内存占用 2.202 MB<br />
版权所有 &copy; 2005-2012 上海商派网络科技有限公司，并保留所有权利。</div>

<script type="text/javascript">
	function del(id){
		if(window.confirm("确认删除此记录吗?一但删除不能恢复了")){
			window.location.href="${pageContext.request.contextPath}/customer_delete?id="+id;
		}
	}
</script>

</body>
</html>
