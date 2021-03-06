<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COOKIT</title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/header.css">
    <link rel="stylesheet" href="/res/css/footer.css">
    <link rel="stylesheet" href="/res/css/review.css">
</head>
<body>
    <!-- <a href="https://www.cjcookit.com/pc/main">https://www.cjcookit.com/pc/main</a> -->
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

    <!-- 내용 -->
    <section class="section">
        <h2>review</h2>
        <article class="over_hidden">
            <!--TODO 결제 많은 순서로 리뷰 리스트 뿌리자.... -->
            <h3>best 리뷰</h3>
            <div class="best_review_list ">
                <div>
                    <img src="http://placehold.it/240x260" alt="">
                    <p>상품명</p>
                    <div><span>작성자</span><span>평점</span></div>
                    <p>내용</p>
                </div>
                <div>
                    <img src="http://placehold.it/240x260" alt="">
                    <p>상품명</p>
                    <div><span>작성자</span><span>평점</span></div>
                    <p>내용</p>
                </div>
                <div>
                    <img src="http://placehold.it/240x260" alt="">
                    <p>상품명</p>
                    <div><span>작성자</span><span>평점</span></div>
                    <p>내용</p>
                </div>
                <div>
                    <img src="http://placehold.it/240x260" alt="">
                    <p>상품명</p>
                    <div><span>작성자</span><span>평점</span></div>
                    <p>내용</p>
                </div><div>
                <img src="http://placehold.it/240x260" alt="">
                <p>상품명</p>
                <div><span>작성자</span><span>평점</span></div>
                <p>내용</p>
            </div>
                <div>
                    <img src="http://placehold.it/240x260" alt="">
                    <p>상품명</p>
                    <div><span>작성자</span><span>평점</span></div>
                    <p>내용</p>
                </div>

            </div>
        </article>
        <!--<hr>-->
        <!--        <article>-->
        <!--            &lt;!&ndash;TODO 리뷰 db에서 검색&ndash;&gt;-->
        <!--            <div>-->
        <!--                <form action="">-->
        <!--                    <input type="text">-->
        <!--                    <input type="button" value="검색">-->
        <!--                </form>-->
        <!--            </div>-->
        <!--        </article>-->
        <!--<hr>-->
        <article class="review_list_wrap">
            <h3>전체 리뷰</h3>
            <div>

                <!--TODO 전채 리뷰를 들고오기 -->
                <ul class="review_list">
                    <li>
                        <div>
                            <img src="http://placehold.it/150x170" alt="이미지 자리">
                        </div>
                        <div>
                            <div>
                                <p>작성자</p>
                                <p>상품 평점</p>
                                <p>작성일시</p>
                            </div>
                            <div>
                                <p>글내용</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="http://placehold.it/150x170" alt="이미지 자리">
                        </div>
                        <div>
                            <div>
                                <p>작성자</p>
                                <p>상품 평점</p>
                                <p>작성일시</p>
                            </div>
                            <div>
                                <p>글내용</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div>
                            <img src="http://placehold.it/150x170" alt="이미지 자리">
                        </div>
                        <div>
                            <div>
                                <p>작성자</p>
                                <p>상품 평점</p>
                                <p>작성일시</p>
                            </div>
                            <div>
                                <p>글내용</p>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
        </article>

        <article class="pagebutton">
            <div>1</div>
            <div>2</div>
            <div>3</div>
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
    <!-- 빠른이동 메뉴 -->
    <!--    <aside class="quickMenu">-->
    <!--        <a href="">top</a>-->
    <!--    </aside>-->
    <script src="/res/js/review.js"></script>
</body>
</html>
