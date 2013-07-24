<%@ page import="java.sql.*"%>
<p>
	<a class="pure-button pure-button-active" href="#">Daftar Siswa
		Kelas Programming </a> <a class="pure-button pure-button-primary"
		href="index.jsp?page=murid_form"><i
		class="icon-plus-sign icon-large"></i> Add </a>
</p>

<table class="pure-table pure-table-bordered">
	<thead>
		<tr>
			<th>#</th>
			<th>Nama</th>
			<th>Alamat</th>
			<th><button class="pure-button">
					<i class="icon-cog"></i>Settings
				</button></th>
		</tr>
	</thead>
	<%
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		java.sql.Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/penilaian", "root", "");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from murid");
	%>
	<tbody>
		<%
			int i = 1;
			while (rs.next()) {
		%>
		<tr id="elem<%=rs.getInt("id")%>">
			<td><%=i%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("address")%></td>
			<td><a class="pure-button"
				href="index.jsp?page=murid_form&id=<%=rs.getInt("id")%>"
				title="edit"><i class="icon-edit"></i></a>
				<button class="pure-button"
					onclick="deleteRow(<%=rs.getInt("id")%>)" title="delete">
					<i class="icon-trash"></i>
				</button></td>
		</tr>
		<%
			i++;
			}
		%>

	</tbody>
</table>

<script>
function deleteRow(n){
	if(window.confirm("Yakin Data ini mau dihapus !!")){
		$.ajax({
			url:"murid_form_proses.jsp",
			type:"POST",
			cache:false,
			async:false,
			data:{id:n,attr:"delete"},
			success:function(pesan){
				$("#elem"+n).remove();
			}
			});
	}
}
</script>