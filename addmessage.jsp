<%@page import="java.util.Date"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<!DOCTYPE HTML>
<html>

<head>
<title>Voidmain</title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css"
	title="style" />

<link rel="stylesheet" href="speech-input.css">

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1>
						<a href="#">Personnel <span class="logo_colour">Onus</span></a>
					</h1>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">

					<%
						String role = (String) request.getSession().getAttribute("role");
						String username = (String) request.getSession().getAttribute(
								"username");

						if (role.equals("admin")) {
					%>
					<li><a href="adduser.jsp">Add User</a></li>
					<li><a href="viewusers.jsp">View User</a></li>
					<%
						}
					%>
					<%
						if (role.equals("user")) {
					%>
					<li><a href="addmessage.jsp">Post Message</a></li>
					<li><a href="viewmessages.jsp">View Messages</a></li>
					<li><a href="sentbox.jsp">Sent Box</a></li>
					<%
						}
					%>

					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status = request.getParameter("status");

					if (status != null) {
				%>
				<h1><%=status%></h1>
				<%
					} else {
				%>
				<h1>Post Message</h1>
				<%
					}
				%>

				<form action="VoidmainServlet" method="post">

					<input type="hidden" name="type" value="com.voidmain.pojo.Message">
					<input type="hidden" name="operation" value="add"> <input
						type="hidden" name="redirect" value="addmessage.jsp">

					<div>
					
						<table align="center">
							<tr>
								<td><span>Message</span></td>
								<td><textarea rows="5" cols="20" name="message" class="speech-input"></textarea></td>
							</tr>
							<tr>
								<td><span>Select Gender</span></td>
								<td>
									<select name="gender">
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</td>
							</tr>
							<tr>
								<td><span>Select User Type</span></td>
								<td>
									<select name="userType">
										<option value="">--select--</option>
										<option value="student">Student</option>
										<option value="faculty">Faculty</option>
									</select>
								</td>
							</tr>
							<tr>
								<td><span>Age</span></td>
								<td><input class="contact" type="text" name="age" value="" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center"><input class="submit" type="submit" value="Post Message" /></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="content_footer"></div>
	<div id="footer">
		Copyright &copy; 2019 <a href="http://www.voidmaintechnologies.com">Voidmain
			Technologies</a>
	</div>
	<script src="speech-input.js"></script>
	<script async defer src="https://buttons.github.io/buttons.js"
		style="width: 10"></script>
</body>
</html>