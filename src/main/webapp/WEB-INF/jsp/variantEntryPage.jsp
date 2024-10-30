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
<style>
/* Basic reset for margin and padding */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  color: #333;
}

/* Centering the form */
div[align="center"] {
  max-width: 500px;
  margin: 5% auto;
  padding: 20px;
  background-color: #ffffff;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
  border-radius: 8px;
}

/* Styling the form header */
h2 {
  text-align: center;
  font-size: 24px;
  color: #4CAF50;
  margin-bottom: 20px;
}

/* Form fields styling */
form input[type="text"],
form input[type="password"],
form input[list],
form input[type="email"],
form select {
  width: 100%;
  padding: 10px;
  margin: 10px 0;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 16px;
}

/* Styling buttons */
button[type="button"],
button[type="reset"] {
  font-size: 16px;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

button[type="button"] {
  background-color: #4CAF50;
  color: #ffffff;
}

button[type="button"]:hover {
  background-color: #45a049;
}

button[type="reset"] {
  background-color: #f44336;
  color: #ffffff;
  margin-left: 10px;
}

button[type="reset"]:hover {
  background-color: #e53935;
}

/* Improving the spacing and alignment */
form {
  display: flex;
  flex-direction: column;
}

form input[type="text"],
form input[type="password"],
form input[type="email"],
form input[list] {
  margin-top: 8px;
  font-size: 14px;
}

form br {
  display: none;
}

</style>
<body>
  <div align="center">
  <h1><u>Car Variant Entry Page</u></h1>
  <h2>
  <form:form action="/variantAdd" method="post" modelAttribute="variantRecord">
        <form:hidden path="variantId"/>
  		Variant Id:<form:input path="variantId" disabled="true"/>
  		<br/><br/>
  		Enter Variant Name: <form:input path="variantName" />
  		<br/><br/>
  		Enter Number of Seats: <form:input path="numberOfSeat" />
  		<br/><br/>
  		Enter Type of Fuel: <form:input path="fuel" />
  		<br/><br/>
  		<button type="submit">Submit</button>
  		<button type="reset">Reset</button>
  </form:form>
  </h2>
  </div>
</body>
</html >