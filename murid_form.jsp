<%@ page import="java.sql.*"%>
<%!String name;%>
<%!String address;%>
<%!String id;%>
<%
	String id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/penilaian", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM murid where id = '"+ id + "'");
	if (rs.next()) {
		name = rs.getString("name");
		address = rs.getString("address");
	} else {
		name = "";
		address = "";
	}
%>

<p>
	<a class="pure-button pure-button-active" href="#">Form Murid</a>
</p>

<form class="pure-form pure-form-aligned" method="post"
	action="murid_form_proses.jsp">
	<fieldset>
		<div class="pure-control-group">
			<label for="name">Nama</label> <input name="name" type="text"
				placeholder="Nama" value="<%=name%>" required>
		</div>

		<div class="pure-control-group">
			<label for="address">Alamat</label>
			<textarea name="address" required><%=address%></textarea>
		</div>
		<input name="id" type="hidden" value="<%=id%>">

		<div class="pure-controls">
			<button type="submit" class="pure-button pure-button-primary">Submit</button>
		</div>
	</fieldset>
</form>