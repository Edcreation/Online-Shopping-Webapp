package project;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Rcart
 */
@WebServlet("/Rcart")
public class Rcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Rcart() {
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
		String email= request.getParameter("email");
		String product_id=request.getParameter("id");
		String name="";
		int quantity=1;
		int product_price=0;
		int product_total=0;
		int cart_total=0;
		int z=0;
		
		try{
			Connection con=ConnectionProvider.getCon();
			Statement st=con.createStatement();
			
			ResultSet rs1=st.executeQuery("select * from cart where product_id='"+product_id+"'and email='"+email+"' and address is NULL;");
		    while(rs1.next())
		    {
		    	cart_total=rs1.getInt(5);

		    	cart_total=cart_total + product_total;
		    	quantity=rs1.getInt(3);
		    	quantity=quantity-1;
		    	z=1;
		    }
		    if(z==1)
		    {
		    	st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"' and email='"+ email +"' and address is NULL;");
		        response.sendRedirect("myCart.jsp?");
		    }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
