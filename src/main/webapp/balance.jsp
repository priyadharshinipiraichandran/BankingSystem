<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        .message {
            background-color: #ffe6e6;
            border: 1px solid #f0adad;
            color: #d9534f;
            padding: 10px;
            margin-top: 20px;
            text-align: center;
        }
        .balance {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 15px;
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .balance p {
            margin: 5px 0;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h2>Account Balance</h2>
    
    <%-- Display balance if available --%>
    <c:if test="${not empty balance}">
        <div class="balance">
            <p>Your current balance is: ${balance}</p>
        </div>
    </c:if>
    
    <%-- Display error message if account not found --%>
   
</body>
</html>
