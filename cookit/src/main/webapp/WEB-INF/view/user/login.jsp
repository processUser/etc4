<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">

    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

    <script src="/res/js/login.js"></script>

    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/header.css">
    <link rel="stylesheet" href="/res/css/footer.css">
    <link rel="stylesheet" href="/res/css/login.css">
</head>
<body>
    <!-- <a href="https://www.cjcookit.com/pc/main">https://www.cjcookit.com/pc/main</a> -->
    <!-- 헤더 -->
    <header class="header">
        <!-- 회원 -->
        <!-- TODO 로그인시 회원가입, 로그인 안보이게 -->
        <nav class="gnb">
            <ul>
                <li><a href="/agreeJoin">회원가입</a></li>
                <li><a href="/login" class="line">로그인</a></li>
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

    <!-- 내용 -->
    <section id="sectionLogin">
        <h2>로그인</h2>
        <form id="formWarp">
            <div class="loginfrm1">
                <input type="text" name="email" placeholder="email">
                <input type="password" name="upw" placeholder="비밀번호">
            </div>
            <div class="loginfrm2">
                <label for="uid"><input type="checkbox" id="uid">아이디 저장</label>
                <span>
                        <a href="">아이디 / 비밀번호 찾기</a>
                        <a href="/agreeJoin.html">회원가입</a>
                    </span>
            </div>
            <div class="loginfrm3">
                <input type="button" id="submit" value="로그인">
            </div>
        </form>
        <!-- <div>소셜 로그인 추가 예정</div> -->
        <div id="naver_id_login" class="snslogin1"></div>
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
            <!--            <a href="" class="micon iconB">cj그룹계열사 바로가기</a>-->
            <a href="/cs">고객행복센터</a>
        </div>
        <!-- cj그룹계열사 -->
        <div class="cjGroup hide">
            <ul>
                <li>
                    cj그룹
                    <ul>
                        <li><a href="">cj주식회사</a></li>
                    </ul>
                </li>
                <li>
                    식품&#47;식품서비스
                    <ul>
                        <li><a href="">cj제일제당</a></li>
                        <li><a href="">cj프레시웨이</a></li>
                        <li><a href="">cj푸드빌</a></li>
                        <li><a href="">cj엠디원</a></li>
                    </ul>
                </li>
                <li>
                    생명공학
                    <ul>
                        <li><a href="">cj제일제당bio사업부문</a></li>
                    </ul>
                </li>
                <li>
                    신유통
                    <ul>
                        <li><a href="">cjenm커머스부문</a></li>
                        <li><a href="">cj대한통운</a></li>
                        <li><a href="">cj텔레닉스</a></li>
                        <li><a href="">cj올리브영</a></li>
                    </ul>
                </li>
                <li>
                    엔터테이먼트&#47;미디어
                    <ul>
                        <li><a href="">cjenm엔터테이먼트부문</a></li>
                        <li><a href="">cjcgv</a></li>
                    </ul>
                </li>
                <li>
                    인프라
                    <ul>
                        <li><a href="">cj대한통운 건설부문</a></li>
                        <li><a href="">cj올리브네트웍스</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </footer>


    <!-- 네이버 로그인 버튼 script -->
    <script type="text/javascript">
        var naver_id_login = new naver_id_login("k8cnRfEmk36R8WL53bbW", "http://127.0.0.1:5500/callback.html");
        var state = naver_id_login.getUniqState();
        naver_id_login.setButton("green", 3, 45);
        naver_id_login.setDomain(".127.0.0.1:5500");
        naver_id_login.setState(state);
        naver_id_login.setPopup();
        naver_id_login.init_naver_id_login();
    </script>
</body>
</html>
