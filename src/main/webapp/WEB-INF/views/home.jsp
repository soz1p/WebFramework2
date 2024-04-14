<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2022/12/13
  Time: 12:55 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <title>학사 정보 시스템</title>
    <style>
      @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Yanone+Kaffeesatz:wght@200..700&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100..900&family=Yanone+Kaffeesatz:wght@200..700&display=swap');

      body {
        font-family: Arial, sans-serif;
        background: #F8404B;
        margin: 0;
        padding: 0;
      }
      .footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 10px 0;
        position: fixed;
        bottom: 0;
        width: 100%;
      }
      .mainbox {
        position: absolute;
        width: 1950px;
        height: 850px;
        left: 50px;
        top: 20px;
        border: 3px solid #FFFFFF;
      }

      .mainText {

        position: relative;
        width: 400px;
        height: 300px;
        margin-left:38%;
        margin-top:15%;
        margin-bottom:8%;

        font-family: "Lobster", sans-serif;
        font-style: normal;
        font-weight: 900;
        font-size: 110px;
        line-height: 10px;
        text-align: right;

        color: #FFFFFF;
      }
      .loginbutton {
        position: absolute;
        top: 10px;
        right: 70px;
        text-align: center;
        margin-top: 20px; /* 예시로 상단 마진 추가 */
      }

      .loginbutton button {
        padding: 10px 20px;
        background-color: #ffffff;
        color: #F8404B;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-family: "Yanone Kaffeesatz", sans-serif;;
        font-size: 16px;
        transition: background-color 0.3s ease;
      }

      .loginbutton button:hover {
        background-color: #ece6cc;
        color: rgb(51, 51, 51);
      }

      .mainButton {
        margin-top: 10px;
        position: relative;
        display: flex;
        justify-content: center;
      }

      .mainButton button {
        box-sizing: border-box;
        width: 200px;
        height: 54px;
        border: 5px solid #FFFFFF;
        border-radius: 50px;
        background-color: transparent;
        color: #FFFFFF;
        font-family: "Noto Sans KR", sans-serif;
        font-weight: 700;
        font-size: 25px;
        text-align: center;
        cursor: pointer;
        transition: background-color 0.3s ease;
      }

      .mainButton button:hover {
        background-color: rgba(255, 255, 255, 0.2);
      }
      /* Text Styles */
      .mainButton p {
        margin: 0 45px; /* 각 버튼 사이의 간격을 조절 */
      }


    </style>
  </head>
  <body>
  <div class="mainbox"></div>
  <div class ="loginbutton">
  <c:choose>
    <c:when test="${empty pageContext.request.userPrincipal}">
      <P> <a href="${pageContext.request.contextPath}/login"> <button>login</button> </a></p>
    </c:when>
    <c:otherwise>
      <a href="javascript:document.getElementById('logout').submit()"> <button>logout</button> </a>
    </c:otherwise>
  </c:choose>
  </div>
  <div class = "mainText">
    <P>Soz1p</P>
    <p>Info</p>
    <p>System</p>
  </div>

  <div class="mainButton">
    <p> <a href="${pageContext.request.contextPath}/coursesByCredits"> <button>학년별 학점</button></a></p>
    <p> <a href="${pageContext.request.contextPath}/createcourse"> <button>수강 신청</button> </a></p>
    <P> <a href="${pageContext.request.contextPath}/newlyRegisteredCourses"> <button>수강 신청 조회</button> </a></p>
  </div>
    <form id="logout"  action="<c:url value="/logout" />"method="post">
      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
    </form>

  <div class="footer">
    <p>@Copyright 2191193 JSJ</p>
  </div>
  </body>
</html>
