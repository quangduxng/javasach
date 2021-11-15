package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.HoaDonbean;
import bean.khachhangbean;
import bo.HoaDonbo;

/**
 * Servlet implementation class HTThanhToan
 */
@WebServlet("/HTThanhToan")
public class HTThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HTThanhToan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(true);  
		khachhangbean khxn=(khachhangbean)session.getAttribute("dn");
		if(khxn==null) {
			session.setAttribute("khxn",(int)1);
			RequestDispatcher rd= request.getRequestDispatcher("HTSach");
		    rd.forward(request, response);
		}
		
		try {
			HoaDonbo hdbo= new HoaDonbo();
			String ml= request.getParameter("ml");
			khachhangbean kh=(khachhangbean)session.getAttribute("dn");
			ArrayList<HoaDonbean> dshoadon=hdbo.GetHd(kh.getMakh());
     		session.setAttribute("dsHoaDon", dshoadon);
     		System.out.println(kh.getMakh());
    		response.setContentType("text/html");
		    RequestDispatcher rd= request.getRequestDispatcher("ThanhToan.jsp");
		    rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
