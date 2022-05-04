<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);
	
      $(function(){
    	  $.ajax({
    		 	type:"GET",
    			url:"<c:url value='/owner/menu2/reviewOwner/ratingstars.do'/>",
    			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
    			
    			success:function(res){
    			//alert(res.starsList);
      			//console.log(res); 
      		//console.log(res.starsList[0].many); 
      		 var jbAry = new Array();
      jbAry[0] = res.starsList[0].many;
      jbAry[1] = res.starsList[1].many;
      jbAry[2] = res.starsList[2].many;
      		drawStuff(jbAry);
    			},
    			error:function(xhr, status, error){
    				alert("error발생:"+ error);
    			}
    		});//ajax
          });
    
      function drawStuff(res) {
    	  //alert(res.starsList);
    	  console.log(res); 
    	  //console.log(res.starsList[0].many); 
    	  
        var data = new google.visualization.arrayToDataTable([
        	 ['countNum', 'many'],
             ["5점 ", res],
             ["4점 ", 0],
             ["3점 ", 2],
             ["2점 ", 2],
             ['1점 ', 2]
        ]);

        var options = {
          title: 'Chess opening moves',
          width: 900,
          legend: { position: 'none' },
          chart: { title: 'Chess opening moves',
                   subtitle: 'popularity by percentage' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Percentage'} // Top x-axis.
            }
          },
          bar: { groupWidth: "50%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
      
 
    </script>
  </head>
  <body>
    <div id="top_x_div" style="width: 400px; height: 300px;"></div>
  </body>
</html>
