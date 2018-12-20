<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border=1 width=350>
     <tr>
        <th>이름</th>
        <th>주소</th> 
        <th>나이</th>
     </tr>
     <c:forEach var="vo" items="${list }">
       <tr>
          <td>${vo.name }</td>
          <td>${vo.addr }</td>
          <td>${vo.age }</td>
       </tr>
     </c:forEach>
   </table>
</body>
</html>