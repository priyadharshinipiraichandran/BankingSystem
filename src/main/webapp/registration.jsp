<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Eren Bank -Sign Up</title>
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="main">
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Create New Account</h2>
                    <form method="post" action="register" class="register-form" id="register-form" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="name" placeholder="Your Full Name" required />
                        </div>
                        <div class="form-group">
                            <label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="text" name="contact" id="contact" placeholder="Contact no" required />
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email" required />
                        </div>
                        <div class="form-group">
                            <label for="dob"><i class="zmdi zmdi-calendar"></i></label>
                            <input type="date" name="dob" id="dob" placeholder="Date of Birth" required />
                        </div>
                        <div class="form-group">
                            <label for="address"><i class="zmdi zmdi-pin"></i></label>
                            <input type="text" name="address" id="address" placeholder="Enter your Address" required />
                        </div>
                        <div class="form-group">
                            <label for="acctype"><i class="zmdi zmdi-pin"></i></label>
                            <input type="text" name="acctype" id="acctype" placeholder="Enter Account Type" required />
                        </div>
                        <div class="form-group">
                            <label for="proof"><i class="zmdi zmdi-folder-person"></i></label>
                            <input type="text" name="proof" id="proof" placeholder="Enter Adhaar Number" required />
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Password" required />
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required />
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree to all statements in <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="images/signuppic.png" alt="sign up image">
                    </figure>
                    <a href="login.jsp" class="signup-image-link">Already a member?</a>
                </div>
            </div>
        </div>
    </section>
</div>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status === "success") {
        swal("Congrats", "Account Created Successfully", "success");
    }

    function validateForm() {
        var name = document.getElementById('name').value;
        var contact = document.getElementById('contact').value;
        var email = document.getElementById('email').value;
        var dob = document.getElementById('dob').value;
        var address = document.getElementById('address').value;
        var acctype = document.getElementById('acctype').value;
        var proof = document.getElementById('proof').value;
        var password = document.getElementById('pass').value;
        var confirmPassword = document.getElementById('re_pass').value;

        // Name validation: should not be empty
        if (name.trim() === "") {
            alert("Please enter your full name.");
            return false;
        }

        // Contact validation: 10 digit number
        if (!/^[0-9]{10}$/.test(contact)) {
            alert("Please enter a valid 10-digit contact number.");
            return false;
        }

        // Email validation: basic email pattern
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailPattern.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Date of Birth validation: should not be empty
        if (dob.trim() === "") {
            alert("Please enter your date of birth.");
            return false;
        }

        // Address validation: should not be empty
        if (address.trim() === "") {
            alert("Please enter your address.");
            return false;
        }

        // Account Type validation: should not be empty
        if (acctype.trim() === "") {
            alert("Please enter your account type.");
            return false;
        }

        // Aadhar number validation: 12 digit number
        if (!/^[0-9]{12}$/.test(proof)) {
            alert("Please enter a valid 12-digit Aadhar number.");
            return false;
        }

        // Password validation: minimum 8 characters, at least one uppercase letter, one lowercase letter, one number and one special character
        var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (!passwordPattern.test(password)) {
            alert("Password must contain at least 8 characters, one uppercase letter, one lowercase letter, one number, and one special character.");
            return false;
        }

        // Confirm Password validation: should match the password
        if (password !== confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }

        return true;
    }
    </script>
    <script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status == "success") {
        swal("Congrats", "Account Created Successfully", "success");
    } else if (status == "exists") {
        swal("Oops", "Phone number, proof, or email already exists", "error");
    } else if (status == "failed") {
        swal("Oops", "Account creation failed", "error");
    }
</script>


</body>
</html>
