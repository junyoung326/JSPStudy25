package dao;

import java.sql.*;
import java.util.*;
import dto.MovieDTO;

public class MovieDAO {
	private Connection conn;

	public MovieDAO() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://192.168.111.101:3306/mvcprojectdb", "mvcproject", "1234");
	}

	public List<MovieDTO> getAllMovies() throws Exception {
		List<MovieDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM movies";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			MovieDTO m = new MovieDTO();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setImagePath("img/movies/inception.jpg");
			m.setSummary(rs.getString("summary"));
			m.setPosterUrl(rs.getString("poster_url"));
			list.add(m);
		}
		return list;
	}

	public MovieDTO getMovieById(int id) throws Exception {
		String sql = "SELECT * FROM movies WHERE id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			MovieDTO m = new MovieDTO();
			m.setId(rs.getInt("id"));
			m.setTitle(rs.getString("title"));
			m.setSummary(rs.getString("summary"));
			m.setPosterUrl(rs.getString("poster_url"));
			return m;
		}
		return null;
	}
}
