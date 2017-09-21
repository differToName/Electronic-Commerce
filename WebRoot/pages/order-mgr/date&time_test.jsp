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
    
    <title>My JSP 'list_order.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!-- 若只做日期选择：
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/js/jquery.datetimepicker.css"/>">
	<script type ="text/javascript" src="<c:url value="/libs/js/jquery-3.2.1.js"/>"></script>
	<script type ="text/javascript" src="<c:url value="/libs/js/jquery.datetimepicker.js"/>"></script>
	<script type="text/javascript">
		$(function(){
  			$('#manangerBirthday').prop("readonly", true).datetimepicker({
  						format:'Y-m-d',
  						timepicker:false	
                        //timeText: '时间',
                        //hourText: '小时',
                        //minuteText: '分钟',
                        //secondText: '秒',
                        //currentText: '现在',
                        //closeText: '完成',
                        //showSecond: true, //显示秒  
                        //timeFormat: 'HH:mm:ss' //格式化时间  
                    });
  		});
	</script>
	-->
	 
	<!-- 日期 + 时间选择器  --> 
	<script src="<c:url value="/libs/date&time_selector/jquery-3.2.1.js"/>"></script>
	<script src="<c:url value="/libs/date&time_selector/jquery-ui.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/date&time_selector/jquery-ui.min.css"/>">
	<script type ="text/javascript" src="<c:url value="/libs/date&time_selector/jquery-ui-timepicker-addon.min.js"/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value="/libs/date&time_selector/jquery-ui-timepicker-addon.min.css"/>">
	<script src="<c:url value="/libs/date&time_selector/datepicker-zh-TW.js"/>"></script>
	<script type="text/javascript">
		$(function(){
  			$('#manangerBirthday').prop("readonly", true).datetimepicker({	
                        timeText: '时间',//设置中文提示
                        hourText: '小时',
                        minuteText: '分钟',
                        secondText: '秒',
                        currentText: '现在',
                        closeText: '完成',
                        showSecond: true, //显示秒  
                        timeFormat: 'HH:mm:ss' //格式化时间  
                    });
  		});
	</script>
  </head>
  
  <body>
     <input type="text" id="manangerBirthdayy" placeholder="yyyy-mm-dd" size="40">
  </body>
</html>
