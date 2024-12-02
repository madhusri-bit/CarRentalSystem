<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  /* Body and Background */
  body {
    background-image: url('https://images2.alphacoders.com/997/997526.jpg'); /* Replace with your background image path if any */
    background-size: cover;
    background-attachment: fixed;
    background-position: center;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    color: #fff;
  }
  div[align="center"] {
    width: 800px;
    margin: 100px auto;
    padding: 20px;
    background-color: rgba(51, 51, 51, 0.8);
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(255, 98, 0, 0.7);
    text-align: center;
  }
  h1 {
    font-size: 2em;
    color: #fffff;
    margin-bottom: 20px;
  }

  h2 {
    font-size: 1.2em;
    color: #ff6200;
    margin-bottom: 15px;
  }

  /* Form Styles */
  form {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  /* Input Field Styles */
  form input[type="text"],
  form input[type="number"],
  form input[list] {
    width: 90%;
    padding: 12px;
    margin: 10px 0;
    border: 1px solid #ff6200;
    border-radius: 5px;
    background-color: #333;
    color: #fff;
    font-size: 1em;
    text-align: center;
  }

  /* Button Styles */
  form button {
    width: 45%;
    padding: 10px;
    margin: 10px;
    border: none;
    border-radius: 5px;
    background-color: #ff6200;
    color: #fff;
    font-size: 1em;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  form button[type="reset"] {
    background-color: #333;
    border: 1px solid #ff6200;
  }

  form button:hover {
    background-color: #e55d00;
  }

  form button[type="reset"]:hover {
    background-color: #444;
  }

  /* Label Styling */
  label {
    font-size: 1em;
    color: #ff6200;
    text-align: left;
    margin-bottom: 5px;
  }
   form input[type="date"] {
    width: 90%; /* Match the size of other input fields */
    padding: 12px; /* Same padding for uniformity */
    margin: 10px 0;
    border: 1px solid #ff6200;
    border-radius: 5px;
    background-color: #333;
    color: #fff;
    font-size: 1em;
    text-align: center; /* Align the placeholder text */
  }
</style>
</head>
<body>
<div class="form-container">
        <h2 class="form-heading">New Booking</h2>

        <form:form action="/createBooking" method="post" modelAttribute="carBooking">
            <form:hidden path="bookingId" />
            <form:hidden path="carNumber" />
            <form:hidden path="username" />

            <label class="label" for="bookingId">Booking Id:</label>
            <form:input path="bookingId" id="bookingId" class="input" placeholder="bookingId" disabled="true"/>
            <br /><br />

            <label class="label" for="carNumber">Car Number:</label>
            <form:input path="carNumber" id="carNumber" class="input" placeholder="carNumber" disabled="true"/>
            <br /><br />

            <label class="label" for="username">Username:</label>
            <form:input path="username" id="username" class="input" placeholder="username" disabled="true"/>
            <br /><br />

            <label class="label" for="rentRate">Rent Rate (per day):</label>
            <input type="text" id="rentRate" value="${rentRate}" disabled="true" class="input" />
            <br /><br />

            <label class="label" for="fromDate">Enter fromDate:</label>
            <form:input type="date" placeholder="dd-mm-yyyy" path="fromDate" />
           
            <br /><br />

            <label class="label" for="toDate">Enter toDate:</label>
            <form:input type="date" placeholder="dd-mm-yyyy" path="toDate" />
            
            <br /><br />

            <button class="submit-button btn" type="submit">Proceed to Payment</button>
        </form:form>
    </div>
</body>
</html>