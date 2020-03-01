package Controle;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modele.Agent;
import Modele.GestionCompteAgent;
import Modele.GestionFacture;

/**
 * Servlet implementation class AdministrateurServlet
 */
@WebServlet("/AdministrateurServlet")
public class AdministrateurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdministrateurServlet() {
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
		switch(hidden)
		{
		case "AjouterAgent":
		
			
			System.out.print(" I am here");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");
			String login = request.getParameter("login");
			String mdp = request.getParameter("mdp");
			String dateNaissance = request.getParameter("dateNaissance");
			int numTel = Integer.parseInt(request.getParameter("numTel"));
			String gradeString = request.getParameter("grade");
			boolean grade = gradeString.equals("true");
			Agent agent = new Agent(login, nom, prenom, adresse, mdp, dateNaissance, numTel, grade);
            boolean x = false;
			
			try {
				x = GestionCompteAgent.AjouterAgent(agent);
			} catch (ClassNotFoundException | SQLException e) {
			}
			
			if(x){
				request.setAttribute("reponse", "succes");
				RequestDispatcher rd = request.getRequestDispatcher("/AjouterAgent.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("reponse", "echec");
				RequestDispatcher rd = request.getRequestDispatcher("/AjouterAgent.jsp");
				rd.forward(request, response);	
			}
			
		break;
		
		case "SupprimerAgent":
			login = request.getParameter("login");
			try {
				GestionCompteAgent.SupprimerAgent(login);
				request.getSession(false).setAttribute("ListAgent", GestionCompteAgent.getListAgent());
			} catch (ClassNotFoundException | SQLException e) {
			}
			System.out.print(login);
			response.sendRedirect(request.getContextPath() + "/SupprimerAgent.jsp");

			
		break;
		
		case "ListAgent":
		
			try {
				request.getSession(false).setAttribute("ListAgent", GestionCompteAgent.getListAgent());
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath() + "/SupprimerAgent.jsp");

		break;
		
		case "CalculerRecette":
		double resultat = 0;
		String choix = request.getParameter("choix");	
		if(choix.equals("date"))
		{
		String date = request.getParameter("date");
		try {
			resultat = GestionFacture.calculerRecette(date);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		if(choix.equals("periode"))
		{
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		try {
			resultat =GestionFacture.calculerRecette(date1,date2);
		} catch (ClassNotFoundException | SQLException e) {
		}
		}
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8");
		response.getWriter().print(resultat+" DA");
		break;
		
		}
	}

}
