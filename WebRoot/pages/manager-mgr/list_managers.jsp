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
    
    <title>管理员信息</title>
    
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
       
       function toUpdateManager(managerNo){
       		location.href="<s:url namespace="/manager" action="toUpdateManager"/>?manager.managerNo="+managerNo;
       }
       
       function toDeleteManager(managerNo,managerName){
       		
       		if(confirm("您确定删除管理员账户名为："+managerName+"的账户吗？")){
				location.href="<s:url namespace="/manager" action="deleteManager"/>?manager.managerNo="+managerNo; 		
       		}
       }
       
       function toAddManager(){
       		
       		location.href="<s:url namespace="/manager" action="toReg"/>";
       }
       </script>

  </head>
  
  <body>
	<div>
		<div class="jumbotron">
				<h2 class="text-center">
				管理员查询 <small>Query Administrator</small>
				</h2>
		</div>
		<hr>
		<div>
			<s:form cssClass="form-inline text-center" namespace="/manager" action="loadManagers" >
				<div class="form-group">
					<label for="managerName">管理员账户名:</label> 
					<s:textfield type="text" cssClass="form-control" id="managerName" placeholder="管理员账户名" name="managerHelper.managerName"></s:textfield>
				</div>
				&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="managerSex">管理员性别:</label> 
					<s:select cssClass="form-control" name="managerHelper.managerSex" list="#{'f':'女','m':'男'}" headerKey="" headerValue="=请选择="></s:select>
				</div>
				&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-info" onclick="toAddManager()">添加管理员</button>
			</s:form>
			
		</div>
		
		<div>
			<s:if test="page.pageContent.size()>0">
				<table class="table table-hover">
					<tr>
						<th>账号</th>
						<th>管理员账户名</th>
						<th>真实姓名</th>
						<th>性别</th>
						<th>出生日期</th>
						<th>邮箱</th>
						<th>电话</th>
						<th>地址</th>
						<th>邮编</th>
						<th>操作</th>
					</tr>
					<s:iterator var="manager" value="page.pageContent" status="status">
					  <s:if test="#manager.managerPosition==\"M\"">
						<tr>
							<td><s:property value="#manager.managerNo" /></td>
							<td><s:property value="#manager.managerName" /></td>
							<td><s:property value="#manager.managerRealName" /></td>
							<td>
								<s:if test="#manager.managerSex==\"f\"">女</s:if> 
								<s:if test="#manager.managerSex==\"m\"">男</s:if>
							</td>

							<td><s:date name="#manager.managerBirthday" format="yyyy-MM-dd"/></td>
							<td><s:property value="#manager.managerMailBox" /></td>
							<td><s:property value="#manager.managerPhone" /></td>
							<td><s:property value="#manager.managerAddress" /></td>
							<td><s:property value="#manager.managerPostCode" /></td>
							<td>
								<button type="button" class="btn btn-success btn-sm" onclick="toUpdateManager(<s:property value="#manager.managerNo"/>)">更新</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="toDeleteManager(<s:property value="#manager.managerNo"/>,'<s:property value="#manager.managerName"/>')">删除</button>
							</td>
						</tr>
					  </s:if>
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
					没有符合您查询条件的管理员信息被找到!
				</div>
			</s:if>
		</div>
	</div>
  </body>
</html>
