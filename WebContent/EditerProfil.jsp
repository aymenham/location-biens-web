<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Editer le profil</title>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/AjouterBien.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
		<script src="jquery-ui/jquery.validate.js"></script>
        <script type="text/javascript" src="jquery-ui/localization/messages_fr.js"> </script>
        </head>
        <body>
        <c:if test="${sessionScope.exist!='true'}">
                <c:redirect url="Authentification.html"></c:redirect>
        </c:if>

            
            <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="http://localhost:8080/agence/index.jsp"><img src="images/img/ekrili_137x60.png"></a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" data-target="login" href="#">
                                    ${sessionScope.pseudo}<span class="caret"></span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="login" id="login-dp">
                                    <div class="row">
                                        <div class="col-md-12">
                                        <form action="http://localhost:8080/agence/EspaceClient.jsp" method="post">
                                            <button type="submit" class="btn-link">
                                                <span class="nav-label">Rechercher</span>
                                            </button>
                                        </form>
                                        <form action="http://localhost:8080/agence/LocataireServlet" method="post">
                                            <input type="hidden" name="hidden" value="MesReservations">
                                            <button type="submit" class="btn-link">
                                                <span class="nav-label">Mes réservations</span>
                                            </button>
                                        </form>
                                        <form action="http://localhost:8080/agence/ProprietaireServlet" method="post">
                                            <input type="hidden" name="hidden" value="MesBiens">
                                            <button type="submit" class="btn-link">
                                                <span class="nav-label">Mes biens</span>
                                            </button>
                                        </form>
                                        <form action="http://localhost:8080/agence/EditerProfilServlet" method="post">
                                            <input type="hidden" name="hidden" value="EditerProfil">
                                            <button type="submit" class="btn-link">
                                                <span class="nav-label">Profile</span>
                                            </button>
                                        </form>
                                    </div>
                                        <div class="bottom text-center">
                                            <p><a href="http://localhost:8080/agence/AuthentificationServlet">Deconnexion</a></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item "><a class="nav-link" href="http://localhost:8080/agence/aide.html">Aide</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/agence/conditions.html">Conditions
							générales</a></li>
                            <li>
                                <a href="#"><button type="button" class="btn btn-outline-dark" style="border-radius: 17px;">+ Louer ma maison</button></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="main">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12 col-md-4 col-lg-3 sidebar" id="sidebar">
                            <ul class="list-sidebar">
                                <li><div>Locataire :</div></li>
                                <li>
                                    <form action="http://localhost:8080/agence/EspaceClient.jsp">
                                        <button type="submit" class="btn-link"><i class="fas fa-search"></i><span class="nav-label">Rechercher</span></button>
                                    </form>
                                </li>
                                <li>
                                    <form action="http://localhost:8080/agence/LocataireServlet" method="post">
                                        <input type="hidden" name="hidden" value="MesReservations">
                                        <button type="submit" class="btn-link"><i class="fa fa-laptop"></i><span class="nav-label">Mes réservations</span></button>
                                    </form>
                                </li>
                            </ul>
                            <ul class="list-sidebar">
                                <li><div>Propriétaire :</div></li>
                                <li>
                                    <form action="http://localhost:8080/agence/ProprietaireServlet" method="post">
                                        <input type="hidden" name="hidden" value="MesBiens">
                                        <button type="submit" class="btn-link"><i class="fas fa-home"></i><span class="nav-label">Mes biens</span></button>
                                    </form>
                                </li>
                                <li>
                                    <form action="http://localhost:8080/agence/AjouterBien.jsp">
                                        <button type="submit" class="btn-link"><i class="fas fa-plus-circle"></i><span class="nav-label">Proposer un bien</span></button>
                                    </form>
                                </li>
                                <li>
                                    <form action="http://localhost:8080/agence/ProprietaireServlet" method="post">
                                        <input type="hidden" name="hidden" value="ListeDemandeLocation">
                                        <button type="submit" class="btn-link"><i class="fas fa-edit"></i><span class="nav-label">Valider une location</span></button>
                                    </form>
                                </li>
                            </ul>
                            <ul class="list-sidebar">
                                <li><div>Compte :</div></li>
                                <li>
                                    <form action="http://localhost:8080/agence/EditerProfilServlet" method="post" class="active">
                                        <input type="hidden" name="hidden" value="EditerProfil">
                                        <button type="submit" class="btn-link"><i class="fas fa-user"></i><span class="nav-label">Editer mon Profil</span></button>
                                    </form>
                                </li>
                                <li>
                                    <form action="http://localhost:8080/agence/AuthentificationServlet" method="get">
                                        <button type="submit" class="btn-link"><i class="fas fa-sign-out-alt"></i><span class="nav-label">Deconnexion</span></button>
                                    </form>
                                </li>
                            </ul>
                        </div>

                    <div class="col-12 col-md-8 col-lg-9 mt-2 content">
	<div class="personal-info col-lg-10">
		<h1>Editer mon Profil</h1>
		<hr>
		<!-- edit form column -->
        <c:if test="${requestScope.reponse=='succes'}">		
        <div class="alert alert-success alert-dismissible"">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Succés!</strong> profil mis a jour avec succés
        </div>
        </c:if>
         <c:if test="${requestScope.reponse=='echec'}">	
        <div class="alert alert-danger alert-dismissible"">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Echec!</strong> Changement non enregistrer
        </div>
        </c:if>
		<h3>Informations personnelles:</h3>

		<form class="form-horizontal bg-light rounded pb-1" role="form"
			id="idForm" method="post"
			action="http://localhost:8080/agence/EditerProfilServlet">
			<div class="form-group">
				<label class="col-lg-3 control-label">Nom:</label>
				<div class="col-lg-8">
					<input class="form-control" type="text" name="nom" id="nom"
						value="${sessionScope.client.nom}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Prenom:</label>
				<div class="col-lg-8">
					<input class="form-control" type="text" name="prenom" id="prenom"
						value="${sessionScope.client.prenom}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Date de naissance:</label>
				<div class="col-md-8">
					<input class="form-control" type="date" name="dateNaissance"
						id="dateNaissance" value="${sessionScope.client.dateNaissance}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">adresse:</label>
				<div class="col-lg-8">
					<input class="form-control" type="text" name="adresse" id="adresse"
						value="${sessionScope.client.adresse}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-lg-3 control-label">Email:</label>
				<div class="col-lg-8">
					<input class="form-control" type="text" name="email" id="email"
						value="${sessionScope.client.email}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Numero de telephone:</label>
				<div class="col-md-8">
					<input class="form-control" type="number" name="numTel" id="numTel"
						value="0${sessionScope.client.numTel}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Pseudo:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="pseudo" id="pseudo"
						value="${sessionScope.client.pseudo}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Mot de passe:</label>
				<div class="col-md-8">
					<input class="form-control" type="password" name="mdp" id="mdp"
						value="" placeholder="******">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">Confirmer le mot de
					passe:</label>
				<div class="col-md-8">
					<input class="form-control" type="password" name="confirmerMdp"
						id="confirmerMdp" placeholder="******">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"></label>
				<div class="col-md-8">
					<input type="hidden" name="hidden" value="Enregistrer"> <input
						type="submit" class="btn btn-primary" value="Enregistrer">
					<span></span> <a
						href="http://localhost:8080/agence/EspaceClient.jsp"
						class="btn btn-default">Annuler</a>
				</div>
			</div>
		</form>
	</div>
</div>
                    
                </div>
                <hr>
            </div>
        </div>

        <footer>
            <div class="container-fluid full-length">
                <div class="container">
                    <div class="row text-center">
                        <div class="col-md-6">
                            <img src="images/img/Ekrili_blanc1.png">
                            <hr class="light">
                            <p>Constantine, 25000</p>
                            <p><a href="http://localhost:8080/agence/conditions.html">Conditions générales</a></p>
                            <p><a href="http://localhost:8080/agence/aide.html">Aide</a></p>
                        </div>
                        <div class="col-md-6">
                            <hr class="light">
                            <h5>Contactez-nous</h5>
                            <hr class="light">
                            <p>E-mail: EkriliAgency@gmail.com</p>
                            <p>Service client: +213 658 087 841</p>
                            <p>Service réclamation: +213 560 600 862</p>
                        </div>
                        <div class="col-12">
                            <hr class="light-100">
                            <h5>&copy; ekrili.com</h5>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
<script>
$(document).on("click", "#test", function() {
    $.ajax({
        url: "http://localhost:8080/agence/AuthentificationServlet",
        method: "post",
        data: $("#idForm").serialize(),
        success: function(responseText) {   
            $("#reponse").text(responseText);
        }
    });
    
});


$(document).ready(function(){

	  jQuery.validator.addMethod("noSpace", function(value, element) { 
	  return value.indexOf(" ") < 0 && value != ""; 
	}, "Espace entre caractéres non autorisé");

	  $.validator.addMethod("checkEmail", 
		        function(value, element) {
		            var result = false;
		            $.ajax({
	                    url: "http://localhost:8080/agence/VerificationServlet",
	                    async: false,
	                    method: "post",
	                    data: {email: value,hidden:'email'},
	                    success: function(data) {   
	                    	result = data == 'true';
	                    }
	                });
		            return result; 
		        },
		        "Email deja utilisé veuillez essayez un autre."
		   ); 
	  $.validator.addMethod("checkPseudo", 
		        function(value, element) {
		            var result = false;
		            $.ajax({
	                    url: "http://localhost:8080/agence/VerificationServlet",
	                    async: false,
	                    method: "post",
	                    data: {pseudo: value,hidden:'pseudo'},
	                    success: function(data) {   
	                    	result = data == 'true';
	                    }
	                });
		            return result; 
		        },
		        "Pseudo deja utilisé veuillez essayez un autre."
		   ); 
	  $.validator.addMethod("minAge", function(value, element, min) {
          var today = new Date();
          var birthDate = new Date(value);
          var age = today.getFullYear() - birthDate.getFullYear();
       
          if (age > min+1) {
              return true;
          }
       
          var m = today.getMonth() - birthDate.getMonth();
       
          if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
              age--;
          }
       
          return age >= min;
      }, "Vous devez être âgé d'au moins 18 ans");

    $('#idForm').validate({
    	
    	lang: 'fr',
        rules: {
    "email": {
        required: true,
        email: true,
        checkEmail: true
    }
    ,
    nom: {
        required: true,
        
       
    },
    prenom: {
        required: true,
        
    },
    pseudo: {
        required: true,
        minlength :6,
        noSpace: true,
        checkPseudo : true
        
    },
    dateNaissance: {
        required: true,
        minAge: 18
        
    },
    adresse: {
        required: true,
    },
    mdp: {
    	minlength : 6
    },
    confirmerMdp: {
    	minlength : 6,
    	equalTo : '#mdp'
    },
    numTel: {
        required: true,
        minlength: 10,
        maxlength: 10
        
    }
            
        }
    });

});
</script>  
</body>
</html>