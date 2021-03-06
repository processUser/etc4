<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MY쿡킷</title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/header.css">
    <link rel="stylesheet" href="/res/css/myinfo.css">
    <link rel="stylesheet" href="/res/css/footer.css">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!--    <script src="/res/js/comm.js"></script>-->
    <script src="/res/js/comm.js"></script>
</head>
<body>
    <!-- 헤더 -->
    <header class="header">
        <!-- 회원 -->
        <!-- TODO 로그인시 회원가입, 로그인 안보이게 -->
        <nav class="gnb">
            <ul>
                <c:if test="${sessionScope.loginUser == null}">
                    <li><a href="/agreeJoin">회원가입</a></li>
                    <li><a href="/login" class="line">로그인</a></li>
                </c:if>
                <c:if test="${sessionScope.loginUser != null}">
                    <li><a href="/my"><c:out value="${sessionScope.loginUser.nm}"></c:out> </a></li>
                    <li><a href="/logout" class="line">로그아웃</a></li>
                </c:if>
                <li><a href="/cs" class="line">고객행복센터</a></li>
            </ul>
        </nav>
        <div class="space-between">
            <!-- 로고 -->
            <div class="logoWrap">
                <a href="/main">
                    <h1 class="logo hide">cookit</h1>
                </a>
            </div>
            <!-- 메뉴 -->
            <nav class="lnb">
                <ul>
                    <li><a href="/menu">cookit메뉴</a></li>
                    <li><a href="/review">리뷰</a></li>
                    <li><a href="/my">my쿡킷</a></li>
                </ul>
            </nav>
            <!-- 장바구니 -->
            <ul class="my_menu">
                <li class="bag"><a href="/cart">장바구니</a></li>
                <li class="found"><a href="">메뉴찾기</a></li>
            </ul>
        </div>
    </header>

    <section class="section w1200">
        <!-- TODO  -->
        <article class="myinfo_category_list border_blue">
            <ul>
                <!--                <li>관심상품</li>-->
                <li>회원정보</li>
                <li>비밀번호변경</li>
                <li>결제내역</li>
                <li>회원탈퇴</li>
            </ul>
        </article>
        <article class="border_blue">
            <div class="myinfo_view_warp">



            </div>
        </article>
    </section>

    <!-- 푸터 -->
    <footer class="footer space-between">
        <!-- 푸터 로고 -->
        <div class="footerLogoWrap">
            <h1 class="footerLogo hide">cookit</h1>
        </div>
        <div class="footerC">
            <ul>
                <li><a href="">이용약관</a></li>
                <li><a href="" class="line">개인정보처리방침</a></li>
                <li><a href="" class="line">법적고지</a></li>
                <li><a href="" class="line">사업자정보확인</a></li>
            </ul>
            <div>
                <p>해당 페이지는 클론코딩으로 제작된 페이지입니다</p>
            </div>
        </div>
        <div class="footerl">
            <a href="">고객행복센터</a>
        </div>
    </footer>
    <script src="/res/js/myinfo.js"></script>
    <script src="/res/js/pwchange.js"></script>
</body>
</html>
