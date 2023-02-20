<%--
  Created by IntelliJ IDEA.
  User: se
  Date: 2023-02-13
  Time: 오후 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

<html>
<head>
    <title>문의사항 등록</title>
</head>
<style>
  hr{
    width: 100%;
    height: 2px;
    background: #00DBAF;
    border: 0;
  }

</style>

<body>
<c:import url="/WEB-INF/views/layout/header.jsp"/>

<div class="container">
  <div class ="heading mt-5">
    <h3> 문의 사항 </h3>
    <hr>
  </div>

  <div class="content">
    <section>
      <form id="saveForm" method="post" action="/board/Iregister">

        <table class="table tb_row">
          <colgroup>
            <col style="width:15%;" /><col style="width:35%;" /><col style="width:15%;" /><col style="width:35%;" />
          </colgroup>
          <tbody>
          <tr>
            <th>제목</th>
            <td colspan="3"><input type="text" class="form-control" id="title" name="boTitle"  placeholder="제목을 입력해주세요." /></td>
          </tr>

          <tr>
            <th>내용</th>
            <td colspan="3"><textarea class="form-control" id="content" name="boContent" cols="50" rows="10" placeholder="내용을 입력해 주세요."></textarea></td>
          </tr>
          </tbody>
        </table>
        <input type="hidden" name="boCategory" value="2">
        <input type="hidden" name="boWriter">
        <input type="hidden" name="boNickname">
        <div class=" d-flex justify-content-center">
          <input type="submit"  class="btn m-3" style="background: #00DBAF; color: #Ffffff;" value="저장">
          <a onclick="location.href='/board/inquiryboardlist'" class="btn m-3" style="background: #00DBAF; color: #Ffffff;" >뒤로</a>
        </div>
      </form>
    </section>
  </div> <!--/* .content */-->
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>

</body>
</html>
