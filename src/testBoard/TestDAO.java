package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TestDAO {
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TestDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<TestDTO> list(){
		String sql = "select * from paging order by num desc";
		ArrayList<TestDTO> listDto = new ArrayList<>();
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				listDto.add(dto);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listDto;
		
	}
	
	public void insert(TestDTO dto) {
		String sql = "insert into paging(num,title,pdate,count)" + "values(test_num.nextval,?,sysdate,0)";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
