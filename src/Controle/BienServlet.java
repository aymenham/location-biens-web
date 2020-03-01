package Controle;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import Modele.Bien;
import Modele.Client;
import Modele.EnvoyerEmail;
import Modele.GestionAvis;
import Modele.GestionBien;
import Modele.GestionCompteClient;
import Modele.GestionLocation;


/**
 * Servlet implementation class BienServlet
 */
@WebServlet("/BienServlet")
public class BienServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BienServlet() {
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
		String hidden = request.getParameter("hidden");
		Bien bien = new Bien();
		switch(hidden)
		{
		
		case "contacterProprietaire":
	    
		String email = request.getParameter("email");
		String message = request.getParameter("message");
	    bien = (Bien) getServletContext().getAttribute("bien");
	    String emailTo ="";
			try {
				 emailTo = GestionCompteClient.getClient(bien.getPseudo()).getEmail();
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		EnvoyerEmail.Envoyer(emailTo,"message de "+email, message);
		response.setContentType("text/plain");  
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().print("message envoyer avec succés");
	    
	    break;		
		
		
		case "ConsulterBien":
			
		
		int idBien = Integer.parseInt(request.getParameter("idBien"));
	    
			try {
				bien = GestionBien.getBien(idBien);
				Client proprietaire = GestionCompteClient.getClient(bien.getPseudo());
				request.setAttribute("bien",bien);
				request.setAttribute("proprietaire",proprietaire);
				request.setAttribute("age",GestionCompteClient.calculerAge(proprietaire.getDateNaissance()));
				request.setAttribute("listAvis", GestionAvis.getListAvisBien(idBien));
				Gson gson = new GsonBuilder()
						   .setDateFormat("dd-MM-yyyy").create();
				String ListJson = gson.toJson(GestionLocation.getListDisabledDates(idBien));
				request.setAttribute("ListDisabledDates", ListJson);
			} catch (ClassNotFoundException | SQLException e) {
			}
		getServletContext().setAttribute("bien", bien);
		request.getRequestDispatcher("/pageBien.jsp").forward(request, response);
		break;
		}
	}

}
