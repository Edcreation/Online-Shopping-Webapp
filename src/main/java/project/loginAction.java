package project;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginAction")
public class loginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		if("admin@gmail.com".equals(email) && "admin".equals(password)) {
			session.setAttribute("email",email);
			response.sendRedirect("admin/adminHome.jsp");
		}
		else
		{
			int z= 0;
			try
			{
				Connection con=ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "';");
				while(rs.next())
				{
					z=1;
					session.setAttribute("email",email);
					response.sendRedirect("home.jsp");
				}
				if(z==0)
				{
					response.sendRedirect("login.jsp?msg=notexist");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				response.sendRedirect("login.jsp?msg=internalerror");
			}
		}
	}

}
