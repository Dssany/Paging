<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>list.jsp<br>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="testBoard.TestDAO"/>
	<c:choose>
		<c:when test="${ param.start == null}">
			<c:set var="start" value="1"/>
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.start }"/>
		</c:otherwise>
	</c:choose>
	<c:set var="listDto" value="${ dao.list(start,) }"/>
	
	<c:set var="totPage" value="${dao.getTotalPage() }"/>
	
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th>
			<th>등록 날짜</th><th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${listDto.size() != 0 }">
				<c:forEach var="dto" items="${listDto }">
		<tr>
			<td>${dto.num }</td>
			<td>
				<a href="count.jsp?num=${dto.num }">
					${dto.title }
				</a>
			</td>
			<td>${dto.pdate }</td><td>${dto.count }</td>
		</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
		<tr><th colspan="4">등록된 정보가 없습니다</th></tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="right">
	
	<c:choose>
		<c:when test="${start > 1 }">
			<button type="button" onclick=
		"location.href='list.jsp?start=${start-1}'">이전</button>
		</c:when>
		<c:otherwise>
			<button type="button" disabled>이전</button>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="1" end="${totPage }" step="1" var="cnt">
		<a href="list.jsp?start=${cnt}">[${cnt }] </a>
	</c:forEach>
	<c:choose>
		<c:when test="${start < totPage }">
			<button type="button" onclick=
		"location.href='list.jsp?start=${start+1}'">다음</button>
		</c:when>
		<c:otherwise>
			<button type="button" disabled>다음</button>
		</c:otherwise>
	</c:choose>
				${totPage }
				<button type ="button" onclick=
				"location.href='regForm.jsp'">등록</button>
			</td>
		</tr>
	</table>
</body>
</html>

