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
    
    <title>密码修改</title>
    
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
	<script src="<c:url value="/js/manager.js"/>" type="text/javascript" charset="utf-8"></script>
  </head>
  
  <body>
  	<div class="jumbotron">
				<h2 class="text-center">
				密码修改<small>Modify Password</small>
				</h2>
		</div>
	<hr>
   	<s:form namespace="/manager" action="modifyManagerPWD" cssClass="form-horizontal" onsubmit="return modifyPWD()">
   		<input value="${loginManager.managerNo }" type="hidden" name="manager.managerNo">
   		<input type="hidden" name="manager.managerName" value="${loginManager.managerName }">
   		
		<%-- <s:hidden type="hidden" name="manager.managerNo">${loginManager.managerNo }</s:hidden>
		<s:hidden type="hidden" name="manager.managerName">${loginManager.managerName }</s:hidden> --%>
		
		<div class="form-group">
			<label for="oldManagerPassword" class="col-sm-2 control-label">旧的密码:</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="oldManagerPassword" placeholder="6-15个英文或数字" name="manager.managerPWD" maxLength="15">
			</div>
		</div>

		<div class="form-group">
			<label for="newManagerPassword" class="col-sm-2 control-label">新的密码:</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="newManagerPassword" placeholder="6-15个英文或数字" name="newManagerPassword" maxLength="15">
			</div>
		</div>
				
		<div class="form-group">
			<label for="vertifyPassword" class="col-sm-2 control-label">确认密码:</label>
			<div class="col-sm-8">
				<input type="password" class="form-control" id="vertifyPassword" placeholder="6-15个英文或数字" maxLength="15">
			</div>
		</div>
		
		<div class="text-center" style='color:red;list-style:none;'>
			<s:actionerror />
		</div>
		
		<s:if test="">
			<div id="errorDiv" class="alert alert-danger" role="alert">
			
			</div>
		</s:if>
		<div class="text-center">
			<input type="submit" class="btn btn-primary" value="确认修改">&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-info" onclick="history.go(-1)">返回上一级</button>
		</div>
	</s:form>
  </body>
</html>
