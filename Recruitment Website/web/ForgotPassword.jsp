<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Register</title>
    <link rel="stylesheet" href="styleForgotPassword.css">
  </head>
  <body>
   <!-- <div class="lnk" align="center">
     <a class="link" href="profile.jsp">PROFILE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</a>
     <a class="link" href="CandidateEvaluation.jsp">EVALUATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</a>
     <a class="link" href="show.jsp">CANDIDATES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
     <a class="link" href="fireemp.jsp">DISCARD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
     <a class="link" href="MailSender.jsp">MAIL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
     <a class="link" href="LoginPage1.jsp">LOG OUT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   </a>
    </div>-->

      <div class="forgotpassword-box">
      <h1>Forgot Password</h1>
      <form name="forgotpasswordform" action="ForgotPassword2" method="post" onsubmit="return validateLogin()">
        <label>E-mail</label>
        <input type="text" name="mail" placeholder="Enter your E-mail here"><br><br>
       <label>Last Password</label>
        <input type="password" name="password" placeholder="Enter last password you remember"><br><br>
        <input type="submit" name="setPassword" value="Set Password"/><br><br>
         <span style="color:red;"><br>${errMsg}</span>
          <!--<a class="link" href="ForgotPassword.html">Forgot Password</a><br><br>-->
      </form>
    </div>
  </body>
</html>
