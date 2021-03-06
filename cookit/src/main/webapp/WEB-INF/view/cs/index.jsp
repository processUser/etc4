<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객센터</title>
    <!-- google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- style -->
    <link rel="stylesheet" href="/res/css/common.css">
    <link rel="stylesheet" href="/res/css/cs.css">
</head>
<body>
    <!-- 헤더 -->
    <header id="header">
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
                <li><a href="/main" class="line">cookit home</a></li>
            </ul>
        </nav>
        <div class="csTitle">
            <h1>고객행복센터</h1>
        </div>
    </header>
    <!-- 내용 -->
    <section class="section1">
        <form>
            <input type="text" name="search" placeholder="궁금한 내용의 키워드를 입력하세요">
            <button type="button"><span class="material-icons">search</span></button>
        </form>
    </section>
    <hr>
    <span class="material-icons">face</span>
    <span class="material-icons">search</span>
    <section class="section2">
        <article class="listWarp">
            <div>
                <div>
                    공지사항
                </div>
                <div>
                    자주 묻는 질문
                </div>
                <div>
                    문의하기
                </div>
            </div>
        </article>
        <article >
            <h2>공지사항</h2>
            <div><span>번호</span> 공지사항리스트 <span>날짜</span></div>
        </article>
    </section>
    <hr>
    <!-- 푸터 -->
    <footer class="footer">
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
    </footer>
</body>
</html>
