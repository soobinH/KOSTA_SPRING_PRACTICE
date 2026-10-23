<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <style>
        .header {
            text-align: center;
        }
        .container {
            margin: 0 auto;
            border: 1px solid;
            width: 280px;
            padding: 10px;
        }
        .row {
            height: 30px;
        }
        .title {
            float: left;
            width: 70px;
            text-align: center;
            font-weight: bold;
        }
        .input {
            float:left;
        }
        input[type='submit'] {
            font-weight: bold;
            width: 120px;
            background-color: lightgray;
            display: block;            
            margin: 0 auto;
        }
    </style>
</head>
<body>
	<jsp:include page="header.jsp"/>
    <form action="deposit" method="post">
        <div class="header"><h3>입금</h3></div>
        <div class="container">
            <div class="row">
                <div class="title">계좌번호</div>
                <div class="input"><input type="text" name="id"></div>
            </div>
            <div class="row">
                <div class="title">입금액</div>
                <div class="input"><input type="number" name="money"></div>
            </div>
            <div class="button">
                <input type="submit" value="입금">
            </div>
        </div>

    </form>    
</body>
</html>