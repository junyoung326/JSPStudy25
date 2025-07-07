package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.ProductDAO;
import mvc.model.ProductDTO;

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (command.equals("/ProductListAction.do")) { // 등록된 상품 목록 출력하기
			requestProductList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./product/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductWriteForm.do")) { // 상품 등록 페이지 출력하기
			requestProductWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductViewAction.do")) {// 선택된 글 상자 페이지 가져오기
			requestProductView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductView.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductView.do")) { // 글 상세 페이지 출력
			RequestDispatcher rd = request.getRequestDispatcher("./product/view.jsp");
			rd.forward(request, response);
		} else if (command.equals("/ProductUpdateAction.do")) { // 선택된 글 수정하기
			requestProductUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductListAction.do");
			rd.forward(request, response);
		} else if (command.equals("/ProductDeleteAction.do")) { // 선택된 글 삭제하기
			requestProductDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/ProductListAction.do");
			rd.forward(request, response);
		}
	}

	//등록된 상품 목록 가져오기
	public void requestProductList(HttpServletRequest request) {

		ProductDAO dao = ProductDAO.getInstance();
		ArrayList<ProductDTO> Productlist = new ArrayList<ProductDTO>();

		int pageNum = 1;
		int limit = LISTCOUNT;

		if (request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));

		String items = request.getParameter("items");
		String text = request.getParameter("text");

		int total_record = dao.getListCount(items, text);
		Productlist = dao.getProductList(pageNum, limit, items, text);

		int total_page;

		if (total_record % limit == 0) {
			total_page = total_record / limit;
			Math.floor(total_page);
		} else {
			total_page = total_record / limit;
			Math.floor(total_page);
			total_page = total_page + 1;
		}

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("Productlist", Productlist);

	}


	//새로운 상품 등록하기
	public void requestProductWrite(HttpServletRequest request) {

		ProductDAO dao = ProductDAO.getInstance();
		int view = Integer.parseInt(request.getParameter("p_view"));
		int rank = Integer.parseInt(request.getParameter("p_rank"));

		ProductDTO Product = new ProductDTO();
		Product.setTitle(request.getParameter("p_title"));
		Product.setYear(request.getParameter("p_year"));
		Product.setView(view);
		Product.setDetail(request.getParameter("p_detail"));
		Product.setCast(request.getParameter("p_cast"));
		Product.setRank(rank);
		Product.setCreator(request.getParameter("p_creator"));
		Product.setAge(request.getParameter("p_age"));
		Product.setGenre(request.getParameter("p_genre"));
		
		System.out.println(request.getParameter("p_title"));
		System.out.println(request.getParameter("p_year"));
		System.out.println(request.getParameter("p_view"));
		System.out.println(request.getParameter("p_detail"));
		System.out.println(request.getParameter("p_cast"));
		System.out.println(request.getParameter("p_rank"));
		System.out.println(request.getParameter("p_creator"));
		System.out.println(request.getParameter("p_age"));
		System.out.println(request.getParameter("p_genre"));

		Product.setView(0);

		dao.insertProduct(Product);
	}

	//선택된 글 상세 페이지 가져오기
	public void requestProductView(HttpServletRequest request) {

		ProductDAO dao = ProductDAO.getInstance();
		String p_title = request.getParameter("p_title");

		ProductDTO Product = new ProductDTO();
		Product = dao.getProductByTitle(p_title);

		request.setAttribute("p_title", p_title);
		request.setAttribute("Product", Product);
	}

	// 선택된 상품 내용 수정하기
	public void requestProductUpdate(HttpServletRequest request) {

		int view = Integer.parseInt(request.getParameter("p_view"));
		int rank = Integer.parseInt(request.getParameter("p_rank"));
		
		ProductDAO dao = ProductDAO.getInstance();

		ProductDTO Product = new ProductDTO();
		Product.setTitle(request.getParameter("p_title"));
		Product.setYear(request.getParameter("p_year"));
		Product.setView(view);
		Product.setDetail(request.getParameter("p_detail"));
		Product.setCast(request.getParameter("p_cast"));
		Product.setRank(rank);
		Product.setCreator(request.getParameter("p_creator"));
		Product.setAge(request.getParameter("p_age"));
		Product.setGenre(request.getParameter("p_genre"));

		Product.setView(0);

		dao.insertProduct(Product);
	}

	//선택된 글 삭제하기
	public void requestProductDelete(HttpServletRequest request) {

		String p_title = request.getParameter("p_title");

		ProductDAO dao = ProductDAO.getInstance();
		dao.deleteProduct(p_title);
	}

}
