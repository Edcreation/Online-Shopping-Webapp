
<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>
<%@include file= "header.jsp" %>
<%@include file= "footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>

<body>
<div style="color: white; text-align: center;margin-bottom: 10px; font-size: 30px;">Cart<i class='fas fa-cart-plus'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">Email</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-usd"></i> Price</th>
            <th scope="col">Remove <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	//String email=session.getAttribute("email").toString();
	Connection con= ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select * from cart where email='"+email+"';");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-usd"></i><%=rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Remove from cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
	}
}
catch(Exception e)
	{
	 System.out.print(e);
	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>
          
   
</body>


</html>