<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>

<%

try{
	String id= request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement(" insert into product values('"+ id +"',?,?,?,?) " ); 
	ps.setString(1, name);
	ps.setString(2, category);
	ps.setString(3, price);
	ps.setString(4, active);
	ps.executeUpdate();
	
	response.sendRedirect("addNewProduct.jsp?msg=added");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("addNewProduct.jsp?msg=notadded");
}

%>