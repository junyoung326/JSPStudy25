package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.UserDTO;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://192.168.111.101:3306/mvcprojectdb", "mvcproject", "1234");

	}

	public int register(UserDTO user) throws Exception {
		String sql = "INSERT INTO users (id, pw, name, birth, gender, email, phone) VALUES (?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPw());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getBirth());
		pstmt.setString(5, user.getGender());
		pstmt.setString(6, user.getEmail());
		pstmt.setString(7, user.getPhone());
		return pstmt.executeUpdate();
	}

	public UserDTO login(String id, String pw) {
		UserDTO user = null;

		String sql = "SELECT * FROM users WHERE id = ? AND pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new UserDTO();
				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setBirth(rs.getString("birth"));
				user.setGender(rs.getString("gender"));
				user.setEmail(rs.getString("email"));
				user.setPhone(rs.getString("phone"));
			}

			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user; // ✔ UserDTO 반환
	}

	public UserDTO getUser(String id) throws Exception {
	    String sql = "SELECT * FROM users WHERE id=?";
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, id);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            if (rs.next()) {
	                UserDTO user = new UserDTO();
	                user.setId(rs.getString("id"));
	                user.setPw(rs.getString("pw"));
	                user.setName(rs.getString("name"));
	                user.setBirth(rs.getString("birth"));
	                user.setGender(rs.getString("gender"));
	                user.setEmail(rs.getString("email"));
	                user.setPhone(rs.getString("phone"));
	                return user;
	            }
	        }
	    }
	    return null;
	}

	public int update(UserDTO user) throws Exception {
		String sql = "UPDATE users SET pw=?, name=?, birth=?, gender=?, email=?, phone=? WHERE id=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getPw());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getBirth());
		pstmt.setString(4, user.getGender());
		pstmt.setString(5, user.getEmail());
		pstmt.setString(6, user.getPhone());
		pstmt.setString(7, user.getId());
		return pstmt.executeUpdate();

	}

	public int delete(String id) throws Exception {
		String sql = "DELETE FROM users WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		return pstmt.executeUpdate();
	}
}
