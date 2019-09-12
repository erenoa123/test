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
      labels: ['test', '8��2��', '8��3��', '8��4��', '8��5��', '8��6��', '8��7��'],
      datasets: [
        {
          label: '�ō��C��(�x�j',
          data: [35, 34, 37, 35, 34, 35, 34, 25],
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
        },
        {
          label: '�Œ�C��(�x�j',
          data: [25, 27, 27, 25, 26, 27, 25, 21],
          borderColor: "rgba(0,0,255,1)",
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '�C���i8��1��~8��7���j'
      },
      scales: {
        yAxes: [{
          ticks: {
            suggestedMax: 40,
            suggestedMin: 0,
            stepSize: 10,
            callback: function(value, index, values){
              return  value +  '�x'
            }
          }
        }]
      },
    }
  });
  </script>
	</body>
</html>