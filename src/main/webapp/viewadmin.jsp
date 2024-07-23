<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bankingsystem.model.Transaction" %>
<%@ page import="com.example.bankingsystem.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #dee2e6;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #343a40;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>User Details and Transaction History</h2>
        <h3>User Information:</h3>
        <table>
            <tbody>
                <tr>
                    <th>Full Name</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getFullName() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getPhoneno() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getEmail() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getDob() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getAddress() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Current Balance</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getCurrentBalance() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Account Type</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getAccountType() : "N/A" %></td>
                </tr>
                <tr>
                    <th>Proof</th>
                    <td><%= request.getAttribute("user") != null ? ((User)request.getAttribute("user")).getProof() : "N/A" %></td>
                </tr>
            </tbody>
        </table>

        <h3>Transaction History:</h3>
        <table>
            <thead>
                <tr>
                    <th>Sender Account</th>
                    <th>Receiver Account</th>
                    <th>Amount Transferred</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
                    if (transactions != null && !transactions.isEmpty()) {
                        for (Transaction transaction : transactions) {
                %>
                        <tr>
                            <td><%= transaction.getSenderAccNo() %></td>
                            <td><%= transaction.getReceiverAccNo() %></td>
                            <td><%= transaction.getAmountTransferred() %></td>
                            <td><%= transaction.getDate() %></td>
                            <td><%= transaction.getTime() %></td>
                        </tr>
                <% 
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="5">No transactions found.</td>
                        </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
