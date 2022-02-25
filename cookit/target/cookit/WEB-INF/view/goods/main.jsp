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
    <link rel="stylesheet" href="/res/css/main.css">
    <!--다음 주소 api-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
    <section style="position: relative">
        <!-- 슬라이더 -->
        <section class="slideWrap">
            <ul class="slide">
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute black">
                                <p class="slideF white backBlack">이벤트 오픈</p>
                                <p class="slideS">cookit<br>thanksfestival</p>
                                <p class="slideT">2021년 마지막 혜택!</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute black">
                                <p class="slideF white backBlack">신메뉴 오픈</p>
                                <p class="slideS">분위기를 한껏 살리는<br>와인페어링요리</p>
                                <p class="slideT">특별한 요리로 완성되는 나만의 와인바</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute black">
                                <p class="slideF white backBlack">웹매거진 오픈</p>
                                <p class="slideS">우리집 식탁이<br>빛나는 순간</p>
                                <p class="slideT">쿡킷이 발행하는 웹 매거진 vol.11</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute white">
                                <p class="slideF black backWhite">기획전 오픈</p>
                                <p class="slideS">추운겨울 떠나는,<br>로맨틱한 캠핑메뉴</p>
                                <p class="slideT">캠핑의 감성은 따듯하고 맛있는 쿡킷으로 완성!</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute black" >
                                <p class="slideF white backBlack">이벤트 오픈</p>
                                <p class="slideS">요린이도 걱정no<br>난이도 '下'메뉴!</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute white">
                                <p class="slideF black backWhite">기획전 오픈</p>
                                <p class="slideS">아이들이 좋아하는<br>패밀리 쿡스토랑</p>
                                <p class="slideT">방학이 시작된 요즘, 아이들과 함께 준비해 보세요!</p>
                            </a>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute white">
                                <p class="slideF black backWhite">베스트 메뉴</p>
                                <p class="slideS"><span>근사한 전골요리</span><br>평양식 어복쟁반</p>
                                <div class="slideI">
                                    <p>3인분</p>
                                    <p>조리 30분</p>
                                </div>
                            </a>
                            <div class="po_absolute white slideP">
                                <p><span>34,800</span>원</p>
                                <a href="#"><span class="hide">장바구니</span></a>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div>
                        <div class="w1200">
                            <a href="" class="po_absolute white">
                                <p class="slideF black backWhite">베스트 메뉴</p>
                                <p class="slideS"><span>오리지널의 맛</span><br>부채살 찹스테이크</p>
                                <div class="slideI">
                                    <p>2인분</p>
                                    <p>조리 10분</p>
                                </div>
                            </a>
                            <div class="po_absolute white slideP">
                                <p><span>20,800</span>원</p>
                                <a href="#"><span class="hide">장바구니</span></a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>

            <div class="btnLR po_absolute">
                <!-- 좌우버튼 -->
                <ul class="w1200">
                    <li class="left po_absolute"><a><span class="hide">좌</span></a></li>
                    <li class="right po_absolute"><a href=""></a></li>
                </ul>
            </div>
            <!--            <div class="btnStop po_absolute">-->
            <!--                &lt;!&ndash; 슬라이더 정지 &ndash;&gt;-->
            <!--                <div class="w1200">-->
            <!--                    <div>-->
            <!--                        <span class="slideNum"><span>1</span>&#47;<span>8</span></span>-->
            <!--                        <a href=""><span class="hide">정지</span></a>-->
            <!--                    </div>-->
            <!--                </div>-->
            <!--            </div>-->

        </section>
        <!-- 배송정보 -->
        <section class="w1200 section2">
            <!-- 배송 정보 -->
            <article>
                <!--TODO JS 로 배송지 검색 넣기-->
                <p>우리집도 cookit 배송이 되나요?</p>
                <p>배송이 가능한지 알려드려요.</p>
                <p>배송지 검색</p>
            </article>
            <!-- 남은시간 -->
            <article>
                <!--TODO JS 로 시간 계산 넣기-->
                <p><span class="date"></span>까지 받을 수 있어요</p>
                <p>오전 7시까지 주문하면 다음날 배송됩니다.</p>
                <p>남은시간 <span class="date_time">00:00:00</span></p>
            </article>
        </section>
        <!-- 추천 메뉴 -->
        <section class="w1200 section3">
            <div>
                <!-- iconB or iconT -->
                <ul class="category_list over_hidden iconB">
                    <li data-category="1" data-defaultimage="52">매콤한맛</li>
                    <li data-category="2" data-defaultimage="52">짭짤한맛</li>
                    <li data-category="3" data-defaultimage="52">새콤한맛</li>
                    <li data-category="4" data-defaultimage="52">담백한맛</li>
                    <li data-category="5" data-defaultimage="52">이국적인맛</li>
                    <li data-category="6" data-defaultimage="52">얼큰한맛</li>
                    <li data-category="7" data-defaultimage="52">시원한맛</li>
                </ul>
                <div>
                    <h2>메뉴를<br>확인해보세요</h2>
                    <ul>
                        <li><a class="bestleft"><span class="hide">좌</span></a></li>
                        <li><a href="" class="bestright"><span class="hide">우</span></a></li>
                    </ul>
                </div>
            </div>
            <!-- 매콤한맛 -->
            <!--            <article>-->
            <!--                <ul class="menuSlideList">-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210901132409761.png" alt="눈꽃치즈닭갈비">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href="">눈꽃치즈닭갈비</a></p>-->
            <!--                            <p>-->
            <!--                                <span>26,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211117164803796.png" alt="스파이시 토마토짬뽕파스타">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href="">스파이시 토마토짬뽕파스타</a></p>-->
            <!--                            <p>-->
            <!--                                <span>22,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                        -->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210106134418272.png" alt="고등어조림">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href="">고등어조림</a></p>-->
            <!--                            <p>-->
            <!--                                <span>19,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20201202195714486.png" alt="매운 불족발">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href="">매운 불족발</a></p>-->
            <!--                            <p>-->
            <!--                                <span>24,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210729173705888.png" alt="대전식 두부두루치기">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href="">대전식 두부두루치기</a></p>-->
            <!--                            <p>-->
            <!--                                <span>19,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 짭짤한맛 -->
            <!--            <article class="hide">-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210202111906736.png" alt="부채살 찹스테이크">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 부채살 찹스테이크</p>-->
            <!--                            <p>-->
            <!--                                <span>20,800원</span>&#47;<span>2인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210825085507178.png" alt="버섯소불고기">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 버섯소불고기</p>-->
            <!--                            <p>-->
            <!--                                <span>25,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210120092826185.png" alt="소고기버섯듬뿍잡채">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 소고기버섯듬뿍잡채</p>-->
            <!--                            <p>-->
            <!--                                <span>28,800원</span>&#47;<span>4인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>    -->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211202092629978.png" alt="토마토해산물스튜">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 토마토해산물스튜</p>-->
            <!--                            <p>-->
            <!--                                <span>36,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 새콤한맛 -->
            <!--            <article class="hide">-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210923143117315.png" alt="토마토비프스튜">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 토마토비프스튜</p>-->
            <!--                            <p>-->
            <!--                                <span>24,800원</span>&#47;<span>2인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211206142339970.png" alt="라코타치즈 콜드파스타">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 라코타치즈 콜드파스타</p>-->
            <!--                            <p>-->
            <!--                                <span>28,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 담백한맛 -->
            <!--            <article class="hide">-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20200618141509433.png" alt="닭한마리와 칼국수">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 닭한마리와 칼국수</p>-->
            <!--                            <p>-->
            <!--                                <span>23,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>    -->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20200416114835278.png" alt="평양식 어복쟁반">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 평양식 어복쟁반</p>-->
            <!--                            <p>-->
            <!--                                <span>34,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211118165400917.png" alt="수삼양지수육전골">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 수삼양지수육전골</p>-->
            <!--                            <p>-->
            <!--                                <span>36,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211202090437947.png" alt="굴감바스 알아히요">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 굴감바스 알아히요</p>-->
            <!--                            <p>-->
            <!--                                <span>26,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>    -->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210727181551921.png" alt="쉬림프&베이컨 또띠아피자">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 쉬림프&베이컨 또띠아피자</p>-->
            <!--                            <p>-->
            <!--                                <span>24,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 이국적인맛 -->
            <!--            <article>-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20210318090508232.png" alt="감바스알아히요">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 감바스알아히요</p>-->
            <!--                            <p>-->
            <!--                                <span>20,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20200128171747960.png" alt="쿵팟퐁커리">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 쿵팟퐁커리</p>-->
            <!--                            <p>-->
            <!--                                <span>23,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211201101809859.png" alt="수비드치킨 브루스케타">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 수비드치킨 브루스케타</p>-->
            <!--                            <p>-->
            <!--                                <span>26,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20201202181334897.png" alt="수비드 닭가슴살스테이크와 크림 리조또">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 수비드 닭가슴살스테이크와 크림 리조또</p>-->
            <!--                            <p>-->
            <!--                                <span>26,800원</span>&#47;<span>2인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 얼큰한맛 -->
            <!--            <article class="hide">-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211118163635929.png" alt="얼큰시원 알곤이전골">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 얼큰시원 알곤이전골</p>-->
            <!--                            <p>-->
            <!--                                <span>29,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <!-- 시원한맛 -->
            <!--            <article class="hide">-->
            <!--                <ul>-->
            <!--                    <li>-->
            <!--                        <a href="">-->
            <!--                            <img src="/res/img/main/product/520/20211111084520036.png" alt="콩나물밥과 황태해장국">-->
            <!--                        </a>-->
            <!--                        <div>-->
            <!--                            <p><a href=""></a> 콩나물밥과 황태해장국</p>-->
            <!--                            <p>-->
            <!--                                <span>23,800원</span>&#47;<span>3인분</span>-->
            <!--                                <a href=""><span class="hide">장바구니</span></a>-->
            <!--                            </p>-->
            <!--                        </div>-->
            <!--                    </li>-->
            <!--                </ul>-->
            <!--            </article>-->
            <script src="/res/js/mainmenu.js"></script>

        </section>
        <!-- 광고/이벤트 -->
        <aside class="aside over_hidden">
            <ul class="adslide">
                <li data-adchoose="0"><a href=""><img src="/res/img/main/ad/20211203164840711.jpg" alt=""></a></li>
                <li data-adchoose="1"><a href=""><img src="/res/img/main/ad/20211130170934313.jpg" alt=""></a></li>
                <li data-adchoose="2"><a href=""><img src="/res/img/main/ad/20210930114221992.jpg" alt=""></a></li>
            </ul>
            <div>
                <ul>
                    <li class="adleft"><a href=""><span class="hide">좌</span></a></li>
                    <li class="adchooseWarp">
                        <div class="adchoose"><a href="" ><span class="hide">1</span></a></div>
                        <div><a href=""><span class="hide">2</span></a></div>
                        <div><a href=""><span class="hide">3</span></a></div>
                    </li>
                    <li class="adright"><a href=""><span class="hide">우</span></a></li>
                </ul>
            </div>
        </aside>
        <!-- 베스트 상품 -->
        <section class="w1200 section4">
            <!--TODO 결제 정보를 이용하여, JS로 리스트 뿌리기-->
            <h2>실시간 베스트</h2>
            <article>
                <div>
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20211118163536348.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>얼큰시원 알곤이전골</p>
                            <p><span>29,800원</span> <span class="a">&#47;3인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
                <div>
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20210202111114206.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>부채살 찹스테이크</p>
                            <p><span>20,800원</span> <span class="a">&#47;2인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
                <div>
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20200605150334686.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>닭한마리와 칼국수</p>
                            <p><span>23,800원</span> <span class="a">&#47;3인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
                <div class="marginTop80">
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20211118165235037.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>수삼양지수육전골</p>
                            <p><span>36,800원</span> <span class="a">&#47;3인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
                <div class="marginTop80">
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20200325091356859.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>평양식 어복쟁반</p>
                            <p><span>34,800원</span> <span class="a">&#47;3인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
                <div class="marginTop80">
                    <!-- 이미지 -->
                    <div><a href=""><img src="/res/img/main/best/20211202092529030.jpg" alt=""></a></div>
                    <!-- 제품정보 -->
                    <div>
                        <a href="">
                            <p>토마토해산물스튜</p>
                            <p><span>36,800원</span> <span class="a">&#47;3인분</span></p>
                        </a>
                        <a href=""><span class="hide">장바구니</span></a>
                    </div>
                </div>
            </article>
        </section>
        <!-- 월간 소식 -->
        <section class="w1200 section5">
            <div>
                <h2>월간 쿡킷패밀리</h2>
                <p>쿡킷이 발행하는 웹 메거진, 열 한번째 이야기</p>
                <div>더보기</div>
            </div>
            <div>
                <a href="">
                    <img src="/res/img/main/etc/img_magazine2021_11.jpg" alt="">
                    <div>
                        <p><span>vol.11</span> 우리집 식탁이 빛나는 순간</p>
                        <p>차분한 색갑의 쿡킷 패키지 박스 포장과<br>잘 정돈되어 있는 식재료들은 키친 어디에 두어도<br>포인트 만점!</p>
                        <p>웹 매거진 내 추천 메뉴 <span>5% 중복 쿠폰</span> 증정</p>
                        <div>
                            <div>
                                <img src="/res/img/main/etc/thumb_magazine202111_01.jpg" alt="">
                                <p>랜선시식 #21</p>
                                <p>우리집 인테리어를 하나씩 소개하는 인테리어 리뷰어 조소현님</p>
                            </div>
                            <div>
                                <img src="/res/img/main/etc/thumb_magazine202111_02.jpg" alt="">
                                <p>랜선시식 #22</p>
                                <p>집 꾸미는게 유일한 힐링, 라이프스타일 블로거<br>유희진님</p>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </section>
        <!-- 리뷰 -->
        <section class="w1200 section6 hide">
            <h2>생생한 리뷰</h2>
            <div>
                <ul>
                    <li>
                        <a href="">
                            <p>제품명~~</p>
                            <p>너무 맛있어요~~ 쿡킷 다 맛있지만 이거 정말 손에 뽑을 정도입니다</p>
                            <div>별점 ----</div>
                            <p>작성자~</p>
                        </a>
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>

                <div>
                    <ul>
                        <li><a href="">좌</a></li>
                        <li><span>1</span>&#47;<span>5</span></li>
                        <li><a href="">우</a></li>
                    </ul>
                </div>
            </div>
            <ul>
                <li><img src="/res/img/main/rev/b41bd217-c76f-4f5d-a5d4-3b684c6b89f5_20211206200307_thum.jpeg" alt=""></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </section>
        <!-- 메뉴(?) -->
        <section class="w1200 section7">
            <article class="article7_1">
                <img src="/res/img/main/etc/20190626103903989.jpg" alt="">
                <div>
                    <p class="p7_1">쿡킷 메뉴보기<br>premium mealkit</p>
                    <p class="p7_2">장보기,재료손질,레시피검색<span> 번거로움 out!</span></p>
                    <p class="p7_3">초간편함은 물론,완벽한 맛 쿡킷이 다~ 했네</p>
                </div>
                <div class="bottom_menu_list"></div>
                <!--                <dl>-->
                <!--                    <dt>-->
                <!--                        <img src="/res/img/main/product/132/20211206142339970.png" alt="리코타치즈 콜드파스타">-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--&lt;!&ndash;                        <a href="">&ndash;&gt;-->
                <!--                            <p>aaa</p>-->
                <!--                            <p>ssss<span>원</span></p>-->
                <!--&lt;!&ndash;                        </a>&ndash;&gt;-->
                <!--                        <a></a>-->
                <!--                    </dd>-->
                <!--                </dl>-->
                <!--                <dl>-->
                <!--                    <dt>-->
                <!--                        <a href=""><img src="/res/img/main/product/132/20211206153212795.png" alt="알리고치즈감자 부채살스테이크"></a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>알리고치즈감자 부채살스테이크</p>-->
                <!--                            <p><span>27,800원</span>&#47;<span class="a">2인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href=""><img src="/res/img/main/product/132/20210607131352880.png" alt="스파이시 보일링랍스터&#38;쉬림프"></a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>스파이시 보일링랍스터&#38;쉬림프</p>-->
                <!--                            <p><span>55,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20201202181334897.png" alt="수비드 닭가슴살스테이크와 크림리조또">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>수비드 닭가슴살스테이크와 크림리조또</p>-->
                <!--                            <p><span>26,800원</span>&#47;<span class="a">2인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211202090437947.png" alt="굴감바스 알아히요">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>굴감바스 알아히요</p>-->
                <!--                            <p><span>26,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211201101809859.png" alt="수비드치킨 브루스케타">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>수비드치킨 브루스케타</p>-->
                <!--                            <p><span>26,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211201103504403.png" alt="고등어파스타">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>고등어파스타</p>-->
                <!--                            <p><span>21,800원</span>&#47;<span class="a">2인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211202092629978.png" alt="토마토해산물스튜">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>토마토해산물스튜</p>-->
                <!--                            <p><span>36,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211118163635929.png" alt="얼큰시원 알곤이전골">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>얼큰시원 알곤이전골</p>-->
                <!--                            <p><span>29,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211118165400917.png" alt="수삼양지수육전골">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>수삼양지수육전골</p>-->
                <!--                            <p><span>36,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20211117164803796.png" alt="스파이시 토마토짬뽕파스타">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>스파이시 토마토짬뽕파스타</p>-->
                <!--                            <p><span>22,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20201202195714486.png" alt="매운 불족발">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>매운 불족발</p>-->
                <!--                            <p><span>24,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210901132409761.png" alt="눈꽃치즈닭갈비">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>눈꽃치즈닭갈비</p>-->
                <!--                            <p><span>26,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20200128171747960.png" alt="쿵팟퐁커리">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>쿵팟퐁커리</p>-->
                <!--                            <p><span>23,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210923143117315.png" alt="토마토비프스튜">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--&lt;!&ndash;                        <a href="">&ndash;&gt;-->
                <!--                            <p>토마토비프스튜</p>-->
                <!--                            <p><span>24,800원</span>&#47;<span class="a">2인분</span></p>-->
                <!--&lt;!&ndash;                        </a>&ndash;&gt;-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210825085507178.png" alt="소고기버섯듬뿍잡채">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>소고기버섯듬뿍잡채</p>-->
                <!--                            <p><span>28,800원</span>&#47;<span class="a">4인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210825085507178.png" alt="버섯소불고기">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>버섯소불고기</p>-->
                <!--                            <p><span>25,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210811091630919.png" alt="마라곱창볶음">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>마라곱창볶음</p>-->
                <!--                            <p><span>26,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20200416114835278.png" alt="평양식 어복쟁반">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>평양식 어복쟁반</p>-->
                <!--                            <p><span>34,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210318090508232.png" alt="감바스알아히요">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>감바스알아히요</p>-->
                <!--                            <p><span>20,800</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20200618141509433.png" alt="닭한마리와 칼국수">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>닭한마리와 칼국수</p>-->
                <!--                            <p><span>23,800원</span>&#47;<span class="a">3인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                    <dt>-->
                <!--                        <a href="">-->
                <!--                            <img src="/res/img/main/product/132/20210202111906736.png" alt="부채살 찹스테이크">-->
                <!--                        </a>-->
                <!--                    </dt>-->
                <!--                    <dd>-->
                <!--                        <a href="">-->
                <!--                            <p>부채살 찹스테이크</p>-->
                <!--                            <p><span>20,800원</span>&#47;<span class="a">2인분</span></p>-->
                <!--                        </a>-->
                <!--                        <a href=""><span class="hide">장바구니</span></a>-->
                <!--                    </dd>-->
                <!--                </dl>-->
            </article>
            <article class="article7_2">
                <div>
                    <img src="/res/img/main/etc/20210601155624639.jpg" alt="">
                    <p class="p7_1">coming soon<br>잠시 후 핫딜이 오픈됩니다.</p>
                </div>
                <div>
                    <a href="">
                        <img src="/res/img/main/etc/20211123111937962.jpg" alt="">
                        <p class="p7_1">프리미엄 밀키트<br>cookit을 소개합니다.</p>
                        <p class="p7_2">cookit은 장보기,재료손질,계량 등 복잡한 과정 없이도<br>누구나 간편하게 특별한 집밥을 만들 수 있도록 도와드립니다.</p>
                        <div>자세히 보기</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="/res/img/main/etc/20210422104052761.jpg" alt="">
                        <p class="p7_1">첫 주문이니까<br>1만원 할인 + 무료배송</p>
                        <p class="p7_2">첫 주문 전용 쿠폰으로<br>프리미엄 밀키트를 부담없이 경험하세요.</p>
                        <div>자세히 보기</div>
                    </a>
                </div>
            </article>
        </section>
        <!-- 공지사항 -->
        <section class="notice">
            <div>
                <h2>공지사항</h2>
                <ul class="noticeSlide">
                    <li><a href="">공지사항1</a></li>
                    <li><a href="">공지사항2</a></li>
                    <li><a href="">공지사항3</a></li>
                    <li><a href="">공지사항4</a></li>
                    <li><a href="">공지사항5</a></li>
                </ul>
            </div>
        </section>
        <!-- 빠른이동 메뉴 -->
        <aside class="quickMenu quickMenuNone">
            <a href="">top</a>
        </aside>
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

    <script src="/res/js/main.js"></script>

    <script src="/res/js/comm.js"></script>

</body>
</html>
