<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>LoginPage</title>
    <link rel="stylesheet" href="styleLoginPage.css">
  </head>
  <body>
      <%
    final int foreignkey=(Integer)request.getAttribute("foreignkey");%>

      <div class="login-box">
      <h1>Login Here</h1>
     <form action="Initial" method="post" onsubmit="return validateLogin()">
        <img src="usericon.jpg" class="usericon">
        <label>Company's Name</label>
        <input type="text" name="username" placeholder="Enter your Username here">
        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password here"><br><br>
        <input type="submit" name="submit" value="Login"><br><br>
        <a class="link" href="ForgotPassword.jsp">Forgot Password</a><br>
        <a class="link" href="RegistrationPage.jsp">Register</a><br>
        <span style="color:red;"><br>${errMsg}</span>
      </form>
    </div>
  </body>
</html>
