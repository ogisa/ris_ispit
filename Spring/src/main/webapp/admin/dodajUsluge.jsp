
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/header.jsp"%>
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
						
						<div class="card">

							<h5 class="card-header stylish-color-dark white-text text-center py-4">
								<strong>Dodaj uslugu</strong>
							</h5>

							<div class="card-body px-lg-5 pt-0">
								<form class="border border-light p-5" method="post"
									action="/AutoM/controllerS/admin/dodajUslugu" class="md-form"
									style="color: #757575;">
									<input type="text" id="input" class="form-control"
										placeholder="Naziv usluge" name="nazivUsluge"> <input
										type="number" id="input" class="form-control"
										placeholder="Cena usluge" name="cena">



									<button
										class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
										type="submit">Dodaj</button>


								</form>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>