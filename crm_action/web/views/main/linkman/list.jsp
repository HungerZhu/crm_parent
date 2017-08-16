<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CRM 管理中心 - 联系人列表 </title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<h1>
    <span class="action-span"><a href="${pageContext.request.contextPath}/linkman_input">新增联系人</a></span>
    <span class="action-span1"><a href="__GROUP__">CRM 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 联系人列表 </span>
    <div style="clear:both"></div>
</h1>
<!--  搜索框:开始 -->
<div class="form-div">
    <form action="${pageContext.request.contextPath}/customer_list" name="searchForm" method="post">
        <img src="././Images/icon_search.gif" width="26" height="22" border="0" alt="search" />
        关键字 :<input type="text" name="keyword"/>
        <input type="submit" value=" 搜索 " class="button" />
    </form>
</div>
<!--  搜索框 :结束-->

<form method="post" action="" name="listForm">
    <div class="list-div" id="listDiv">
        <table width="100%" cellspacing="1" cellpadding="2" id="list-table">
            <tr>
                <th>序号</th>
                <th>联系人姓名</th>
                <th>所属客户</th>
                <th>性别</th>
                <th>办公电话</th>
                <th>手机</th>
                <th>操作</th>
            </tr>
            <s:iterator value="pagination.resultList">
            <tr align="center" class="0">
            	<td align="left"  >
                	<s:property value="lkmId"/>
                </td>
                <td align="left"  >
                	<s:property value="lkmName"/>
                </td>
                 <td align="left"  >
                	<s:property value="customer.custName"/>
                </td>
                   <td align="left"  >
                	<s:property value="lkmGender"/>
                </td>
                <td align="left"  >
                	<s:property value="lkmPhone"/>
                </td>
                <td align="left"  >
                	<s:property value="lkmMobile"/>
                </td>
                <td width="30%" align="center">
                <a href="${pageContext.request.contextPath}/linkman_get?id=<s:property value='lkmId'/>">编辑</a> |
                <a href="javascript:void()" title="移除" onclick="del('<s:property value="lkmId"/>')">移除</a>
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
	                		<s:a value="/linkman_listPage?page=1%{pagination.parameterStr}">首页</s:a>&nbsp;
	                    	<s:a value="/linkman_listPage?page=%{pagination.page-1}%{pagination.parameterStr}">上一页</s:a>&nbsp;
	                	</s:if>
	                	
	                	<s:if test="pagination.page<pagination.totalPage">
	                		 <s:a value="/linkman_listPage?page=%{pagination.page+1}%{pagination.parameterStr}"> 下一页</s:a>&nbsp;
	                    	<s:a value="/linkman_listPage?page=%{pagination.totalPage}%{pagination.parameterStr}">末页</s:a>&nbsp;
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
			window.location.href="${pageContext.request.contextPath}/linkman_delete?id="+id;
		}
	}
</script>

</body>
</html>
