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

import bean.GioHangbean;
import bean.khachhangbean;
import dao.GioHangdao;

/**
 * Servlet implementation class lichsumuahang
 */
@WebServlet("/lichsumuahang")
public class lichsumuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsumuahang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(); 
		khachhangbean kh = (khachhangbean) session.getAttribute("kh"); 
				 GioHangdao dao = new GioHangdao();
				 ArrayList<GioHangbean> hist = dao.History(kh.getMakh());
				  //dao.History(kh.getMakh());
				
				  int ma = 0; 
				  for(GioHangbean d: hist) { 
					  ma = d.getMakh(); 
					  break;
				  
				  }
				  
				  response.getWriter().print(ma); 
				  if (kh.getMakh() != null) {
				  
				  if (request.getAttribute("hist") == null) 
				  { request.setAttribute("history",hist); 
				  RequestDispatcher rd =request.getRequestDispatcher("lichsumuahang.jsp") ;
				  
				  rd.forward(request,response); } }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
