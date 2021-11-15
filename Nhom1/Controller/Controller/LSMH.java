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

import bean.ghbean;
import bean.khachhangbean;
import bean.loaibean;
import bean.sachbean;
import bo.GioHangbo;
import bo.loaibo;
import bo.sachbo;
import dao.ChiTietHoaDondao;
import dao.HoaDondao;

/**
 * Servlet implementation class LSMH
 */
@WebServlet("/LSMH")
public class LSMH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LSMH() {
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
			String xn = request.getParameter("XNDatMua");
			if(xn!=null) 
			{	
			khachhangbean khxn=(khachhangbean)session.getAttribute("dn");
			if(khxn==null) {
				session.setAttribute("khxn",(int)1);
			}
			else {
				GioHangbo gh=null;
				gh= new GioHangbo();
		    	gh=(GioHangbo)session.getAttribute("gh");
		    	HoaDondao hdd= new HoaDondao();
		    	ChiTietHoaDondao cthdd= new ChiTietHoaDondao();
		    	try {
					hdd.ThemHD(khxn.getMakh(), false);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    
			
			}
		    RequestDispatcher rd= request.getRequestDispatcher("HTThanhToan");
		    rd.forward(request, response);
		    
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
