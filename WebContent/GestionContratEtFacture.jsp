<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head>
        <title>Gestion des documents</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="style/css/ContratFacture.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="images/img/Ekrili_blanc1.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" data-target="login" href="#">
                                ${sessionScope.nom} ${sessionScope.prenom}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-3">
            
            <form action="http://localhost:8080/agence/AgentServlet" method="post">
            <input type="hidden" name="hidden" value="ListLocation">
            <button type="submit" class="btn btn-outline-dark" style="border-radius: 17px;">Retour à la liste des locations</button>
            </form>
        </div>
        <div class="container bg-light rounded mb-3">
            <h4 class="mt-3 pt-2">Location n° ${sessionScope.Location.idLocation} :</h4>
            <div class="container mt-3 row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-3">
                            <b style="font-size: 1.1em">Titre:</b>
                        </div>
                        <div class="col-9">
                           ${sessionScope.Bien.titre}
                        </div>
                        <div class="col-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <b style="font-size: 1.1em">Adresse:</b>
                        </div>
                        <div class="col-9">
                            ${sessionScope.Bien.adresse}
                        </div>
                        
                    </div>
                    <div class="col-12"><hr></div>
                    <div class="row">
                        <div class="col-3">
                            <b style="font-size: 1.1em">Période:</b>
                        </div>
                        <div class="col-9">
                            ${sessionScope.Location.dateDebut} / ${sessionScope.Location.dateFin}
                        </div>
                        <div class="col-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3">
                            <b style="font-size: 1.1em">Prix Total:</b>
                        </div>
                        <div class="col-9">
                            <span id="nb">${sessionScope.Facture.prixTotale}</span> DA
                        </div>
                        <div class="col-12"><hr></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-3">
                            <b style="font-size: 1.1em" id="proprietaire">Locataire:</b>
                        </div>
                        <div class="col-9">
                            <p>
                                Nom : <b>${sessionScope.Locataire.nom}</b>
                                <br>Prénom : <b>${sessionScope.Locataire.prenom}</b>
                                <br>Numero de telephone : <b>0${sessionScope.Locataire.numTel}</b>
                            </p>
                        </div>
                        <div class="col-12"><hr></div>
                         <div class="col-3">
                            <b style="font-size: 1.1em" id="proprietaire">Proprietaire:</b>
                        </div>
                        <div class="col-9">
                            <p>
                                Nom : <b>${sessionScope.Proprietaire.nom}</b>
                                <br>Prénom : <b>${sessionScope.Proprietaire.prenom}</b>
                                <br>Numero de telephone : <b>0${sessionScope.Proprietaire.numTel}</b>
                            </p>
                        </div>
                        <div class="col-12"><hr></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <object id="contratView" data="Document/Contrat/contrat.pdf" type="application/pdf" width="450" height="667" class="bg-dark my-3 mr-5 ml-3">
                    <a id="linkcontrat" href="">contrat.pdf</a>
                </object>
                <form id="formContrat">
                    <input type="hidden" name="hidden" value="contrat">
                    <input type="hidden" name="idLocation" value="${sessionScope.Location.idLocation}">
                </form>

                <object id="factureView" data="Document/Facture/facture.pdf" type="application/pdf" width="450" height="667" class="bg-light mt-3">
                    <a id="linkfacture" href="">facture.pdf</a>
                </object>
                <form id="formFacture">
                    <input type="hidden" name="hidden" value="facture">
                    <input type="hidden" name="idLocation" value="${sessionScope.Location.idLocation}">
                </form>
            </div>
            <div class="mb-3" id="reponse" style="font-size: 18px; font-weight: 600;"></div>
            <div class="row">
                <span class="mr-2">
                    <input type="Submit" value="Genérer le contrat et la facture"  id="btn" class="btn btn-success">
                </span>
                <form id='envoyerEmail'>
                    <input type="button" value="Envoyer les documents par Email" id="envoyer" class="btn btn-primary">
                    <input type="hidden" name="hidden" value="envoyerDocument">
                    <input type="hidden" name="idLocation" value="${sessionScope.Location.idLocation}">
                </form>
            </div>

        </div>
    </body>
    <script>

        $( "#btn" ).click(function( event ) {
            $.ajax({
                url: "http://localhost:8080/agence/AgentServlet",
                method: "post",
                data: $("#formContrat").serialize(),
                success: function(responseText) {   
                    setTimeout(function(){  
                        $("#contratView").attr("data",responseText); 
                        $("#linkcontrat").attr("href",responseText);}, 3000); 
                }
            });
            event.preventDefault();
        });

        $( "#btn" ).click(function( event ) {
            $.ajax({
                url: "http://localhost:8080/agence/AgentServlet",
                method: "post",
                data: $("#formFacture").serialize(),
                success: function(responseText) {      
                    setTimeout(function(){  
                        $("#factureView").attr("data",responseText); 
                        $("#linkfacture").attr("href",responseText);}, 3000); 
                }
            });
            event.preventDefault();
        });
        $( "#envoyer" ).click(function( event ) {
            $.ajax({
                url: "http://localhost:8080/agence/AgentServlet",
                method: "post",
                data: $("#envoyerEmail").serialize(),
                success: function(responseText) {      
                    $('#reponse').text(responseText);
                }
            });
            event.preventDefault();
        });
    </script>
</html>