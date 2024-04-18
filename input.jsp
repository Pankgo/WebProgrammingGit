<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>명함입력</h1><form action="<%= request.getRequestURI() %>" method="post"><table border="1"><tr><th>ID</th><td><input type="text" name="txtId" value="" /></td></tr><tr><th>이름</th><td><input type="text" name="txtName" value="" /></td></tr>
<th>폰번호</th><td><input type="text" name="txtTelNo" value="" /></td></tr><tr><th>이메일</th><td><input type="text" name="txtEmail" value="" /></td></tr></table><br/><input type="submit" value="입력" /></form>
	
<%
String url = "jdbc:oracle:thin:@localhost:1521/XE";
String user = "system";
String password = "1234";


Connection conn = null;
Statement stat = null;
%>
<% 
try{
	
	String id = request.getParameter("txtId");
	String name = request.getParameter("txtName");
	String telNo = request.getParameter("txtTelNo");
	String mail = request.getParameter("txtEmail");
	

	Class.forName("oracle.jdbc.OracleDriver");
	conn = DriverManager.getConnection(url,user,password);
	String sql = "Insert Into namecard (id,name,telno,mail) VALUES ('" + id + "', '" + name + "', '" + telNo + "', '" + mail + "')";
	

	
	stat = conn.createStatement();
	stat.executeUpdate(sql);
	%><script>
		alert("저장완료");
	</script>
	<% 
}catch(Exception e){
	e.printStackTrace();
	%>
	<script>
		alert("오류");
	</script>
	<% 
}finally{
	if(stat != null) stat.close();
	if(conn != null) conn.close();
}
%>
	
</body>
</html>