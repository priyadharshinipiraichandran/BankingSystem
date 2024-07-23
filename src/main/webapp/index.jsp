<%
    if (session.getAttribute("phno") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Welcome to Eren Bank</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Eren Bank</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><% session.getAttribute("phno"); %></a></li>
						 <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"><%= session.getAttribute("phno") %></a></li>
						
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			<img class="masthead-avatar mb-5" src="assets/img/bankicon.svg"
				alt="..." />
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Welcome To Eren Bank</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Your Financial Partner</p>
		</div>
	</header>
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Services You Can Count On</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Portfolio Grid Items-->
			<div class="row justify-content-center">
				<!-- Portfolio Item 1-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal1">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/transl.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 2-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal2">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/balancel.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 3-->
				<div class="col-md-6 col-lg-4 mb-5">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal3">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/pcl.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 4-->
				
					
				<!-- Portfolio Item 5-->
				<div class="col-md-6 col-lg-4 mb-5 mb-md-0">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal5">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/thl.png"
							alt="..." />
					</div>
				</div>
				<!-- Portfolio Item 6-->
				<div class="col-md-6 col-lg-4">
					<div class="portfolio-item mx-auto" data-bs-toggle="modal"
						data-bs-target="#portfolioModal6">
						<div
							class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
							<div
								class="portfolio-item-caption-content text-center text-white">
								<i class="fas fa-plus fa-3x"></i>
							</div>
						</div>
						<img class="img-fluid" src="assets/img/portfolio/User Details.png"
							alt="..." />
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section-->
	
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						206 Veltech Hightech Hostel <br /> Chennai - 600055
					</p>
				</div>
				<!-- Footer Social Icons-->
				
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">Devoleped By Raja Pandi S & Priyadharshini P</h4>
					<p class="lead mb-0">
						Banking System Project for <a href="https://www.genpact.com/">Genpact</a> .
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Eren Bank 2024</small>
		</div>
	</div>
	<!-- Portfolio Modals-->
	<!-- Portfolio Modal 1-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" aria-labelledby="portfolioModal1" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Transaction</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/transl.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<div class="row justify-content-center">
			
					<form id="contactForm"  method="post" action= "withdraw">
						<!-- Name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="amount" type="number" name= "amount"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="amount">Enter Amount to be transferred</label>
							<div class="invalid-feedback" data-sb-feedback="amount:required">A
								Amount is required.</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="recaccname" type="text" name= "recaccname"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="recaccname">Enter Reciever's Full name</label>
							<div class="invalid-feedback" data-sb-feedback="recaccname:required">A
								Reciever's Name is required.</div>
						</div>
						<!-- Message input-->
					    <div class="form-floating mb-3">
							<input class="form-control" id="recaccno" type="text" name= "recaccno"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="recaccno">Enter Reciever's Account number</label>
							<div class="invalid-feedback" data-sb-feedback="recaccno:required">A
								Reciever's Account number is required.</div>
						</div>
						<div class="form-floating mb-3">
							<input class="form-control" id="pass" type="password" name="pass"
								placeholder="(123) 456-7890" data-sb-validations="required" />
							<label for="pass">Enter Your Password</label>
							<div class="invalid-feedback" data-sb-feedback="pass:required">A
								Password is Required.</div>
						</div>
						<div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="btn btn-primary" value="Send" />
                        </div>
						<!-- Submit Button-->
	
					</form>
				</div>
			</div>
		</div>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 2-->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" aria-labelledby="portfolioModal2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Balance
									</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/balancel.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<form id="balForm" method="post" action="balanceenq">
										<div class="form-floating mb-3">
											<input class="form-control" id="pass" type="password" name="pass"
												placeholder="(123) 456-7890" data-sb-validations="required" />
											<label for="pass">Enter Your Password</label>
											<div class="invalid-feedback" data-sb-feedback="pass:required">A
												Password is Required.</div>
										</div>
                                    <div class="form-group form-button">
                                        <input type="submit" name="delacc" id="delacc" class="btn btn-primary" value="Balance" />
                                    </div>
                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 3-->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" aria-labelledby="portfolioModal3" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0"> Change password
									</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/pcl.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<form id="updatepass" method="post" action="updatepassuser">
                                    <div class="form-floating mb-3">
										<input class="form-control" id="userpass" type="password" name="userpass"
											placeholder="(123) 456-7890" data-sb-validations="required" />
										<label for="userpass">Enter Your old Password</label>
										<div class="invalid-feedback" data-sb-feedback="userpass:required">A
											Password is Required.</div>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="newpass" type="password" name="newpass"
											placeholder="(123) 456-7890" data-sb-validations="required" />
										<label for="newpass">Enter Your new Password</label>
										<div class="invalid-feedback" data-sb-feedback="newpass:required">A
											Password is Required.</div>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" id="renewpass" type="password" name="renewpass"
											placeholder="(123) 456-7890" data-sb-validations="required" />
										<label for="renewpass">Re-Enter Your Password</label>
										<div class="invalid-feedback" data-sb-feedback="renewpass:required">A
											Password is Required.</div>
									</div>
									<div class="form-group form-button">
                                        <input type="submit" name="update" id="update" class="btn btn-primary" value="Update" />
                                    </div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 4-->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" aria-labelledby="portfolioModal4" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Transaction history</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/thl.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 5-->
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" aria-labelledby="portfolioModal5" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Transaction History</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/thl.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<form id="transhist" method="post" action="transhist">
                                    <div class="form-floating mb-3">
										<input class="form-control" id="thpass" type="password" name="thpass"
											placeholder="(123) 456-7890" data-sb-validations="required" />
										<label for="thpass">Enter Password</label>
										<div class="invalid-feedback" data-sb-feedback="th:required">A
											Password is Required.</div>
									</div>
                                    <div class="form-group form-button">
                                        <input type="submit" name="trans" id="trans" class="btn btn-primary" value="Get History" />
                                    </div>
								</form>
								
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 6-->
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" aria-labelledby="portfolioModal6" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header border-0">
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center pb-5">
					<div class="container">
						<div class="row justify-content-center">
							<div class="col-lg-8">
								<!-- Portfolio Modal - Title-->
								<h2
									class="portfolio-modal-title text-secondary text-uppercase mb-0">User Details</h2>
								<!-- Icon Divider-->
								<div class="divider-custom">
									<div class="divider-custom-line"></div>
									<div class="divider-custom-icon">
										<i class="fas fa-star"></i>
									</div>
									<div class="divider-custom-line"></div>
								</div>
								<!-- Portfolio Modal - Image-->
								<img class="img-fluid rounded mb-5"
									src="assets/img/portfolio/User Details.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<form id="showdet" method="post" action="showdetail">
				
								    <div class="form-floating mb-3">
								        <input class="form-control" id="thpass" type="password" name="thpass" placeholder="Password" data-sb-validations="required" />
								        <label for="thpass">Enter Password</label>
								        <div class="invalid-feedback" data-sb-feedback="thpass:required">A Password is Required.</div>
								    </div>
								    <div class="form-group form-button">
								        <input type="submit" name="showdetails" id="showdetails" class="btn btn-primary" value="Get" />
								    </div>
								</form>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script defer>
        document.addEventListener("DOMContentLoaded", function () {
            document.getElementById("updatepass").addEventListener("submit", function (event) {
                // Fetch form values
                var oldPassword = document.getElementById("userpass").value;
                var newPassword = document.getElementById("newpass").value;
                var reNewPassword = document.getElementById("renewpass").value;

                // Password validation regex
                var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                // Clear previous validation messages
                var invalidFeedbacks = document.querySelectorAll(".invalid-feedback");
                invalidFeedbacks.forEach(function (feedback) {
                    feedback.style.display = "none";
                });

                // Perform validations
                if (!passwordPattern.test(newPassword)) {
                    document.querySelector("#newpass + .invalid-feedback").textContent = "Password must be at least 8 characters long and include one uppercase letter, one lowercase letter, one digit, and one special character.";
                    document.querySelector("#newpass + .invalid-feedback").style.display = "block";
                    event.preventDefault();
                }

                if (newPassword !== reNewPassword) {
                    document.querySelector("#renewpass + .invalid-feedback").textContent = "Passwords do not match.";
                    document.querySelector("#renewpass + .invalid-feedback").style.display = "block";
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
