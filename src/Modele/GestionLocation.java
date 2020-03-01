package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;


public class GestionLocation {

	public static String AjouterLocation(Location location,int prixTotal) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		Statement stt = null;
		String sql = "";
		cn = ConnectionLV.getConnection();
		
		//verifier si il a des demandes de locations
		sql="select * from location where Client_pseudo='"+location.getPseudo()+"' and Bien_idBien="+location.getIdBien()
		+" and statut='EnAttente'";	
		stt= cn.createStatement();
		ResultSet rs = stt.executeQuery(sql);
		if (rs.next()) {
		return ("Vous avez deja effectué une demande de location");
		}
		
		System.out.print("");
		//verifier que la demande  n'interfére pas avec une autre
		sql="select * from location where  Bien_idBien="+location.getIdBien()
		+" and (statut='EnCours' or statut='Accepter')"
				+" and( (( '"+new java.sql.Date(location.getDateDebut().getTime())+"'>=dateDebut and '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateFin )  or  ( '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateDebut and '"+new java.sql.Date(location.getDateFin().getTime())+"'<=dateFin))"
						+ "or  (( '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateDebut and '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateDebut )  or  ( '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateFin and '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateFin)))";	
		stt= cn.createStatement();
		rs = stt.executeQuery(sql);
		if (rs.next()) {
		return ("désolè le bien est déja loué durant cette période vérifier le calendrier de disponiblité");
		}
		
		int idLocation = 0;
		sql= "INSERT INTO location values (NULL,?,?,?,?,?)";
		st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		st.setDate(1, new java.sql.Date(location.getDateDebut().getTime()));
		st.setDate(2,new java.sql.Date(location.getDateFin().getTime()) );
		st.setString(3, location.getStatut());
		st.setString(5, location.getPseudo());
		st.setInt(4, location.getIdBien());
		st.executeUpdate();
		rs = st.getGeneratedKeys();
		if (rs.next()) {
		idLocation = rs.getInt(1);
		}
		Facture facture = new Facture(0,null,null,prixTotal,idLocation);
		GestionFacture.AjouterFacture(facture);
		
		return("demande de location enregistré avec succés veuillez attendre l'approbation du proprietaire");
		
	}
	
	public static ArrayList<Location> getListLocation(String pseudo) throws ClassNotFoundException, SQLException
	{
		ArrayList<Location> List = new ArrayList<Location>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM location WHERE Client_pseudo = '"+pseudo+"'";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		List.add(new Location(rs.getInt("idLocation"),rs.getDate("dateDebut"),rs.getDate("dateFin"),rs.getString("Statut"),rs.getInt("Bien_idBien"),rs.getString("Client_pseudo")));
		}
		return List;
	}
	
	public static ArrayList<Location> getListLocation() throws ClassNotFoundException, SQLException
	{
		ArrayList<Location> List = new ArrayList<Location>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM location";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		List.add(new Location(rs.getInt("idLocation"),rs.getDate("dateDebut"),rs.getDate("dateFin"),rs.getString("Statut"),rs.getInt("Bien_idBien"),rs.getString("Client_pseudo")));
		}
		return List;
	}
	
	public static ArrayList<Location> getListLocation(int idBien) throws ClassNotFoundException, SQLException
	{
		ArrayList<Location> List = new ArrayList<Location>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM location where Bien_idBien="+idBien;
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		List.add(new Location(rs.getInt("idLocation"),rs.getDate("dateDebut"),rs.getDate("dateFin"),rs.getString("Statut"),rs.getInt("Bien_idBien"),rs.getString("Client_pseudo")));
		}
		return List;
	}
	
	public static ArrayList<Location> getListeDemandeLocation(String Proprietaire) throws SQLException, ClassNotFoundException {
		
		ArrayList<Location> List = new ArrayList<Location>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM location l,bien b WHERE l.statut='EnAttente' and l.Bien_idBien = b.idBien and b.Client_pseudo ='"+Proprietaire+"'";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		List.add(new Location(rs.getInt("idLocation"),rs.getDate("dateDebut"),rs.getDate("dateFin"),rs.getString("Statut"),rs.getInt("Bien_idBien"),rs.getString("Client_pseudo")));
		}
		return List;
	}

	public static Location getLocation(int idLocation) throws ClassNotFoundException, SQLException {
			Location location = new Location();
			Connection cn = null;
			Statement st = null;
			String sql = "Select * FROM location	WHERE idLocation="+idLocation;
			cn = ConnectionLV.getConnection();
			st = cn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
			location.setIdLocation(idLocation);
			location.setDateDebut(rs.getDate("dateDebut"));
			location.setDateFin(rs.getDate("dateFin"));
			location.setStatut(rs.getString("Statut"));
			location.setIdBien(rs.getInt("Bien_idBien"));
			location.setPseudo(rs.getString("Client_pseudo"));
			}
			return  location;
	}
	
	public static ArrayList<Date> getListDisabledDates(int idBien) throws SQLException, ClassNotFoundException
	{
		
		ArrayList<Date> List = new ArrayList<Date>();
		Connection cn = null;
		Statement st = null;
		Statement stt=null;
		String sql = "Select dateDebut,dateFin FROM location  WHERE Bien_idBien="+idBien+" and (statut='Accepter' or statut='EnCours')";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		stt = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			Date dateDebut = rs.getDate("dateDebut");
			Date dateFin = rs.getDate("dateFin");
			sql=" select * from (select adddate('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date from "
					+ " (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t0, "
					+ " (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t1, "
					+ " (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t2,"
					+ " (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t3, "
					+ " (select 0 i union select 1 union select 2 union select 3 union select 4 union select 5 union select 6 union select 7 union select 8 union select 9) t4) v "
					+ " where selected_date between '"+new java.sql.Date(dateDebut.getTime())+"' and '"+new java.sql.Date(dateFin.getTime())+"'";
			ResultSet rs2 = stt.executeQuery(sql);
			while(rs2.next())
			{
			Date x = rs2.getDate("selected_date");
			List.add(x);
			}
		}		
		return List;
	}
	
	// gerer une demande de location
		public static boolean setStatutLocation(int idLocation, String Statut) throws ClassNotFoundException, SQLException {
			Connection cn = null;
			Statement st = null;
			String sql = "UPDATE location  SET statut = '" + Statut + "' WHERE idLocation = " + idLocation;
			cn = ConnectionLV.getConnection();
			st = cn.createStatement();
			int count = st.executeUpdate(sql);
			
			
			//refuser les autres demandes de location qui interféres avec cette location
			if(Statut.equals("Accepter"))
			{		
			Location location = getLocation(idLocation);
			sql="Update location set statut='Refuser' where  Bien_idBien="+location.getIdBien()
			+" and statut='EnAttente' "
					+" and( (( '"+new java.sql.Date(location.getDateDebut().getTime())+"'>=dateDebut and '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateFin )  or  ( '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateDebut and '"+new java.sql.Date(location.getDateFin().getTime())+"'<=dateFin))"
							+ "or  (( '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateDebut and '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateDebut )  or  ( '"+new java.sql.Date(location.getDateDebut().getTime())+"'<=dateFin and '"+new java.sql.Date(location.getDateFin().getTime())+"'>=dateFin)))";	
			count = st.executeUpdate(sql);
			}
			
			return (count > 0);
	}
		
		public static long getDifferenceDays(Date d1, Date d2) {
		    long diff = d2.getTime() - d1.getTime();
		    return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		}
	
	
}
	
