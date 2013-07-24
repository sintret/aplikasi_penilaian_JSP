<%@ page import="java.sql.*"%>
<p>
	<a class="pure-button pure-button-active" href="#">Daftar Mata Pelajaran Programming </a> 
	<a class="pure-button pure-button-primary" href="#"><i class="icon-plus-sign icon-large"></i> Add </a>
</p>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/penilaian", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM matapelajaran");
%>

<table class="pure-table pure-table-bordered">
	<thead>
		<tr>
			<th>#</th>
			<th>Mata Pelajaran</th>
			<th>
				<button class="pure-button">
					<i class="icon-cog"></i>Settings
				</button>
			</th>
		</tr>
	</thead>

	<tbody>
		<%
			int i = 1;
			while (rs.next()) {
		%>
		<tr id="elem<%=rs.getInt("id")%>">
			<td><%=i%></td>
			<td><%=rs.getString("subject")%></td>
			<td><a class="pure-button" href="#" title="edit"><i	class="icon-edit"></i></a>
				<button class="pure-button" onclick="deleteRow(<%=rs.getInt("id")%>)" title="delete">
					<i class="icon-trash"></i>
				</button>
			</td>
		</tr>
		<%
			i++;
			}
		%>

	</tbody>
</table>