<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>

<%
try
{
   	Connection con = ConnectionProvider.getCon();
   	Statement st = con.createStatement();
   	String ql="create table users(name varchar(100), email varchar(100) primary key,mobileNumber varchar(20), securityQuestion varchar(300), answer varchar(200), password varchar(200), address varchar(200), city varchar(100),state varchar(100), country varchar(100) )";
    String q2="create table product(id int,name varchar(500),category varchar(200),price int,active varchar(10))";
    String q3="create table cart(email varchar(200),name varchar(200),product_id int,quantity int,price int,total int,address varchar(300),city varchar(100),state varchar(100),country varchar(200),mobileNumber varchar(20),orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
   	System.out.println(ql);
   	System.out.println(q2);
   	System.out.println(q3);
    //  st.execute(ql);
    //  st.execute(q2);
    st.execute(q3);
    System.out.print("table created");
    con.close();
}
catch(Exception e)
{
  	System.out.print(e);
}

%>