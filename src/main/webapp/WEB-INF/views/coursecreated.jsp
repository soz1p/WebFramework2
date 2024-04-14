<%--
  Created by IntelliJ IDEA.
  User: hansung
  Date: 2024-04-11
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수강신청 완료</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100..900&family=Yanone+Kaffeesatz:wght@200..700&display=swap');

        body {
            font-family: Arial, sans-serif;
            background-color: #FF5A5F;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            flex-direction: column;
        }

        .homebutton {
            position: fixed;
            top: 2px;
            right: 10px;
        }

        .created{
            /* 2024학년도 2학기 수강신청에 성공하셨습니다! */
            margin-bottom: 20px;
            font-family: "Noto Sans KR", sans-serif;
            font-style: normal;
            font-weight: 700;
            font-size: 30px;
            line-height: 39px;
            /* identical to box height */
            text-align: center;
            letter-spacing: 0.11em;

            color: #FFFFFF;


        }

        .docreate{
            position: relative;

            font-family: "Lobster", sans-serif;
            font-style: normal;
            font-weight: 900;
            font-size: 110px;
            line-height: 10px;
            text-align: center;

            color: #FFFFFF;
        }

        .createdButton {
            margin-top: 10px;
            position: relative;
            display: flex;
            justify-content: center;
        }

        .createdButton button {
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

        .createdButton button:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        /* Text Styles */
        .createdButton p {
            margin-top: 20px;
            margin: 0 55px; /* 각 버튼 사이의 간격을 조절 */
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
    </style>
</head>
<body>

<div class="homebutton">
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home"style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>

<div class="docreate">
    <p> <a>Do</a></p>
    <p><a>/</a></p>
    <p><a>create</a></p>
</div>
<div>
    <div class="created">2024학년도 2학기 ${course.courseName} 수강신청에 성공하셨습니다</div>
</div>

<div class="createdButton">
<p><a href="${pageContext.request.contextPath}/"> <button>Home</button> </a></p>
<p><a href="${pageContext.request.contextPath}/newlyRegisteredCourses"> <button>수강현황</button> </a></p>
</div>
<div class="footer">
    <p>@Copyright 2191193 JSJ</p>
</div>

</body>
</html>
