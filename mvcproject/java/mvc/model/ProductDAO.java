package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import mvc.database.DBConnection;

public class ProductDAO {
	
	private static ProductDAO instance; // 클래스 내부에 자기 자신을 참조하는 정적 변수 (싱글톤)
	
	private ProductDAO() {
		
	}// 기본 생성자
	
	
	public static ProductDAO getInstance() {
		if(instance == null)
			instance = new ProductDAO();
		return instance;
	} // 싱글톤 객체를 얻을 수 있게 제공
	 
	
	
	//product 테이블의 레코드 개수
		public int getListCount(String items, String text) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			int x = 0;

			String sql;
			
			if (items == null && text == null)
				sql = "select count(*) from product";
			else
				sql = "SELECT count(*) FROM product where " + items + " like '%" + text + "%'";
			
			try {
				conn = DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) 
					x = rs.getInt(1);
				
			} catch (Exception ex) {
				System.out.println("getListCount() 레코드수 : " + ex);
			} finally {			
				try {				
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();												
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}		
			}		
			return x;
		}
		// product 테이블의 레코드 가져오기
		// limit: 한 페이지에 보여줄 레코드 수
		// items: 검색 대상 컬럼
		// text: 검색 키워드
		public ArrayList<ProductDTO> getProductList(int page, int limit, String items, String text) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			int total_record = getListCount(items, text );
			int start = (page - 1) * limit;
			int index = start + 1;

			String sql;

			if (items == null && text == null)
				sql = "select * from product ORDER BY p_title DESC";
			else
				sql = "SELECT * FROM product where " + items + " like '%" + text + "%' ORDER BY p_title DESC ";

			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		
			try {
				conn = DBConnection.getConnection();
				
				
				pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = pstmt.executeQuery();
				
				while (rs.absolute(index)) {
					ProductDTO product = new ProductDTO();
					product.setTitle(rs.getString("p_title"));
					product.setYear(rs.getString("p_year"));
					product.setView(rs.getInt("p_view"));
					product.setDetail(rs.getString("p_detail"));
					product.setCast(rs.getString("p_cast"));
					product.setRank(rs.getInt("p_rank"));
					product.setCreator(rs.getString("p_creator"));
					product.setAge(rs.getString("p_age"));
					product.setGenre(rs.getString("p_genre"));
					product.setImage(rs.getString("image"));
					list.add(product);
		
					if (index < (start + limit) && index <= total_record)
						index++;
					else
						break;
				}
				return list;
			} catch (Exception ex) {
				System.out.println("getBoardList() 예외처리 : " + ex);
			} finally {
				try {
					if (rs != null) 
						rs.close();							
					if (pstmt != null) 
						pstmt.close();				
					if (conn != null) 
						conn.close();
				} catch (Exception ex) {
					throw new RuntimeException(ex.getMessage());
				}			
			}
			return null;
		}
	
	
	
	
	
	// product 테이블에 새로운 글 삽입하기 (c: 등록)
	public void insertProduct(ProductDTO product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into product values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getTitle());
			pstmt.setString(2, product.getYear());
			pstmt.setInt(3, product.getView());
			pstmt.setString(4, product.getDetail());
			pstmt.setString(5, product.getCast());
			pstmt.setInt(6, product.getRank());
			pstmt.setString(7, product.getCreator());
			pstmt.setString(8, product.getAge());
			pstmt.setString(9, product.getGenre());
			pstmt.setString(10, product.getImage());

			
			pstmt.executeUpdate();
		}catch (Exception ex){
			System.out.println("insertProduct() 예외처리 : " + ex);
			
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	} //insertProduct 메서드 종료
	
	// 선택된 OTT의 조회 수 증가시키기
	public void updateView(String p_title) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = DBConnection.getConnection();

	        // 조회수 가져오기
	        String sql = "select p_view from product where p_title = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, p_title);
	        rs = pstmt.executeQuery();

	        int p_view = 0;
	        if (rs.next()) {
	            p_view = rs.getInt("p_view") + 1;
	        }

	        rs.close();
	        pstmt.close();

	        // 조회수 업데이트
	        sql = "update product set p_view = ? where p_title = ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, p_view);
	        pstmt.setString(2, p_title);
	        pstmt.executeUpdate();

	    } catch (Exception ex) {
	        System.out.println("updateView() 예외코드 : " + ex);
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception ex) {
	            throw new RuntimeException(ex.getMessage());
	        }
	    }
	} //updateView 메서드 종료
	
	// 선택된 글 상세 내용 가져오기
	public ProductDTO getProductByTitle(String p_title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProductDTO product = null;
		
		updateView(p_title);
		String sql = "select * from product where p_title=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_title);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductDTO();
				product.setTitle(rs.getString("p_title"));
				product.setYear(rs.getString("p_year"));
				product.setView(rs.getInt("p_view"));
				product.setDetail(rs.getString("p_detail"));
				product.setCast(rs.getString("p_cast"));
				product.setRank(rs.getInt("p_rank"));
				product.setCreator(rs.getString("p_creator"));
				product.setAge(rs.getString("p_age"));
				product.setGenre(rs.getString("p_genre"));
				product.setImage(rs.getString("image"));

		
			}
			return product;
		} catch (Exception ex) {
			System.out.println("getBoardByNum() 예외처리 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}// getProductByTitle 메서드 종료	
	
	// 선택된 상품 내용 수정하기
	public void updateProduct(ProductDTO product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update product set p_detail=?, p_cast=?, p_rank=? where p_title=?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, product.getDetail());
			pstmt.setString(2, product.getCast());
			pstmt.setInt(3, product.getRank());
			pstmt.setString(4, product.getTitle());
			
			pstmt.executeUpdate();
			conn.commit();

		}catch(Exception ex) {
			System.out.println("updateProduct() 예외코드 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}
		}
	} // updateProduct 메서드 종료
	
	// 선택된 상품 삭제하기
	public void deleteProduct(String p_title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from product where p_title=?";
		
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_title);
			pstmt.executeUpdate();
			
		} catch (Exception ex){
			System.out.println("deleteBoard() 예외처리 : " + ex);
		}finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}	
		}	
	} //deleteProduct 메서드 종료
	
} // ProductDAO 메서드 종료
