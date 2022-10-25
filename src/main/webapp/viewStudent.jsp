<%@page import="persistence.Student"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Learner's Academy</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<center>
<a href="index.html">Back to Main Menu</a>&nbsp;&nbsp;
<a href="addStudent.html">Add Student</a>&nbsp;&nbsp;
<a href="assignStudentToClass.jsp">Assign Student</a>

<h1>The Following Students are listed</h1>
<%
	SessionFactory sf  = HibernateUtil.buildSessionFactory();
	Session hibernateSession = sf.openSession();
	List<Student> students = hibernateSession.createQuery("from Student").list();
%>
<table>
<tr>
<th>Name </th>
<th>Last Name </th>
<th>Assigned Class </th>
</tr>
	<%		
		for(Student student : students){
			out.print("<tr>");	
			out.print("<td>" + student.getName() + "</td>");
			out.print("<td>" + student.getFname() + "</td>");
			out.print("<td>" + getClassName(student) + "</td>");
			out.print("</tr>");	
		}
	%>
</table>

<%!
	public String getClassName(Student student){
	if (student.getClasses() == null){
		return "no class assigned";
	}
	else{
		return student.getClasses().getName();
	}
}

%>
</center>
</body>
</html>