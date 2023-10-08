<?php
session_start();

// initializing variables
$userid = "";
$first_name = "";
$last_name = "";
$user_type="";
$email    = "";
$mobile="";
$dob="";
$password = "";
$errors = array(); 

// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'touron0');

// REGISTER USER
if (isset($_POST['submit'])) {
  // receive all input values from the form
  $userid = mysqli_real_escape_string($db, $_POST['userid']);
  $first_name = mysqli_real_escape_string($db, $_POST['first_name']);
  $last_name = mysqli_real_escape_string($db, $_POST['last_name']);
  $user_type = mysqli_real_escape_string($db, $_POST['user_type']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $mobile = mysqli_real_escape_string($db, $_POST['mobile']);
  $dob = mysqli_real_escape_string($db, $_POST['dob']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  // form validation: ensure that the form is correctly filled ...
  // by adding (array_push()) corresponding error unto $errors array
  if (empty($userid)) { array_push($errors, "Userid is required"); }
   if (empty($first_name)) { array_push($errors, "First name is required"); }
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($password)) { array_push($errors, "Password is required"); }
  

  // first check the database to make sure 
  // a user does not already exist with the same userid and/or email
  $user_check_query = "SELECT * FROM registration WHERE userid='$userid' OR email='$email' OR mobile='$mobile' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);
  
  if ($user) { // if user exists
    if ($user['userid'] === $userid) {
      array_push($errors, "Userid already exists");
    }

    if ($user['email'] === $email) {
      array_push($errors, "email already exists");
    }
	
	if ($user['mobile'] === $mobile) {
      array_push($errors, "Mobile number already exists");
    }
  }
  

  
  
  

  // Finally, register user if there are no errors in the form
  if (count($errors) == 0) {
  	$password = md5($password);//encrypt the password before saving in the database

  	$query1 = "INSERT INTO registration(userid,password,first_name,last_name,dob,user_type,email,mobile) 
  			  VALUES('$userid', '$password', '$first_name','$last_name','$dob' ,'$user_type','$email','$mobile')";
			  
			  
			 //END HERE 
			 
			 
			 
			 
			 
			 
			 
			 //iGNORE THIS CODE....
			 //....
			 //...
			 
			 
			  if($user_type=='client'){
				  $query2 = "INSERT INTO client(client_id, userid)
  			  VALUES('','$userid')";
			  }else if($user_type=='manager'){
				  $query2 = "INSERT INTO manager(manager_id, userid) VALUES('','$userid')";
			  }
			  $query=$query1 . ";" . $query2 ;

         $db->multi_query($query);
  	
  	$_SESSION['userid'] = $userid;
  	$_SESSION['success'] = "You are now logged in";
  	header('location: homepage.php');
  }
}




//signup2 














// LOGIN USER
if (isset($_POST['login_user'])) {
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  if (empty($email)) {
  	array_push($errors, "Userid is required");
  }
  if (empty($password)) {
  	array_push($errors, "Password is required");
  }

  if (count($errors) == 0) {
  	$password = md5($password);
  	$query = "SELECT user_type FROM registration WHERE email='$email' AND password='$password'";
	//$user_type = mysqli_fetch_assoc($query);
	 
	 $results = mysqli_query($db, $query);
	 $user_type = mysqli_fetch_assoc($results);
	if ($user_type['user_type'] === 'client') {
     //array_push($errors, "Userid already exists");
	 //$results = mysqli_query($db, $query);
	 
  	if (mysqli_num_rows($results) == 1) {
  	  $_SESSION['email'] = $email;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location:homepage-loggedin.php');
  	}else {
  		array_push($errors, "Wrong userid/password combination");
  	}
    } else if ($user_type['user_type'] === 'manager') {
     //array_push($errors, "Userid already exists");
	 //$results = mysqli_query($db, $query);
  	if (mysqli_num_rows($results) == 1) {
  	  $_SESSION['email'] = $email;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location:homepage-manager.php');
  	}else {
  		array_push($errors, "Wrong userid/password combination");
  	}
    } else if ($user_type['user_type'] === 'admin') {
     //array_push($errors, "Userid already exists");
	 //$results = mysqli_query($db, $query);
  	if (mysqli_num_rows($results) == 1) {
  	  $_SESSION['email'] = $email;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location:homepage-admin.php');
  	}else {
  		array_push($errors, "Wrong userid/password combination");
  	}
    }
	 
  	/* $results = mysqli_query($db, $query);
  	if (mysqli_num_rows($results) == 1) {
  	  $_SESSION['email'] = $email;
  	  $_SESSION['success'] = "You are now logged in";
  	  header('location:homepage-loggedin.php');
  	}else {
  		array_push($errors, "Wrong userid/password combination");
  	}*/
  }
}

?>