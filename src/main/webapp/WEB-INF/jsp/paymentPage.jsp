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
   /* Body Styles */
body {
    background-image: url('https://images2.alphacoders.com/997/997526.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    color: #FFFFFF;
    font-family: Arial, sans-serif;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    flex-direction: column;
}

/* Form Container */
.form-container {
    background: rgba(0, 0, 0, 0.8); /* Semi-transparent black */
    border-radius: 10px;
    padding: 20px 30px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    max-width: 500px;
    width: 90%;
    text-align: center;
}

/* Heading */
.form-heading {
    font-size: 1.8em;
    color: #4CAF50;
    margin-bottom: 20px;
    border-bottom: 2px solid #4CAF50;
    display: inline-block;
    padding-bottom: 10px;
}

/* Detail Item */
.detail-item {
    font-size: 0.9em;
    margin-bottom: 10px;
    color: #DDDDDD;
}

.detail-value {
    font-weight: bold;
    color: #FFFFFF;
}

/* Description */
.description {
    font-size: 0.85em;
    margin: 15px 0;
    color: #AAAAAA;
}

.description span {
    color: #4CAF50;
    font-weight: bold;
}

/* Label Styles */
.label {
    display: block;
    font-size: 0.9em;
    margin-bottom: 5px;
    color: #DDDDDD;
    text-align: left;
}

/* Input Styles */
.input {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #555555;
    border-radius: 5px;
    font-size: 0.9em;
    color: #FFFFFF;
    background-color: rgba(255, 255, 255, 0.1);
    box-sizing: border-box;
    outline: none;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.input:focus {
    border-color: #4CAF50;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.4);
}

/* Buttons */
.btn {
    padding: 10px 20px;
    font-size: 0.9em;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
}

.submit-button {
    background-color: #4CAF50;
    color: #ffffff;
}

.submit-button:hover {
    background-color: #45a049;
    box-shadow: 0 4px 8px rgba(76, 175, 80, 0.3);
}

.reset-button {
    background-color: #f44336;
    color: #ffffff;
    margin-left: 10px;
}

.reset-button:hover {
    background-color: #e53935;
    box-shadow: 0 4px 8px rgba(244, 67, 54, 0.3);
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-container {
        padding: 15px 20px;
    }

    .form-heading {
        font-size: '1.5em';
    }

    .btn {
        width: 100%;
        margin-bottom: 10px;
    }

    .reset-button {
        margin-left: 0;
    }
}

</style>
<script>
        function validateForm(event) {
            let isValid = true;
            const amountInput = document.getElementById("amount");
            const paymentRefInput = document.getElementById("paymentRefNo");
            const pendingAmount = parseFloat("${pendingPayment}");
            const errorMessages = document.querySelectorAll(".error-message");

            // Clear previous error messages
            errorMessages.forEach(msg => msg.remove());

            // Validate amount
            const amountValue = amountInput.value.trim();
            const amount = parseFloat(amountValue);

            if (amountValue === "") {
                isValid = false;
                amountInput.classList.add("error");

                const errorMsg = document.createElement("div");
                errorMsg.className = "error-message";
                errorMsg.innerText = "Amount paid cannot be empty.";
                amountInput.insertAdjacentElement("afterend", errorMsg);
            } else if (amount > pendingAmount) {
                isValid = false;
                amountInput.classList.add("error");

                const errorMsg = document.createElement("div");
                errorMsg.className = "error-message";
                errorMsg.innerText = "Amount paid cannot be greater than the pending amount.";
                amountInput.insertAdjacentElement("afterend", errorMsg);
            } else {
                amountInput.classList.remove("error");
            }

            // Validate payment reference number
            if (paymentRefInput.value.trim() === "") {
                isValid = false;
                paymentRefInput.classList.add("error");

                const errorMsg = document.createElement("div");
                errorMsg.className = "error-message";
                errorMsg.innerText = "Payment reference number cannot be empty.";
                paymentRefInput.insertAdjacentElement("afterend", errorMsg);
            } else {
                paymentRefInput.classList.remove("error");
            }

            // Prevent form submission if there are validation errors
            if (!isValid) {
                event.preventDefault();
            }
        }

        // Attach validation to form submission
        document.addEventListener("DOMContentLoaded", function () {
            const paymentForm = document.getElementById("paymentForm");
            paymentForm.addEventListener("submit", validateForm);
        });
    </script>
</head>
<body>
 <div class="form-container" id="payment-form-container">
        <h2 class="form-heading">Make Payment</h2>
        <form:form action="/makePayment" method="post" modelAttribute="transaction">
            <p class="detail-item"><strong>Booking ID:</strong> <span class="detail-value">${transaction.bookingId}</span></p>
            <p class="detail-item"><strong>Total Payment:</strong> <span class="detail-value">${totalPayment}</span></p>
            <p class="detail-item"><strong>Pending Payment:</strong> <span class="detail-value">${pendingPayment}</span></p>
            <p class="description"><strong>Make a payment on <span>carrental@upi</span> using your preferred UPI app and fill the form below!</strong></p>

            <form:hidden path="bookingId"/>
            <form:hidden path="transactionId" />

            <label class="label" for="transactionId">Transaction Id:</label>
            <form:input path="transactionId" id="transactionId" class="input" disabled="true"/>
            <br /><br />

            <label class="label" for="amount">Amount paid:</label>
            <form:input path="amount" id="amount" class="input" placeholder="Enter payment amount"/>
            <br /><br />

            <label class="label" for="paymentRefNo">Payment Reference Number:</label>
            <form:input path="paymentRefNo" id="paymentRefNo" class="input" placeholder="Enter payment reference number" />
            <br /><br />

            <button class="submit-button btn" type="submit">Make Payment</button>
            <button class="reset-button btn" type="reset">Reset</button>
        </form:form>
        <h3 align="center"><a href="/index">Return</a></h3>
    </div>
</body>
</html>