<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            text-align: center;
            margin-top: 50px;
        }
        
        #outer {
            width: 600px;
            border: 1px solid black;
            margin: 0 auto;
            padding: 25px 0;
            
        }

        #outer>div {
            margin-bottom: 15px;
        }

        #outer>div:last-child {
            margin-bottom: 0;
        }


        h2 {
            display: inline-block;
            width: 200px;
            text-align: center;
            font-size: 20px;
            margin: 0;
            vertical-align: middle;            
        }
        input {
            width:300px;
            height:22px;
            margin-left: 10px;
            vertical-align: middle;
        }

        button {
            width: 100px;
            height: 30px;
            margin-top: 0;
            margin-left: 40px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file = "header.jsp" %>
<form action="transfer" method="post">
    <h1>계좌 송금</h1>
    <div id="outer">
        <div>
            <h2>보내는계좌번호</h2>
            <input type="text" name="sendID">
        </div>
        <div>
            <h2>받는계좌번호</h2>
            <input type="text" name="receiveID">
        </div>
        <div>
            <h2>송금액</h2>
            <input type="text" name="money">
        </div>
        <br>
        <button>송금</button>
        
    </div>
 </form>   
</body>
</html>