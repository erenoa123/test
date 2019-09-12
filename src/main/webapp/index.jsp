<%@page contentType="text/html; charset=Windows-31J"%>
<%@page import="com.tuyano.web.ConnectionManager, java.sql.*"%>
<%@page import="com.tuyano.web.ConnectionManager, java.net.*"%>
<html>
	<head>
		<title>Sample Index</title>
	</head>
	<body>
		<h1>Hello World! kurihara!!!</h1>
		<%= new java.util.Date().toString() %><br>

		<%
		try{
			Connection con = ConnectionManager.getConnection();
			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select * from shop");
			while(rs.next()) {
				String s = "id=" + rs.getInt("num")+",name="+rs.getString("name");
				out.println(s);
			}
			smt.close();
			con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}catch(URISyntaxException e1){
			e1.printStackTrace();
		}
		%>
		 <canvas id="myLineChart"></canvas>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

  <script>

  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['test', '8月2日', '8月3日', '8月4日', '8月5日', '8月6日', '8月7日'],
      datasets: [
        {
          label: '最高気温(度）',
          data: [35, 34, 37, 35, 34, 35, 34, 25],
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
        },
        {
          label: '最低気温(度）',
          data: [25, 27, 27, 25, 26, 27, 25, 21],
          borderColor: "rgba(0,0,255,1)",
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '気温（8月1日~8月7日）'
      },
      scales: {
        yAxes: [{
          ticks: {
            suggestedMax: 40,
            suggestedMin: 0,
            stepSize: 10,
            callback: function(value, index, values){
              return  value +  '度'
            }
          }
        }]
      },
    }
  });
  </script>
	</body>
</html>