<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- head 컨텐트 영역 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootStrap/kfonts2.css" rel="stylesheet">
<title>Jolly</title>
</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
	<h2 class="text-center" style="margin-bottom: 50px;">상세 주문 내역</h2>
	
	
	<table class="table table-striped">
		<thead>
			<tr>
				<th style="font-size: 17px">
					번호
				</th>
				<th style="font-size: 17px">
					상품명
				</th>
				<th style="font-size: 17px">
					수량
				</th>
				<th style="font-size: 17px">
					가격
				</th>
			</tr>
		</thead>
		<tbody>
		
			
			
			<c:forEach var="orderHistoryVo" items="${ orderHistoryVos }" varStatus="status">
				<tr>
					<th style="font-size: 17px">
						${ status.count }
					</th>
					<td style="font-size: 17px">
						${ orderHistoryVo.product }
					</td>
					<td style="font-size: 17px">
						${ orderHistoryVo.quantity }
					</td>
					<td style="font-size: 17px">
						<fmt:formatNumber value="${ orderHistoryVo.salePrice }" pattern="#,###원" />
					</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>


</body>
</html>