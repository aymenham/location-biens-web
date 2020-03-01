package Modele;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class GestionCompteAgent {

	public static boolean AjouterAgent(Agent agent) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "INSERT INTO agent values (?,?,?,?,?,?,?,?)";

		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.prepareStatement(sql);
		st.setString(1, agent.getLogin());
		st.setString(2, agent.getNom());
		st.setString(3, agent.getPrenom());
		st.setString(4, agent.getDateNaissance());
		st.setString(5, agent.getAdresse());
		st.setString(6, agent.getMdp());
		st.setInt(7, agent.getNumTel());
		st.setBoolean(8, agent.getGrade());
		System.out.println("Done");
		// executer la requête
		int count = st.executeUpdate();
		return (count > 0);
	}

	public static void SupprimerAgent(String login) throws SQLException, ClassNotFoundException {
		Connection cn = null;
		java.sql.Statement st = null;
		cn = ConnectionLV.getConnection();
			
		st = cn.createStatement();
		String sql = "DELETE FROM agent WHERE login = '" + login + "'";
		st.executeUpdate(sql);

	}

	public static boolean Authentification(String login, String mdp) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "Select * from agent where login = ? and password= ? ";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1, login);
		st.setString(2, mdp);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
	    return true;
		}
		return false;
	}
	
	public static Agent getAgent(String login) throws ClassNotFoundException, SQLException
	{
		Connection cn = null;
		Statement st = null;
		Agent agent = new Agent();
		String sql = "Select * FROM agent	WHERE login = '"+login+"'";
		cn = ConnectionLV.getConnection();
		st = cn.createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
		agent = new Agent (login,rs.getString("nom"),rs.getString("prenom"),rs.getString("adresse")
				,rs.getString("password"),rs.getString("dateNaissance"),rs.getInt("numTel"),rs.getBoolean("grade"));	
		}
		return agent;
	}
	
	public static ArrayList<Agent> getListAgent() throws ClassNotFoundException, SQLException
	{
		ArrayList<Agent> List = new ArrayList<Agent>();
		Connection cn = null;
		Statement st = null;
		// Recuperer la connexion
		cn = ConnectionLV.getConnection();
		// creer un Statement
		st = cn.createStatement();
		String sql = "SELECT * FROM agent";
		// executer la requête
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			List.add(getAgent(rs.getString("login")));
		}
		return List;
	}

	public static boolean verifierEmail(String login) throws ClassNotFoundException, SQLException {
		
		
		Connection cn = null;
		PreparedStatement st = null;
		String sql = "Select * from agent where login= ? ";

		cn = ConnectionLV.getConnection();
		st = cn.prepareStatement(sql);
		st.setString(1,login);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
	    return true;
		}
		
		return false;
	}

}
