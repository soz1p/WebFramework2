<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>학년별 이수 학점 조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            overflow-y: auto;
        }
        .homebutton {
            position: fixed;
            top: 2px;
            right: 10px;
        }
        h1 {
            color: #F8404B;
            text-align: center;
            margin-top: 20px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #FFF;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #F8404B;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #F8404B;
            color: #FFF;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        a {
            text-decoration: none;
            color: #F8404B;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #FF5A5F;
        }
        button {
            padding: 10px 20px;
            background-color: #F8404B;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #FF5A5F;
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
        .total-credits {
            font-size: 1.2em;
            color: #F8404B;
            background-color: #f2f2f2;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="homebutton">
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home" style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>
<h1>학년별 이수 학점 조회</h1>
<table>
    <tr>
        <th>년도</th>
        <th>학기</th>
        <th>취득 학점</th>
        <th>상세보기</th>
    </tr>
    <c:set var="totalCredits" value="0" />
    <c:forEach var="semesterCredit" items="${id_SemesterCredits}">
        <tr>
            <td>${semesterCredit.year}</td>
            <td>${semesterCredit.semester}</td>
            <td>${semesterCredit.credits}</td>
            <td><a href="${pageContext.request.contextPath}/coursesDetails?year=${semesterCredit.year}&semester=${semesterCredit.semester}">more</a></td>
        </tr>
        <c:set var="totalCredits" value="${totalCredits + semesterCredit.credits}" />
    </c:forEach>
    <tr>
        <td colspan="2">총 이수 학점</td>
        <td class="total-credits">${totalCredits}</td>
        <td></td>
    </tr>
</table>

<div class="footer">
    <p>@Copyright 2191193 JSJ</p>
</div>

</body>
</html>
