<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
<title>Insert title here</title>
<style type="text/css">
.my-custom-scrollbar{
	position: relative;
	overflow: auto;
}
.table-wrapper-scroll-y{
display: block;
}s
</style>
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
								<strong>Moje popravke</strong>
							</h5>

							<!--Card content-->
							<div class="card-body px-lg-5 pt-0 ">



								<!--                 <div class="col"> -->
								<!--                     Last name -->
								<!--                     <div class="md-form"> -->
								<!--                         <input type="text" id="materialRegisterFormLastName" name="regTablice" placeholder="Registarske tablice"  class="form-control"> -->
								<!--                     </div> -->
								<!--                 </div> -->
								<!--             </div> -->
								<c:if test="${!empty popravke }">
									<table class="table table-striped table-wrapper-scroll-y my-custom-scrollbar" style="height: 500px"> 
										<thead class="grey darken-3 white-text">
											<tr>
												<th scope="col">ID</th>
												<th scope="col">Tablice automobila</th>
												<th scope="col">Opis popravke</th>
												<th scope="col">Status popravke</th>
												<th scope="col">Unesi usluge</th>
												<th scope="col">Završi popravku</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${popravke }" var="p">
											
												<tr>
													<th scope="row">${p.idPopravka }</th>
													<td>${p.vozilo.regTablice}</td>
													<td>${p.opisPopravke }</td>
													<td>${p.status.opis }</td>
													<c:if
														test="${!empty popravka && popravka.idPopravka == p.idPopravka}">
														<c:if test="${!empty usluge }">
															<td>
																<form action="/AutoM/controllerS/users/unesiUsluge"
																	method="post">
																	<!-- Material checked -->
																	<div class="form-check">
																		<c:forEach var="u" items="${usluge }">
																			<c:if test="${u.imaP(popravka.idPopravka) }">
																				<input type="checkbox" class="form-check-input" id="materialChecked"  name="idU" value="${u.idUsluga }" disabled checked>
																			 	<label class="form-check-label" for="materialUnchecked"> ${u.nazivUsluge }</label> <br>
																			</c:if>
																			<c:if test="${!u.imaP(popravka.idPopravka) }">
																					<label class="form-check-label" for="materialUnchecked" ><input type="checkbox" class="form-check-input" id="materialChecked"  name="idU" value="${u.idUsluga }" >
																			  ${u.nazivUsluge }</label> 
																			</c:if>
																		</c:forEach>
																	</div>
																	<input class="btn btn-primary" type="submit"
																		value="Dodaj">

																</form>
															</td>
														</c:if>
													</c:if>
													<c:if test="${ p.cena!=0 }">
														<td>Cena: ${p.cena} </td>
													</c:if>
													<c:if
														test="${!empty popravka &&  popravka.idPopravka != p.idPopravka && p.cena==0}">
														<td><a
															href="/AutoM/controllerS/users/ucitajUsluge?idP=${p.idPopravka }">Unesi
														</a></td>

													</c:if>
													<c:if test="${empty popravka && p.cena==0}">
														<td><a
															href="/AutoM/controllerS/users/ucitajUsluge?idP=${p.idPopravka }">Unesi
														</a></td>

													</c:if>
													
													<td><a
														href="/AutoM/controllerS/users/dodajZavrsetak?idP=${p.idPopravka }">
															Završeno</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>



								</c:if>
								<c:if test="${empty popravke }">
				Nemate ni jednu popravku
			</c:if>

								<!-- Sign up button -->


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