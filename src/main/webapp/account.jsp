<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Eren</title>
<!-- Favicon-->
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
			<a class="navbar-brand" href="#page-top">Eren Bank- Admin</a>
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
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><% session.getAttribute("adminid"); %></a></li>
						<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded"><%= session.getAttribute("adminid") %></a></li>
					
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
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Admin Services</h2>
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
						<img class="img-fluid" src="assets/img/portfolio/UPDATEUSERBANK.png"
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
						<img class="img-fluid" src="assets/img/portfolio/DELETEUSERBANK.png"
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
						<img class="img-fluid" src="assets/img/portfolio/VIEWUSERBANK.png"
							alt="..." />
					</div>
				</div>
		</div>
	</section>
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
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Update User Details</h2>
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
									src="assets/img/portfolio/UPDATEUSERBANK.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<div class="row justify-content-center">
			
								
									<form id="updateForm" method="post" action="adminupdate">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="accno" type="text" name="accno" placeholder="Enter Account number" data-sb-validations="required" /> 
                                        <label for="accno">Enter Account number</label>
                                        <div class="invalid-feedback" data-sb-feedback="accno:required">Account number is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newname" type="text" name="newname" placeholder="Enter new name..." data-sb-validations="required" /> 
                                        <label for="newname">New Name</label>
                                        <div class="invalid-feedback" data-sb-feedback="newname:required">New name is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newphno" type="text" name="newphno" placeholder="Enter new phone number..." data-sb-validations="required" /> 
                                        <label for="newphno">New Phone Number</label>
                                        <div class="invalid-feedback" data-sb-feedback="newphno:required">New phone number is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newemail" type="text" name="newemail" placeholder="Enter new email..." data-sb-validations="required" /> 
                                        <label for="newemail">New Email</label>
                                        <div class="invalid-feedback" data-sb-feedback="newemail:required">New email is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newdob" type="text" name="newdob" placeholder="Enter new date of birth..." data-sb-validations="required" /> 
                                        <label for="newdob">New Date of Birth</label>
                                        <div class="invalid-feedback" data-sb-feedback="newdob:required">New date of birth is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newaddress" type="text" name="newaddress" placeholder="Enter new address..." data-sb-validations="required" /> 
                                        <label for="newaddress">New Address</label>
                                        <div class="invalid-feedback" data-sb-feedback="newaddress:required">New address is required.</div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="newpass" type="text" name="newpass" placeholder="Enter new password..." data-sb-validations="required" /> 
                                        <label for="newpass">New Password</label>
                                        <div class="invalid-feedback" data-sb-feedback="newpass:required">New password is required.</div>
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
									class="portfolio-modal-title text-secondary text-uppercase mb-0">Delete User
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
									src="assets/img/portfolio/DELETEUSERBANK.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								<form id="deleteForm" method="post" action="admindelete">
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="delaccno" type="text" name="accno" placeholder="Enter Account number" data-sb-validations="required" /> 
		                                        <label for="delaccno">Enter Account Number</label>
		                                        <div class="invalid-feedback" data-sb-feedback="delaccno:required">Account number is required.</div>
		                                    </div>
		                                    <div class="form-group form-button">
		                                        <input type="submit" name="delacc" id="delacc" class="btn btn-danger" value="Delete" />
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
									class="portfolio-modal-title text-secondary text-uppercase mb-0">View Details
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
									src="assets/img/portfolio/VIEWUSERBANK.png" alt="..." />
								<!-- Portfolio Modal - Text-->
								
								<form id="viewForm" method="post" action="adminview">
		                                    <div class="form-floating mb-3">
		                                        <input class="form-control" id="viewno" type="text" name="viewno" placeholder="Enter Account number" data-sb-validations="required" /> 
		                                        <label for="viewno">Enter Account Number</label>
		                                        <div class="invalid-feedback" data-sb-feedback="delaccno:required">Account number is required.</div>
		                                    </div>
		                                    <div class="form-group form-button">
		                                        <input type="submit" name="viewno" id="viewno" class="btn btn-danger" value="View" />
		                                    </div>
		                                </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio Modal 4--
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
