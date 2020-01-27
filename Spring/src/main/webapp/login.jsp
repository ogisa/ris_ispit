<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Prijavi se</title>
</head>
<body>

	<div class="view intro-2">
		<div class="full-bg-img">
			<div class="mask rgba-black-strong flex-center">
				<div class="container">

						<!-- Material form login -->
						<div class="card">

							<h5
								class="card-header stylish-color-dark white-text text-center py-4">
								<strong>Prijavi se</strong>
							</h5>

							<!--Card content-->
							<div class="card-body px-lg-5 pt-0">

								<!-- Form -->
								<form class="text-center" style="color: #757575;"
									action="${pageContext.request.contextPath}/login" method="post">

									
									<div class="md-form">
										<input type="text" id="materialLoginFormEmail"
											class="form-control" name="username" placeholder="Korisnicko ime">
									</div>

									<!-- Password -->
									<div class="md-form">
										<input type="password" id="materialLoginFormPassword"
											class="form-control" name="password" placeholder="Password">
									</div>


									<!-- Sign in button -->
									<button
										class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
										type="submit">Prijavi se</button>


								</form>
								<!-- Form -->

							</div>

						</div>
						<!-- Material form login -->
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>