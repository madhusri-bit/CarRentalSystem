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
 <div class="main-container" id="bookingPaymentsMainContainer">
      <h1 class="primary-heading">Booking Payments - Admin</h1>
      <br />
      <div class="table-container">
        <table class="table">
            <tr class="table-header">
                <th>Transaction ID</th>
                <th>Payment Reference No.</th>
                <th>Booking ID</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <c:forEach items="${transactions}" var="transaction">
                <tr class="table-row">
                    <td>${transaction.transactionId}</td>
                    <td>${transaction.paymentRefNo}</td>
                    <td>${transaction.bookingId}</td>
                    <td>₹${transaction.amount}</td>
                    <td>
                        <c:choose>
                            <c:when test="${transaction.approved == null}"><span id = "pending">Pending</span></c:when>
                            <c:when test="${transaction.approved == false}"><span id = "cancelled">Rejected</span></c:when>
                            <c:when test="${transaction.approved == true}"><span id = "confirmed">Approved</span></c:when>
                        </c:choose>
                    </td>
                    <td class="action-cell">
                        <c:choose>
                            <c:when test="${transaction.approved == null}">
                                <a href="/updatePaymentStatus/${transaction.transactionId}/approve" class="action-btn approve-btn">Approve</a>
                                <a href="/updatePaymentStatus/${transaction.transactionId}/reject" class="action-btn reject-btn">Reject</a>
                            </c:when>
                            <c:otherwise>
                                N/A
                            </c:otherwise>
                        </c:choose>
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