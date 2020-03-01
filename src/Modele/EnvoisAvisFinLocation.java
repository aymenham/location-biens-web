package Modele;



import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class EnvoisAvisFinLocation implements Job {

	@Override
	public void execute(final JobExecutionContext ctx) throws JobExecutionException {

		System.out.print("Job en cours d'execution");
		ArrayList<Location> list = new ArrayList<Location>();
		try {
			list = GestionLocation.getListLocation();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String to;
		String subject = "Avis de fin de location";
		String text;
		long days;

		LocalDate dateFinLocation;
		LocalDate now = LocalDate.now();

		for (Location x : list) {

			if (x.getStatut().equals("EnCours")) {
				dateFinLocation = x.getDateFin().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
				days = ChronoUnit.DAYS.between(dateFinLocation, now);

				if (days < 1) {
					try {
						Bien bien = GestionBien.getBien(x.getIdBien());
						to = GestionCompteClient.getClient(x.getPseudo()).getEmail();
                        text = "votre location va bientôt se terminer , si vous souhaitez prolonger veuillez "
                        		+ "faire une nouvelle demande de location pour le bien"+
                        		"\n titre du bien: "+bien.getTitre()
                        		+"\n description du bien: "+bien.getDescription();
                        
						EnvoyerEmail.Envoyer(to, subject, text);
					} catch (ClassNotFoundException | SQLException e) {
					}

				}

			}

		}

	}

}
