window.onload = function(){
    var parentGoodsClass= document.getElementById("parentGoodsClass");
    var index=parentGoodsClass.selectedIndex;
    var parentGoodsClassNo = parentGoodsClass.options[index].value;  
//    alert(parentGoodsClassNo);
    
    doAjax("goods/loadChildGoodsClass.do?parentGoodsClassNo="+parentGoodsClassNo);
};

function checkLast(str){  
    var flag=false;  
    var ext=str.split('.')[str.split('.').length-1];  
    if(ext=='png'||ext=='jpg'||ext=='bmp'||ext=='gif'){  
        flag=true;  
    }  
    return flag;  
}

function preview(picPath){
	var submit = document.getElementById("submit");
	if(!checkLast(picPath.toLowerCase())){
		 alert("上传文件格式错误！");
		 submit.disabled=true;
	}else{
		document.getElementById("goodsPreview").src=picPath;
		submit.disabled="";
	}
}

function change(){
	
    var parentGoodsClass= document.getElementById("parentGoodsClass");
    var index=parentGoodsClass.selectedIndex;
    var parentGoodsClassNo = parentGoodsClass.options[index].value;  

    doAjax("goods/loadChildGoodsClass.do?parentGoodsClassNo="+parentGoodsClassNo);
    
}

var xmlhttp;

function ck(){
    if(window.XMLHttpRequest){
        xmlhttp=new XMLHttpRequest;
    }else if(window.ActiveObject){
        xmlhttp=new ActiveObject("Microsoft.XMLHTTP");
    }
    
}

function doAjax(url){
//		alert("123");
        ck();

        if(xmlhttp!=null){
        	
            xmlhttp.open("POST",url,true);//初始化请求参数
            xmlhttp.onreadystatechange=ok;//指定回调函数
            xmlhttp.send(null);
            
        }else{
            alert("xmlhttp初始化失败！！！");
        }
  }

function ok(){
    //判断响应状态
    if(xmlhttp.readyState==4){
        if(xmlhttp.status==200){
//        	alert(xmlhttp.responseText);
            excute(xmlhttp.responseText);
        }
    }
}

function excute(status){
	
	var option = null;
	var no_result = status.split("|")[0];
	var name_result = status.split("|")[1];
	var selectedNo = status.split("|")[2];
	
	var no = no_result.split("_");
	var name = name_result.split("_");

	var goodsClass= document.getElementById("childGoodsClass");
	goodsClass.options.length=0;
//	goodsClass.innerHTML = "<option>==请选择子类别==</option>";
	var html="";
    for ( var i = 0; i < no.length-1; i++) {  
//    	alert(cno);
        html += "<option value='" + no[i] + "'" + (no[i] == selectedNo ? ' selected' : '') + ">" + name[i] + "</option>";
    }
    
    goodsClass.innerHTML ="<option value=''>==请选择子类别==</option>"+html;
    
    
}

function checkName(){
	
	var goodsName = document.getElementById("goodsName").value;
	var reg = /^[\u0391-\uFFE5]{3,15}$/; 
	var span = document.getElementById("alertName");
	var submit = document.getElementById("submit");

	if(!reg.test(goodsName)){
		span.innerHTML = "商品名称为3-15位汉字";
		submit.disabled=true;
	}else{
//		alert("成功");
		span.innerHTML = "";
		submit.disabled="";
	}
		
}

function checkPrice(){
	
	var price = document.getElementById("price").value;
	var reg = /^\d+(\.\d{2})?$/; 
	var span = document.getElementById("alertPrice");
	var submit = document.getElementById("submit");
	
	if(!reg.test(price)){
		span.innerHTML = "商品价格只能有两位小数";
		submit.disabled=true;
	}else{
		span.innerHTML="";
		submit.disabled="";
	}
}


function check(){
//	var pno = document.getElementById("parentGoodsClass").value;
//    var cno = document.getElementById("childGoodsClass").value;
////	alert(cno);
//	if(pno!="0"){
//		if(cno=="==请选择子类别=="){
//			alert("请选择子类别！");
//			return false;
//		}
//	}
	return true;
}

function $(id){
    return document.getElementById(id);
}