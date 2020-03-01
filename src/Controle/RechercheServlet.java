package Controle;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modele.Bien;
import Modele.GestionBien;

/**
 * Servlet implementation class RechercheServlet
 */
@WebServlet("/RechercheServlet")
public class RechercheServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RechercheServlet() {
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
		doGet(request, response);
		
	    
	    String type = request.getParameter("type");
		int minPrixMensuelle = Integer.parseInt(request.getParameter("minPrixMensuelle"));
		int maxPrixMensuelle = Integer.parseInt(request.getParameter("maxPrixMensuelle"));
		String wilaya = request.getParameter("wilaya");
	    double minSurface = Double.parseDouble(request.getParameter("minSurface"));
	    double maxSurface = Double.parseDouble(request.getParameter("maxSurface"));	    
	    String typeTerrain = request.getParameter("typeTerrain");
	    
	    int nbChambre = -1;
	    int etage = -1;
	    if(request.getParameter("nbChambre")!="")
	    {
	    nbChambre= Integer.parseInt(request.getParameter("nbChambre"));
	    }
	    if(request.getParameter("etage")!="")
	    {
	    etage= Integer.parseInt(request.getParameter("etage"));
	    }
	    
	    int nbChambre2 = -1;
	    int nombreEtage = -1;
	    if(request.getParameter("nbChambre2")!="")
	    {
	    nbChambre2= Integer.parseInt(request.getParameter("nbChambre2"));
	    }
	    if(request.getParameter("nombreEtage")!="")
	    {
	    nombreEtage= Integer.parseInt(request.getParameter("nombreEtage"));
	    }
	    
	    
	    
	    boolean jardin = Boolean.parseBoolean(request.getParameter("jardin"));
	    System.out.println(jardin);
	    boolean piscine = Boolean.parseBoolean(request.getParameter("piscine"));
	    System.out.println(piscine);
	    boolean garage = Boolean.parseBoolean(request.getParameter("garage"));
	    System.out.println(garage);
	    ArrayList<Bien> listBien = new ArrayList<Bien>();
	    
	    try {
			listBien = GestionBien.RechercherBien(type,wilaya,minPrixMensuelle,maxPrixMensuelle,minSurface,maxSurface,typeTerrain
					,nbChambre,etage,nbChambre2,nombreEtage,jardin,piscine,garage);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    request.setCharacterEncoding("utf-8");
	    request.setAttribute("listBien", listBien);
	    request.getRequestDispatcher("/ListeBiens.jsp").forward(request, response);
	    
	   
	}

}
