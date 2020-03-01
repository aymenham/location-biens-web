package Modele;

import java.util.Date;

public class Facture {
	
	private int idFacture;
	private Date dateFacture;
	private Date dateLimite;
	private int prixTotale;
	private int idLocation;
	
	
	public Facture(){
		;
	}


	public Facture(int idFacture, Date dateFacture, Date dateLimite, int prixTotale, int idLocation) {
		super();
		this.idFacture = idFacture;
		this.dateFacture = dateFacture;
		this.dateLimite = dateLimite;
		this.prixTotale = prixTotale;
		this.idLocation = idLocation;
	}


	public int getIdFacture() {
		return idFacture;
	}


	public void setIdFacture(int idFacture) {
		this.idFacture = idFacture;
	}


	public Date getDateFacture() {
		return dateFacture;
	}


	public void setDateFacture(Date dateFacture) {
		this.dateFacture = dateFacture;
	}


	public Date getDateLimite() {
		return dateLimite;
	}


	public void setDateLimite(Date dateLimite) {
		this.dateLimite = dateLimite;
	}


	public int getPrixTotale() {
		return prixTotale;
	}


	public void setPrixTotale(int prixTotale) {
		this.prixTotale = prixTotale;
	}


	public int getIdLocation() {
		return idLocation;
	}


	public void setIdLocation(int idLocation) {
		this.idLocation = idLocation;
	}
	
	

	
}
