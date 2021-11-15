package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import bean.loaibean;
import bean.sachbean;

import bo.loaibo;
import bo.sachbo;

/**
 * Servlet implementation class HtSach
 */
@WebServlet("/HTSach")
public class HTSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HTSach() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession(true);
			loaibo lbo= new loaibo();
			sachbo sbo= new sachbo();
			String ml= request.getParameter("ml");
			String key= request.getParameter("key");
			ArrayList<loaibean> dsloai=lbo.getloai();
			ArrayList<sachbean> dssach= sbo.getsach();
			//
			
			//
			if(ml!=null) dssach= sbo.TimLoai(dssach, ml);
			else
				if(key!=null) dssach=sbo.Tim(dssach, key);		     
     		session.setAttribute("dsloai", dsloai);
     		session.setAttribute("dssach", dssach);
     		
    		response.setContentType("text/html");
		    RequestDispatcher rd= request.getRequestDispatcher("HTSach.jsp");
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
