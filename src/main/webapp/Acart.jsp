<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>


<%  

String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
String name="";
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;
int z=0;

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+product_id+"';");
	while(rs.next())
	{
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1=st.executeQuery("select * from cart where product_id='"+product_id+"'and email='"+email+"' and address is NULL;");
    while(rs1.next())
    {
    	cart_total=rs1.getInt(5);
    	cart_total=cart_total + product_price;
    	quantity=rs1.getInt(3);
    	quantity=quantity+1;
    	z=1;
    }
    if(z==1)
    {
    	st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+ email +"' and address is NULL;");
        response.sendRedirect("myCart.jsp?msg=inc");
    }
    if(z==0)
    {
    	System.out.println("fail"+ product_id + email+ quantity);
    }
}
catch(Exception e)
{
	System.out.println(e);
}

%>