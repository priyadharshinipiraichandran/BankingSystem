<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        td {
            background-color: #fff;
        }
        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h2>Account Details</h2>
    <table>
        <tr>
            <th>Account Number</th>
            <td><%= request.getAttribute("accountno") %></td>
        </tr>
        <tr>
            <th>Full Name</th>
            <td><%= request.getAttribute("fullname") %></td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td><%= request.getAttribute("phno") %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= request.getAttribute("email") %></td>
        </tr>
        <tr>
            <th>Date of Birth</th>
            <td><%= request.getAttribute("dob") %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= request.getAttribute("address") %></td>
        </tr>
        <tr>
            <th>Proof</th>
            <td><%= request.getAttribute("proof") %></td>
        </tr>
        <tr>
            <th>Current Balance</th>
            <td><%= request.getAttribute("current_balance") %></td>
        </tr>
        <tr>
            <th>Account Type</th>
            <td><%= request.getAttribute("acc_type") %></td>
        </tr>
    </table>
</body>
</html>
