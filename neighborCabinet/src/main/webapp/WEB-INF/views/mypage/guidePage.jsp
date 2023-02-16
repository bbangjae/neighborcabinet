<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-02-11
  Time: 오후 2:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!DOCTYPE html>
<html>
	<head>
	<link rel ="stylesheet" type="text/css" href="<c:url value='/css/guidePage.css'/>">
	<script src="<c:url value='/js/guidePage.js' />"></script>
    <title> 가이드페이지 </title>
    <c:import url="/WEB-INF/views/layout/header.jsp"/>
	</head>
	<body>
	<div class="container">
    	<div class ="heading mt-5">
        	<h3> 가이드 페이지 </h3>
       		<hr>
  		</div>
		<div class="btnGroup">
			<button class="Type1" id="TypeA">사용자 안내</button>
			<button class="Type1" id="TypeB">공급자 안내</button>
		</div>
    	<div class="Type1Guide">
    		a
    	</div>
    	<div class="Type2Guide" style="display:none;">
    		b
    	</div>
	</div>
	</body>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</html>
