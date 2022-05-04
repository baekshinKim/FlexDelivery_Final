<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);
      

      function drawStuff() {
    	  var data =0;
          var options =0;
    	  $.ajax({
    		 	type:"GET",
				url:"<c:url value='/owner/menu2/reviewOwner/ratingstars.do'/>",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				
				success:function(res){
				//alert(res.starsList);
  	  			console.log(res); 
  	  		console.log(res.starsList[0].many); 
  	  			
       data = new google.visualization.arrayToDataTable([
          ['countNum', 'many'],
          ["5점 ", res.starsList[0].many],
          ["4점 ", res.starsList[1].many],
          ["3점 ", res.starsList[2].many],
          ["2점 ", res.starsList[3].many],
          ['1점 ', res.starsList[4].many]
			
        ]);

				},
				error:function(xhr, status, error){
					alert("error발생:"+ error);
				}
				
			});//ajax
    	 
      options = {
          title: 'Chess opening moves',
         
          legend: { position: 'none' },
          chart: { title: '우리 가게 고객들의 리뷰 별점입니다. ',
                   subtitle: 'Reviews by my store customers, star ratings' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Stars'} // Top x-axis.
            }
          },
          bar: { groupWidth: "40%" },
          series: {
              0: {color: '#0d6efd'},
          }
        };
	console.log(data);
        console.log(options);
        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
  </head>
  <body>
    <div id="top_x_div" style="width: 300px; height: 300px;"></div>
  </body>
</html>

