<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>학기별 수강 강좌 내역</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            height: 100vh;
            flex-direction: column;
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
            max-height: 70vh;
            background-color: #FFF;
            border-radius: 8px;
            overflow-y: auto;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #F8404B;
            color: #fff;
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
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home" style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>

<h1>학기별 수강 강좌 내역</h1>
<table>
    <tr>
        <th>Year</th>
        <th>Semester</th>
        <th>Course Name</th>
        <th>Course Type</th>
        <th>Professor</th>
        <th>Credits</th>
    </tr>
    <c:forEach var="course" items="${id_Courses}" >
        <tr>
            <td><c:out value="${course.year}" /></td>
            <td><c:out value="${course.semester}" /></td>
            <td><c:out value="${course.courseName}" /></td>
            <td><c:out value="${course.courseType}" /></td>
            <td><c:out value="${course.professor}" /></td>
            <td><c:out value="${course.credits}" /></td>
        </tr>
    </c:forEach>
</table>

<div class="footer">
    <p>@Copyright 2191193 JSJ</p>
</div>

</body>
</html>
