<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">

<div class="myinfo_view_list">
    <div>
        <h1>회원정보수정</h1>
        <div class="cart_check border_blue">
            <div class="myclick">기본정보</div>
            <div class="">배송지</div>
        </div>
    </div>
    <div class="cart_list ">
        <div>
            <span>이메일</span><input type="email" class="email" name="email" readonly>
        </div>
        <div>
            <span>이름</span><input type="text" class="nm" name="nm">
        </div>
        <div>
            <span>성별</span>
            <select name="gender" class="gender">
                <option value="3">선택안함</option>
                <option value="1">남자</option>
                <option value="2">여자</option>
            </select>
        </div>
        <div class="birth">
            <span>생일</span>
            <input type="text" class="birthdaymm" name="birthdaymm">
            <input type="text" class="birthdaydd" name="birthdaydd">
        </div>
        <div class="info_button">정보수정</div>
    </div>

    <div class="cart_list display_none">
        <div class="addrWarp">
            <div class="addrsearch">
                <span>주소</span>
                <input type="text" class="addr" name="addr">
                <input type="text" class="detailedaddr" name="detailedaddr" placeholder="상세주소">
            </div>
            <div>
                <span>연락처</span><input type="text" class="addrtel" name="addrtel">
            </div>
            <div>
                <span>이름</span><input type="text" class="addrnm" name="addrnm">
            </div>
            <div class="deladdr">삭제</div>
        </div>
    </div>

</div>
