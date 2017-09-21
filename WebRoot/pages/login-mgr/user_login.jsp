<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	<script src="<c:url value="/libs/jquery/jquery-3.2.1.js"/>"></script>
	<script src="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/libs/angular/angular.min.js"/>"></script>	
  </head>
  
  <body>
    <div>
		<div class="container-fluid">
		<s:form cssClass="form-horizontal" namespace="/user" action="userLogin" method="post">
			<div class="form-group">
				<label for="login-userName" class="col-sm-2 control-label">用户账户名：</label>
				<div class="col-sm-8">
					<s:textfield name="user.userName" cssClass="form-control" id="login-userName" placeholder="3-15个英文或者数字" maxLength="15"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="login-password" class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="login-password" placeholder="请输入密码" name="user.userPWD" maxLength="15">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox"> Remember me
						</label>
					</div>
				</div>
			</div>
			
			<div>
				<s:actionerror/>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">登陆</button>
				</div>
			</div>
		</s:form>
		</div>
	</div>
  </body>
</html>
