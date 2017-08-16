<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CRM 管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/Styles/general.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/Styles/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/Js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	//异步登录
	//页面加载完成后
	$(function(){
		$(".button").click(function(){
			//发送异步请求，到后台获取所有客户信息
			$.post("${pageContext.request.contextPath}/user_login",$("#loginForm").serialize(),function(data){
				if(data.success==1){
					window.location.href="${pageContext.request.contextPath}/views/main/main.jsp";
				}else{
					alert("登录失败："+data.msg);
				}
			});
			
		});
	});

</script>
</head>
<body style="background: #278296;color:white">
<form id="loginForm">
    <table cellspacing="0" cellpadding="0" style="margin-top:100px" align="center">
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/Images/login.png" width="178" height="256" border="0" alt="ECSHOP" />
            </td>
            <td style="padding-left: 50px">
                <table>
                    <tr>
                        <td>管理员姓名：</td>
                        <td>
                        <input type="text" name="userCode"/>
                        </td>
                    </tr>
                    <tr>
                        <td>管理员密码：</td>
                        <td>
                         <input type="password" name="userPassword"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="right">
                            <img src="" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <input type="button" value="进入管理中心" class="button" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
