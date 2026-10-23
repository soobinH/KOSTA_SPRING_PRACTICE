<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import = "com.kosta.bank.dto.Account" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	List<Account> accs = (List<Account>)request.getAttribute("accs");
%>
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
            width: 600px;
        }
        .row {
            height: 40px;
            border-top: 1px solid;
            border-bottom: 1px solid;
        }
        .title {
            font-weight: bold;
            background-color: lightgray;
        }
        .column {
            width:98px;
            height: 100%;
            float: left;
            line-height: 40px;
            text-align: center;
            border-right: 1px solid;
            border-left: 1px solid;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
    <script>
        /* var accs = [
            {id:'1001',name:'홍길동',balance:100000,type:'일반',grade:''},
            {id:'1002',name:'김길동',balance:200000,type:'특수',grade:'VIP'},
            {id:'1003',name:'고길동',balance:300000,type:'특수',grade:'Gold'},
            {id:'1004',name:'송길동',balance:400000,type:'특수',grade:'Silver'},
            {id:'1005',name:'하길동',balance:500000,type:'특수',grade:'Normal'},
        ]
        $(function() {
            accs.forEach(function(item,index) {
                let row = $("<div></div>").addClass('row');
                // $(`<div class='column'>${index}</div>`).appendTo(row);
                $("<div></div>").addClass('column').text(index).appendTo(row);
                $("<div></div>").addClass('column').text(item.id).appendTo(row);
                $("<div></div>").addClass('column').text(item.name).appendTo(row);
                $("<div></div>").addClass('column').text(item.balance).appendTo(row);
                $("<div></div>").addClass('column').text(item.type).appendTo(row);
                $("<div></div>").addClass('column').text(item.grade).appendTo(row);
                $('#container').append(row);
            })
        }) */
        // window.onload = function() {
        //     var container = document.getElementById("container");
        //     var elemStr = "";
        //     accs.forEach((item,index)=>
        //         elemStr+=`<div class='row'>
        //                   <div class="column">${index}</div>
        //                   <div class="column">${item.id}</div>
        //                   <div class="column">${item.name}</div>
        //                   <div class="column">${item.balance}</div>
        //                   <div class="column">${item.type}</div>
        //                   <div class="column">${item.grade}</div>
        //                   </div>`)
        //     container.innerHTML += elemStr;
        // }
    </script>
</head>
<body>
	<%@ include file="header.jsp" %>
    <%-- <form action="">
        <div class="header"><h3>전체계좌조회</h3></div>
        <div class="container" id="container">
            <div class="row">
                <div class="title column">순서</div>
                <div class="title column">계좌번호</div>
                <div class="title column">이름</div>
                <div class="title column">입금액</div>
                <div class="title column">종류</div>
                <div class="title column">등급</div>
            </div>
            
            <% for(int i = 0; i<accs.size(); i++) { %>
            <div class="row">
            	<div class="column"><%=i+1 %></div>
                <div class="column"><%=accs.get(i).getId() %></div>
                <div class="column"><%=accs.get(i).getName() %></div>
                <div class="column"><%=accs.get(i).getBalance() %></div>
                <div class="column"><%=accs.get(i).getType() %></div>
                <div class="column"><%=accs.get(i).getGrade() %></div>
            	</div>
                <%}
            	
            %>
            
            
        </div>

    </form> --%>
    
    <form action="">
    	<div class="header"><h3>전체계좌조회</h3></div>
    	<div class="container" id="container">
    		<div class="row">
    			<div class="title column">순서</div>
                <div class="title column">계좌번호</div>
                <div class="title column">이름</div>
                <div class="title column">입금액</div>
                <div class="title column">종류</div>
                <div class="title column">등급</div>
    		</div>
    		
    		<c:forEach items="${requestScope.accs }" var="acc" varStatus="status">
    			<div class="row">
    			<div class="column">${status.index+1 }</div>
    			<div class="column">${acc.id }</div>
    			<div class="column">${acc.name }</div>
    			<div class="column">${acc.balance }</div>
    			<div class="column">${acc.type }</div>
    			<div class="column">${acc.grade }</div>
    			</div>
    		</c:forEach>
    	</div>
    	
    </form>
    
</body>
</html>