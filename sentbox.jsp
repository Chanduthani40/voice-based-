<%@page import="com.voidmain.service.AES"%>
<%@page import="com.voidmain.pojo.com.voidmain.pojo.User"%>
<%@page import="com.voidmain.pojo.Message"%>
<%@page import="com.voidmain.dao.HibernateTemplate"%>
<%@page import="com.voidmain.dao.HibernateDAO"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp"%>
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
	<h1>View Messages</h1>
	<%
		}
	%>

	<table style="width: 100%; border-spacing: 0;">
		<tr>
			<th>Sender</th>
			<th>Date</th>
			<th>Message</th>
			<th>Delete</th>
			<%
				User user = HibernateDAO.getUserById(username);
					
					for (Message message : HibernateDAO.getMessage()) {
						
						if(message.getSender().equals(username))
						{
			%>
		
		<tr>
			<td><%=message.getSender()%></td>
			<td><%=message.getMessageDate()%></td>
			<td><%=message.getMessage()%></td>
			<td><a href="sentbox.jsp?id=<%=message.getMessageId()%>">delete</a></td>
		</tr>

		<%
				}
			}
		%>
	</table>

	<%
		String id = request.getParameter("id");

		if (id != null) {
			if (HibernateTemplate.deleteObject(Message.class,
					Integer.parseInt(id)) == 1) {
				response.sendRedirect("sentbox.jsp?status=success");
			} else {
				response.sendRedirect("sentbox.jsp?status=failed");
			}
		}
	%>

</div>
<%@include file="footer.jsp"%>