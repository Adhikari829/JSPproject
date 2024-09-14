<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@page import="org.eclipse.jdt.internal.compiler.flow.TryFlowContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection conn = null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","Kanchan@123");
	}catch(Exception e){
		e.printStackTrace();
	}
if("POST".equalsIgnoreCase(request.getMethod())){
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		
		
		
		PreparedStatement pre = null;
		
		
		try{
			
			String sql = "INSERT INTO register (name, email, password, gender) VALUES (?, ?, ?, ?)";
			pre = conn.prepareStatement(sql);
			pre.setString(1, name);
			pre.setString(2, email);
			pre.setString(3,password);
			pre.setString(4, gender);
			
			
			int i = pre.executeUpdate();
			
			if(i>0){
				out.println("<h2>Registered successfully</h2>");
			}else{
				out.println("<h2>Registered not successfully</h2>");
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
}
%>


</body>
</html>