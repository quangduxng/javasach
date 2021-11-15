package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.loaidao;

/**
 * Servlet implementation class QuanlyloaiController
 */
@WebServlet("/QuanlyloaiController")
public class QuanlyloaiController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuanlyloaiController() {
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
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String maloai = request.getParameter("txtmaloai");
		String tenloai = request.getParameter("txttenloai");
		loaidao loaidao1 = new loaidao();
		try {
			if (request.getParameter("btnthem") != null) {

				int rs = loaidao1.Them(maloai, tenloai);
				if (rs == 0)
					request.setAttribute("ktnhap", 0);
			}
			if (request.getParameter("btnsua") != null) {
				int rs = loaidao1.Sua(maloai, tenloai);
				if (rs == 0)
					request.setAttribute("ktnhap", 0);
			}
			if (request.getParameter("mlchon") != null) {
				request.setAttribute("chon", loaidao1.getTheoMaLoai(request.getParameter("mlchon")));
				request.getRequestDispatcher("admin/qlloai.jsp").forward(request, response);
			}
			if (request.getParameter("mlxoa") != null) {
				String ml = request.getParameter("mlxoa");
				int n = loaidao1.Xoa(ml);
				if (n == 0)
					request.setAttribute("ktxoa", 0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			request.setAttribute("dsloai", loaidao1.getloai());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("admin/qlloai.jsp").forward(request, response);
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
