<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <strong>Dodaj vozilo</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center " style="color: #757575;" action="/AutoM/controllerS/admin/dodajVozilo" method="post">

            <div class="form-row">
                <div class="col">
                      <!-- First name -->
                    <div class="md-form">
                        <input type="text" id="materialRegisterFormFirstName" name="marka" placeholder="Marka"  class="form-control">
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                        <input type="text" id="materialRegisterFormLastName" name="regTablice" placeholder="Registarske tablice"  class="form-control">
                    </div>
                </div>
            </div>
			<c:if test="${!empty vlasnici }">
            <select  class="browser-default custom-select" name="idV">
            <c:forEach items="${vlasnici }" var="v">
            <option value="${v.idVlasnik }">${v.ime } ${v.prezime } </option>
            </c:forEach>
            
            </select>
            </c:if>
            <c:if test="${empty vlasnici }">
				Prvo dodajte vlasnika
			</c:if>
           
            <!-- Sign up button -->
            <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Dodaj vozilo</button>

         
        </form>
        <!-- Form -->

    </div>

</div>
<!-- Material form register -->


<!-- Material form register -->
<div class="card">

    <h5 class="card-header stylish-color-dark white-text text-center py-4">
        <strong>Dodaj vlasnika</strong>
    </h5>

    <!--Card content-->
    <div class="card-body px-lg-5 pt-0">

        <!-- Form -->
        <form class="text-center" style="color: #757575;" action="/AutoM/controllerS/admin/dodajVlasnika" method="post">

            <div class="form-row">
                <div class="col">
                    <!-- First name -->
                    <div class="md-form">
                        <input type="text" id="materialRegisterFormFirstName" name="ime" placeholder="Ime"  class="form-control">
                    </div>
                </div>
                <div class="col">
                    <!-- Last name -->
                    <div class="md-form">
                        <input type="text" id="materialRegisterFormLastName" name="prezime" placeholder="Prezime"  class="form-control">
                    </div>
                </div>
            </div>

            <!-- E-mail -->
            <div class="md-form mt-0">
                <input type="text" id="materialRegisterFormEmail" name="mesto" placeholder="Mesto" class="form-control">
             
            </div>

            <!-- Sign up button -->
            <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Dodaj vlasnika</button>

         
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