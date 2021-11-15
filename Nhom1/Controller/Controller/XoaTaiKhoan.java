package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.khachhangdao;
import dao.khachhangdao;

/**
 * Servlet implementation class XoaTaiKhoan
 */
@WebServlet("/XoaTaiKhoan")
public class XoaTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XoaTaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("msgtieude", "Quản lý tài khoản");
		String makh = request.getParameter("makh");
		khachhangdao.XoaKhachHang(makh);
		request.setAttribute("dskh", khachhangdao.getDsKhachHang());
		RequestDispatcher rd = request.getRequestDispatcher("admin/qlTaiKhoan.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
