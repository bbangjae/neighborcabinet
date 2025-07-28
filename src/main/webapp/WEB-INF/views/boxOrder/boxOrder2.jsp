<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>배송지 변경</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href='<c:url value="/css/boxOrder2.css"/>'>
		<script src="<c:url value="/js/jquery-3.6.1.min.js"/>"></script>
		<script src="<c:url value='/js/searchZip.js' />"></script>
		<script src="<c:url value='/js/boxOrder2.js' />"></script>
	</head>
	<body>
		<div id="wrap">
			<h2 style="text-align : center;">배송지 변경</h2>
			<hr>
			<form id="SI_changeForm">
				<table>
					<tr>
						<td>
							<label for="recipient">수령인</label>
						</td>
					</tr>
					<tr>
						<td style="text-align : center;">
							<input type="text" class="input_shipping" id="recipient" name="recipient" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>주소</label>
						</td>
					</tr>
					<tr>
						<td>
							<div id="addressBox">
			            		<input type="text" class="input_shipping" id="userZipcode" name="userZipcode" readonly>
			            		<input type="button" class="input_shipping" id="searchZipBtn" value="우편번호 찾기">
		            		</div>
			           	</td>
					</tr>
					<tr>
						<td>
							<textarea type="text" class="input_shipping" id="userAddress1" name="userAddress1" readonly></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="input_shipping" id="userAddress2" name="userAddress2" placeholder="상세주소 입력">
						</td>
					</tr>
					<tr>
						<td>
							<label for="userHp2">핸드폰</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="number" class="input_shipping" id="userHp" name ="userHp">
						</td>
					</tr>
					<tr>
						<td style="text-align : center;">
							<input type="submit" value="수정"><input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>