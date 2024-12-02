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
 body {
  background-image: url('https://images2.alphacoders.com/997/997526.jpg');
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  color: #FFF;
  font-family: 'Roboto', Arial, sans-serif;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 20px;
}

h1, h2, h3 {
  font-weight: bold;
  text-transform: uppercase;
  margin-bottom: 10px;
}

h1 {
  font-size: 2.5rem;
  color: #ff6200;
  text-decoration: underline;
}

h2, h3 {
  font-size: 1.8rem;
  color: #ff6200;
}

p {
  font-size: 1rem;
  line-height: 1.6;
}

a {
  color: #ff6200;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
}

/* Container Styles */
.booking-detail-container {
  background-color: rgba(0, 0, 0, 0.8);
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
  max-width: 1000px;
  width: 100%;
}

.section {
  margin-bottom: 30px;
}

.section-heading {
  border-bottom: 2px solid #ff6200;
  padding-bottom: 5px;
  margin-bottom: 15px;
  color: #ff6200;
  font-size: 1.5rem;
}

.detail-item {
  margin: 10px 0;
  font-size: 1.1rem;
  display: flex;
  justify-content: space-between;
}

.detail-value {
  font-weight: bold;
  color: #ffb347;
}

/* Table Styles */
table {
  width: 100%;
  margin-top: 20px;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
  border: 1px solid #ff6200;
}

th {
  background-color: #ff6200;
  color: #fff;
}

td {
  background-color: rgba(51, 51, 51, 0.8);
}

/* Status Labels */
#confirmed {
  color: #4CAF50;
}

#pending {
  color: #FFC107;
}

#cancelled {
  color: #F44336;
}

#returned {
  color: #03A9F4;
}

/* Buttons */
.button {
  background-color: #ff6200;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  font-size: 1rem;
  font-weight: bold;
  cursor: pointer;
  text-transform: uppercase;
  transition: all 0.3s ease-in-out;
}

.button:hover {
  background-color: #e55d00;
  transform: scale(1.05);
}

/* Payment History */
.transaction-item {
  display: flex;
  justify-content: space-between;
  padding: 10px;
  border: 1px solid #ff6200;
  margin: 5px 0;
  background-color: rgba(51, 51, 51, 0.8);
  border-radius: 5px;
}
.action-link:hover {
  background-color: #e55d00;
}
.transaction-id, .transaction-amount, .transaction-status {
  flex: 1;
  text-align: center;
}
tr:nth-child(even) {
  background-color: rgba(255, 255, 255, 0.1);
}
.status {
  font-weight: bold;
  padding: 5px 10px;
  border-radius: 5px;
}

.status.pending {
  background-color: #FFC107;
  color: #000;
}

.status.cancelled {
  background-color: #F44336;
  color: #fff;
}

.status.confirmed {
  background-color: #4CAF50;
  color: #fff;
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
  body {
    padding: 10px;
  }

  h1 {
    font-size: 2rem;
  }

  h2, h3 {
    font-size: 1.5rem;
  }

  p, .detail-item {
    font-size: 0.9rem;
  }

  .booking-detail-container {
    padding: 20px;
  }
  .action-link {
    font-size: 0.9rem;
    padding: 8px 15px;
  }
  .action-links {
  text-align: center;
}

.action-link {
  background-color: #ff6200;
  color: #fff;
  text-decoration: none;
  font-weight: bold;
  padding: 10px 20px;
  border-radius: 5px;
  margin: 5px;
  transition: background-color 0.3s ease;
}
  
}
</style>
<script>
            function handleAction(actionType, isActive, bookingId) {
                if (isActive) {
                    switch (actionType) {
                        case "payDues":
                            window.location.href = `/makePayment/${bookingId}`;
                            break;
                        case "returnBooking":
                            window.location.href = `/returnBooking/${bookingId}`;
                            break;
                        case "cancelBooking":
                            window.location.href = `/cancelBooking/${bookingId}`;
                            break;
                        default:
                            alert("Invalid action.");
                    }
                }
            }
        </script>
</head>
<body>
<div class="booking-detail-container">
        <h3 class="booking-heading">Booking Report</h3>
        <div class="booking-main-container">
            <div class="section booking-details" id="bk-section">
                <h2 class="section-heading">Booking Information:</h2>
                <p class="detail-item" id="bk-detail-item"><strong>Booking ID:</strong> <span class="detail-value">${booking.bookingId}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>Start Date:</strong> <span class="detail-value">${booking.fromDate}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>End Date:</strong> <span class="detail-value">${booking.toDate}</span></p>
                <p class="detail-item" id="bk-detail-item"><strong>Status:</strong>
                    <span class="detail-value">
                        <c:choose>
                            <c:when test="${booking.status == 'CNF'}"><span id = "confirmed">Confirmed</span></c:when>
                            <c:when test="${booking.status == 'P'}"><span id = "pending">Pending</span></c:when>
                            <c:when test="${booking.status == 'C'}"><span id = "cancelled">Cancelled</span></c:when>
                            <c:when test="${booking.status == 'R'}"><span id ="returned">Returned</span></c:when>
                            <c:otherwise>Unknown Status</c:otherwise>
                        </c:choose>
                    </span>
                </p>
            </div>

            <div class="section car-details" id="bk-section">
                <h2 class="section-heading">Car Detail:</h2>
                <p class="detail-item"><strong>Car Number:</strong> <span class="detail-value">${car.carNumber}</span></p>
                <p class="detail-item"><strong>Car Name:</strong> <span class="detail-value">${car.carName}</span></p>
                <p class="detail-item"><strong>Car Color:</strong> <span class="detail-value">${car.carColor}</span></p>
                <p class="detail-item"><strong>Manufacturer:</strong> <span class="detail-value">${car.manufacturer}</span></p>
                <p class="detail-item"><strong>Rent Rate (per day):</strong> <span class="detail-value">₹${car.rentRate}</span></p>
                <p class="detail-item"><strong>Variant Name:</strong> <span class="detail-value">${variant.variantName}</span></p>
                <p class="detail-item"><strong>Number of Seats:</strong> <span class="detail-value">${variant.numberOfSeat}</span></p>
                <p class="detail-item"><strong>Fuel Type:</strong> <span class="detail-value">${variant.fuel}</span></p>
            </div>

            <div class="section payment-info" id="bk-section">
                <h2 class="section-heading">Payment Information:</h2>
                <p class="detail-item" id="bk-detail-item"><strong>Total Payment:</strong> <span class="detail-value">₹${booking.totalPayment}</span></p>
                <p class="detail-item"><strong>Advance Payments:</strong> <span class="detail-value">₹${booking.advancePayment}</span></p>
                <p class="detail-item"><strong>Pending Payments:</strong> <span class="detail-value">₹${booking.pendingPayment}</span></p>
                <h3 class="detail-item payment-history-heading">Payment History:</h3>
                <div id="transaction-list">
                    <c:forEach items="${transactions}" var="transaction">
                        <div class="transaction-item">
                            <p class="transaction-id">${transaction.transactionId}</p>
                            <p class="transaction-amount">₹${transaction.amount}</p>
                            <p class="transaction-status">
                                <c:choose>
                                    <c:when test="${transaction.approved == null}">
                                        <span class="status pending">In Review</span>
                                    </c:when>
                                    <c:when test="${transaction.approved == false}">
                                        <span class="status cancelled">Failed</span>
                                    </c:when>
                                    <c:when test="${transaction.approved == true}">
                                        <span class="status confirmed">Success</span>
                                    </c:when>
                                </c:choose>
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>


        <div align="center" class="section action" id="bk-action">
            <div class="action-links">
                <button
                    class="btn action-link ${booking.pendingPayment > 0 && booking.status != 'C' && booking.status != 'R' ? '' : 'disabled'}"
                    data-tooltip="There is no pending payments."
                    onclick="handleAction('payDues', ${booking.pendingPayment > 0 && booking.status != 'C' && booking.status != 'R'}, '${booking.bookingId}')">
                    Pay dues
                </button>

                <button
                    class="btn action-link ${booking.status == 'CNF' && booking.pendingPayment == 0 ? '' : 'disabled'}"
                    data-tooltip="You can return booking only if there is no pending payment."
                    onclick="handleAction('returnBooking', ${booking.status == 'CNF' && booking.pendingPayment == 0}, '${booking.bookingId}')">
                    Return
                </button>

                <button
                    class="btn action-link ${booking.status == 'P' || (booking.advancePayment == 0 && booking.status != 'C') ? '' : 'disabled'}"
                    data-tooltip="You can cancel booking only if it's Pending or no advance payment has been made."
                    onclick="handleAction('cancelBooking', ${booking.status == 'P' || (booking.advancePayment == 0 && booking.status != 'C')}, '${booking.bookingId}')">
                    Cancel
                </button>
            </div>
        </div>
        <h3 class="detail-item payment-history-heading"><a href="/index">Return to Home</a></h3>
        
    </div>
</body>
</html>