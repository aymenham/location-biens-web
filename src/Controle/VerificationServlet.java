package Controle;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modele.GestionCompteClient;
import Modele.Client;
import Modele.GestionCompteAgent;
/**
 * Servlet implementation class VerificationServlet
 */
@WebServlet("/VerificationServlet")
public class VerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String hidden = request.getParameter("hidden");
		boolean x = false;
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8");
	    Client client = new Client();
	    client =	(Client) request.getSession(false).getAttribute("client");
		switch(hidden)
		{
		case "email":
			String email = request.getParameter("email");
			if(client==null)
			{
			client = new Client();
			client.setEmail("null");	
			}
			if(email.equals(client.getEmail()))
			{
			response.getWriter().print("true");	
			}
			else
			{	
			try {
				x = GestionCompteClient.verifierEmail(email);
			} catch (ClassNotFoundException | SQLException e) {
			}
			response.getWriter().print(String.valueOf(!x));
			}
			break;
			
		case "login":
			String login = request.getParameter("login");
			
			try {
				x = GestionCompteAgent.verifierEmail(login);
			} catch (ClassNotFoundException | SQLException e) {
			}
			response.getWriter().print(String.valueOf(!x));
			
			break;
		
	case "pseudo":
		
		String pseudo = request.getParameter("pseudo");
		
		if(client==null)
		{
		client = new Client();
		client.setPseudo("null");	
		}
		
		if(pseudo.equals(client.getPseudo()))
		{
		response.getWriter().print("true");	
		}
		else
		{	
		try {
			x = GestionCompteClient.verifierPseudo(pseudo);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.getWriter().print(String.valueOf(!x));
		}
		break;
	}
		
		
	}

}
