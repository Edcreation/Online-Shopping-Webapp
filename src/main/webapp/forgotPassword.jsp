<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="fpassword" method="post" >
      <input type="email" name="email" placeholder="Enter Email" required>
      <select name="securityQuestion" required >
       <option value="What is your pet's name?" >What is your pet's name?</option>
       <option value="What is your favorite color?" >What is your favorite color?</option>
       <option value="Where does your grandma live?" >Where does your grandma live?</option>
       <option value="How many trips did you take around the world?" >How many trips did you take around the world?</option>
       <option value="What was your first car?" >What was your first car?</option>
      </select>
      <input type="text" name="answer" placeholder="answer" required >
      <input type="text" name="mobileNumber" placeholder="Enter Phone Number" required >
      <input type="password" name="npassword" autocomplete="new-password" placeholder="Enter New Password" required >
      <input type="submit" value="CHANGE PASSWORD" >
      </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
<%
String msg = request.getParameter("msg");
if("done".equals(msg))
{
%>
 <h1>Password Changed</h1> 
<%} %>

<% 
if("noacc".equals(msg))
{
%>
<h1>No Account with those details!.</h1>
<% } %>

<% 
if("internalerror".equals(msg))
{
%>
<h1>Something Went Wrong! Try Again Later !</h1>
<% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>