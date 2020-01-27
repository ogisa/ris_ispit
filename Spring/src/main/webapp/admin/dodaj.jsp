<%@ include file="/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>Zaposli radnika</title>
</head>
<body>

	<div class="view intro-2">
		<div class="full-bg-img">
			<div class="mask rgba-black-strong flex-center">
				<div class="container">

					<!-- Material form register -->
					<div class="card">

						<h5 class="card-header stylish-color-dark white-text text-center py-4">
							<strong>Dodaj radnika</strong>
						</h5>

						<!--Card content-->
						<div class="card-body px-lg-5 pt-0">

							<!-- Form -->
							<form class="text-center" style="color: #757575;" method="post"
<%-- 							${pageContext.request.contextPath}	 --%>
							action="/AutoM/controllerS/admin/add">

								<div class="form-row">
									<div class="col">
										<!-- First name -->
										<div class="md-form">
											<input type="text" id="materialRegisterFormFirstName"
												class="form-control" name="ime"> <label
												for="materialRegisterFormFirstName">First name</label>
										</div>
									</div>
									<div class="col">
										<!-- Last name -->
										<div class="md-form">
											<input type="text" id="materialRegisterFormLastName"
												class="form-control" name="prezime"> <label
												for="materialRegisterFormLastName">Last name</label>
										</div>
									</div>
								</div>
								<!-- Struka name -->
								<div class="md-form">
									<input type="text" id="materialRegisterFormFirstName"
										class="form-control" name="kvalifikacije"> <label
										for="materialRegisterFormFirstName">Struka</label>
								</div>


								<!-- Kor name -->
								<div class="md-form">
									<input type="text" id="materialRegisterFormFirstName"
										class="form-control" name="korIme"> <label
										for="materialRegisterFormFirstName">Username</label>
								</div>


								<!-- Password -->
								<div class="md-form">
									<input type="password" id="materialRegisterFormPassword"
										name="password" class="form-control"
										aria-describedby="materialRegisterFormPasswordHelpBlock">
									<label for="materialRegisterFormPassword">Password</label> <small
										id="materialRegisterFormPasswordHelpBlock"
										class="form-text text-muted mb-4"> At least 8
										characters and 1 digit </small>
								</div>


								<!-- Sign up button -->
								<button
									class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
									type="submit">Sign in</button>

							</form>
							<!-- Form -->

						</div>

					</div>
					<!-- Material form register -->

				</div>
			</div>
		</div>
	</div>

</body>
</html>