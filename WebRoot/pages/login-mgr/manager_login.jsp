<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<%-- <script src="<c:url value="/js/manager.js"/>" charset="utf-8"></script> --%>
	<script type="text/javascript">
		if (top.location !== self.location) {
			top.location = self.location;
		}
	</script>
  </head>
  	
  <body>
	<div>
		<div class="jumbotron">
				<h2 class="text-center">
				管理员登陆 <small>Manager Login</small>
				</h2>
		</div>
		<div class="container-fluid">
		<s:form cssClass="form-horizontal" namespace="/manager" action="managerLogin" method="post">
			<div class="form-group">
				<label for="login-managerName" class="col-sm-2 control-label" >管理员账户名：</label>
				<div class="col-sm-8">
					<s:textfield name="manager.managerName" cssClass="form-control" id="login-managerName" placeholder="3-15个英文或者数字" maxLength="15"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="login-password" class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="login-password" placeholder="请输入密码" name="manager.managerPWD" maxLength="15">
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
			
			<div class="text-center" style="color:red;">
				<s:actionerror />
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
