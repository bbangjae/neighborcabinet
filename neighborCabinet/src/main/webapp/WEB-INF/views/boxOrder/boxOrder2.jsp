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
	</head>
	<body>
		<div id="wrap">
			<h2 style="text-align : center;">배송지 변경</h2>
			<hr>
			<form>
				<table>
					<tr>
						<td>
							<label for="recipient">수령인</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" class="input_shipping" id="recipient" name="recipient" required >
						</td>
					</tr>
					<tr>
						<td>
							<label>주소</label>
						</td>
					</tr>
					<tr>
						<td colspan="3">
		            		<input type="text" class="input_shipping" id="memZipcode" name="memZipcode" readonly required>
		            		<input type="button" class="input_shipping" id="searchZipBtn" value="우편번호 찾기"><br>
		            		<input type="text" class="input_shipping" id="memAddress1" name="memAddress1" readonly required> <br>
		            		<input type="text" class="input_shipping" id="memAddress2" name="memAddress2" required placeholder="상세주소 입력">
			           	</td>
					</tr>
					<tr>
						<td>
							<label for="userHp2">핸드폰</label>
						</td>
					</tr>
					<tr>
						<td>
							<input type="number" class="input_shipping" id="userHp1" name ="userHp1" value="010" required> - 
							<input type="number" class="input_shipping" id="userHp2" name ="userHp2" required> - 
							<input type="number" class="input_shipping" id="userHp3" name ="userHp3" required>
						</td>
					</tr>
					<tr>
						<td class="left_col">
						요청사항
						</td>
					</tr>
					<tr>
					<td class="right_col">
						<select id="shipping_option" class="input_shipping">
							<option value="">요청사항을 선택하세요</option>
							<option value="문 앞">문 앞</option>
       		  		 		<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
       		  		 		<option value="경비실">경비실</option>
       		  		 		<option value="기타사항">기타사항</option>
						</select>
						<input type="text" id="shipping_optionInput" class="input_shipping">
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