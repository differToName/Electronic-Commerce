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
    
    <title>所有注册用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.css"/>">
	 <script src="<c:url value="/libs/jquery/jquery-3.2.1.js"/>"></script>
	 <script src="<c:url value="/libs/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"/>"></script>
	 <script src="<c:url value="/libs/angular/angular.min.js"/>"></script>
	<script type="text/javascript">
		function doQuery(pageno)
       {
           if(pageno<1 || pageno><s:property value="page.totalPageNum"/>)
           {
              alert("页号超出范围，有效范围：[1-<s:property value="page.totalPageNum"/>]!");
              $('pageNo').select();
              return;
           }
           
            var f=document.forms[0];
            f.action=f.action+"?page.pageNo="+pageno;
            f.submit();
       }
       
       function toChangeStatus(userNo,userStatus){
       		if(confirm("您确定冻结账户为："+userNo+"的账户吗？")){
       			location.href="<s:url namespace="/user" action="toChangeStatus"/>?user.userStatus="+userStatus+"&user.userNo="+userNo;
       		}
       }
	</script>
  </head>

<body>
	<div>
		<div>
			<div class="jumbotron">
				<h1 class="text-center">
				注册用户查询 <small>分页查询</small>
				</h1>
			</div>
			<ol class="breadcrumb">
				<li><a href="<s:url value="/welcome.jsp"/>" target="contentFrame">Home</a></li>
				<li class="active">添加</li>
				<li class="active">查询</li>
			</ol>
		<hr>
		<div>
			<s:form cssClass="form-inline text-center" namespace="/user" action="loadUsers" >
				<div class="form-group">
					<label for="userName">用户账户名:</label> 
					<s:textfield type="text" cssClass="form-control" id="userName" placeholder="用户账户名" name="userHelper.userName"></s:textfield>
				</div>
				<div class="form-group">
					<label for="userSex">用户性别:</label> 
					<s:select cssClass="form-control" name="userHelper.userSex" list="#{'f':'女','m':'男'}" headerKey="" headerValue="=请选择="></s:select>
				</div>
				<div class="form-group">
					<label for="userStatus">账户状态:</label> 
					<s:select id="userStatus" cssClass="form-control" name="userHelper.userStatus" list="#{'A':'活动','F':'冻结'}" headerKey="" headerValue="=请选择="></s:select>
				</div>
				<button type="submit" class="btn btn-primary">查询</button>
			</s:form>
		</div>
		
		<div>
			<s:if test="page.pageContent.size()>0">
				<table class="table table-hover">
					<tr>
						<th>账号</th>
						<th>用户昵称</th>
						<th>用户真实姓名</th>
						<th>性别</th>
						<th>用户出生日期</th>
						<th>用户邮箱</th>
						<th>用户电话</th>
						<th>用户地址</th>
						<th>用户邮编</th>
						<th>账户状态</th>
						<th>操作</th>
					</tr>
					<s:iterator var="user" value="page.pageContent" status="status">
						<tr>
							<td><s:property value="#user.userNo" /></td>
							<td><s:property value="#user.userName" /></td>
							<td><s:property value="#user.userRealName" /></td>
							<td>
								<s:if test="#user.userSex==\"f\"">女</s:if> 
								<s:if test="#user.userSex==\"m\"">男</s:if>
							</td>

							<td><s:date name="#user.userBirthday" format="yyyy-MM-dd"/></td>
							<td><s:property value="#user.userMailBox" /></td>
							<td><s:property value="#user.userPhone" /></td>
							<td><s:property value="#user.userAddress" /></td>
							<td><s:property value="#user.userPostCode" /></td>
							<td><s:if test="#user.userStatus==\"A\"">活动</s:if> 
								<s:if test="#user.userStatus==\"F\"">冻结</s:if>
							</td>
							<td>
								<s:if test="#user.userStatus==\"A\"">
									<button class="btn btn-danger btn-sm" onclick="toChangeStatus(<s:property value="#user.userNo"/>,'F')">冻结</button>
								</s:if> 
								<s:if test="#user.userStatus==\"F\"">
									<button class="btn btn-success btn-sm" onclick="toChangeStatus(<s:property value="#user.userNo"/>,'A')">解冻</button>
								</s:if>
							</td>
						</tr>
					</s:iterator>
				</table>
				<div id="pageinfo">
					<button class="btn btn-primary btn-sm" onclick="history.go(-1)" id="goBack">返回上一级菜单</button>
					共
					<s:property value="page.totalRecNum" />
					条, 当前显示
					<s:property value="page.startIndex+1" />
					-
					<s:property value="page.endIndex" />
					条, 第
					<s:property value="page.pageNo" />
					/
					<s:property value="page.totalPageNum" />
					页 |
					<s:if test="page.pageNo>1">
						<span class="linkspan btn btn-primary btn-sm" onclick="doQuery(1)">首页</span>&nbsp;
	          		</s:if>
					<s:if test="page.prePage">
						<span class="linkspan btn btn-primary btn-sm" onclick="doQuery(<s:property value="page.pageNo"/>-1)">上一页</span>&nbsp;
	           		</s:if>
					<s:if test="page.nextPage">
						<span class="linkspan btn btn-primary btn-sm" onclick="doQuery(<s:property value="page.pageNo"/>+1)">下一页</span>&nbsp;
	           		</s:if>
					<s:if test="page.pageNo!=page.totalPageNum">
						<span class="linkspan btn btn-primary btn-sm" onclick="doQuery(<s:property value="page.totalPageNum"/>)">末页</span>&nbsp;
	           		</s:if>
					| 到<input  type="text" id="pageNo" size=4 style="text-align:right;"
						onkeypress="onlynumber();" /> 页
					<button class="btn btn-primary btn-sm" onclick="doQuery($('pageNo').value);">跳 转</button>
				</div>
			</s:if>
			<s:if test="page.pageContent.size()==0">
				<div style="padding:30px;text-align:center;color:red;font-size：12px;">
					没有符合您查询条件的用户信息被找到!
				</div>
			</s:if>
		</div>
	</div>
</body>
</html>
