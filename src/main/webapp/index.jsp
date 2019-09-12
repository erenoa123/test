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
		String dataDate[] =  {"","","","","","","","","","",""};
		int dataFCnt[] ={0,0,0,0,0,0,0,0,0,0,0};
		int dataSCnt[] ={0,0,0,0,0,0,0,0,0,0,0};
		try{

			Connection con = ConnectionManager.getConnection();
			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select * from kintore");
			int j =0;
			while(rs.next()) {
				dataDate[j] = rs.getString("date");
				dataFCnt[j] = rs.getInt("fcnt");
				dataSCnt[j] = rs.getInt("scnt");
				out.println(dataDate[j]);
				out.println(dataFCnt[j]);
				out.println(dataSCnt[j]);
				j++;
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
  var jsdataDate = [<% for( int i =0; i < dataDate.length;i++){
    	  if( i != 0){
    		  out.print(",");
    	  }
    	  out.print("'"+dataDate[i]+"'");
      }%>];
  int jsdataFCnt = [<% for( int i =0; i < dataFCnt.length;i++){
  	  if( i != 0){
  		  out.print(",");
  	  }
  	  out.print(dataFCnt[i]);
    }%>];
  int jsdataSCnt = [<% for( int i =0; i < dataSCnt.length;i++){
  	  if( i != 0){
  		  out.print(",");
  	  }
  	  out.print(dataSCnt[i]);
    }%>];
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: jsdataDate,

      datasets: [
        {
          label: '腹筋',
          data: jsdataFCnt,
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
        },
        {
          label: 'スクワット',
          data: jsdataSCnt,
          borderColor: "rgba(0,0,255,1)",
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '筋トレ（<%out.print("'"+dataDate[0]+"'");%>~<%out.print("'"+dataDate[dataDate.length]+"'");%>）'
      },
      scales: {
        yAxes: [{
          ticks: {
            suggestedMax: 40,
            suggestedMin: 0,
            stepSize: 10,
            callback: function(value, index, values){
              return  value +  '回'
            }
          }
        }]
      },
    }
  });
  </script>

	</body>
</html>