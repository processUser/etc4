<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">

<div class="myinfo_view_list">
    <div>
        <h1>관심 리스트</h1>
        <div class="cart_check border_blue">
            <div><label for="chec"><input type="checkbox" name="chec" id="chec">전체선택</label></div>
            <div class="line">선택삭제</div>
        </div>
    </div>
    <div class="cart_list border_blue">
        <ul>
            <li>
                <div><input type="checkbox"></div>
                <div class="cart_list_img">
                    <img src="http://placehold.it/132x132" alt="상품이미지">
                </div>
                <div class="cart_list_gnm">상품명</div>
                <div class="cart_list_pri">19,900</div>
                <div class="cart_list_deli">삭제</div>
            </li>
            <li>
                <div><input type="checkbox"></div>
                <div class="cart_list_img">
                    <img src="http://placehold.it/132x132" alt="상품이미지">
                </div>
                <div class="cart_list_gnm">상품명</div>
                <div class="cart_list_pri">19,900</div>
                <div class="cart_list_deli">삭제</div>
            </li>
        </ul>
    </div>
</div>
