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