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
    <link rel="stylesheet" href="/res/css/agreeJoin.css">

    <script src="/res/js/agreejoin.js"></script>
</head>
<body>
    <div id="content">
    <!-- 헤더 -->
    <header id="header">
        <h1>cookit 회원가입</h1>
    </header>

    <!-- 세션 -->
    <section id="section">
        <form id="agreeform">
            <div>
                <div class="checkboxWarp">
                    <label for="all" class="all"><input type="checkbox" name="all" value="1" id="all" >전체 동의</label>
                    <p class="allText">선택항목에 동의하지 않은 경우도 서비스이용이 가능합니다.</p>
                </div>
                <div class="checkboxWarp">
                    <label for="termsOfUse" class="termsOfUse"><input type="checkbox" name="termsOfUse" value="1" id="termsOfUse">이용약관 동의<span>(필수)</span></label>
                    <div>약관보기</div>
                </div>
                <div class="checkboxWarp">
                    <label for="userInformation" class="userInformation"><input type="checkbox" name="userInformation" value="1" id="userInformation">개인정보 수집 및 이용 동의<span>(필수)</span></label>
                    <div>약관보기</div>
                </div>
                <div class="checkboxWarp">
                    <label for="marketing" class="marketing"><input type="checkbox" name="marketing" value="1" id="marketing">마케팅등 정보 수신 등 활용 동의<span>(선택)</span></label>
                    <div>약관보기</div>
                </div>
                <!--                    <div class="checkboxWarp">-->
                <!--                        <label for="age" class="age"><input type="checkbox" name="age" value="1" id="age">본인은 만 14세 이상입니다<span>(필수)</span></label>-->
                <!--                    </div>-->
                <div class="checkboxWarp">
                    <label for="notRealpage" class="notRealpage"><input type="checkbox" name="notRealpage" value="1" id="notRealpage">현 서비스는 포트폴리오로 제작되었습니다<span>(필수)</span></label>
                    <p class="allText">현 서비스는 실제 이용되지 않는 것을 본인은 인지하고 있습니다.</p>
                </div>
            </div>
            <div class="btnWrap">
                <input type="button" value="취소">
                <!-- 필수항목에 체크 안된경우 서브밋 막고 에러 메세지 띄우기-->
                <input type="button" id="submit" value="확인">
            </div>
        </form>
    </section>

    <!-- 푸터 -->
    <footer id="footer">
<%--        <a href="/join">회원가입</a>--%>
    </footer>
</div>
</body>
</html>
