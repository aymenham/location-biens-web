package Modele;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;  
import javax.mail.internet.*;  
  

public class EnvoyerEmail {
	
	public static Boolean Envoyer(String to,String subject,String text)
	{
		   
	     String username = "EkriliAgency@gmail.com";
	     String password = "aymenSami";
	     //dateNaissance 01/01/1990
	      
	     //Get the session object  
	      Properties props = System.getProperties();  
	      props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.host", "smtp.gmail.com");
	      props.put("mail.smtp.port", "587");  
	     
	      Session session = Session.getInstance(props,
	    		  new javax.mail.Authenticator() {
	    			protected PasswordAuthentication getPasswordAuthentication() {
	    				return new PasswordAuthentication(username, password);
	    			}
	    		  });
	  
	     //compose the message  
	      try{  
	         MimeMessage message = new MimeMessage(session);  
	         message.setFrom(new InternetAddress(username));  
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	         message.setSubject(subject);  
	         message.setText(text);  
	  
	         // Send message  
	         Transport.send(message);  
	         System.out.println("message sent successfully...."); 
	         
	      }
	      catch (MessagingException mex) {
	    	  mex.printStackTrace();
	    	  return false;
	    	  }  
	      return true;
	   }  
	

    public static boolean EnovoyerPieceJointe(String to,String subject,String text,String file,String fileName)
    {
    	
    	
    	String username = "EkriliAgency@gmail.com";
	    String password = "aymenSami";
	    

        //Get the session object  
	      Properties props = System.getProperties();  
	      props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.host", "smtp.gmail.com");
	      props.put("mail.smtp.port", "587");  
	      
	      Session session = Session.getInstance(props,
	    		  new javax.mail.Authenticator() {
	    			protected PasswordAuthentication getPasswordAuthentication() {
	    				return new PasswordAuthentication(username, password);
	    			}
	    		  });

        try {
           // Create a default MimeMessage object.
           MimeMessage message = new MimeMessage(session);

           // Set From: header field of the header.
           message.setFrom(new InternetAddress(username));

           // Set To: header field of the header.
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));

           // Set Subject: header field
           message.setSubject(subject);

           // Create the message part 
           BodyPart messageBodyPart = new MimeBodyPart();

           // Fill the message
           messageBodyPart.setText(text);
           
           // Create a multipar message
           Multipart multipart = new MimeMultipart();

           // Set text message part
           multipart.addBodyPart(messageBodyPart);

           // Part two is attachment
           messageBodyPart = new MimeBodyPart();
           String filename = file;
           DataSource source = new FileDataSource(filename);
           messageBodyPart.setDataHandler(new DataHandler(source));
           messageBodyPart.setFileName(fileName);
           multipart.addBodyPart(messageBodyPart);

           // Send the complete message parts
           message.setContent(multipart );

           // Send message
           Transport.send(message);
           System.out.println("Sent message successfully....");
           return true;
        } catch (MessagingException mex) {
           mex.printStackTrace();
        }
    	return false;
    }


}