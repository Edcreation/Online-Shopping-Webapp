package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotPassword
 */
@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPassword() {
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
		String npassword = request.getParameter("npassword");
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		
		
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
				ResultSet rs = st.executeQuery("select * from users where email='" + email + 
						"' and password='" + password + "'and securityQuestion='"+ securityQuestion +"' and answer='"
						+ answer + "';" );
				while(rs.next())
				{
					z=1;
					ResultSet cg= st.executeQuery("update users set password='"+ npassword +"' where email='"+ email +"';");
					cg.next();
					response.sendRedirect("forgotPassword.jsp?msg=pswdchanged");
				}
				if(z==0)
				{
					response.sendRedirect("forgotPassword.jsp?msg=noacc");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
				response.sendRedirect("forgotPassword.jsp?msg=internalerror");
			}
		}
	}

}
