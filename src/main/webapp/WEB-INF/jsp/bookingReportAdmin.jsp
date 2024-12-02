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
    color: #ff6200;
    text-decoration: underline;
    margin-top: 20px;
  }

  h2 {
    font-size: 1.5em;
    color: #ff6200;
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
    background-color: #ff6200;
    font-weight: bold;
  }

  /* Link Styles */
  a {
    color: #ff6200;
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
 <div class="main-container" id="bookingReportMainContainer">
      <h1 class="primary-heading">Booking Report - Admin</h1>
      <br />
      <div class="table-container">
        <table class="table">
            <tr class="table-header">
                <th>Booking ID</th>
                <th>Car Number</th>
                <th>Username</th>
                <th>From Date</th>
                <th>To Date</th>
                <th>Status</th>
                <th>Pending Payment</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${bookings}" var="booking">
                <tr class="table-row">
                    <td>${booking.bookingId}</td>
                    <td>${booking.carNumber}</td>
                    <td>${booking.username}</td>
                    <td>${booking.fromDate}</td>
                    <td>${booking.toDate}</td>
                    <td>
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span id = "confirmed">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span id = "pending">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span id = "cancelled">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span id ="returned">Returned</span></c:when>
                        </c:choose>
                    </td>
                    <td>₹${booking.pendingPayment}</td>
                    <td class="action-cell">
                        <a href="/bookingReport/${booking.bookingId}" class="action-btn details-btn">Details</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
      </div>
      <br />
      <h3><a class="return-link" href="/index">Return</a></h3>
  </div>
</body>
</html>