<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- stylesheet -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	
	var today = new Date();
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	
	var endDay = year+"-"+month+"-"+date;
	
	var today2 = new Date();
	today2.setMonth(today2.getMonth() - 6);
	var year2 = today2.getFullYear(); // 년도
	var month2 = today2.getMonth() + 1;  // 월
	var startDay = year2+"-"+month2+"-"+1;
	
	console.log(endDay);
	console.log(startDay);
	
	
	$.ajax({
		url:"<c:url value='/owner/menu2/charts/ordersListChart.do'/>",
		data:"startDay="+startDay+"&endDay="+endDay,
		success:function(res){
			var result = 0;
			var type="";
			var resultValue=0;
			var label = [];
			var total = 0;
			
			$.each(res, function(idx,items){
				label.push(items['ORDERSCOUNT']);
				total+=items['ORDERSCOUNT'];
			});
			
		
			var re1= label[0];
			var re2= label[1];
			var re3= label[2];
			var re4= label[3];
			var re5= label[4];
			
			if(total!=0){
				$('#chart5span').html('<small style="float: center;" >* 주문 취소건도 포함되었습니다</small><br><small style="float: center;" >* 6개월간 주문건에 대한 통계입니다</small>');
				var chart5 = c3.generate({
					bindto:"#chart5",
					size:{
						height:200
					},
				    data: {
				        columns: [
				            ['주문접수', re1],
				            ['주문중', re2 ],
				            ['배달중', re3],
				            ['배달완료', re4],
				            ['주문취소', re5]
				        ],
				        type : 'donut',
				        onclick: function (d, i) { console.log("onclick", d, i); },
				        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
				        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
				    },
				    donut: {
				        title: "주문건수 비교"
				    },
				    legend: {
				        position: 'right'
				    },
				    tooltip: {
	                    format: {
	                        title: function (d) { return '주문상황'; },
	                        value: function (value, ratio, id) {
	                        	var value2 = value+" 건";
	                            return value2;
	                        }
	                    }
	                }
				});
				
			}else{
				$('#chart5').html('주문을 플렉스하는 <br>그날 까지 통계와는 <br>잠시만 안녕!');
				$('#chart5span').html('');
			}

		},
		error:function(xhr,status,error){
			
		}
	});
});





</script>

<div id="chart5" class="mb-2">
</div>

<span id="chart5span" class=" mr-2" > </span>