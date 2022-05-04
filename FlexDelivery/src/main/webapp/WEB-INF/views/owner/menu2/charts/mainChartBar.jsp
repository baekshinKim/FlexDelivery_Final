<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


    <script type="text/javascript">
    $(function(){
    	
    	$.ajax({
    		url:"<c:url value='/owner/menu2/charts/ordersCount.do'/>",
    		success:function(res){
    		
    			var label = [];
    			var total = 0;
    			$.each(res.tList, function(idx, item){
    			
    					label.push(item['ORDERSCOUNT']);
    					total+=item['ORDERSCOUNT'];
    					
    			});

    			 console.log(label); 
    			
    			
    			var label2 = [];
    			$.each(res.lList, function(idx, item){
    			
    					label2.push(item['ORDERSCOUNT']);
    					total+=item['ORDERSCOUNT'];
    				
    			});
    			console.log(label2); 
    			
    		
		  	
    			if(total!=0){
	    			
	    			var chart4 = c3.generate({
	    		    	size:{
	    					height:250
	    				},
	    		    	 bindto: '#chart3',
	    		        data: {
	  		            	json: {
	  		            		'data1': label2,
					    		'data2': label
					    	},	      	
	    		            names: {
	    			             data1: '지난주', 
	    			             data2: '이번주',
	    			        },
	    		            type: 'bar',
	    		            colors: {
	    		                 data1: '#FFDF00', 
	    		                data2: '#12E680'
	    		            },
	    		            labels: true
	    		            
	    		        },
	    		        axis: {
	    	    	        x: {
	    	    	            type: 'category',
	    	    	            categories: ['월', '화', '수', '목', '금', '토', '일']
	    	    	        }
	    	    	    },
	    		        bar: {
	    		            width: {
	    		                ratio: 0.8
	    		            }
	    		        }
	    		    });
	    		}else{
					$('#chart3').html('주문을 플렉스하는 <br>그날 까지 통계와는 <br>잠시만 안녕!');
				}
    		
    		},
    		error:function(xhr,status, error){
    			alert('error:'+ error);
    		}
    		
    	});
    	
   
	   
    });
    </script>

 
<div id="chart3"></div>

