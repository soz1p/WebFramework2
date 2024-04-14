<%--
  Created by IntelliJ IDEA.
  User: hansung
  Date: 2024-04-11
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>2024년도 2학기 수강 신청</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/css/main.css?ver=1.0.0" >

</head>
<body>
<div class="homebutton">
    <p><a href="${pageContext.request.contextPath}/"><img src="././resources/images/home.png" alt="Home"style="width: 40px; height: 50px; filter: invert(50%);"></a></p>
</div>

<h1> 2024년도 2학기 수강 신청 </h1>


<sf:form method="post" action="${pageContext.request.contextPath}/docreate" modelAttribute="course">
    <table class="formtable">
        <tr>
            <td class="label"> Year : </td>
            <td><sf:input cssClass="control" type="text" path="year" readonly="true" value="${course.year}"/> <br/>
                <sf:errors path="year" class="error"/>
            </td>
        </tr>
        <tr>
            <td class="label"> Semester : </td>
            <td><sf:input class="control" type="text" path="semester" readonly="true" value="${course.semester}"/> <br/>
                <sf:errors path="semester" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> Course Code : </td>
            <td><sf:input class="control" type="text" path="courseCode"/> <br/>
                <sf:errors path="courseCode" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> Course Name : </td>
            <td><sf:input class="control" type="text" path="courseName"/> <br/>
                <sf:errors path="courseName" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> Course Type : </td>
            <td><sf:input class="control" type="text" path="courseType"/> <br/>
                <sf:errors path="courseType" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> Professor : </td>
            <td><sf:input class="control" type="text" path="professor"/> <br/>
                <sf:errors path="professor" class="error" />
            </td>
        </tr>
        <tr>
            <td class="label"> Credits : </td>
            <td><sf:input class="control" type="text" path="credits"/> <br/>
                <sf:errors path="credits" class="error" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="수강 신청"/> </td>
        </tr>
    </table>
</sf:form>

<div class="footer">
    <p>@Copyright 2191193 JSJ</p>
</div>

</body>
</html>