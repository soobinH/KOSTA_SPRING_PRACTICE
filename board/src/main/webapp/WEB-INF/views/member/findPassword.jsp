<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
  .step-box { margin-bottom: 15px; }
  .hidden { display: none; }
  .msg { font-size: 13px; margin-top: 4px; }
</style>
</head>
<body>
<h2>비밀번호 찾기 / 변경</h2>

  <!-- 1단계: 이메일 입력 및 전송 -->
  <div class="step-box">
    <label>이메일:</label>
    <input type="email" id="email" placeholder="example@naver.com">
    <button type="button" id="btnSend" onclick="sendAuthCode()">인증번호 전송</button>
  </div>

  <!-- 2단계: 인증코드 입력 -->
  <div class="step-box hidden" id="codeArea">
    <label>인증코드:</label>
    <input type="text" id="authCode" maxlength="6" placeholder="6자리 숫자">
    <button type="button" onclick="verifyAuthCode()">인증 확인</button>
  </div>

  <!-- 3단계: 새 비밀번호 입력 -->
  <div class="step-box hidden" id="pwArea">
    <div>
      <label>새 비밀번호:</label>
      <input type="password" id="newPassword" placeholder="새 비밀번호 입력">
    </div>
    <div style="margin-top: 8px;">
      <label>비밀번호 확인:</label>
      <input type="password" id="confirmPassword" placeholder="비밀번호 재입력">
      <button type="button" onclick="changePassword()">비밀번호 변경</button>
    </div>
  </div>

  <script>
    const ctx = "${pageContext.request.contextPath}";

    // 1. 인증번호 메일 발송
    function sendAuthCode() {
      const email = document.getElementById("email").value.trim();
      if (!email) {
        alert("이메일을 입력해 주세요.");
        return;
      }

      const btn = document.getElementById("btnSend");
      btn.disabled = true;
      btn.innerText = "발송 중...";

      fetch(ctx + "/member/sendAuthCode", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "email=" + encodeURIComponent(email)
      })
      .then(res => res.text())
      .then(data => {
        btn.disabled = false;
        btn.innerText = "재전송";

        if (data === "SUCCESS") {
          alert("인증번호가 이메일로 전송되었습니다. (유효시간: 5분)");
          document.getElementById("codeArea").classList.remove("hidden");
        } else {
          alert("메일 발송에 실패했습니다. 이메일 주소를 다시 확인해 주세요.");
        }
      })
      .catch(err => {
        btn.disabled = false;
        btn.innerText = "인증번호 전송";
        alert("서버 통신 중 오류가 발생했습니다.");
      });
    }

    // 2. 인증번호 검증
    function verifyAuthCode() {
      const code = document.getElementById("authCode").value.trim();
      if (!code) {
        alert("인증번호를 입력해 주세요.");
        return;
      }

      fetch(ctx + "/member/verifyAuthCode", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "inputCode=" + encodeURIComponent(code)
      })
      .then(res => res.text())
      .then(data => {
        if (data === "MATCH") {
          alert("인증이 완료되었습니다. 새 비밀번호를 설정해 주세요.");
          document.getElementById("pwArea").classList.remove("hidden");
          document.getElementById("email").readOnly = true;
          document.getElementById("authCode").readOnly = true;
        } else if (data === "EXPIRED") {
          alert("인증 유효시간이 지났습니다. 인증번호를 다시 받아주세요.");
        } else {
          alert("인증코드가 일치하지 않습니다.");
        }
      });
    }

    // 3. 새 비밀번호 저장
    function changePassword() {
      const pw1 = document.getElementById("newPassword").value;
      const pw2 = document.getElementById("confirmPassword").value;

      if (!pw1 || !pw2) {
        alert("비밀번호를 입력해 주세요.");
        return;
      }
      if (pw1 !== pw2) {
        alert("새 비밀번호가 서로 일치하지 않습니다.");
        return;
      }

      fetch(ctx + "/member/resetPassword", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "newPassword=" + encodeURIComponent(pw1)
      })
      .then(res => res.text())
      .then(data => {
        if (data === "SUCCESS") {
          alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해 주세요.");
          location.href = ctx + "/member/login";
        } else if (data === "UNAUTHORIZED") {
          alert("인증 유효시간이 만료되었거나 비정상적인 접근입니다.");
          location.reload();
        } else {
          alert("비밀번호 변경에 실패했습니다.");
        }
      });
    }
  </script>
</body>
</html>