<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <title>Details Location</title>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/DetailsLocation.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
    </head>
    <body>
    <c:if test="${sessionScope.exist!='true'}">
		<c:redirect url="Authentification.html"></c:redirect>
	</c:if>
        <nav class="navbar navbar-expand-md navbar-light bg-light sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="http://localhost:8080/agence/index.jsp"><img
                                                                                           src="images/img/ekrili_137x60.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" data-target="login" href="#"> ${sessionScope.pseudo}</a>
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
                                        <p>
                                            <a href="http://localhost:8080/agence/AuthentificationServlet">Deconnexion</a>
                                        </p>
                                    </div>
                                </div>
                            </div></li>
                        <li class="nav-item "><a class="nav-link" href="http://localhost:8080/agence/aide.html">Aide</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/agence/conditions.html">Conditions
							générales</a></li>
                        <li><a href="#"><button type="button" class="btn btn-outline-dark" style="border-radius: 17px;">+ Louer ma maison</button></a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container mt-4">                                      
                <a	href="http://localhost:8080/agence/GestionDemandeLocation.jsp"><buttontype="button" class="btn btn-outline-info" style="border-radius: 17px;">Retour à la liste des locations</button></a>   
        </div><br>
        <div id="hr"></div>
        <div class="container mt-3">
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em">Titre:</b>
                </div>
                <div class="col-9 col-lg-8">
                    ${sessionScope.bien.titre}
                </div>
                <div class="col-12 col-lg-10"><hr></div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em">Adresse:</b>
                </div>
                <div class="col-9 col-lg-8">
                    ${sessionScope.bien.adresse}
                </div>
                <div class="col-12 col-lg-10"><hr></div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em">Période:</b>
                </div>
                <div class="col-9 col-lg-8">
                    location du ${sessionScope.location.dateDebut} au ${sessionScope.location.dateFin}
                </div>
                <div class="col-12 col-lg-10"><hr></div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em">Prix Total:</b>
                </div>
                <div class="col-9 col-lg-8">
                    <span id="nb">${sessionScope.prixTotal}</span> DA
                </div>
                <div class="col-12 col-lg-10"><hr></div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em" id="proprietaire">Locataire:</b>
                </div>
                <div class="col-6 col-lg-4">
                    <p>
                        <br>Pseudo : <b>${sessionScope.locataire.pseudo}</b>
                        <br>Nom : <b>${sessionScope.locataire.nom}</b>
                        <br>Prénom : <b>${sessionScope.locataire.prenom}</b>
                        <br>Age : <b>${sessionScope.age}</b>
                        <br>Numero de telephone : <b>0${sessionScope.locataire.numTel}</b>
                    </p>
                </div>
                <!--<div class="col-12 col-lg-3">
                    <a href=""><button type="button" class="btn btn-outline-primary" style="border-radius: 17px;">Contacter le locataire</button></a>
                </div>
                <div class="col-9"><hr></div>-->
            </div>
            <form method="POST" action="http://localhost:8080/agence/ProprietaireServlet">
                <input type="hidden" name="hidden" value="choixDemandeLocation">
                <input type="hidden" name="idLocation" value="${sessionScope.location.idLocation}">
                <input type="Submit" value="Accepter" name="reponse" id="sub" class="btn btn-success">
                <input type="Submit" value="Refuser" name ="reponse" id="sub" class="btn btn-danger">
            </form>
        </div>
        <footer class="sticky-bottom mt-4">
            <div class="container-fluid">
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
    </body>
</html>