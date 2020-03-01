package Controle;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modele.Client;
import Modele.GestionCompteClient;

/**
 * Servlet implementation class EditerProfil
 */
@WebServlet("/EditerProfilServlet")
public class EditerProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditerProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hidden = request.getParameter("hidden");
		Client client = new Client();
		switch(hidden)
		{
		
		case "Enregistrer" :
		boolean x = false;
		
		String AncienPseudo = (String) request.getSession(false).getAttribute("pseudo");
	    String pseudo = request.getParameter("pseudo");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adresse = request.getParameter("adresse");
		String email = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		String dateNaissance = request.getParameter("dateNaissance");
		int numTel = Integer.parseInt(request.getParameter("numTel"));
		client = new Client(pseudo,nom, prenom, adresse, email, mdp, dateNaissance, numTel,true);
		
		
			try {
				x = GestionCompteClient.EditerProfil(client,AncienPseudo);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		if(x){
			request.getSession(false).setAttribute("pseudo", pseudo);
			request.setAttribute("reponse", "succes");
			try {
				client = GestionCompteClient.getClient((String)request.getSession(false).getAttribute("pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
				
			}
			
			request.getSession(false).setAttribute("client", client);
		    RequestDispatcher rd = request.getRequestDispatcher("/EditerProfil.jsp");
		    rd.forward(request,response);
			
		}
		else
		{
			request.setAttribute("reponse", "echec");
		    RequestDispatcher rd = request.getRequestDispatcher("/EditerProfil.jsp");
		    rd.forward(request,response);
			
		}
		
		break;
		case "EditerProfil":
			
			try {
				client = GestionCompteClient.getClient((String)request.getSession(false).getAttribute("pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
				
			}
			request.getSession(false).setAttribute("client", client);
			response.sendRedirect(request.getContextPath() + "/EditerProfil.jsp");
			
			
		}
	}

}
