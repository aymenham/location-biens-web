package Modele;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class GestionBien {

	public static Bien getBien(int idBien) throws ClassNotFoundException, SQLException {
		Bien bien = new Bien();
		int prixMensuelle = 0;
		String wilaya = null;
		String adresse = null;
		String actePropriete = null;
		double surface = 0;
		String titre = null;
		String description = null;
		String statut = null;
		String pseudo = null;
		ArrayList<Object> ListPhoto = new ArrayList<Object>();
		Connection cn = null;
		Statement st = null;
		String sql = "Select * FROM Bien	WHERE idBien = " + idBien;
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			prixMensuelle = rs.getInt("PrixMensuelle");
			wilaya = rs.getString("wilaya");
			adresse = rs.getString("adresse");
			actePropriete = rs.getString("actePropriete");
			surface = rs.getDouble("surface");
			titre = rs.getString("titre");
			description = rs.getString("description");
			statut = rs.getString("statut");
			pseudo = rs.getString("Client_pseudo");
		}

		sql = "Select * FROM PhotoBien WHERE Bien_idBien = " + idBien;
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			String x = rs.getString("url");
			ListPhoto.add(x);
		}

		// chercher dans maison
		sql = "Select * FROM maison WHERE Bien_idBien = " + idBien;
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			int etage = rs.getInt("NombreEtage");
            int nbChambre = rs.getInt("NombreChambre");
            boolean garage = rs.getBoolean("garage");
            boolean piscine = rs.getBoolean("piscine");
            boolean jardin = rs.getBoolean("jardin");
			bien = new Bien(idBien, prixMensuelle, wilaya, adresse, actePropriete, surface, etage, nbChambre, garage,
					piscine, jardin, titre,description, statut, pseudo, ListPhoto);
		}

		// chercher dans appartement
		sql = "Select * FROM appartement WHERE Bien_idBien = " + idBien;
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			int etage = rs.getInt("etage");
            int nbChambre = rs.getInt("NombreChambre");
			 bien = new Bien( idBien,  prixMensuelle, wilaya,  adresse,  actePropriete,  surface
						, etage, nbChambre, titre,description,  statut,  pseudo,  ListPhoto);
		}
		// chercher dans garage
		sql = "Select * FROM garage WHERE Bien_idBien = " + idBien;
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			bien = new Bien( idBien,  prixMensuelle,  wilaya,  adresse,  actePropriete,  surface,
					titre, description, statut,  pseudo, ListPhoto);
		}

		// chercher dans terrain
		sql = "Select * FROM terrain WHERE Bien_idBien = " + idBien;
		st = cn.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			String typeTerrain = rs.getString("typeTerrain");
			 bien = new Bien( idBien,  prixMensuelle,  wilaya,  adresse,  actePropriete, surface
		 				, typeTerrain,titre, description,  statut,  pseudo, ListPhoto);
		}

		return bien;
	}

	// gerer demande d'ajout d'un bien
	public static boolean setStatutBien(int idBien, String Statut) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		Statement st = null;
		
		String sql = "UPDATE bien  SET statut = '" + Statut + "' WHERE idBien = " + idBien;
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		int count = st.executeUpdate(sql);
		return (count > 0);
	}

	public static boolean SupprimerBien(int idBien) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		Statement st = null;
		String Statut = getBien(idBien).getStatut();
		Boolean x = false;
		if(Statut.equals("EnAttente")||Statut.equals("Refuser"))
		{
		String sql = "DELETE FROM Bien	WHERE idBien = " + idBien;
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		int count = st.executeUpdate(sql);
		x = (count > 0);
		}
		else
		{
		x = setStatutBien(idBien,"Supprimer");
		}
		
    return x;
		
	}

	public static boolean AjouterBien(Bien bien) throws ClassNotFoundException, SQLException, IOException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "INSERT INTO bien values (NULL,?,?,?,?,?,?,?,?,?)";
		int generatedKey = 0;
		String url;
		int i = 0;
		boolean y;

		cn = ConnectionLV.getConnection();
		cn.setAutoCommit(false);
		st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		st.setInt(1, bien.getPrixMensuelle());
		st.setString(2, bien.getWilaya());
		st.setString(3, bien.getAdresse());
		st.setString(4, "null");
		st.setDouble(5, bien.getSurface());
		st.setString(6, bien.getTitre());
		st.setString(7, bien.getDescription());
		st.setString(8, bien.getStatut());
		st.setString(9, bien.getPseudo());
		// executer la requête
		int count = st.executeUpdate();
		y = (count > 0);
		ResultSet rs = st.getGeneratedKeys();
		if (rs.next()) {
			generatedKey = rs.getInt(1);
		}

		switch (bien.getType()) {
		case "terrain":
			sql = "INSERT INTO terrain values(?,?)";
			st = cn.prepareStatement(sql);
			st.setString(2, bien.getTypeTerrain());
			break;
		case "garage":
			sql = "INSERT INTO garage values(?)";
			st = cn.prepareStatement(sql);
			break;
		case "maison":
			sql = "INSERT INTO maison values(?,?,?,?,?,?)";
			st = cn.prepareStatement(sql);
			st.setInt(2, bien.getNbChambre());
			st.setInt(3, bien.getEtage());
			st.setBoolean(4, bien.isJardin());
			st.setBoolean(5, bien.isPiscine());
			st.setBoolean(6, bien.isGarage());
			break;
		case "appartement":
			sql = "INSERT INTO appartement values(?,?,?)";
			st = cn.prepareStatement(sql);
			st.setInt(2, bien.getEtage());
			st.setInt(3, bien.getNbChambre());
			break;

		}
		st.setInt(1, generatedKey);
		count = st.executeUpdate();
		y = y || (count > 0);

		//url = "C:\\Users\\asus\\workspace\\agence\\WebContent\\images\\acteProprietes\\"
		url = "C:\\Users\\asus\\workspace\\agence\\WebContent\\images\\acteProprietes\\"
				+ generatedKey + ".jpg";
		//"http:\\localhost:8080\\agence\\images\\actePorpriete"
		ImageIO.write((BufferedImage) bien.getActePropriete(), "jpg", new File(url));
		
		
		
		url ="images/acteProprietes/"+generatedKey+".jpg";
		Statement stt;
	    sql = "UPDATE bien  SET actePropriete = '"+url+"' WHERE idBien = " + generatedKey;
		stt = cn.createStatement();
		stt.executeUpdate(sql);
		

		for (Object x : bien.getListPhoto()) {
			url ="C:\\Users\\asus\\workspace\\agence\\WebContent\\images\\"+ generatedKey + "-" + i+".jpg";
			ImageIO.write((BufferedImage) x, "jpg",
					new File(url));
			url ="images/"+generatedKey+"-"+i+".jpg";
			sql = "INSERT INTO photoBien values(?,?)";
			st = cn.prepareStatement(sql);
			st.setString(1, url);
			st.setInt(2, generatedKey);
			count = st.executeUpdate();
			y = y || (count > 0);
			i++;
		}

		cn.commit();
		return (y);
	}

	public static boolean ModifierPrix(int idBien, int prixMensuelle) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		Statement st = null;
		String sql = "UPDATE bien  SET prixMensuelle = " + prixMensuelle + " WHERE idBien = " + idBien;

		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		int count = st.executeUpdate(sql);
		return (count > 0);

	}

	public static ArrayList<Bien> getListeBien(String valeur,String parametre) throws SQLException, ClassNotFoundException {

		Bien bien = new Bien();
		int idBien;
		ArrayList<Bien> List = new ArrayList<Bien>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql ="";
		
		if(parametre.equals("pseudo"));
		{
		sql = "SELECT idBien FROM bien WHERE Client_pseudo = '" + valeur + "'";
		}
		if(parametre.equals("statut"))
		{
		sql = "SELECT idBien FROM bien WHERE statut = '" + valeur + "'";
		}
		if(parametre.equals("all"))
		{
		sql = "SELECT idBien FROM bien";
		}
		
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			idBien = rs.getInt("idBien");
			bien = GestionBien.getBien(idBien);
			List.add(bien);
		}
		return List;
	}

	public static ArrayList<Bien> RechercherBien(String type, String wilaya, int minPrixMensuelle, int maxPrixMensuelle,
			double minSurface, double maxSurface, String typeTerrain, int nbChambre, int etage, int nbChambre2, int nombreEtage, boolean jardin,
			boolean piscine, boolean garage) throws ClassNotFoundException, SQLException {
		
		Connection cn = null;
		Statement st = null;
		String sql = "Select idBien from bien,"+type+"  where Bien.idBien="+type+".Bien_idBien  "
				+ "and prixMensuelle>="+minPrixMensuelle+" and prixMensuelle<="+maxPrixMensuelle
				+" and surface>="+minSurface+" and surface<="+maxSurface+" and (statut='Accepter' or statut='EnLocation')";
		
		if(wilaya!=null)
		{
			sql = sql + " and wilaya='"+wilaya+"'";
		}
		
		
		switch (type) {
		case "terrain":
		
		if(typeTerrain!=null)
		{
			sql = sql + " and typeTerrain='"+typeTerrain+"'";
		}

		break;
		
		case "maison":
		
			if(nombreEtage!=-1)
			{
			sql = sql + " and nombreEtage="+nombreEtage;
			}
			if(nbChambre2!=-1)
			{
			sql = sql +" and nombreChambre="+nbChambre2;
			}
			if(piscine==true)
			{
			sql = sql +" and piscine = 1"	;
			}
			if(garage==true)
			{
			sql = sql +" and garage =  1"	;
			}
			if(jardin==true)
			{
			sql = sql +" and jardin =  1"	;
			}
			
		
		break;
		
		case "appartement":
		
			if(etage!=-1)
			{
			sql = sql + " and etage="+etage;
			}
			
			if(nbChambre!=-1)
			{
			sql = sql +" and nombreChambre="+nbChambre;
			}
	
		break;

		}
		
		ArrayList <Bien> listBien = new ArrayList<Bien>();
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		  listBien.add(GestionBien.getBien(rs.getInt("idBien")));
		  System.out.println(rs.getInt("idBien"));
		}
		

		return (listBien);
	}

}
