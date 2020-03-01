package Controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.DocumentException;
import Modele.Bien;
import Modele.Client;
import Modele.EnvoyerEmail;
import Modele.Facture;
import Modele.GestionBien;
import Modele.GestionCompteClient;
import Modele.GestionDocument;
import Modele.GestionFacture;
import Modele.GestionLocation;
import Modele.Location;

/**
 * Servlet implementation class AgentServlet
 */
@WebServlet("/AgentServlet")
public class AgentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgentServlet() {
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
		String pseudo = request.getParameter("pseudo");
		Boolean x = false;
		ArrayList<Client> ListClient = new ArrayList <Client>();
		ArrayList<Bien>   ListBien = new ArrayList <Bien>();
		RequestDispatcher D;
		
		switch (hidden) {
		case "BloquerClient":
			
			
			try {
				x = GestionCompteClient.SetStatutClient(pseudo , false);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if(x)
			{
			try {
		    ListClient = GestionCompteClient.getListeClient(true);
			} catch (ClassNotFoundException | SQLException e) {
			}
			request.getSession(false).setAttribute("ListClient",ListClient);
			response.sendRedirect(request.getContextPath() + "/BloquerClient.jsp");
			}
			
			
			break;

		case "DebloquerClient":
			
			try {
				x = GestionCompteClient.SetStatutClient(pseudo , true);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			if(x)
			{
			try {
		    ListClient = GestionCompteClient.getListeClient(false);
			} catch (ClassNotFoundException | SQLException e) {
			}
			request.getSession(false).setAttribute("ListClient",ListClient);
			response.sendRedirect(request.getContextPath() + "/DebloquerClient.jsp");
			}
			else
			{
				
			}
			break;
		case "GererAjoutBien":
			
			Bien bien = new Bien();
			Client proprietaire = new Client();
			long age = 0;
			int idBien = Integer.parseInt(request.getParameter("idBien"));
			try {
				 bien = GestionBien.getBien(idBien);
				 proprietaire = GestionCompteClient.getClient(bien.getPseudo());
				 age = GestionCompteClient.calculerAge(proprietaire.getDateNaissance());
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			request.getSession(false).setAttribute("bien",bien);
			request.getSession(false).setAttribute("age",age);
			request.getSession(false).setAttribute("proprietaire", proprietaire);
			response.sendRedirect(request.getContextPath() + "/GererDemandeAjoutBien.jsp");
			
			
			break;
			
		case "reponseGererAjoutBien":
			String statut = request.getParameter("reponse");
			idBien = Integer.parseInt(request.getParameter("idBien"));
			bien = new Bien();
			proprietaire = new Client();
			
			try {
				 GestionBien.setStatutBien(idBien, statut);
				 ListBien = GestionBien.getListeBien("EnAttente","statut");
			} catch (ClassNotFoundException | SQLException e1) {
			}
			
			
			request.getSession(false).setAttribute("ListBien",ListBien);
			response.sendRedirect(request.getContextPath() + "/GererAjoutBien.jsp");
			
			break;

		case "ListclientBloque":
			
			try {
		    ListClient = GestionCompteClient.getListeClient(false);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("ListClient",ListClient);
			D = request.getRequestDispatcher("DebloquerClient.jsp");
			D.include(request, response);
					
			break;
			
		case "ListclientDebloque":
			
			try {
			    ListClient = GestionCompteClient.getListeClient(true);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("ListClient",ListClient);
				
				D = request.getRequestDispatcher("BloquerClient.jsp");
				D.include(request, response);
			
			break;
		case "ListBienAGerer":
			
			try {
				ListBien = GestionBien.getListeBien("EnAttente","statut");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession(false).setAttribute("ListBien",ListBien);
			D = request.getRequestDispatcher("GererAjoutBien.jsp");
			D.include(request, response);
			break;
		case "ListClientSupprimable":
			try {
				request.getSession().setAttribute("ListClientSupprimable", GestionCompteClient.getListeClientSupprimable());
			} catch (ClassNotFoundException | SQLException e1) {
			}
			response.sendRedirect(request.getContextPath() + "/SupprimerClient.jsp");
		break;
		
		case "supprimerClient":
			pseudo = request.getParameter("pseudo");
			try {
				GestionCompteClient.SupprimerClient(pseudo);
			} catch (ClassNotFoundException | SQLException e) {
			}
			try {
				request.getSession().setAttribute("ListClientSupprimable", GestionCompteClient.getListeClientSupprimable());
			} catch (ClassNotFoundException | SQLException e1) {
			}
			response.sendRedirect(request.getContextPath() + "/SupprimerClient.jsp");
				
		break;
		
		
		case "contrat":
		
		int idLocation = Integer.parseInt(request.getParameter("idLocation"));
		String url="";
			try {
				url = GestionDocument.genererContrat(GestionFacture.getFacture(idLocation));
			} catch (ClassNotFoundException | SQLException | DocumentException e) {
			}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(url);
		break;
		
		
		case "facture":
			
			idLocation = Integer.parseInt(request.getParameter("idLocation"));
			url="";
				try {
					url = GestionDocument.genererFacture(GestionFacture.getFacture(idLocation));
				} catch (ClassNotFoundException | SQLException | DocumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(url);
			break;
	
		
		case "ListLocation":
			
			
			ArrayList<Location> ListLocation = new ArrayList<Location>();
			ArrayList<Facture> ListFacture = new ArrayList<Facture>();
		    ListBien = new ArrayList<Bien>();
			try {
				ListLocation = GestionLocation.getListLocation();
			} catch (ClassNotFoundException | SQLException e) {
			}

			for (Location l : ListLocation) {
				try {
					ListFacture.add(GestionFacture.getFacture(l.getIdLocation()));
					ListBien.add(GestionBien.getBien(l.getIdBien()));
				} catch (ClassNotFoundException | SQLException e) {
				}
			}
			
			
			
				request.getSession(false).setAttribute("ListLocation", ListLocation);
			    request.getSession(false).setAttribute("ListFacture", ListFacture);
			    request.getSession(false).setAttribute("ListBien", ListBien);
			
			
			
			response.sendRedirect(request.getContextPath() + "/ListeLocation.jsp");
			
			
			
			
		break;
		
		case "GenererDocument":
		
		idLocation  = Integer.parseInt(request.getParameter("idLocation"));
			try {
				bien = GestionBien.getBien(GestionLocation.getLocation(idLocation).getIdBien());
				request.getSession(false).setAttribute("Location", GestionLocation.getLocation(idLocation));
				request.getSession(false).setAttribute("Facture", GestionFacture.getFacture(idLocation));
				request.getSession(false).setAttribute("Bien", bien);
				request.getSession(false).setAttribute("Locataire", GestionCompteClient.getClient(GestionLocation.getLocation(idLocation).getPseudo()));
				request.getSession(false).setAttribute("Proprietaire", GestionCompteClient.getClient(bien.getPseudo()));


			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		response.sendRedirect(request.getContextPath() + "/GestionContratEtFacture.jsp");
		break;
		
		case "envoyerDocument":
			
		idLocation = Integer.parseInt(request.getParameter("idLocation"));
		Location location = new Location();
		Facture facture = new Facture();
			try {
				location = GestionLocation.getLocation(idLocation);
				facture = GestionFacture.getFacture(idLocation); 
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    
		String reponse;
		
		if(facture.getDateLimite()==null)
		{
			reponse ="les documents doivent être genérés";
		}
		else
		{
			try {
			    
			    bien = GestionBien.getBien(location.getIdBien());
			    EnvoyerEmail.EnovoyerPieceJointe(GestionCompteClient.getClient(location.getPseudo()).getEmail(), "docu","message de compagnie","C:\\Users\\asus\\workspace\\agence\\WebContent\\Document\\Facture\\facture-n"+facture.getIdFacture()+".pdf"
						,"facture.pdf");
			    EnvoyerEmail.EnovoyerPieceJointe(GestionCompteClient.getClient(location.getPseudo()).getEmail(), "Contrat de location","message de compagnie","C:\\Users\\asus\\workspace\\agence\\WebContent\\Document\\Contrat\\contrat-n"+location.getIdLocation()+".pdf"
						,"contrat.pdf");
			    EnvoyerEmail.EnovoyerPieceJointe(GestionCompteClient.getClient(bien.getPseudo()).getEmail(), "Contrat de location","message de compagnie","C:\\Users\\asus\\workspace\\agence\\WebContent\\Document\\Contrat\\contrat-n"+location.getIdLocation()+".pdf"
						,"contrat.pdf");
			} catch (ClassNotFoundException | SQLException e) {
			}
			reponse="Document envoyer avec succés";
		}
		
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(reponse);
		
		break;
		
		case "ListBien":
			
			try {
				request.getSession(false).setAttribute("ListBien", GestionBien.getListeBien("", "all"));
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		response.sendRedirect(request.getContextPath() + "/SupprimerBien.jsp");
		break;
		
		case "SupprimerBien":
			
		   idBien = Integer.parseInt(request.getParameter("idBien"));
		
			
			try {		
				GestionBien.SupprimerBien(idBien);
				request.getSession(false).setAttribute("ListBien", GestionBien.getListeBien("", "all"));
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		response.sendRedirect(request.getContextPath() + "/SupprimerBien.jsp");
		break;
		
		}
	}

}
