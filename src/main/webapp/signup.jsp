<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="./css/signup-style.css">
<title>SignUp</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="signupAction" method="post">
      <input type="text" name="name" placeholder="Enter Name" required >
      <input type="email" name="email" placeholder="Enter Email" required >
      <input type="tel"  name="mobileNumber"  placeholder="Enter Phone number" pattern="[0-9]{3}[0-9]{3}[0-9]{4}" style="display: block;
  margin: 0 auto;
  width: 80%;
  border: 0;
  border-bottom: 1px solid rgba(0,0,0,.2);
  height: 45px;
  line-height: 45px;  
  margin-bottom: 10px;
  font-size: 1em;
  color: black;" required >
      
      <select name="securityQuestion" required>
       <option value="What is your pet's name?" >What is your pet's name?</option>
       <option value="What is your favorite color?" >What is your favorite color?</option>
       <option value="Where does your grandma live?" >Where does your grandma live?</option>
       <option value="How many trips did you take around the world?" >How many trips did you take around the world?</option>
       <option value="What was your first car?" >What was your first car?</option>
      </select>
      <input type="text" name="answer" placeholder="answer" required >
      <input type="password" name="password" autocomplete="new-password" placeholder="Enter Password" required >
      <input type="submit" value="SIGN UP" >
      </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<% 
String msg = request.getParameter("msg");
if("valid".equals(msg))
{
%>
 <h1> Successfully Registered!!!</h1> 
<%} %>

<% 
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<% } %>
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>