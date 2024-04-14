<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>모든 수강 강좌 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
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
        table {
            border-collapse: collapse;
            overflow-y: auto; /* 추가 */
            width: 80%; /* 변경 */
            background-color: #FFF;
            border-radius: 8px;
            margin-top: 20px; /* 추가 */
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
        .footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            width: 100%;
            margin-top: 20px; /* 수정 */
            position: relative; /* 변경 */
            bottom: 0;
        }
        h1 {
            color: #F8404B;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="homebutton">
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home" style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>
<h1>모든 수강 강좌 목록</h1>
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
