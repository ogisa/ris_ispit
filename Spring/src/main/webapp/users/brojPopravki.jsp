<%@ include file="/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Izvestaji</title>
</head>
<body>
	<div class="view intro-2">
		<div class="full-bg-img">
			<div class="mask rgba-black-strong flex-center">
				<div class="container">
					<div class="white-text text-center wow fadeInUp">
						<c:if test="${!empty majstori }">
							<div class="card">

								<h5
									class="card-header stylish-color-dark white-text text-center py-4">
									<strong>Broj popravki za majstore</strong>
								</h5>

								<div class="card-body px-lg-5 pt-0">

									<form class="md-form" style="color: #757575;" method="post"
										action="/AutoM/controllerS/users/brPopravki">
										<div>
											<select class="browser-default custom-select" id="select"
												name="idR">
												<option value="" disabled selected>Izaberi majstora</option>
												<c:forEach items="${majstori }" var="m">
													<option value="${m.idRadnik }">${m.ime }
														(${m.korIme }) ${m.prezime }</option>
												</c:forEach>
											</select>
										</div>
										<div class="md-form">
											Pocetak: <input name="pocetak"  type="date" value="${pre }" id="date-picker-example" class="form-control datepicker"><br>
										</div>
										<div class="md-form">
											Kraj: <input name="kraj"  type="date" id="date-picker-example" value="${danas }" class="form-control datepicker">
										</div>

										<button
											class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
											type="submit">Izveštaj</button>


									</form>
									<c:if test="${!empty radnikPod }">
									<h5 class="card-header stylish-color-dark white-text text-center py-4">
									<strong>${radnikPod }</strong>
								</h5>
									</c:if>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>