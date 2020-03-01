package Controle;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Modele.GestionBien;
import Modele.GestionCompteClient;
import Modele.GestionFacture;
import Modele.GestionLocation;
import Modele.Location;
import Modele.Avis;
import Modele.Bien;
import Modele.Client;
import Modele.Facture;
import Modele.GestionAvis;

/**
 * Servlet implementation class LocataireServlet
 */
@WebServlet("/LocataireServlet")
public class LocataireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LocataireServlet() {
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
		String message ="";
		String pseudo;
		int idBien;
		switch (hidden) {

		case "LouerBien":

			int nbMois = Integer.parseInt(request.getParameter("nbMois"));
			String DateDebut = request.getParameter("dateDebut");
			System.out.print(DateDebut);
			final java.util.Calendar cal1 = GregorianCalendar.getInstance();
			DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
			Date dateDebut = null;
			try {
				dateDebut = format.parse(DateDebut);
				cal1.setTime(dateDebut);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			cal1.add(GregorianCalendar.MONTH, nbMois);
			Date dateFin = cal1.getTime();
			Bien bien = (Bien) getServletContext().getAttribute("bien"); 
			pseudo = (String) request.getSession(false).getAttribute("pseudo");
			Location location = new Location(0, dateDebut, dateFin, "EnAttente", bien.getIdBien(), pseudo);
			try {
				message = GestionLocation.AjouterLocation(location,nbMois*bien.getPrixMensuelle());
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(message);
			
			break;

		case "MesReservations":

			HttpSession session = request.getSession(false);
			ArrayList<Location> listLocation = new ArrayList<Location>();
			ArrayList<String> listTitre = new ArrayList<String>();
			ArrayList<Facture> listFacture = new ArrayList<Facture>();
			ArrayList<Long> listJoursRestants = new ArrayList<Long>();
			try {
				listLocation = GestionLocation.getListLocation((String) session.getAttribute("pseudo"));
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			for (Location l : listLocation) {
				try {
					listTitre.add(GestionBien.getBien(l.getIdBien()).getTitre());
					listFacture.add(GestionFacture.getFacture(l.getIdLocation()));
					listJoursRestants.add(GestionLocation.getDifferenceDays(new Date(), l.getDateFin()));
				} catch (ClassNotFoundException | SQLException e) {
				}
			}

			session.setAttribute("listJoursRestants", listJoursRestants);
			session.setAttribute("listFacture", listFacture);
			session.setAttribute("listLocation", listLocation);
			session.setAttribute("listTitre", listTitre);
			response.sendRedirect(request.getContextPath() + "/MesReservations.jsp");
			break;

		case "AjouterAvis":

			int idAvis = 0;
			Date dateAvis = new Date();
			bien = (Bien) getServletContext().getAttribute("bien");
			idBien = bien.getIdBien();
			pseudo = (String) request.getSession(false).getAttribute("pseudo");
			int note = Integer.parseInt(request.getParameter("note"));
			String Message = request.getParameter("comment");
			Avis avis = new Avis(idAvis, note, Message, dateAvis, pseudo, idBien);
			
			try {
				GestionAvis.AjouterAvis(avis);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
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
