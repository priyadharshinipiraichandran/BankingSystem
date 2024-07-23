<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.bankingsystem.model.Transaction" %>
<%@ page import="com.example.bankingsystem.model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
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
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #343a40;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Transaction History</h2>
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
                            <td colspan="5">No transactions available</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <form action="transhist" method="post" onsubmit="return confirm('Are you sure you want to download the last 20 transactions?');">
            <input type="hidden" name="action" value="download">
            <button type="submit" class="btn">Download Last 20 Transactions</button>
        </form>
    </div>
</body>
</html>
