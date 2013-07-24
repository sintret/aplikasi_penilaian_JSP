<%@ page import="java.sql.*"%>
<%  
	String attr = request.getParameter("attr");
	String id = request.getParameter("id");
	String murid_id = request.getParameter("murid_id");
	String matapelajaran_id = request.getParameter("matapelajaran_id");
	String nilai = request.getParameter("nilai"); 
	
	// open conection
	Connection con = null;
	PreparedStatement  prepare = null;
	int execQuery = 0;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/penilaian", "root", "");
	
	// delete statement
	if(attr!= null &&  attr.equals("delete"))
	{
		String sql = "DELETE FROM nilai where id = '"+id+"'";
		Statement st = con.createStatement();
		st.execute(sql);
		
	} else {
		
		if( id.hashCode()==3392903 )
		{
			String sql = "INSERT INTO nilai (nilai,murid_id,matapelajaran_id) VALUES (?,?,?)";
			prepare = con.prepareStatement(sql);
			prepare.setString(1,nilai);
			prepare.setString(2,murid_id);
			prepare.setString(3,matapelajaran_id);
			execQuery = prepare.executeUpdate();
		} else {
			String sql = "UPDATE nilai SET nilai=?, murid_id=?, matapelajaran_id=?  where id=?";
			prepare =con.prepareStatement(sql);
			prepare.setString(1,nilai);
			prepare.setString(2,murid_id);
			prepare.setString(3,matapelajaran_id);
			prepare.setString(4,id);
			execQuery = prepare.executeUpdate();
		}
		
		if(execQuery>0){
			response.sendRedirect("index.jsp");
		} else{
			out.print("Failed to query");
		}	
		
				
	}

%>

