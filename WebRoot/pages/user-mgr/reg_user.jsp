<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>注册用户</title>
    
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
	<script src="<c:url value="/libs/jquery/jquery-ui-1.12.1.custom/jquery-ui.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/jquery/jquery-ui-1.12.1.custom/jquery-ui.min.css"/>">
	<script src="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/libs/angular/angular.min.js"/>"></script>
	<script src="<c:url value="/libs/jquery/datepicker-zh-TW.js"/>"></script>
	<script src="<c:url value="/js/userJs.js"/>"></script>
  </head>

<body>
	<div class="container-fluid">
	
		<div class="jumbotron">
			<h2 class="text-center">
				添加用户 <small>Add User</small>
			</h2>
		</div>
		<hr>
		
		<s:form cssClass="form-horizontal" namespace="/user" action="createUser" method="post">

			<div class="form-group">
				<label for="userName" class="col-sm-2 control-label">用户昵称:</label>
				<div class="col-sm-8">
					<input name="user.userName" type="text" class="form-control" id="userName" placeholder="3-15个英文或者数字" maxLength="15">
				</div>
			</div>

			<div class="form-group">
					<label for="userPassword" class="col-sm-2 control-label">密码:</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="userPassword" placeholder="Password" name="user.userPWD" maxLength="15">
					</div>
			</div>
				
			<div class="form-group">
				<label for="vertifyPassword" class="col-sm-2 control-label">确认密码:</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="vertifyPassword" placeholder="Password" maxLength="15">
				</div>
			</div>

			<div class="form-group">
					<label for="userRealName" class="col-sm-2 control-label">真实姓名:</label>
					<div class="col-sm-8">
						<input name="user.userRealName" type="text" class="form-control" id="userRealName" placeholder="1-5个汉字" maxLength="5">
					</div>
			</div>

			<div class="form-group">
				<label for="userSex" class="col-sm-2 control-label">性别:</label>
				<div class="col-sm-8">
					<select class="form-control" name="user.userSex">
						<option value="m">男</option>
						<option value="f">女</option>
					</select>
				</div>
			</div>

	<%-- 		<div class="form-group">
				<span>用户性别:</span>
				<s:select list="#{\"m\":'男',\"f\":'女'}" name="user.userSex"></s:select>
			</div> --%>

			<div class="form-group">
				<label for="userBirthday" class="col-sm-2 control-label">出生日期:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userBirthday"
						placeholder="yyyy-mm-dd" name="user.userBirthday">
				</div>
			</div>

			<div class="form-group">
				<label for="userEmail" class="col-sm-2 control-label">邮箱:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userEmail" placeholder="Email" name="user.userMailBox" maxLength="20">
				</div>
			</div>
				
			<div class="form-group">
				<label for="userPhone" class="col-sm-2 control-label">电话:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userPhone" placeholder="请输入11位手机号码" maxLength="11" name="user.userPhone">
				</div>
			</div>
				
			<div class="form-group">
				<label for="userAddress" class="col-sm-2 control-label">地址:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userAddress" placeholder="请输入地址" name="user.userAddress">
				</div>
			</div>
				
			<div class="form-group">
				<label for="userPostCode" class="col-sm-2 control-label">邮编:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="userPostCode" placeholder="请输入6位数邮编" name="user.userPostCode" maxLength="6">
				</div>
			</div>

			<input type="hidden" id="userPosition" value="A" name="user.userStatus">	

			<div class="text-center">
				<s:actionerror />
			</div>

			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-1">
					<button type="submit" class="btn btn-primary btn-block">添加</button>
					<button type="button" class="btn btn-info btn-block" onclick="history.go(-1)">返回上一级</button>
				</div>
			</div>
		</s:form>
	</div>
</body>

</html>
