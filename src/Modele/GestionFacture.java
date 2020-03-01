package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class GestionFacture {

	
	public static boolean AjouterFacture(Facture facture) throws SQLException, ClassNotFoundException
	{
			Connection cn = null;
			PreparedStatement st = null;
			String sql = "INSERT INTO facture values (NULL,NULL,NULL,?,?)";
			
			cn = ConnectionLV.getConnection();
			st = cn.prepareStatement(sql);
			//st.setDate(1, new java.sql.Date(facture.getDateFacture().getTime()));
			//st.setDate(2,new java.sql.Date(facture.getDateLimite().getTime()) );
			st.setInt(1, facture.getPrixTotale());
			st.setInt(2, facture.getIdLocation());
			int count = st.executeUpdate();
			return(count>0);
			
		
	}
	
	public static boolean UpdateFacture(Facture facture) throws SQLException, ClassNotFoundException
	{
		Connection cn = null;
		Statement st = null;
		String sql = "UPDATE Facture set dateLimite='"+ new java.sql.Date(facture.getDateLimite().getTime())+"' ,"
				+ " dateFacture ='"+ new java.sql.Date(facture.getDateFacture().getTime())+"' where idFacture="+facture.getIdFacture();
		
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		int count = st.executeUpdate(sql);
		return(count>0);
	}

	public static double calculerRecette(String date) throws ClassNotFoundException, SQLException {
		
		double total=0;
		Connection cn = null;
		Statement st = null;
		String sql = "Select SUM(prixTotale) as total FROM facture WHERE  dateFacture = '" +date+"' and dateFacture IS NOT NULL";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		total = (rs.getInt("total")*8.33)/100;
		}
		return total;
	}

	public static double calculerRecette(String date1, String date2) throws ClassNotFoundException, SQLException {
		double total=0;
		Connection cn = null;
		Statement st = null;
		String sql = "Select SUM(prixTotale) as total FROM facture WHERE  dateFacture>= '"+date1+"' and dateFacture<= '"+date2+"' and dateFacture IS NOT NULL";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		total =	 (rs.getInt("total")*8.33)/100;
		}
		return total;
	}
	
	public static Facture getFacture(int idLocation) throws SQLException, ClassNotFoundException
	{
		Facture facture = new Facture();
		Connection cn = null;
		Statement st = null;
		String sql = "Select * FROM facture	WHERE Location_idLocation="+idLocation;
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
     	facture.setIdLocation(idLocation);
		facture.setDateFacture(rs.getDate("dateFacture"));
		facture.setDateLimite(rs.getDate("dateLimite"));
		facture.setIdFacture(rs.getInt("idFacture"));
		facture.setPrixTotale(rs.getInt("PrixTotale"));
		}
		return  facture;
	}
	
}
