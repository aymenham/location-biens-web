package Modele;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class ConnectionLV{
//URL de connexion
private String url = "jdbc:mysql://localhost/ekrili";
//Nom du user
private String user = "root";
//Mot de passe de l'utilisateur
private String password = "anisanis";
//Objet Connection
private static Connection connect;
 
//Constructeur privé
private ConnectionLV() throws ClassNotFoundException{
  try {
	  Class.forName("com.mysql.jdbc.Driver");
	  connect = (Connection) DriverManager.getConnection(url, user, password);
  } catch (SQLException e) {
    e.printStackTrace();
  }
}
 
//Méthode qui va nous retourner notre instance et la créer si elle n'existe pas
 public static Connection getConnection() throws ClassNotFoundException{
  if(connect == null){
    new ConnectionLV();
  }
  return connect;   
}   
}