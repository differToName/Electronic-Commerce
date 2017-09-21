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
    
    <title>个人资料管理</title>
    
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
	<script src="<c:url value="/js/show_manager.js"/>"></script>
	<script type="text/javascript">
		function modifyManager(managerNo) {
			location.href = "<s:url namespace='/manager' action='toUpdateManager'/>?manager.managerNo="+managerNo;
			}
	</script>
  </head>
  
  <body>
    <div class="">
		<div class="jumbotron">
				<h2 class="text-center">
				个人资料管理 <small>Personal data management</small>
				</h2>
		</div>
		<div class="col-sm-offset-2 col-sm-8">
		<div class="panel panel-default">
  		<!-- Default panel contents -->
  			<div class="panel-heading text-center"><h3>${loginManager.managerName}管理员</h3></div>
	 		<div class="panel-body text-left " style="font-size:20px;">
	 			<%-- <span class="label label-default"></span> --%>
	   			<p>管理员账号：${loginManager.managerNo }</p>
	   			<p>管理员账号昵称：${loginManager.managerName }</p>
	   			<p>管理员真实姓名：${loginManager.managerRealName }</p>
	   			<p>管理员性别：<c:if test="${loginManager.managerSex=='m'}">男</c:if>
	   						  <c:if test="${loginManager.managerSex=='f'}">女</c:if>
	   			</p>
	   			<p>管理员出生日期：${loginManager.managerBirthday }</p>
	   			<p>管理员邮箱：${loginManager.managerMailBox }</p>
	   			<p>管理员电话：${loginManager.managerPhone }</p>
	   			<p>管理员邮编：${loginManager.managerPostCode }</p>
	   			<p>管理员地址：${loginManager.managerAddress }</p>
	   			<p>管理员权限：<c:if test="${loginManager.managerPosition=='M'}">一般管理员</c:if>
	   					      <c:if test="${loginManager.managerPosition=='S'}">超级管理员</c:if>
	   			</p>
	 		</div>
 		</div>
 		</div>
 		

 	</div>
 	 	<div class="col-sm-12 text-center">
 			<button class="btn btn-primary" onclick="modifyManager('${loginManager.managerNo }')">修改</button>
 			<button class="btn btn-danger" onclick="history.go(-1)">返回上一级</button>
 		</div>
  </body>
</html>
