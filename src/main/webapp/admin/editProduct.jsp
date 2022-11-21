<%@page import=" project.ConnectionProvider " %>
<%@page import=" java.sql.*" %>
<%@include file= "adminHeader.jsp" %>
<%@include file= "../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Change Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>

<%
 String id= request.getParameter("id");
 
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id=' "+ id +"';");
	while(rs.next())
	{		
%>



<form action="editProductAction.jsp" method="post">

<input type="hidden" name="id" value="<%out.println(id); %>" >
<div class="left-div">
 <h3>Change Name</h3>
 <input class="input-style" type="text" value="<%=rs.getString(2) %>" name="name" placeholder="Enter Product Name" required >
<hr>
</div>

<div class="right-div">
<h3>Change Category</h3>
<input class="input-style" type="text" value="<%=rs.getString(3) %>" name="category" placeholder="Enter Category" required >
<hr>
</div>

<div class="left-div">
<h3>Change Price</h3>
 <input class="input-style" type="number" value="<%=rs.getString(4) %>" name="price" placeholder="Enter Price" required >
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active" >
  <option value="yes" >Yes</option>
  <option value="no">No</option>
</select>

<hr>

</div>
<%
  }
 }
  catch(Exception e)
{
    System.out.print(e);	
   }
%>
<button class="button" >Save
 <i class='far fa-arrow-alt-circle-right'></i>
 </button>
</form>

</body>
<br><br><br>
</body>
</html>