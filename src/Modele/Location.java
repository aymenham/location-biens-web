package Modele;

import java.util.Date;

public class Location {
	
	private int idLocation;
	private Date dateDebut;
	private Date dateFin;
	private String statut;
	private int idBien;
	private String pseudo;
	
	public Location(int idLocation, Date dateDebut, Date dateFin, String statut, int idBien, String pseudo) {
		super();
		this.idLocation = idLocation;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.statut = statut;
		this.idBien = idBien;
		this.pseudo = pseudo;
	}
	
	public Location()
	{
		
	}

	public int getIdLocation() {
		return idLocation;
	}

	public void setIdLocation(int idLocation) {
		this.idLocation = idLocation;
	}

	public Date getDateDebut() {
		return dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
	}

	public int getIdBien() {
		return idBien;
	}

	public void setIdBien(int idBien) {
		this.idBien = idBien;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
	
	

}
