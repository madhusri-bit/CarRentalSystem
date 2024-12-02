<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>
<style>
  /* Body and General Styles */
      body {
        background-image: url('https://images2.alphacoders.com/997/997526.jpg'); /* Replace with the path to your background image */
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: #FFF;
        font-family: Arial, sans-serif;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        flex-direction: column;
    }


  /* Header Styles */
  h1 {
    font-size: 2.5em;
    color: #ffffff;
    margin-top: 20px;
  }

  /* Table Styles */
  table {
    border-collapse: collapse;
    width: 90%;
    background-color: rgba(51, 51, 51, 0.8);
    color: #fff;
    margin: 20px auto;
    border: 2px solid #ff6200;
    box-shadow: 0 0 10px #ff6200;
  }

  th, td {
    padding: 15px;
    text-align: center;
    border: 1px solid #ff6200;
  }

  th {
     color:#ff6200;
    background-color: #00000;
    font-weight: bold;
  }

  /* Link Styles */
  a {
    color: #ffffff;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  /* Button Style */
  .button {
    background-color: #ff6200;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 5px;
  }

  .button:hover {
    background-color: #e55d00;
  }

  /* Center Align Container */
  div[align="center"] {
    text-align: center;
    margin: auto;
    padding: 20px;
  }
</style>
</head>
<body>
  <div align="center">
    <h1 color="#fff"><u>Hello ${customer.username}!!!</u></h1>
    
    
    <table border="4">
      <tr>
        <th>User Name</th>
        <td>${customer.username}</td>
       </tr>
       <tr>
        <th>First Name</th>
        <td>${customer.firstName}</td>
        </tr>
        <tr>
        <th>Last Name</th>
        <td>${customer.lastName}</td>
        </tr>
        <tr>
        <th>Address</th>
        <td>${customer.address}</td>
        </tr>
        <tr>
        <th>Email</th>
        <td>${customer.email}</td>
        </tr>
        <tr>
        <th>Mobile Number</th>
        <td>${customer.mobile}</td>
        </tr>
        <tr>
        <th>License Number</th>
        <td>${customer.license}</td>
        </tr>
        <tr>
        <th>License Expiry Date</th>
        <td>${customer.experiryDate}</td>
        </tr>
        <tr>
        <th>Status</th>
        <td>${customer.status}</td>
        </tr>
        </table>
        <h3><a href="/customerUpdate/${customer.username}">Want to update your details?</a></h3>
        <h3><a href="/index">Return</a></h3>
  </div>
</body>
</html>
