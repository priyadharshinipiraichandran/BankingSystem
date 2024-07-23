<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Eren Bank - Sign in</title>

<!-- Font Icon -->
<link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<style>
    .error {
        color: red;
        display: none;
    }
</style>

</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<div class="main">

    <!-- Sign in Form -->
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure>
                        <img src="images/login_girl.png" alt="sign up image">
                    </figure>
                    <a href="registration.jsp" class="signup-image-link">Create an account</a>
                    <a href="adminlogin.jsp" class="signup-image-link">Admin login</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Sign in</h2>

                    <form method="post" action="login" class="register-form" id="login-form" onsubmit="return validateForm()">
                        <div class="form-group">
                            <label for="phno"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="tel" name="phno" id="phno" pattern="[0-9]{10}" placeholder="Enter valid Phone number" required>
                        </div>
                        <div id="error-message" class="error">Please enter exactly 10 digits.</div>
                        <div id="custom-warning" class="error">Enter Valid Phone number</div>
                        <div class="form-group">
                            <label for="password"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password" required>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </section>

</div>

<!-- JS -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status == "failed"){
        swal("Oops!","Wrong Username or Password","failed");
    }
</script>
<script>
    function validateForm() {
        const phoneInput = document.getElementById('phno');
        const errorMessage = document.getElementById('error-message');
        const customWarning = document.getElementById('custom-warning');
        const phoneNumber = phoneInput.value;
        const pattern = /^[0-9]{10}$/;

        // Clear previous custom warning
        customWarning.style.display = 'none';
        customWarning.innerHTML = '';

        if (!pattern.test(phoneNumber)) {
            errorMessage.style.display = 'block';
            return false;
    
        }

        errorMessage.style.display = 'none';
        return true;
    }
</script>
</body>
<!-- This template was made by Colorlib (https://colorlib.com) -->
</html>
