<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<script type="text/javascript" src="/AutoM/js/jquery-3.4.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="/AutoM/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/AutoM/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="/AutoMjs/mdb.min.js"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link href="/AutoM/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="/AutoM/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="/AutoM/css/style.css" rel="stylesheet">

<html lang="sr" class="full-height">
<link rel="icon" href="https://i.dlpng.com/static/png/1254968-tool-png-tool-png-512_512_preview.png">
<!--Main Navigation-->
<meta charset="UTF-8">
<header>
	
	<nav class="navbar navbar-expand-lg navbar-dark black">
		
			<a class="navbar-brand" href="/AutoM/index.jsp"><strong>Auto
					servis</strong></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="true"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link"
						href="/AutoM/index.jsp">Home </a>
					</li>
			

					<s:authorize access="isAuthenticated()">
						<li class="nav-item"><a class="nav-link"
							href="/AutoM/controllerS/users/ucitajPopravke">Moje popravke</a>
						</li>
<!-- 						<li class="nav-item"><a class="nav-link" -->
<!-- 							href="/AutoM/controllerS/users/ucitajZaBrojPopravki">Broj popravki</a> -->
<!-- 						</li> -->
					</s:authorize>
					<s:authorize access="hasRole('1')">
						<li class="nav-item"><a class="nav-link"
							href="/AutoM/admin/dodaj.jsp">Zaposli majstora</a></li>
							<li class="nav-item"><a class="nav-link"
							href="/AutoM/controllerS/admin/ucitajZaPopravku">Dodaj
								popravku</a></li>
						<li class="nav-item"><a class="nav-link"
							href="/AutoM/controllerS/admin/ucitajZaIzvestaj">Izveštaji</a></li>

						<li class="nav-item"><a class="nav-link"
							href="/AutoM/admin/dodajUsluge.jsp">Dodaj usluge servisa</a></li>
					</s:authorize>
					

				</ul>
				<ul class="navbar-nav nav-flex-icons">
					<s:authorize access="isAnonymous()">
						<li class="nav-item"><a class="nav-link"
							href="/AutoM/login.jsp">Prijavi se</a></li>
					</s:authorize>

					<s:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link">Trenutni radnik: ${korisnik} </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/logout">Odjavi se</a></li>
					</s:authorize>
				</ul>
			</div>
	
	</nav>

	<!--   <div class="view intro-2"> -->
	<!--     <div class="full-bg-img"> -->
	<!--       <div class="mask rgba-black-strong flex-center"> -->
	<!--         <div class="container"> -->
	<!--           <div class="white-text text-center wow fadeInUp"> -->
	<!--             <h2>This Navbar isn't fixed</h2> -->
	<!--             <h5>When you scroll down it will disappear</h5> -->
	<!--             <br> -->
	<!--             <p>Full page intro with background image will be always displayed in full screen mode, regardless -->
	<!--               of device </p> -->
	<!--           </div> -->
	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->

</header>
<!--Main Navigation-->

<!--Main Layout-->
<!-- <main class="text-center my-5"> -->

<!--   <div class="container"> -->
<!--     <div class="row"> -->
<!--       <div class="col-md-12"> -->

<!--         <p align="justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor -->
<!--           incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation -->
<!--           ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in -->
<!--           voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non -->
<!--           proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> -->

<!--       </div> -->
<!--     </div> -->
<!--   </div> -->

<!-- </main> -->
<!--Main Layout-->