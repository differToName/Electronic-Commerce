function checkName(){
	
    var goodsClassName=document.getElementById("goodsClassName").value.trim();
    var parentGoodsClass= document.getElementById("parentGoodsClass");
    var index=parentGoodsClass.selectedIndex;
    var parentGoodsClassNo = parentGoodsClass.options[index].value;  
    
    var input = document.getElementById("submit");
    input.disabled="";
    var reg = /^[\u0391-\uFFE5]{3,15}$/;    
    
    if(!goodsClassName){
    	document.getElementById("span").innerHTML="类别名不能为空";
    	input.disabled=true;
    }else if(!reg.test(goodsClassName)){
    	document.getElementById("span").innerHTML="类别只能为3-15位汉字";
    	input.disabled=true;
    }else{
        doAjax("goodsClass/checkName.do?goodsClass.goodsClassName="+goodsClassName+"&&goodsClassNo="+parentGoodsClassNo);
    }
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
	var span = document.getElementById("span");
	var input = document.getElementById("submit");
	if(status!="")
		input.disabled=true;
    span.innerHTML=status;
    span.style.display="block";
    
}

function loadAll(){
	document.getElementById("qryForm").submit();
}

function $(id){
    return document.getElementById(id);
}
