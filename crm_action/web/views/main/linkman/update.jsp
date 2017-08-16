<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CRM 管理中心 - 修改联系人</title>
<meta name="robots" content="noindex, nofollow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Styles/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	//页面加载完成后
	$(function(){
		//发送异步请求，到后台获取所有客户信息
		$.post("${pageContext.request.contextPath}/customer_loadCustomers",function(data){
			//data是一个DOM对象
			//$(data): 把data从DOM对象转换JQuery对象
			//customersID
			
			
			//正在编辑的客户ID
			var curCustId = "${customer.custId}";
			$(data).each(function(){
				var selected = "";
				if(this.custId==curCustId){
					selected = "selected='selected'";
				}	
				var option = "<option value='"+this.custId+"' "+selected+">"+this.custName+"</option>";	
				//把这个option就加入到customersID中
				$("#customersID").append(option);
			});			
		});
		
	});

</script>
</head>
<body>
<h1>
    <span class="action-span"><a href="__GROUP__/Category/categoryList">联系人列表</a></span>
    <span class="action-span1"><a href="__GROUP__">CRM 管理中心</a></span>
    <span id="search_id" class="action-span1"> - 修改联系人 </span>
    <div style="clear:both"></div>
</h1>
<div class="main-div">
    <s:form action="/linkman_update" >
    	<s:hidden name="lkmId"/>
        <table width="100%" id="general-table">
            <tr>
                <td class="label">联系人姓名:</td>
                <td>
                  <s:textfield name="lkmName"/> <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="label">所属客户:</td>
                <td>
                 <select name="customer.custId" id="customersID"></select>
                </td>
            </tr>
            <tr>
                <td class="label">性别:</td>
                <td>
                <s:radio name="lkmGender" list="{'男','女'}"></s:radio>
                <font color="red">*</font>
                </td>
            </tr>
             <tr>
                <td class="label">联系人办公电话:</td>
                <td>
                    <s:textfield name="lkmPhone"/>
                </td>
            </tr>
             <tr>
                <td class="label">联系人移动电话:</td>
                <td>
                     <s:textfield name="lkmMobile"/><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="label">联系人邮箱:</td>
                <td>
                  <s:textfield name="lkmEmail"/><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="label">联系人QQ:</td>
                <td>
                    <s:textfield name="lkmQq"/><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="label">联系人职位:</td>
                <td>
                     <s:textfield name="lkmPosition"/><font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td class="label">联系人备注:</td>
                <td>
                     <s:textfield name="lkmMomo"/><font color="red">*</font>
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
