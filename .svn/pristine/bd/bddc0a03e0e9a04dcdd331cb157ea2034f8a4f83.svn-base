
$(function(){
	$("#manangerBirthday").focusin(function(){
			$("#manangerBirthday").datepicker({ changeMonth: true,changeYear: true});
			$( "#manangerBirthday" ).datepicker( "option",$.datepicker.regional[ "zh-CN" ] );
			$( "#manangerBirthday" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		});
});


function modifyPWD(){
	var oldPWD=$("#oldManagerPassword").val();
	var newPWD=$("#newManagerPassword").val();
	var vertifyPWD=$("#vertifyPassword").val();
	var mgrPWDCheck=/^(\w){5,14}$/;
	
	if(!mgrPWDCheck.test($("#newManagerPassword").val())){
		alert("请输入6-15个由数字字母或下划线组成的密码!");
		return false;
	}
	
	if(newPWD!==vertifyPWD){
		alert("重复输入密码有误！");
		return false;
	}
	
	return true;
}

function updateCheck(){
	var realNameCheck=/^[\u4e00-\u9fa5]/g;
	var mgrNameCheck=/^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._]){2,14}$/;
	var mgrPWDCheck=/^(\w){5,14}$/;
	var mgrEmailCheck=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/ ;
	var mgrManagerPhoneCheck=/^1[3|4|5|8][0-9]\d{4,8}$/;
	var mgrPostCode=/^[1-9][0-9]{5}$/;
	//console.log($("#managerRealName").val());
	//验证
	if(!mgrNameCheck.test($("#managerName").val())){
		alert("请输入英文和数字组成的昵称！");
		return false;
	}
	
	//验证真实姓名中文
	if(!realNameCheck.test($("#managerRealName").val())){
		alert("请正确填写真实姓名！");
		return false;
	}
	
	if(!mgrPWDCheck.test($("#managerPassword").val())){
		alert("请输入6-15个由数字字母或下划线组成的密码!");
		return false;
	}
	
	if($("#managerPassword").val()!==$("#vertifyPassword").val()){
		alert("重复密码不正确！");
		return false;
	}
	
	if(!mgrEmailCheck.test($("#managerEmail").val())){
		alert("邮箱格式不正确！");
		return false;
	}
	
	if(!mgrManagerPhoneCheck.test($("#managerPhone").val())){
		alert("电话格式不对！");
		return false;
	}
	
	if(!mgrPostCode.test($("#managerPostCode").val())){
		alert("邮编格式不对！");
		return false;
	}
	
	return true;	
}

function regCheck(){
	var realNameCheck=/^[\u4e00-\u9fa5]/g;
	var mgrNameCheck=/^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._]){2,14}$/;
	var mgrPWDCheck=/^(\w){5,14}$/;
	var mgrEmailCheck=/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/ ;
	var mgrManagerPhoneCheck=/^1[3|4|5|8][0-9]\d{4,8}$/;
	var mgrPostCode=/^[1-9][0-9]{5}$/;
	//console.log($("#managerRealName").val());
	//验证
	if(!mgrNameCheck.test($("#managerName").val())){
		alert("请输入英文和数字组成的昵称！");
		return false;
	}
	
	//验证真实姓名中文
	if(!realNameCheck.test($("#managerRealName").val())){
		alert("请正确填写真实姓名！");
		return false;
	}
	
	if(!mgrPWDCheck.test($("#managerPassword").val())){
		alert("请输入6-15个由数字字母或下划线组成的密码!");
		return false;
	}
	
	if($("#managerPassword").val()!==$("#vertifyPassword").val()){
		alert("重复密码不正确！");
		return false;
	}
	
	if(!mgrEmailCheck.test($("#managerEmail").val())){
		alert("邮箱格式不正确！");
		return false;
	}
	
	if(!mgrManagerPhoneCheck.test($("#managerPhone").val())){
		alert("电话格式不对！");
		return false;
	}
	
	if(!mgrPostCode.test($("#managerPostCode").val())){
		alert("邮编格式不对！");
		return false;
	}
	
	return true;
}