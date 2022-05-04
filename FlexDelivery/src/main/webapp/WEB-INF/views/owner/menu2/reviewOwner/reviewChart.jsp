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
    	  console.log(starsList);
        var data = new google.visualization.arrayToDataTable([
          ['countNum', 'Person'],
          ["5점 ", 44],
          ["4점 ", 31],
          ["3점 ", 12],
          ["2점 ", 10],
          ['1점 ', 3]
        ]);

        var options = {
          title: 'My store review star ratings ',
          legend: { position: 'none' },
          chart: { title: '우리 가게 고객들의 리뷰 별점입니다. ',
              subtitle: 'Reviews by my store customers, star ratings' },
          bars: 'horizontal', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'top', label: 'Person '} // Top x-axis.
            }
          },
          bar: { groupWidth: "60%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script>
  </head>
  <body>
   
  </body>
</html>
