<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div align="center">
  <h1><u>Car Entry Page</u></h1>
  <h2>
  <form:form action="/carAdd" method="post" modelAttribute="carRecord">
        <form:hidden path="available"/>
  		Enter Car Registration Number:<form:input path="carNumber" />
  		<br/><br/>
  		Enter Car Name: <form:input path="carName" />
  		<br/><br/>
  		Enter Manufacturer Name:<form:input path="manufacturer" />
  		<br/><br/>
  		Enter Year of Manufacture: <form:input path="yearOfMfg" />
  		<br/><br/>
  		Enter Rent Rate/Hour: <form:input path="rentRate" />
  		<br/><br/>
  		Select Variant Id<form:input list="variants" path="variantId"/>
  		<datalist id="variants">
  		<c:forEach items="${variantIdList }" var="vids">
  		<option value="${vids}"></option>
  		</c:forEach>
  		</datalist>
  		<button type="submit">Submit</button>
  		<button type="reset">Reset</button>
  </form:form>
  </h2>
  </div>
</body>
</html >