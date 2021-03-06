<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/header.css">
    <link rel="stylesheet" href="/res/css/cart.css">
    <link rel="stylesheet" href="/res/css/footer.css">
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
        <div class="cart_tit">
            <h1>장바구니</h1>
        </div>
        <div class="cart_content">
            <article class="article cart_content1 border_blue">
                <div class="cart_check border_blue">
                    <div><label for="chec"><input type="checkbox" name="chec" id="chec">전체선택</label></div>
                    <div class="line">선택삭제</div>
                </div>
                <div class="cart_list border_blue">
                    <ul class="carts_list">
                        <li>
                            <div><input type="checkbox"></div>
                            <div class="cart_list_img">
                                <img src="http://via.placeholder.com/132x132" alt="상품이미지">
                            </div>
                            <div class="cart_list_gnm">상품명</div>
                            <div class="cart_list_quantity">
                                <span>-</span><span class="cart_list_quant">01</span><span>+</span>
                            </div>
                            <div class="cart_list_pri">19,900</div>
                            <div class="cart_list_deli">삭제</div>
                        </li>
                        <li>
                            <div><input type="checkbox"></div>
                            <div class="cart_list_img">
                                <img src="http://via.placeholder.com/132x132" alt="상품이미지">
                            </div>
                            <div class="cart_list_gnm">상품명</div>
                            <div class="cart_list_quantity">
                                <span>-</span><span class="cart_list_quant">01</span><span>+</span>
                            </div>
                            <div class="cart_list_pri">19,900</div>
                            <div class="cart_list_deli">삭제</div>
                        </li>
                    </ul>
                </div>
            </article>
            <article class="article cart_content2 border_blue">
                <div class="price_infor border_blue">
                    <div class="product_amount">상품금액 <span>19,900</span></div>
                    <div class="delivery_fee">배송비 <span>3,100</span></div>
                    <div class="expected_payment_amount">결제예정금액 <span>23,000</span></div>
                    <div class="make_payment">결제하기</div>
                </div>
            </article>
        </div>

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
            <a href="" class="micon iconB">cj그룹계열사 바로가기</a>
            <a href="">고객행복센터</a>
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
    <script src="/res/js/comm.js"></script>
    <script src="/res/js/cart.js"></script>
</body>
</html>
