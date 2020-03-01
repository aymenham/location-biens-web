package Modele;

public class Agent {

	private String login;
	private String nom;
	private String prenom;
	private String adresse;
	private String mdp;
	private String dateNaissance;
	private int numTel;
	private Boolean grade;
	
	
	public Agent(String login, String nom, String prenom, String adresse, String mdp, String dateNaissance, int numTel,
			Boolean grade) {
		super();
		this.login = login;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.mdp = mdp;
		this.dateNaissance = dateNaissance;
		this.numTel = numTel;
		this.grade = grade;
	}
	public Agent()
	{
		
	}
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public String getDateNaissance() {
		return dateNaissance;
	}
	public void setDateNaissance(String dateNaissance) {
		this.dateNaissance = dateNaissance;
	}
	public int getNumTel() {
		return numTel;
	}
	public void setNumTel(int numTel) {
		this.numTel = numTel;
	}
	public Boolean getGrade() {
		return grade;
	}
	public void setGrade(Boolean grade) {
		this.grade = grade;
	}
	
	


}
