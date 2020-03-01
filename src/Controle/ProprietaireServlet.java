package Controle;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import Modele.Bien;
import Modele.Client;
import Modele.Facture;
import Modele.GestionBien;
import Modele.GestionCompteClient;
import Modele.GestionFacture;
import Modele.GestionLocation;
import Modele.Location;

/**
 * Servlet implementation class ProprietaireServlet
 */
@WebServlet("/ProprietaireServlet")
@MultipartConfig
public class ProprietaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProprietaireServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String hidden = request.getParameter("hidden");
		Boolean x = false;
		HttpSession session;
		int idBien;
		switch (hidden) {

		case "AjouterBien":

			BufferedImage image;
			Bien bien = new Bien();
			String type = request.getParameter("type");
			idBien = 0;
			int prixMensuelle = Integer.parseInt(request.getParameter("prixMensuelle"));
			String wilaya = request.getParameter("wilaya");
			String adresse = request.getParameter("adresse");
			Object actePropriete;
			double surface = Double.parseDouble(request.getParameter("surface"));
			String titre = request.getParameter("titre");
			String description = request.getParameter("description");
			String statut = "EnAttente";
			String pseudo = (String) request.getSession(false).getAttribute("pseudo");
			ArrayList<Object> ListPhoto = new ArrayList<Object>();
			String typeTerrain = request.getParameter("typeTerrain");
			int nbChambre;
			int etage;
			boolean jardin = Boolean.parseBoolean(request.getParameter("jardin"));
			boolean piscine = Boolean.parseBoolean(request.getParameter("piscine"));
			boolean garage = Boolean.parseBoolean(request.getParameter("garage"));

			// Retrieves <input type="file" name="actePropriete">
			Part filePart0 = request.getPart("actePropriete");
			InputStream fileContent0 = filePart0.getInputStream();
			actePropriete = ImageIO.read(fileContent0);

			// Retrieves <input type="file" name="photoBien" multiple="true">
			List<Part> fileParts = request.getParts().stream().filter(part -> "photoBien".equals(part.getName()))
					.collect(Collectors.toList());
			for (Part filePart : fileParts) {
				InputStream fileContent = filePart.getInputStream();
				image = ImageIO.read(fileContent);
				ListPhoto.add(image);
			}

			switch (type) {
			case "garage":
				bien = new Bien(idBien, prixMensuelle, wilaya, adresse, actePropriete, surface, titre, description,
						statut, pseudo, ListPhoto);
				break;

			case "terrain":

				bien = new Bien(idBien, prixMensuelle, wilaya, adresse, actePropriete, surface, typeTerrain, titre,
						description, statut, pseudo, ListPhoto);
				break;

			case "maison":
				etage = Integer.parseInt(request.getParameter("numeroEtage"));
				nbChambre = Integer.parseInt(request.getParameter("nbChambre2"));
				bien = new Bien(idBien, prixMensuelle, wilaya, adresse, actePropriete, surface, etage, nbChambre,
						garage, piscine, jardin, titre, description, statut, pseudo, ListPhoto);
				break;

			case "appartement":
				nbChambre = Integer.parseInt(request.getParameter("nbChambre"));
				etage = Integer.parseInt(request.getParameter("etage"));
				bien = new Bien(idBien, prixMensuelle, wilaya, adresse, actePropriete, surface, etage, nbChambre, titre,
						description, statut, pseudo, ListPhoto);
				break;
			}

			try {
				x = GestionBien.AjouterBien(bien);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (x) {
				request.setAttribute("reponse", "succes");
				RequestDispatcher rd = request.getRequestDispatcher("/AjouterBien.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("reponse", "echec");
				RequestDispatcher rd = request.getRequestDispatcher("/AjouterBien.jsp");
				rd.forward(request, response);
			}

			break;

		case "MesBiens":

			session = request.getSession(false);
			try {
				session.setAttribute("listBien",
						GestionBien.getListeBien((String) session.getAttribute("pseudo"), "pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
			}
			response.sendRedirect(request.getContextPath() + "/MesBiens.jsp");

			break;

		case "ModifierPrix":

			idBien = Integer.parseInt(request.getParameter("idBien"));
			int NouveauPrix = Integer.parseInt(request.getParameter("NouveauPrix"));
			if (NouveauPrix >= 5000 && NouveauPrix<=100000) {
				ArrayList<Bien> listBien = (ArrayList<Bien>) request.getSession(false).getAttribute("listBien");
				for (Bien b : listBien) {
					if (b.getIdBien() == idBien) {
						b.setPrixMensuelle(NouveauPrix);
						break;
					}
				}
				request.getSession(false).setAttribute("listBien", listBien);
				try {
					x = GestionBien.ModifierPrix(idBien, NouveauPrix);
				} catch (ClassNotFoundException | SQLException e1) {
				}
			} else {
				try {
					NouveauPrix = GestionBien.getBien(idBien).getPrixMensuelle();
				} catch (ClassNotFoundException | SQLException e) {
				}
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(NouveauPrix);

			break;

		case "Supprimer":

			idBien = Integer.parseInt(request.getParameter("idBien"));
			try {
				GestionBien.SupprimerBien(idBien);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(
					"<i class='fas fa-check pr-2' style='font-size: 26px; color: red; position: relative; top: 4px;'></i>");

			break;

		case "ListeDemandeLocation":

			session = request.getSession(false);
			ArrayList<Location> listLocation = new ArrayList<Location>();
			ArrayList<String> listTitre = new ArrayList<String>();
			ArrayList<Facture> listFacture = new ArrayList<Facture>();
			try {
				listLocation = GestionLocation.getListeDemandeLocation((String) session.getAttribute("pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
			}

			for (Location l : listLocation) {
				try {
					listTitre.add(GestionBien.getBien(l.getIdBien()).getTitre());
					listFacture.add(GestionFacture.getFacture(l.getIdLocation()));
				} catch (ClassNotFoundException | SQLException e) {
				}
			}

			session.setAttribute("listDemandeLocation", listLocation);
			session.setAttribute("listTitre", listTitre);
			session.setAttribute("listFacture", listFacture);
			response.sendRedirect(request.getContextPath() + "/GestionDemandeLocation.jsp");
			break;

		case "ConsulterDemandeLocation":
			int idLocation = Integer.parseInt(request.getParameter("idLocation"));
			session = request.getSession(false);

			try {
				Location location = GestionLocation.getLocation(idLocation);
				session.setAttribute("location", location);
				session.setAttribute("bien", GestionBien.getBien(location.getIdBien()));
				Client locataire = GestionCompteClient.getClient(location.getPseudo());
				session.setAttribute("locataire", locataire);
				session.setAttribute("age", GestionCompteClient.calculerAge(locataire.getDateNaissance()));
				session.setAttribute("prixTotal", GestionFacture.getFacture(idLocation).getPrixTotale());
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			response.sendRedirect(request.getContextPath() + "/DetailsLocation.jsp");
			break;

		case "choixDemandeLocation":
			String reponse = request.getParameter("reponse");
			idLocation = Integer.parseInt(request.getParameter("idLocation"));
			session = request.getSession(false);
			listLocation = new ArrayList<Location>();
			listTitre = new ArrayList<String>();
			listFacture = new ArrayList<Facture>();
			try {
				GestionLocation.setStatutLocation(idLocation, reponse);
				listLocation = GestionLocation.getListeDemandeLocation((String) session.getAttribute("pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
			}

			for (Location l : listLocation) {
				try {
					listTitre.add(GestionBien.getBien(l.getIdBien()).getTitre());
					listFacture.add(GestionFacture.getFacture(l.getIdLocation()));
				} catch (ClassNotFoundException | SQLException e) {
				}
			}

			session.setAttribute("listDemandeLocation", listLocation);
			session.setAttribute("listTitre", listTitre);
			session.setAttribute("listFacture", listFacture);
			request.getRequestDispatcher("/GestionDemandeLocation.jsp").forward(request, response);
			break;
			
		case "ListLocation":
			
		idBien = Integer.parseInt(request.getParameter("idBien"));
		
		
		session = request.getSession(false);
		listLocation = new ArrayList<Location>();
	    listFacture = new ArrayList<Facture>();
		ArrayList<Long> listJoursRestants = new ArrayList<Long>();
		titre = "titre";
		try {
			listLocation = GestionLocation.getListLocation(idBien);
			titre = GestionBien.getBien(idBien).getTitre();
		} catch (ClassNotFoundException | SQLException e) {
		}
       
		for (Location l : listLocation) {
			try {
				listFacture.add(GestionFacture.getFacture(l.getIdLocation()));
				listJoursRestants.add(GestionLocation.getDifferenceDays(new Date(), l.getDateFin()));
			} catch (ClassNotFoundException | SQLException e) {
			}
		}
		session.setAttribute("listJoursRestants", listJoursRestants);
		session.setAttribute("listFacture", listFacture);
		session.setAttribute("listLocation", listLocation);
		session.setAttribute("titre", titre);
		response.sendRedirect(request.getContextPath() + "/ReservationsBien.jsp");
		
		break;
		}
	}

}
