<%--
  Created by IntelliJ IDEA.
  User: nykim
  Date: 2024-03-20
  Time: 오후 4:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&family=Yanone+Kaffeesatz:wght@200..700&display=swap');

        .homebutton {
            position: fixed;
            top: 2px; /* 원하는 위치로 조절 가능 */
            right: 10px; /* 원하는 위치로 조절 가능 */
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
            border: 3px solid #F8404B;
        }
        .container{
            position: relative;
            justify-content: center;
        }
        .form-signin {
            position: relative;
            justify-content: center;
            text-align: center;
        }
        .form-signin-heading {
            position: relative;
            text-align: center;
            margin-top: 12%;
            margin-bottom: 5%;
            font-family: "Song Myung", serif;
            font-style: normal;
            font-weight: 900;
            font-size: 90px;
            line-height: 50px; /* identical to box height */
            color: #F8404B;
        }
        .form-control {
            position: relative;
            justify-content: center;
            text-align: center;
            width: 358px;
            height: 54px;
            border: 2px solid #F8404B;
            border-radius: 20px;
            margin-bottom: 40px;
        }

        /* Username and Password Labels */
        label {
            font-family: 'Playfair Display';
            font-style: normal;
            text-align: center;
            margin-left: 10px;
            font-weight: 900;
            font-size: 20px;
            color: rgba(248, 64, 75, 0.7);
        }
        /* Signin Line */
        .signin-button-wrapper {
            margin-top: 10px;

        }

        /* Sign In */
        .signin-button-wrapper button {
            width: 350px;
            height: 65px;
            border-radius: 20px;
            font-family: "Song Myung", serif;
            font-style: normal;
            font-weight: 900;
            font-size: 25px;
            text-align: center;
            background: #F8404B;
            color: #FFFFFF;
            border: none;
        }

        .signin-button-wrapper button:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

    </style>
</head>
<body>
<div class="mainbox"></div>
<div class="homebutton">
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home"style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>

<div class="container">
    <form class="form-signin" method="post" action="<c:url value="/login" />">
        <h2 class="form-signin-heading">Please Sign In..</h2>

        <c:if test="${not empty errorMsg}">
            <div style="color: #ff0000;"> <h3> ${errorMsg} </h3></div>
        </c:if>

        <c:if test="${not empty logoutMsg}">
            <div style="color: #0000ff;" > <h3> ${logoutMsg} </h3></div>
        </c:if>

        <p>
            <label for="username" class="sr-only">Username</label>
            <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        </p>
        <p>
            <label for="password" class="sr-only">Password</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        </p>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"  />
        <div class="signin-button-wrapper">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </div>
    </form>
</div>
<div class="footer">
    <p>@Copyright 2191193 JSJ</p>
</div>
</body>

</html>
