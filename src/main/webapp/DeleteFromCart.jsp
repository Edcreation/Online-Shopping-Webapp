<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>

<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q= " DELETE FROM cart WHERE product_id='"+product_id+"'and email='"+email+"'; ";
	st.execute(q);
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e)
{
	System.out.println(e);
}

%>