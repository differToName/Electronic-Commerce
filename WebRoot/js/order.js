
$(function(){
	$('#mindate').prop("readonly", true).datetimepicker({	
        timeText: '时间',//设置中文提示
        hourText: '时',
        minuteText: '分',
        secondText: '秒',
        currentText: '现在',
        closeText: '完成',
        showSecond: true, //显示秒  
        timeFormat: 'HH:mm:ss', //格式化时间  
        maxDate: 0, //today
        maxTime: 0,  //now 
    });
    
    $('#maxdate').prop("readonly", true).datetimepicker({	
        timeText: '时间',//设置中文提示
        hourText: '时',
        minuteText: '分',
        secondText: '秒',
        currentText: '现在',
        closeText: '完成',
        showSecond: true, //显示秒  
        timeFormat: 'HH:mm:ss', //格式化时间 
        maxDate: 0,
        maxTime: 0
    });
});