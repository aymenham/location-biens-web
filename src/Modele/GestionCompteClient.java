package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;


import org.apache.commons.lang.RandomStringUtils;

public class GestionCompteClient {

	public static boolean Inscription(Client client) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "INSERT INTO client values (?,?,?,?,?,?,?,?,?)";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1, client.getPseudo());
		st.setString(2, client.getNom());
		st.setString(3, client.getPrenom());
		st.setString(4, client.getDateNaissance());
		st.setString(5, client.getAdresse());
		st.setString(6, client.getEmail());
		st.setString(7, client.getMdp());
		st.setInt(8, client.getNumTel());
		st.setBoolean(9, client.getStatut());
		// executer la requête
		int count = st.executeUpdate();
		return (count > 0);
	}

	public static boolean SetStatutClient(String pseudo, boolean Statut) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		int statut = 0;
		if (Statut){
		 statut = 1;}
		String sql = "UPDATE client  SET statut = ? WHERE pseudo = ?";
		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setInt(1,statut);
		st.setString(2, pseudo);
		int count = st.executeUpdate();
		return (count > 0);
	}
	
    
	public static boolean SupprimerClient(String pseudo) throws ClassNotFoundException, SQLException
	{
		Connection cn = null;
		Statement st = null;
		String sql = "DELETE FROM Client	WHERE pseudo = '"+pseudo+"'";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		int count = st.executeUpdate(sql);
		return (count > 0);
		
	}
	
	public static boolean Authentification(String login, String mdp) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "Select * from client where email= ? or pseudo = ? and password= ? ";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1, login);
		st.setString(2, login);
		st.setString(3, mdp);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
	    return true;
		}
		return false;
	}
	
	public static boolean EditerProfil(Client client,String AncienPseudo) throws ClassNotFoundException, SQLException
	{
		
		Connection cn = null;
		PreparedStatement st = null;
		String x ="";
		
		if(!client.getMdp().equals(""))
		{
			x =", password = ? ";
		}
		String sql = "UPDATE client  SET nom = ? ,prenom = ? ,dateNaissance = ? ,adresse = ? ,email =  ? ,pseudo = ? "
				+ ",numTel = ? "+x+ "  WHERE pseudo = '"+AncienPseudo+"'";
		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1,client.getNom());
		st.setString(2, client.getPrenom());
		st.setString(3, client.getDateNaissance());
		st.setString(4, client.getAdresse());
		st.setString(5, client.getEmail());
		st.setString(6, client.getPseudo());
		st.setInt(7, client.getNumTel());
		if(!client.getMdp().equals(""))
		{
			st.setString(8, client.getMdp());
		}
		
		int count = st.executeUpdate();
		return (count > 0);
	}
	
	public static ArrayList<Client> getListeClient(boolean statut) throws ClassNotFoundException, SQLException
	{
		int Statut=0;
		ArrayList<Client> List = new ArrayList<Client>();
		if(statut){Statut=1;}
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM client WHERE statut = "+Statut;
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			List.add(getClient(rs.getString("pseudo")));
		}
		return List;
	}
	public static ArrayList<Client> getListeClientSupprimable() throws ClassNotFoundException, SQLException
	{
		
		ArrayList<Client> List = new ArrayList<Client>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "select * from client"+
         " where pseudo NOT IN ( select Client_pseudo from bien where statut='Accepter' or statut='EnLocation' )"+
         " and pseudo NOT IN ( select Client_pseudo from location where statut='Termine' or statut='Accepter' or statut='EnCours');";
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			List.add(getClient(rs.getString("pseudo")));
		}
		return List;
	}
	
	
	public static boolean verifierEmail(String email) throws ClassNotFoundException, SQLException
	{
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "Select * from client where email= ? ";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1,email);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
	    return true;
		}
		return false;
	}
	
	public static boolean verifierPseudo(String pseudo) throws ClassNotFoundException, SQLException
	{
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "Select * from client where pseudo= ? ";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1,pseudo);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
	    return true;
		}
		return false;
	}
	
	public static boolean EnvoyerNouveauMdp(String email) throws ClassNotFoundException, SQLException
	{
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "UPDATE client  SET password = ? WHERE email = ?";
		
		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		//generate random password with the characters above
		String pwd = RandomStringUtils.random( 15, characters );
		st.setString(1,pwd);
		st.setString(2, email);
		int count = st.executeUpdate();
		boolean x = EnvoyerEmail.Envoyer(email,"nouveau mot de passe","voici votre nouveau mot de passe :"+ pwd);
		
		return (count > 0||x);
	}
	
	public static Client getClient(String login) throws ClassNotFoundException, SQLException
	{
		String pseudo = null;
		String nom = null;
		String prenom = null;
		String adresse = null;
		String email = null;
		String mdp = null;
		String dateNaissance = null;
		int numTel = 0;
		boolean statut = false;
		Connection cn = null;
		Statement st = null;
		String sql = "Select * FROM client	WHERE email = '"+login+"' or pseudo ='"+login+"'";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			 pseudo = rs.getString("pseudo");
			 nom = rs.getString("nom");
			 prenom = rs.getString("prenom");
			 adresse = rs.getString("adresse");
			 email = rs.getString("email");
			 mdp = "******";
			 dateNaissance = rs.getString("dateNaissance");
			 numTel = rs.getInt("numTel");
			 statut = rs.getBoolean("statut");
		}
		return new Client (pseudo,nom,prenom,adresse,email,mdp,dateNaissance,numTel,statut);
	}
	
	public static long calculerAge(String date)
	{
		 DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		 LocalDate dateNaissance  = LocalDate.parse(date, formatter);
		 LocalDate now = LocalDate.now();
		 long years = ChronoUnit.YEARS.between(dateNaissance ,now);
		 return years;
	}
}
