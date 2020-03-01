package Modele;

import java.util.Date;

public class Avis {
	
	private int idAvis;
	private float note;
	private String message;
	private Date dateAvis;
	private String pseudo;
	private int idBien;
	
	public Avis(int idAvis, float note, String message, Date dateAvis, String pseudo, int idBien) {
		super();
		this.idAvis = idAvis;
		this.note = note;
		this.message = message;
		this.dateAvis = dateAvis;
		this.pseudo = pseudo;
		this.idBien = idBien;
	}
	
	public Avis()
	{
		
	}

	public int getIdAvis() {
		return idAvis;
	}

	public void setIdAvis(int idAvis) {
		this.idAvis = idAvis;
	}

	public float getNote() {
		return note;
	}

	public void setNote(float note) {
		this.note = note;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Date getDateAvis() {
		return dateAvis;
	}

	public void setDateAvis(Date dateAvis) {
		this.dateAvis = dateAvis;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public int getIdBien() {
		return idBien;
	}

	public void setIdBien(int idBien) {
		this.idBien = idBien;
	}
	
	
	
	
	
	

}
