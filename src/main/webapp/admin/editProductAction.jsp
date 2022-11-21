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
	Statement st= con.createStatement();
	st.executeUpdate(" UPDATE product SET id = '"+ id +"', name= '"+ name +"',category='"+ category +"',price='"+ price +"',active='"+ active +"' WHERE id = '"+ id +"'; ");
	if(active.equals("No"))
	{
		st.executeUpdate(" delete from cart where product id='"+ id +"'and address is NULL;");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=change");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=nochange");
}

%>