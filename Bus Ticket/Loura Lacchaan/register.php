<?php include('server.php') ?>
<!DOCTYPE html>
<html lang="en">
<head>
   
	<title>Registration</title>
	<link rel="stylesheet" href="register1.css">
</head>
<body>
    
   
   
    <div class="main">
        <div class="navbar">
            <div class="logo"><img src="touronlogo.png" width="300" height="160">
            </div>
            <div class="signin">
                    <button class="signinbtn">Login</button>
                    <div class="signin-content">
                      
                      <div class="loginform">
            
                        <input type="email" name="lemail" placeholder="e-mail">
                        <input type="password" name="lpassword" placeholder="password">
                        <button class="loginbtnn"><a href="homepage.php">LOGIN</a></button>
            
                      </div>
                      
                    </div>
            </div>
            <div class="toolbar">
                <button class="btnhome"><a href="homepage.php">HOME</a></button>
                <button class="btndest"><a href="destination.php">DESTINATION</a></button>
                <button class="btnpackages"><a href="package.php">PACKAGES</a></button>
                <button class="btncontact"><a href="about.php">ABOUT</a></button>
            </div>
        </div>
        </div>
        <div class="regcontainer">
            <div class="registerform">
            
                <form action="register.php" method="post">
                    <p class="registration">Registration</p>
              <input type="text" name="userid" placeholder="User ID">
              <input type="text" name="first_name" placeholder="First Name">
              <input type="text" name="last_name" placeholder="Last Name">
              <p class="usertype">User Type:</p>
              <select name="user_type">
                 <option value="client">Client</option>
                <option value="manager">Manager</option>
                </select>
              <input type="email" name="email" placeholder="email">
              <input type="number" name="mobile" placeholder="Mobile Number">
              <p class="DOB">Date of Birth:</p>
              <input type="date" name="dob" placeholder="Date of Birth">
              <input type="password" name="password" placeholder="password">
              <input type="submit" name="submit" value="REGISTER">
                </form>
            </div>
            <div class="travelpic">
                <img src="vacay.jpg" width="500" height="500">
            </div>
        </div>
        </div>
    </div>

    <footer class="footer-distributed">

      <div class="footer-left">

        <h3><img src="touronlogo.png" width="300" height="160"></h3>

        <p class="footer-links">
          <a href="homepage.php" class="link-1">Home</a>
          
          <a href="destination.php">Destination</a>
        
          <a href="packages.php">Packages</a>
        
          <a href="about.php">About</a>
          
        </p>

        <p class="footer-company-name">TourOn © 2023</p>
      </div>

      <div class="footer-center">

        <div>
          <i class="fa fa-map-marker"></i>
          <p><span>&#128205;Location: <br>NSU Campus, B Block</span> Bashundhara, Dhaka</p>
        </div>

        <div>
          <i class="fa fa-phone"></i>
          <p>+88 019191919</p>
        </div>

        <div>
          <i class="fa fa-envelope"></i>
          <p><a href="mailto:contact@touron.org">contact@touron.org</a></p>
        </div>

      </div>

      <div class="footer-right">

        <p class="footer-company-about">
          <span>About the company</span>
          This is a developing website that will help improve our customer handling efficiency.
        </p>


      </div>

    </footer>
</body>
</html>