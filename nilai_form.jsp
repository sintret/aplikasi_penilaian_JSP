<%@ page import="java.sql.*"%>
<%!int nilai;%>
<%!int murid_id;%>
<%!int matapelajaran_id;%>
<%!String id;%>
<%!String selected;%>
<%
	String id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/penilaian", "root", "");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM nilai where id = '"+ id + "'");
	if (rs.next()) {
		nilai = rs.getInt("nilai");
		murid_id = rs.getInt("murid_id");
		matapelajaran_id = rs.getInt("matapelajaran_id");
	} 
%>

<p>
	<a class="pure-button pure-button-active" href="#">Form  Penilaian Siswa</a>
</p>

<form class="pure-form pure-form-aligned"  method="post" action="nilai_form_proses.jsp">
    <fieldset>
        <div class="pure-control-group">
            <label for="name">Nama</label>
            <select name="murid_id">
            	<% ResultSet res = st.executeQuery("select * from murid");
            		while(res.next())
            		{
            			if(res.getInt("id")==murid_id){
            				selected = "selected";
            			} else {
            				selected="";
            			}
            	%>
            		<option value="<%=res.getString("id") %>"  <%=selected %>><%=res.getString("name") %></option>
            	<%		
            		}
            	%>
            </select>
        </div>

 		<div class="pure-control-group">
            <label for="name">MataPelajaran</label>
            <select name="matapelajaran_id">
	            <% 	ResultSet result = st.executeQuery("select * from matapelajaran");
	            	while(result.next())
	            	{
	            		if(result.getInt("id")==matapelajaran_id){
            				selected = "selected";
            			} else {
            				selected="";
            			}
	            %>
	            	<option value="<%=result.getInt("id") %>"  <%=selected %>><%=result.getString("subject") %></option>
	            <%		
	            	}
	            %>
            </select>
        </div>    
         
        <div class="pure-control-group">
            <label for="name">Nilai</label>
            <select name="nilai">
            	<% int[] array =  {1,2,3,4,5,6,7,8,9,10}; 
            		for(int r:array){
            			if(r == nilai){
            				selected = "selected";
            			} else {
            				selected="";
            			}
            	%>
            	<option value="<%=r%>" <%=selected %> ><%=r%></option>
            	<%} %>
            
            	
            </select>
        </div>    
            <input name="id" type="hidden" value="<%=id %>">
        
        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Submit</button>
        </div>
    </fieldset>
</form>