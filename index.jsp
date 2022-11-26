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
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<!-- class="logo_colour", allows you to change the colour of the text -->
					<h1><a href="index.html">Robust Algorithm <span class="logo_colour">for Secure</span></a></h1>
          			<h2>Voice Communication</h2>
				</div>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="content">
				<!-- insert the page content here -->
				<%
					String status=request.getParameter("status");
									
					if(status!=null)
					{
				%>
						<h1><%=status%></h1>
				<%		
					}
					else
					{
				%>
						<h1>Login Here</h1>
				<%		
					}
				%>
				
				<form action="LoginServlet">
					<div class="form_settings">
						
						<p>
							<span>User Name :</span><input class="contact" type="text"
								name="username" value="" />
						</p>
						<p>
							<span>Password :</span><input class="contact" type="password"
								name="password" value="" />
						</p>
						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Login" />
						</p>
					</div>
				</form>
			</div>
		</div>
		<div id="content_footer"></div>
		<div id="footer">
			Copyright &copy; 2019 <a href="http://www.voidmaintechnologies.com">Voidmain
				Technologies</a>
		</div>
	</div>
</body>
</html>
