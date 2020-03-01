package Modele;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.AcroFields;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

public class GestionDocument {

	public static String genererFacture(Facture facture) throws ClassNotFoundException, SQLException, IOException, DocumentException {
		
		final java.util.Calendar cal1 = GregorianCalendar.getInstance();
		cal1.setTime(new Date());
		cal1.add(GregorianCalendar.MONTH,1);
		Date dateLimite = cal1.getTime();
		facture.setDateFacture(new Date());
		facture.setDateLimite(dateLimite);
		GestionFacture.UpdateFacture(facture);
		Location location = GestionLocation.getLocation(facture.getIdLocation());
		Client locataire = GestionCompteClient.getClient(location.getPseudo());
		Bien bien = GestionBien.getBien(location.getIdBien());
		String SRC = "C:/Users/asus/workspace/agence/WebContent/Document/Facture/facture.pdf";
		String DEST = "C:/Users/asus/workspace/agence/WebContent/Document/Facture/facture-n" + facture.getIdFacture()+".pdf";
		File file = new File(DEST);
		file.getParentFile().mkdirs();
		PdfReader reader = new PdfReader(SRC);
		reader.removeUsageRights();
		PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(DEST));
		stamper.setFormFlattening(true);
		AcroFields form = stamper.getAcroFields();
		form.removeXfa();
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String DateDebut = sdf.format(location.getDateDebut());
		String DateFin = sdf.format(location.getDateFin());
		
		Calendar startCalendar = new GregorianCalendar();
		startCalendar.setTime(location.getDateDebut());
		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(location.getDateFin());

		int diffYear = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
		int mois = diffYear * 12 + endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
		
		
		double prix90 =  (facture.getPrixTotale()* 91.67)/100;
		double prix10 =  (facture.getPrixTotale()*8.33)/100;
		double pm90 = prix90/mois;
		double pm10 = prix10/mois;
		form.setField("Text1","cité 500 logement zouaghi constantine");
		form.setField("Text2", "2");
		form.setField("Text3",  "3");
		form.setField("Text4", locataire.getAdresse());
		form.setField("Text5",  "5");
		form.setField("Text6",  "6");
		form.setField("Text7",  locataire.getNom()+"  "+locataire.getPrenom());
		form.setField("Text8",  "n°" + facture.getIdFacture());
		form.setField("Text9",  ""+sdf.format(new Date()));
		form.setField("Text10", ""+sdf.format(dateLimite));
		form.setField("Text11", ""+DateDebut);
		form.setField("Text12", ""+DateFin);
		form.setField("Text13", ""+bien.getAdresse());
		form.setField("Text14", "");
		form.setField("Text15", ""+mois);
		form.setField("Text16", ""+pm90);
		form.setField("Text17", ""+prix90);
		form.setField("Text18", ""+pm10);
		form.setField("Text19", ""+prix10);
		form.setField("Text20", ""+mois);
		form.setField("Text21", ""+facture.getPrixTotale());
		form.setField("Text22", "22");
		stamper.close();
		reader.close();
		
		return "http://localhost:8080/agence/Document/Facture/facture-n"+facture.getIdFacture()+".pdf";
	}

	public static String genererContrat(Facture facture) throws ClassNotFoundException, SQLException, IOException, DocumentException {
		Location location = GestionLocation.getLocation(facture.getIdLocation());
		Client locataire = GestionCompteClient.getClient(location.getPseudo());
		Bien bien = GestionBien.getBien(location.getIdBien());
		Client proprietaire = GestionCompteClient.getClient(bien.getPseudo());
		String SRC = "C:/Users/asus/workspace/agence/WebContent/Document/Contrat/contrat.pdf";
		String DEST = "C:/Users/asus/workspace/agence/WebContent/Document/Contrat/contrat-n" + location.getIdLocation()+".pdf";
		File file = new File(DEST);
		file.getParentFile().mkdirs();
		PdfReader reader = new PdfReader(SRC);
		reader.removeUsageRights();
		PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(DEST));
		stamper.setFormFlattening(true);
		AcroFields form = stamper.getAcroFields();
		form.removeXfa();
		
		for(int i=1;i<=20;i++)
		{
		form.setFieldProperty("Text"+i, "textcolor", BaseColor.BLUE, null);
		}
		
	    
		Calendar startCalendar = new GregorianCalendar();
		startCalendar.setTime(location.getDateDebut());
		Calendar endCalendar = new GregorianCalendar();
		endCalendar.setTime(location.getDateFin());

		int diffYear = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
		int mois = diffYear * 12 + endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
		
	
		form.setField("Text1","   "+ proprietaire.getNom() + "       " + proprietaire.getPrenom());
		form.setField("Text2", " "+proprietaire.getAdresse());
		form.setField("Text3", "    "+proprietaire.getDateNaissance());
		form.setField("Text4", "           "+proprietaire.getEmail());
		form.setField("Text5", "0"+proprietaire.getNumTel());
		form.setField("Text6", "   "+locataire.getNom() + "       " + locataire.getPrenom());
		form.setField("Text7", " "+locataire.getAdresse());
		form.setField("Text8", "    "+locataire.getDateNaissance());
		form.setField("Text9", "           "+locataire.getEmail());
		form.setField("Text10", "0"+locataire.getNumTel());
		form.setField("Text11",  bien.getDescription());
		form.setField("Text20",  bien.getAdresse());
		form.setField("Text12",  "  "+mois);
		form.setField("Text13",  " "+location.getDateDebut());
		form.setField("Text14",  " "+location.getDateFin());
		form.setField("Text15",  "  "+facture.getPrixTotale()/mois);
		form.setField("Text16",  "  "+facture.getPrixTotale());
		form.setField("Text17",  "Constantine");
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		form.setField("Text18",  "     "+ sdf.format(new Date()));
		form.setField("Text19",  "2");
		
		stamper.close();
		reader.close();
		return "http://localhost:8080/agence/Document/Contrat/contrat-n"+location.getIdLocation()+".pdf";
	}
}
