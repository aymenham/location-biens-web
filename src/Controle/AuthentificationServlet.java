package Controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Modele.Agent;
import Modele.GestionCompteAgent;
import Modele.GestionCompteClient;

/**
 * Servlet implementation class AuthentificationServlet
 */
@WebServlet("/AuthentificationServlet")
public class AuthentificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//logout
		if(("true").equals(request.getSession().getAttribute("agent")))
		{
			request.getSession(false).setAttribute("agent", "false");
			request.getSession(false).setAttribute("admin", "false");
			request.getSession(false).invalidate();
		    response.sendRedirect(request.getContextPath() + "/Administrator.html");	
		}
		else
		{
			request.getSession(false).setAttribute("exist", "false");
			request.getSession(false).invalidate();
		    response.sendRedirect(request.getContextPath() + "/index.jsp");	
		}
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hidden = request.getParameter("hidden");
		String login = request.getParameter("login");
		String mdp = request.getParameter("mdp");
		Boolean x = false;
		boolean statut = false;
		switch (hidden) {
		
		case "Administrator":
			
			try {
				x = GestionCompteAgent.Authentification(login, mdp);
			} catch (ClassNotFoundException | SQLException e) {
			}
			if(x){
				Agent agent = new Agent();
				try {
					agent = GestionCompteAgent.getAgent(login);
				} catch (ClassNotFoundException | SQLException e1) {
				}
				request.getSession().invalidate();
				HttpSession session = request.getSession();
			    session.setAttribute("nom",agent.getNom());
				session.setAttribute("prenom",agent.getPrenom());
				session.setAttribute("login", agent.getLogin());
				session.setAttribute("agent", "true");
				if(agent.getGrade()==true)
				{
				session.setAttribute("admin", "true");	
				}
				
				response.sendRedirect(request.getContextPath() + "/EspaceAgent.jsp");
			}
			else
			{
				response.sendRedirect(request.getContextPath() + "/Administrator.html");
			}
			break;
			
		case "Authentification":
			
			try {
				x = GestionCompteClient.Authentification(login, mdp);
			} catch (ClassNotFoundException | SQLException e) {
			}
			
			
			if(x){
				try {
					statut = GestionCompteClient.getClient(login).getStatut();
				} catch (ClassNotFoundException | SQLException e1) {
				}
				if(statut==false)
				{
				request.setAttribute("message","Votre compte est Bloqué"); // This will be available as ${message}
			    request.getRequestDispatcher("/message.jsp").forward(request, response);
				}
				else
				{
				request.getSession().invalidate();
				HttpSession session = request.getSession();
				try {
					session.setAttribute("pseudo",GestionCompteClient.getClient(login).getPseudo());
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("exist", "true");
				response.sendRedirect(request.getContextPath() + "/EspaceClient.jsp");
				}
				
			}
			else
			{
				response.sendRedirect(request.getContextPath() + "/Authentification.html");
			}
			break;
			
		case "MdpOublie":
			
			boolean y = false;
			String email = request.getParameter("email");
			response.setContentType("text/plain");  
		    response.setCharacterEncoding("UTF-8");
			try {
				x = GestionCompteClient.verifierEmail(email);
			} catch (ClassNotFoundException | SQLException e) {
				
			}
			
			
			if (x)
			{
			    try {
					y = GestionCompteClient.EnvoyerNouveauMdp(email);
				} catch (ClassNotFoundException | SQLException e) {
				}
			    if(y)
				{
			     
				response.getWriter().print("nouveau mots de passe envoyer avec succés");
					
				}
				else
				{
				
				response.getWriter().print("error ...");	
				}
			    
			}
			else
			{
				try {
					TimeUnit.SECONDS.sleep(1);
				} catch (InterruptedException e) {
				}
				response.getWriter().print("cette adresse n'existe pas");
			}
		
			break;
	}
	}

}
