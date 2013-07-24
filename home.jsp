<%@ page import="java.sql.*"%>
<p>
	<a class="pure-button pure-button-active" href="#">Daftar Siswa
		Dengan Nilai Kelas Programming </a> 
	<a	class="pure-button pure-button-primary" href="index.jsp?page=nilai_form"><i class="icon-plus-sign icon-large"></i> Add </a>
</p>

<%
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/penilaian", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT nilai,id,(select name from murid where id=murid_id) as name,  (select subject from matapelajaran where id=matapelajaran_id) as matapelajaran FROM nilai order by id desc");
%>

<table class="pure-table pure-table-bordered">
	<thead>
		<tr>
			<th>#</th>
			<th>Nama</th>
			<th>Mata Pelajaran</th>
			<th>Nilai</th>
			<th><button class="pure-button">
					<i class="icon-cog"></i>Settings
				</button></th>
		</tr>
	</thead>

	<tbody>
		<%
			int i = 1;
			while (rs.next()) {
		%>

		<tr id="elem<%=rs.getInt("id")%>">
			<td><%=i%></td>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("matapelajaran")%></td>
			<td><%=rs.getInt("nilai")%></td>
			<td>
				<a class="pure-button" href="index.jsp?page=nilai_form&id=<%=rs.getInt("id")%>" title="edit"><i class="icon-edit"></i></a>
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

<script>
function deleteRow(n){
	if(window.confirm("Yakin Data ini mau dihapus !!")){
		$.ajax({
			url:"nilai_form_proses.jsp",
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