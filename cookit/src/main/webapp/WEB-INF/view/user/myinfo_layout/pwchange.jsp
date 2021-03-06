<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">

<div class="myinfo_view_list">
    <div>
        <h1>비밀번호 변경</h1>
    </div>
    <div class="cart_list border_blue">
        <div class="now_pw pw_change"><span>현재 비밀번호</span><input type="password" class="beforepw" name="beforepw"></div>
        <div class="new_pw pw_change"><span>변경 비밀번호</span><input type="password" class="upw" name="upw"></div>
        <div class="check_pw pw_change"><span>비밀번호 확인</span><input type="password" class="chkpw" name="chkpw"></div>
        <div class="info_button change_button">비밀번호 변경</div>
    </div>
</div>

