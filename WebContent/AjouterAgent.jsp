<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Espace Agent</title>
<link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
<script src="style/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
<script src="style/bootstrap/js/bootstrap.min.js"></script>
<link href="style/css/EspaceAgent.css" rel="stylesheet">
<link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
<script src="jquery-ui/jquery.validate.js"></script>
<script type="text/javascript" src="jquery-ui/localization/messages_fr.js"> </script>

</head>
<body>
	<%@include file="EspaceAgentBar.jsp"%>
	<div id="content" class="col-12 col-md-8 col-lg-9 mt-3">
		<div class="personal-info col-lg-10 bg-light rounded">
			<H1 align="center">Ajouter un agent</H1>
			<hr>
			<c:if test="${requestScope.reponse=='succes'}">
				<div class="alert alert-success alert-dismissible"">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Succés!</strong> bien ajouté avec succés
				</div>
			</c:if>
			<c:if test="${requestScope.reponse=='echec'}">
				<div class="alert alert-danger alert-dismissible"">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Echec!</strong> bien non ajouté
				</div>
			</c:if>
			
			
			<form id="idForm" class="bg-light rounded pb-1 mb-3 col-md-6" style="margin: auto;"
			id="idForm" method="post" action="http://localhost:8080/agence/AdministrateurServlet">
				
			<div class="form-group pt-3">
                <input class="form-control" type="text" id="login" name="login" placeholder="Login">
            </div>
            <div class="form-group">
                <input class="form-control" type="password" id="mdp" name="mdp" placeholder="Mot de passe">
            </div>
             <div class="form-group">
                <input class="form-control" type="password" id="confirmerMdp" name="confirmerMdp" placeholder="Confirmer le mot de passe">
            </div>
            <div class="form-group">
                <input class="form-control" type="text" id="nom" name="nom" placeholder="Nom">
            </div>
            <div class="form-group">
                <input class="form-control" type="text" id="prenom" name="prenom" placeholder="Prénom">
            </div>
            <div class="form-group">
                <input class="form-control" type="text" id="adresse" name="adresse" placeholder="Adresse">
            </div>
            <label class="control-label" for="dateNaissance">Date de naissance :</label>
            <div class="form-group">
	            <input class="form-control" type="date" id="dateNaissance" name="dateNaissance">
	        </div>
            <div class="form-group">
                <input class="form-control" type="number" id="numTel" name="numTel" placeholder="Numéro de telephone">
            </div>
            <label class="px-3">Grade : </label>
			<input type="radio" id="grade" name="grade" value="false" checked>Agent
			<input class="ml-2" type="radio" id="grade2" name="grade" value="true">Administrateur
			<div>
				<input type="submit" value="Ajouter" class="btn btn-secondary mx-3 mb-3">
			</div>
				
			<input type="hidden" name="hidden" value="AjouterAgent">
			
			</form>
			</div>
			
		</div>
		<!--  mat9issch fihoum lil tahte-->
	</div>
	</div>
	</div>
	</div>
<script>
            $(document).ready(function(){
                jQuery.validator.addMethod("noSpace", function(value, element) { 
                    return value.indexOf(" ") < 0 && value != ""; 
                }, "Espace entre caractéres non autorisé");

                
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
                }, "vous n'avez pas l'age autorisé!");
                
                $.validator.addMethod("checkLogin", 
                                      function(value, element) {
                    var result = false;
                    $.ajax({
                        url: "http://localhost:8080/agence/VerificationServlet",
                        async: false,
                        method: "post",
                        data: {login: value,hidden:'login'},
                        success: function(data) {   
                            result = data == 'true';
                        }
                    });
                    return result; 
                },"Login deja utilisé"); 
               
                $('#idForm').validate({
                    lang: 'fr',
                    rules: {
                        login: {
                            required: true,
                            checkLogin: true
                        }
                        ,
                        nom: {
                            required: true,
                        },
                        prenom: {
                            required: true,
                        },
                        dateNaissance: {
                            required: true,
                            minAge: 18
                        },
                        adresse: {
                            required: true,
                        },
                        mdp: {
                            minlength : 6,
                            required: true
                        },
                        confirmerMdp: {
                            minlength : 6,
                            equalTo : '#mdp',
                            required: true
                        },
                        numTel: {
                            required: true,
                            minlength: 10,
                            maxlength: 10 
                        },
                        grade: {
                            required: true
                        }  
                    }
                });
            });
        </script>   
</body>
</html>