<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ECSHOP Menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/demo.css" type="text/css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/js/jquery.ztree.core-3.4.js"></script>
<SCRIPT type="text/javascript">
		<!--
		var setting = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		//菜单名称
		var zNodes =[
			{ id:5, pId:0, name:"系统用户管理", open:true, iconOpen:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/1_open.png", iconClose:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/1_close.png"},
			{ id:15, pId:5, name:"新增系统用户",url :"${pageContext.request.contextPath}/views/main/user/save.jsp'",target:"main-frame",icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/2.png"},
			{ id:16, pId:5, name:"系统用户列表",url :"${pageContext.request.contextPath}/user_listPage",target:"main-frame", icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/3.png"},
			{ id:1, pId:0, name:"客户管理", open:true, iconOpen:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/1_open.png", iconClose:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/1_close.png"},
			{ id:11, pId:1, name:"新增客户",url :"${pageContext.request.contextPath}/views/main/customer/save.jsp'",target:"main-frame",icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/2.png"},
			{ id:12, pId:1, name:"客户列表",url :"${pageContext.request.contextPath}/customer_listPage",target:"main-frame", icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/3.png"},
			{ id:2, pId:0, name:"联系人管理", open:true, icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/4.png"},
			{ id:21, pId:2, name:"新增联系人", url :"${pageContext.request.contextPath}/views/main/linkman/save.jsp'",target:"main-frame",icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/6.png"},
			{ id:22, pId:2, name:"联系人列表", url :"${pageContext.request.contextPath}/linkman_listPage'",target:"main-frame", icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/7.png"},
			{ id:4, pId:0, name:"系统管理", open:true, icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/4.png"},
			{ id:25, pId:4, name:"日志统计", icon:"${pageContext.request.contextPath}/Js/JQuery-zTree-v3.4/css/zTreeStyle/img/diy/5.png"},
		];

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
</SCRIPT>
<style type="text/css">
body {
  background: #80BDCB;
}
#tabbar-div {
  background:#278296;
  padding-left:10px;
  height:21px;
  padding-top:0px;
}
#tabbar-div p {
  margin:1px 0 0 0;
}
.tab-front {
  background:#80BDCB;
  line-height:20px;
  font-weight:bold;
  padding:4px 15px 4px 18px;
  border-right:2px solid #335b64;
  cursor:hand;
  cursor:pointer;
}
.tab-back {
  color:#F4FAFB;
  line-height:20px;
  padding:4px 15px 4px 18px;
  cursor:hand;
  cursor:pointer;
}
.tab-hover {
  color:#F4FAFB;
  line-height:20px;
  padding:4px 15px 4px 18px;
  cursor:hand;
  cursor:pointer;
  background:#2F9DB5;
}
#top-div
{
  padding:3px 0 2px;
  background:#BBDDE5;
  margin:5px;
  text-align:center;
}
#main-div {
  border:1px solid #345C65;
  padding:5px;
  margin:5px;
  background:#FFF;
}
#menu-list {
  padding:0;
  margin:0;
}
#menu-list ul {
  padding:0;
  margin:0;
  list-style-type: none;
  color:#335B64;
}
#menu-list li {
  padding-left:16px;
  line-height:16px;
  cursor:hand;
  cursor:pointer;
}
#main-div a:visited, #menu-list a:link, #menu-list a:hover {
  color:#335B64
  text-decoration:none;
}
#menu-list a:active {
  color:#EB8A3D;
}
.explode {
  background:url(./Images/menu_minus.gif) no-repeat 0px 3px;
  font-weight:bold;
}
.collapse {
  background:url(./Images/menu_plus.gif) no-repeat 0px 3px;
  font-weight:bold;
}
.menu-item {
  background:url(./Images/menu_arrow.gif) no-repeat 0px 3px;
  font-weight:normal;
}
#help-title {
  font-size:14px;
  color:#000080;
  margin:5px 0;
  padding:0px;
}
#help-content {
  margin:0;
  padding:0;
}
.tips {
  color:#CC0000;
}
.link {
  color:#000099;
}
#treeDemo{
	width:200px;
}
</style>

</head>
<body>
<div id="tabbar-div">
    <p>
        <span class="tab-front" id="menu-tab">菜单</span>
    </p>
</div>
<div id="main-div">
   	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>
</body>
</html>