<%@page import="com.voidmain.service.AES"%>
<%@page import="com.voidmain.util.VoiceUtil"%>
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
			<th>Read</th>
			<th>Delete</th>
			<%
				User user = HibernateDAO.getUserById(username);
					
						String attributeKey=user.getGender().charAt(0)+user.getAge()+user.getUserType().charAt(0);
						
						for (Message message : HibernateDAO.getMessage()) {
							
							String finalKey=message.getSeckey()+attributeKey;
							
							AES aes=new AES();
							aes.setKey(finalKey);
							
							String mess=aes.decrypt(message.getMessage());
							
							if(mess!=null)
							{
			%>
		
		<tr>
			<td><%=message.getSender()%></td>
			<td><%=message.getMessageDate()%></td>
			<td><%=mess%></td>
			<td><a href="viewmessages.jsp?message=<%=message.getMessage()%>">read</a>
			<%
				if (message.getSender().equals(username)) {
			%>
			<td><a href="viewmessages.jsp?id=<%=message.getMessageId()%>">delete</a>
			</td>
			<%
				} else {
			%>
			<td>No Access</td>
			<%
				}
			%>
		</tr>

		<%
					}
			}
		%>
	</table>
	
	<%
		String message=request.getParameter("message");
	
		if(message!=null)
		{
			VoiceUtil.getVoice().speak(message);
		}
	%>

	<%
		String id = request.getParameter("id");

		if (id != null) {
			if (HibernateTemplate.deleteObject(Message.class,
					Integer.parseInt(id)) == 1) {
				response.sendRedirect("viewmessages.jsp?status=success");
			} else {
				response.sendRedirect("viewmessages.jsp?status=failed");
			}
		}
	%>

</div>
<%@include file="footer.jsp"%>