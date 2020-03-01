package Modele;

import java.util.ArrayList;

public class Bien {
	private int idBien;
	private int prixMensuelle;
	private String wilaya;
	private String adresse;
	private Object actePropriete;
	private double surface;
	private String titre;
	private String description;
	private String statut;
	private String pseudo;
	private ArrayList<Object> listPhoto;
	private String type;
	private String typeTerrain;
	private int nbChambre;
	private int etage;
	private boolean piscine;
	private boolean jardin;
	private boolean garage;
    
    
    //constructeur appartement
	public Bien(int idBien, int prixMensuelle, String wilaya, String adresse, Object actePropriete, double surface
			,int etage,int nbChambre,String titre,String description, String statut, String pseudo, ArrayList<Object> listPhoto) {
		this.idBien = idBien;
		this.prixMensuelle = prixMensuelle;
		this.wilaya = wilaya;
		this.adresse = adresse;
		this.actePropriete = actePropriete;
		this.surface = surface;
		this.etage = etage;
		this.nbChambre=nbChambre;
		this.titre=titre;
		this.description = description;
		this.statut = statut;
		this.pseudo = pseudo;
		this.listPhoto = listPhoto;
		type="appartement";
	}
	
	//constructeur garage
	public Bien(int idBien, int prixMensuelle, String wilaya, String adresse, Object actePropriete, double surface,
			String titre,String description, String statut, String pseudo, ArrayList<Object> listPhoto) {
		super();
		this.idBien = idBien;
		this.prixMensuelle = prixMensuelle;
		this.wilaya = wilaya;
		this.adresse = adresse;
		this.actePropriete = actePropriete;
		this.surface = surface;
		this.titre=titre;
		this.description = description;
		this.statut = statut;
		this.pseudo = pseudo;
		this.listPhoto = listPhoto;
		type="garage";
	}
	
	//constructeur terrain
	public Bien(int idBien, int prixMensuelle, String wilaya, String adresse,Object actePropriete, double surface
			,String typeTerrain,String titre,String description, String statut, String pseudo, ArrayList<Object> listPhoto) {
		this.idBien = idBien;
		this.prixMensuelle = prixMensuelle;
		this.wilaya = wilaya;
		this.adresse = adresse;
		this.actePropriete = actePropriete;
		this.surface = surface;
		this.typeTerrain=typeTerrain;
		this.titre=titre;
		this.description = description;
		this.statut = statut;
		this.pseudo = pseudo;
		this.listPhoto = listPhoto;
		type="terrain";
	}
	
	//constructeur sans parametres
	public Bien()
	{
		
	}
	
	//constructeur maison
	public Bien(int idBien, int prixMensuelle, String wilaya, String adresse, Object actePropriete, double surface
			,int etage, int nbChambre,boolean garage,boolean piscine,boolean jardin,String titre,String description, String statut, String pseudo, ArrayList<Object> listPhoto) {
		this.idBien = idBien;
		this.prixMensuelle = prixMensuelle;
		this.wilaya = wilaya;
		this.adresse = adresse;
		this.actePropriete = actePropriete;
		this.surface = surface;
		this.piscine=piscine;
		this.jardin=jardin;
		this.garage=garage;
		this.etage=etage;
		this.nbChambre=nbChambre;
		this.titre=titre;
		this.description = description;
		this.statut = statut;
		this.pseudo = pseudo;
		this.listPhoto = listPhoto;
		type="maison";
	}

	public int getIdBien() {
		return idBien;
	}

	public void setIdBien(int idBien) {
		this.idBien = idBien;
	}

	public int getPrixMensuelle() {
		return prixMensuelle;
	}

	public void setPrixMensuelle(int prixMensuelle) {
		this.prixMensuelle = prixMensuelle;
	}

	public String getWilaya() {
		return wilaya;
	}

	public void setWilaya(String wilaya) {
		this.wilaya = wilaya;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public Object getActePropriete() {
		return actePropriete;
	}

	public void setActePropriete(String actePropriete) {
		this.actePropriete = actePropriete;
	}

	public double getSurface() {
		return surface;
	}

	public void setSurface(double surface) {
		this.surface = surface;
	}
    public String getTitre()
    {
    return titre;
    }
    public void setTitre(String titre)
    {
    this.titre=titre;
    }
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	
	

	public ArrayList<Object> getListPhoto() {
		return listPhoto;
	}

	public void setListPhoto(ArrayList<Object> listPhoto) {
		this.listPhoto = listPhoto;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTypeTerrain() {
		return typeTerrain;
	}

	public void setTypeTerrain(String typeTerrain) {
		this.typeTerrain = typeTerrain;
	}

	public int getNbChambre() {
		return nbChambre;
	}

	public void setNbChambre(int nbChambre) {
		this.nbChambre = nbChambre;
	}

	public int getEtage() {
		return etage;
	}

	public void setEtage(int etage) {
		this.etage = etage;
	}

	public boolean isPiscine() {
		return piscine;
	}

	public void setPiscine(boolean piscine) {
		this.piscine = piscine;
	}

	public boolean isJardin() {
		return jardin;
	}

	public void setJardin(boolean jardin) {
		this.jardin = jardin;
	}

	public boolean isGarage() {
		return garage;
	}

	public void setGarage(boolean garage) {
		this.garage = garage;
	}

	
	
	
    
}
