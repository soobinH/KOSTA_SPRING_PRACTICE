<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>

    async function checkDoubleAccId() {

        const accId = document.getElementById('accId');

        if (!accId.value.trim()) {
            alert("계좌번호를 입력하세요");
            return;
        }

        try {
            const response = await fetch("doubleAccId", {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    addId: accId.value
                })
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status:${response.status}`);
            }

            const result = await response.json();

            console.log(result);
            
            if(result.status == 'fail') {
            	alert("계좌번호 중복체크 시 오류가 발생했습니다.");
            	return;
            }
            
            if(result.exist){
            	alert("사용중인 계좌번호입니다.");
            } else {
            	alert("사용 가능한 계좌번호입니다.")
            }

        } catch (error) {
            console.log(error);
        }
    }

    window.onload = function() {

        const doubleId = document.getElementById("doubldId");

        doubleId.onclick = function(e) {

            e.preventDefault();

            checkDoubleAccId();
        }
    }

    </script>
    <style>
        body {
            text-align: center;
            margin-top: 50px;
        }
        
        #form-box {
            width: 400px;
            border: 1px solid black;
            margin: 0 auto;
            padding: 30px 0;
        }

        /* 각 입력 줄을 감싸는 div 스타일 */
        .row {
            margin-bottom: 15px;
            text-align: left;
            padding-left: 45px; /* 박스 안에서 요소들을 가운데로 밀어줌 */
        }
        
        h2 {
            display: inline-block;
            width: 80px; /* 모든 라벨 너비 통일 */
            text-align: center;
            font-size: 20px;
            margin: 0;
            vertical-align: middle;            
        }
        
        /* id 대신 속성 선택자 사용 */
        input[type="text"] {
            width: 200px;
            height: 22px;
            margin-left: 10px;
            vertical-align: middle;
        }

        /* 라디오 버튼과 셀렉트 박스 간격 및 정렬 */
        input[type="radio"], select {
            margin-left: 10px;
            vertical-align: middle;
        }

        select {
            height: 26px;
            width: 100px;
        }

        /* 버튼 영역 스타일 */
        .btn-row {
            text-align: center;
            margin-top: 25px;
        }

        button {
            width: 100px;
            height: 30px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file = "header.jsp" %>
    
    <form action="makeAccount" method="post">
    	<h1>계좌 개설</h1>
	    <div id="form-box">
	        <div class="row">
	            <h2>계좌번호</h2>
	            <input type="text" id="accId" name="id">
	            <div class="input"><button id="doubldId"> 중복</button></div>
	        </div>
	        <div class="row">
	            <h2>이름</h2>
	            <input type="text" name="name">
	        </div>
	        <div class="row">
	            <h2>입금액</h2>
	            <input type="text" name="balance">
	        </div>
	        <div class="row">
	            <h2>종류</h2>
	            <input type="radio" name="type" value="normal" checked> 일반
	            <input type="radio" name="type" value="special"> 특수
	        </div>
	        <div class="row">
	            <h2>등급</h2>
	            <select name="grade">
	                <option id="grade" value="vip">vip</option>
	                <option id="grade" value="gold">gold</option>
	                <option id="grade" value="silver">silver</option>
	                <option id="grade" value="bronze">bronze</option>
	                <option id="grade" value="normal">normal</option>
	            </select>
	        </div>
	        <div class="btn-row">
	            <button>송금</button>
	        </div>
	    </div>
    </form>
    <!-- 폼 하단, </body> 바로 위에 스크립트 추가 -->
    <script>
        const typeRadios = document.querySelectorAll('input[name="type"]');
        const gradeSelect = document.querySelector('select[name="grade"]');

        // 처음 로딩될 때 아무것도 선택되어 있지 않거나 '일반'이 기본값이면 셀렉트 박스 비활성화 처리 (선택사항)
        gradeSelect.disabled = true; 

        typeRadios.forEach(radio => {
            radio.addEventListener('change', function() {
                if (this.value === 'normal') {
                    gradeSelect.disabled = true;  // '일반' 선택 시 비활성화
                } else if (this.value === 'special') {
                    gradeSelect.disabled = false; // '특수' 선택 시 활성화
                }
            });
        });
    </script>
</body>
</html>