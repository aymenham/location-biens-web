<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <title>Demande ajout bien</title>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style/gallery/baguetteBox.min.css">
        <script src="style/gallery/baguetteBox.min.js"></script>
        <link href="style/css/GererDemandeAjoutBien.css" rel="stylesheet">
    </head>
    <body>
    
    <c:if test="${sessionScope.agent!='true'}">
		<c:redirect url="Administrator.html"></c:redirect>
	    </c:if>
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
        <div class="container mt-4">
                                     
        <a	href="http://localhost:8080/agence/GererAjoutBien.jsp"><buttontype="button" class="btn btn-outline-info" style="border-radius: 17px;">Retour au demandes d'ajout de biens</button></a>
            
        </div><br>
        <div id="hr"></div>
        <div class="container mt-3">
            <div class="row">
                <div class="col-12 col-lg-9">
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em" id="proprietaire">Propriétaire:</b>
                        </div>
                        <div class="col-6 col-lg-9">
                                Pseudo : <b>${sessionScope.proprietaire.pseudo}</b>
                                <br>Nom : <b>${sessionScope.proprietaire.nom}</b>
                                <br>Prénom : <b>${sessionScope.proprietaire.prenom}</b>
                                <br>Age : <b>${sessionScope.age}</b>
                                <br>Numero de telephone : <b>0${sessionScope.proprietaire.numTel}</b>
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em">Type du bien:</b>
                        </div>
                        <div class="col-9 col-lg-9">
                            ${sessionScope.bien.type}
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em">Wilaya:</b>
                        </div>
                        <div class="col-9 col-lg-9">
                            ${sessionScope.bien.wilaya}
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em">Adresse:</b>
                        </div>
                        <div class="col-9 col-lg-9">
                            ${sessionScope.bien.adresse}
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em">Prix Mensuel:</b>
                        </div>
                        <div class="col-9 col-lg-9">
                            <span id="nb">${sessionScope.bien.prixMensuelle}</span> DA
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                    <div class="row">
                        <div class="col-3 col-lg-3">
                            <b style="font-size: 1.1em">Titre:</b>
                        </div>
                        <div class="col-9 col-lg-9">
                            ${sessionScope.bien.titre}
                        </div>
                        <div class="col-12 col-lg-12"><hr></div>
                    </div>
                </div>
                <div class="col-12 col-lg-3 mb-3">
                    <div class="card" style="width: 260px;">
                        <a href="" data-toggle="modal" data-target="#act">
                            <img src="${sessionScope.bien.actePropriete}" class="card-img-top rounded act">
                        </a>
                    </div>
                </div>
                <div class="modal fade" id="act" tabindex="-1" role="dialog">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <img class="img-fluid w-100" src="${sessionScope.bien.actePropriete}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em" id="description">Description:</b>
                </div>
                <div class="col-9 col-lg-10" style="white-space: pre-wrap;"><p>${sessionScope.bien.description}</div>
                <div class="col-12 col-lg-10"><hr></div>
            </div>
            <div class="row">
                <div class="col-3 col-lg-2">
                    <b style="font-size: 1.1em" id="details">Détails:</b>
                </div>
                <c:if test="${bien.type=='maison'}">
				<div class="col-9 col-lg-8">
					<div class="row text-center">
						<span class="details">
							<i class="fas fa-chart-area d-block"></i>Surface
							<span class="d-block">${bien.surface}m²</span>
						</span>
						<span class="details">
							<i class="fas fa-align-center d-block"></i>Etages
							<span class="d-block">${bien.etage}</span>
						</span> 
						<span class="details">
							<i class="fas fa-door-open d-block"></i>Chambres
							<span class="d-block">${bien.nbChambre}</span>
						</span>
					</div>
					<br>
					<c:if test="${bien.piscine}">
						<p>
							<i class="fas fa-check-square"></i> Piscine
						</p>
					</c:if>
					<c:if test="${!bien.piscine}">
						<p>
							<i class="fas fa-square"></i> Piscine
						</p>
					</c:if>
					<c:if test="${bien.jardin}">
						<p>
							<i class="fas fa-check-square"></i> Jardin
						</p>
					</c:if>
					<c:if test="${!bien.jardin}">
						<p>
							<i class="fas fa-square"></i> Jardin
						</p>
					</c:if>
					<c:if test="${bien.garage}">
						<p>
							<i class="fas fa-check-square"></i>Garage
						</p>
					</c:if>
					<c:if test="${!bien.garage}">
						<p>
							<i class="fas fa-square"></i>Garage
						</p>
					</c:if>
				</div>
			</c:if>

			<c:if test="${bien.type=='appartement'}">
				<div class="col-9 col-lg-8">
					<div class="row text-center">
						<span class="details"><i class="fas fa-chart-area d-block"></i>Surface<span
							class="d-block">${bien.surface}m²</span></span> <span
							class="details"><i class="fas fa-door-open d-block"></i>Chambres<span class="d-block">${bien.nbChambre}</span></span>
						<span class="details"><i
							class="fas fa-align-center d-block"></i>Etage<span
							class="d-block">${bien.etage}</span></span>
					</div>
					<br>
				</div>
			</c:if>

			<c:if test="${bien.type=='garage'}">
				<div class="col-9 col-lg-8">
					<div class="row text-center">
						<span class="details"><i class="fas fa-chart-area d-block"></i>Surface<span
							class="d-block">${bien.surface}m²</span></span>
					</div>
					<br>
				</div>
			</c:if>

			<c:if test="${bien.type=='terrain'}">
				<div class="col-9 col-lg-8">
					<div class="row text-center">
						<span class="details"><i class="fas fa-chart-area d-block"></i>Surface<span
							class="d-block">${bien.surface}m²</span></span> <span
							class="details"><i class="fas fa-question d-block"></i>Type<span class="d-block">${bien.typeTerrain}</span></span>
					</div>
					<br>
				</div>
			</c:if>
                <div class="col-12"><hr></div>
            </div>
            <div class="container gallery-container"><!--Photos-->
                <h1 class="text-center" id="photos">Photos</h1>
                <div class="tz-gallery">
                    <div class="row mb-3">
                    
                    
                        <c:forEach var="url" items="${sessionScope.bien.listPhoto}">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <a class="lightbox" href="http://localhost:8080/agence/${url}">
                                    <img src="http://localhost:8080/agence/${url}" class="card-img-top rounded">
                                </a>
                            </div>
                        </div>
                        </c:forEach>

                       
                       
                    </div>
                </div>
            </div>
            <form method="POST" action="http://localhost:8080/agence/AgentServlet" class="ml-4">
                <input type="hidden" name="hidden" value="reponseGererAjoutBien">
                <input type="hidden" name="idBien" value="${sessionScope.bien.idBien}">
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
                            <p><a href="#">Conditions générales</a></p>
                            <p><a href="#">Aide</a></p>
                        </div>
                        <div class="col-md-6">
                            <hr class="light">
                            <h5>Contactez-nous</h5>
                            <hr class="light">
                            <p>E-mail: ekriliagency@gmail.com</p>
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
            baguetteBox.run('.tz-gallery');
        </script>
    </body>
</html>