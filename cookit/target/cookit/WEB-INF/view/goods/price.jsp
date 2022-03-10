<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결재하자</title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/header.css">
    <link rel="stylesheet" href="/res/css/price.css">
    <link rel="stylesheet" href="/res/css/footer.css">

    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
    <div class="warp">
        <header class="price_header margin_t20 margin_b20">
            <h1>결제 정보</h1>
        </header>
        <div class="goods_warp border_grey padding_10"></div>
        <div class="clear_both align_right border_grey padding_r20 margin_t20 margin_b20"><span>배송비 </span><span class="price"></span></div>

        <div class="price_category_list">
            <div>기본배송지</div>
            <div class="line">신규배송지</div>
            <div class="line">배송지목록</div>
        </div>
        <div class="price_warp"></div>

        <div class="pay_warp"></div>
    </div>


    <script src="/res/js/comm.js"></script>
    <script src="/res/js/price.js"></script>
</body>
</html>
