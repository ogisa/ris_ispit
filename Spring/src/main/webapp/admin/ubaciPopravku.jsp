<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Dodaj popravku</title>
</head>
<body>
	<div class="view intro-2">
		<div class="full-bg-img">
			<div class="mask rgba-black-strong flex-center">
				<div class="container">
					<div class="white-text text-center wow fadeInUp">
						<!-- Material form register -->
						<div class="card">

							<h5 class="card-header stylish-color-dark white-text text-center py-4">
								<strong>Dodaj popravku</strong>
							</h5>

							<!--Card content-->
							<div class="card-body px-lg-5 pt-0">

								<!-- Form -->
								<form class="text-center" style="color: #757575;"
									action="/AutoM/controllerS/admin/dodajVoziloRadniku"
									method="post">

									<div class="form-row">
                <div class="col">
                      <!-- First name -->
                    <div class="md-form">
                        <input type="text" id="materialRegisterFormFirstName" name="opis" placeholder="Opis popravke"  class="form-control">
                    </div>
                </div>
                </div>
									<div class="form-row">
										<div class="col">
											<c:if test="${!empty vozila }">
												<select  class="browser-default custom-select" name="idV">
													<c:forEach items="${vozila }" var="v">
														<option value="${v.idVozilo }">${v.regTablice }</option>
													</c:forEach>

												</select>
												<br>
											</c:if>
											<c:if test="${empty vozila }">
				Prvo dodajte Vozilo
			</c:if>
										</div>
									</div>
									<div class="form-row">
										<div class="col">
											<c:if test="${!empty radnici }">
												<select  class="browser-default custom-select" name="idR">
													<c:forEach items="${radnici }" var="r">
															<option value="${r.idRadnik}">${r.ime}
																${r.prezime}</option>
													</c:forEach>

												</select>
											</c:if>
											<c:if test="${empty radnici }">
				Prvo dodajte Radnika
			</c:if>
										</div>
									</div>
									<a href="/AutoM/controllerS/admin/popuniVlasnike">Dodaj
										novo vozilo</a>   <br>
										<a href="/AutoM/admin/dodaj.jsp">Dodaj novog
										radnika</a>
									<!-- Sign up button -->
									<button
										class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
										type="submit">Dodaj vozilo radniku</button>


								</form>
								<!-- Form -->

							</div>

						</div>
						<!-- Material form register -->


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>