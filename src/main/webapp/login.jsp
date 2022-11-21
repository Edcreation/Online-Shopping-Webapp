
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
      <form action="loginAction" method="post">
      <input type="email" name="email" placeholder="Enter Email" required>
      <input type="password" name="password" placeholder="Enter Password" autocomplete="new-password" required>
      <input type="submit" value="LOG IN">
      </form>
     
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
<% 
String msg = request.getParameter("msg");
if("notexist".equals(msg))
{
%>
 <h1> Incorrect Email or Password. Try Again</h1> 
<%} %>

<% 
if("internalerror".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again Later !</h1>
<% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>