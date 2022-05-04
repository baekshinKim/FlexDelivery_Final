<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- stylesheet -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	$.ajax({
		url:"<c:url value='/owner/menu2/charts/ordersBestMenu.do'/>",
		success:function(mList){
			 /* console.log(mList); */
			
			 if(mList.length==0){
				 $('#chart').html('주문을 플렉스하는 <br>그날 까지 통계와는 <br>잠시만 안녕!');
			 }else{
				 $('#chartspan').html('<small style="float: center;" class="mt-2">* 주문 완료건만 계산되었습니다</small><br><small style="float: center;" >* 한달간 주문건에 대한 통계입니다</small>');
				 $('#chart').html('');
				 var label3=[];
				 var label4=[];
				 
				 $.each(mList, function(idx,item){
					 	var idx = [];
					 	label3.push(item['ORDERSMENUNAME']);
					 	label4.push(item['ORDERSMENUQTY']);
				 });
				/*  console.log(label3);
				 console.log(label4); */
				
				 var chart = c3.generate({
					bindto:'chart',
					size:{
						height:200
					},
					bindto: '#chart',
				    data: {
				    	 rows: [
				            label3,
				            label4
				         ],
			            labels: false,
				        type : 'pie',
				        onclick: function (d, i) { console.log("onclick", d, i); },
				        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
				        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
				    },
				    legend: {
				        position: 'right'
				    },
				    tooltip: {
	                    format: {
	                        title: function (d) { return '메뉴이름'; },
	                        value: function (value, ratio, id) {
	                        	value2 = value+" 건";
	                            return value2;
	                        }
	                    }
	                }
				    
				});
			 }
		},
		error: function(xhr, status, error){
			alert('error:' +error);
		}
	});
	
});







/* 

var chart = c3.generate({
	size:{
		height:200
	},
	bindto: '#chart',
    data: {
        columns: [
            ['data1', 30],
            ['data2', 120],
            ['data3', 30],
        ],
        names: {
            data1: '족발',
            data2: '보쌈',
            data3: '막국수',
        },
        labels: false,
        type : 'pie',
        onclick: function (d, i) { console.log("onclick", d, i); },
        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
    },
    legend: {
        position: 'right'
    } */

</script>

<div id="chart" class="mb-2"></div>


<span id="chartspan" class=" mr-2" > </span>