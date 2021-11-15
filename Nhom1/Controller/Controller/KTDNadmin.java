package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.adminbean;
import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class KiemTraDN
 */
@WebServlet("/KTDNadmin")
public class KTDNadmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KTDNadmin() {
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
	

		khachhangbo admin= new khachhangbo();
		String un1=request.getParameter("txtun1");
		String pass1=request.getParameter("txtpass1");
		adminbean ad=null;
		
		try {
			ad= admin.ktadmin(un1, pass1);
			System.out.println(ad);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		if(ad!=null) {
			session.setAttribute("dn", ad);	
			session.setAttribute("kt", (long)1);
			response.sendRedirect("HomeadminForward");			
		}
		else {
			response.sendRedirect("HTSach");
			session.setAttribute("kt", (long)0);
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
