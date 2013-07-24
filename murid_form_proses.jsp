<%@ page import="java.sql.*"%>
<%  
	String attr = request.getParameter("attr");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	
	// open conection
	Connection con = null;
	PreparedStatement  prepare = null;
	String sql = null;
	int execQuery = 0;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/penilaian", "root", "");
	
	// delete statement
	if(attr!= null &&  attr.equals("delete"))
	{
		sql = "DELETE FROM murid where id = '"+id+"'";
		Statement st = con.createStatement();
		st.execute(sql);
		
	} 
	else 
	{
			
		if( id.hashCode()==3392903 )
		{
			sql = "INSERT INTO murid (name,address) values (?,?)";
			prepare = con.prepareStatement(sql);
			prepare.setString(1,name);
			prepare.setString(2,address);
			execQuery = prepare.executeUpdate();			
		} else {
			sql = "UPDATE murid SET name=?,address=?  where id=?";
			prepare =con.prepareStatement(sql);
			prepare.setString(1,name);
			prepare.setString(2,address);
			prepare.setString(3,id);
			execQuery = prepare.executeUpdate();
		}
		
		
		if(execQuery>0){
			response.sendRedirect("index.jsp?page=murid");
		} else{
			out.print("Failed to query");
		}			 
	}
%>