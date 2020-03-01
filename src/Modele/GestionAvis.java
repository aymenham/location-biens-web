package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class GestionAvis {

	public static void AjouterAvis(Avis avis) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql ="";
		cn = ConnectionLV.getConnection();
		if (AvisExiste(avis) == true) {
			sql = "UPDATE avis  SET dateAvis = ? ,note = ? ,message = ? where Bien_idBien=" + avis.getIdBien() + " and Client_pseudo='"+ avis.getPseudo() + "'";
			st = cn.prepareStatement(sql);
			st.setDate(1,new java.sql.Date(avis.getDateAvis().getTime()));
			st.setFloat(2, avis.getNote());
			st.setString(3, avis.getMessage());
			st.executeUpdate();
		} else {
			sql = "INSERT INTO avis values (null,?,?,?,?,?)";
			st = cn.prepareStatement(sql);
			st.setFloat(1, avis.getNote());
			st.setString(2, avis.getMessage());
			st.setDate(3, new java.sql.Date(avis.getDateAvis().getTime()));
			st.setString(4, avis.getPseudo());
			st.setInt(5, avis.getIdBien());
			// executer la requête
			st.executeUpdate();
		}
	}

	public static boolean AvisExiste(Avis avis) throws SQLException, ClassNotFoundException {
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "select * from avis where Bien_idBien=" + avis.getIdBien() + " and Client_pseudo='"
				+ avis.getPseudo() + "'";
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		if (rs.next()) {
			return true;
		}
		return false;
	}

	public static ArrayList<Avis> getListAvisBien(int idBien) throws ClassNotFoundException, SQLException {
		float note = 0;
		String message = null;
		Date dateAvis = null;
		String pseudo = null;
		int idAvis = 0;
		ArrayList<Avis> list = new ArrayList<Avis>();
		Connection cn = null;
		Statement st = null;
		String sql = "Select * FROM Avis	WHERE  Bien_idBien= " + idBien;
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			idAvis = rs.getInt("idAvis");
			pseudo = rs.getString("Client_pseudo");
			message = rs.getString("message");
			note = rs.getFloat("note");
			dateAvis = rs.getDate("dateAvis");
			list.add(new Avis(idAvis, note, message, dateAvis, pseudo, idBien));
		}

		return list;
	}

}
