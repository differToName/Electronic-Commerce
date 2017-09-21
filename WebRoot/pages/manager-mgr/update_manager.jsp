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
    
    <title>修改管理员</title>
    
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
	<script src="<c:url value="/js/manager.js"/>" type="text/javascript" charset="utf-8" ></script>

  </head>
  
  <body>
	<div class="">
		<div class="jumbotron">
				<h2 class="text-center">
				管理员修改  <small>Modify Manager</small>
				</h2>
		</div>
		
		<hr>
		<div>
			<s:form namespace="/manager" action="updateManager" cssClass="form-horizontal" onsubmit="return updateCheck();">
				<s:hidden name="manager.managerNo"><s:property value="#manager.managerNo"/></s:hidden>
				<div class="form-group">
					<label for="managerName" class="col-sm-2 control-label">管理员昵称:</label>
					<div class="col-sm-8">
						<s:textfield name="manager.managerName" cssClass="form-control" id="managerName" placeholder="3-15个英文或者数字" maxLength="15" readonly="true"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerRealName" class="col-sm-2 control-label">真实姓名:</label>
					<div class="col-sm-8">
						<s:textfield name="manager.managerRealName" type="text" cssClass="form-control" id="managerRealName" placeholder="1-5个汉字" maxLength="5"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerSex" class="col-sm-2 control-label">性别:</label>
					<div class="col-sm-8">
						<s:select cssClass="form-control" name="manager.managerSex" list="#{\"m\":'男',\"f\":'女'}"></s:select>
					</div>
				</div>
				
				<div class="form-group">
					<label for="manangerBirthday" class="col-sm-2 control-label">出生日期:</label>
					<div class="col-sm-8">
						<s:textfield  cssClass="form-control" id="manangerBirthday" placeholder="yyyy-mm-dd" name="manager.managerBirthday"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerEmail" class="col-sm-2 control-label">Email:</label>
					<div class="col-sm-8">
						<s:textfield type="text" cssClass="form-control" id="managerEmail" placeholder="Email" name="manager.managerMailBox" maxLength="20"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerPhone" class="col-sm-2 control-label">电话:</label>
					<div class="col-sm-8">
						<s:textfield type="text" cssClass="form-control" id="managerPhone" placeholder="请输入11位手机号码" maxLength="11" name="manager.managerPhone"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerAddress" class="col-sm-2 control-label">地址:</label>
					<div class="col-sm-8">
						<s:textfield type="text" cssClass="form-control" id="managerAddress" placeholder="请输入地址" name="manager.managerAddress"></s:textfield>
					</div>
				</div>
				
				<div class="form-group">
					<label for="managerPostCode" class="col-sm-2 control-label">邮编:</label>
					<div class="col-sm-8">
						<s:textfield type="text" cssClass="form-control" id="managerPostCode" placeholder="请输入6位数邮编" name="manager.managerPostCode" maxLength="6"></s:textfield>
					</div>
				</div>
				
				<input type="hidden" id="managerPosition" value="M" name="manager.managerPosition">	
				
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-1">
						<button type="submit" class="btn btn-primary btn-block" >修改</button>
						<button type="button" class="btn btn-info btn-block" onclick="history.go(-1)">返回上一级</button>
					</div>
				</div>
			</s:form>
		</div>
	</div>
  </body>
</html>
