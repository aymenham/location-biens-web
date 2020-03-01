<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>details du bien</title>
<link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="style/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
<script src="style/bootstrap/js/bootstrap.min.js"></script>
<link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
<link rel="stylesheet" href="style/gallery/baguetteBox.min.css">
<script src="style/gallery/baguetteBox.min.js"></script>
<link rel="stylesheet" href="style/css/Maison.css">
<link href="jquery-ui/jquery-ui.min.css" rel="stylesheet">
<script src="jquery-ui/jquery-ui.min.js"></script>
<script src="jquery-ui/jquery.barrating.min.js"></script>
<link rel="stylesheet" href="jquery-ui/themes/css-stars.css">
<script>
            function calc(){
                var n = parseInt(document.getElementById('nbMois').value);
                var prix = parseInt(document.getElementById('prix').value);
                document.getElementById('result').value = prix * n + ' DA';
            }

            $(document).ready(function(){
                var quantity = 1;

                $('.quantity-right-plus').click(function(e){
                    e.preventDefault();
                    var quantity = parseInt($('#nbMois').val());
                    $('#nbMois').val(quantity + 1);
                });

                $('.quantity-left-minus').click(function(e){
                    e.preventDefault();
                    var quantity = parseInt($('#nbMois').val());
                    if(quantity > 1){
                        $('#nbMois').val(quantity - 1);
                    }
                });
            });
        </script>
</head>
<body>
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						data-target="login" href="#"> <c:if
								test="${sessionScope.exist=='true'}">
                            ${sessionScope.pseudo}
                            </c:if> <c:if test="${sessionScope.exist!='true'}">
                            Login
                            </c:if> <span class="caret"></span>
					</a>
						<div class="dropdown-menu" aria-labelledby="login" id="login-dp">
							<div class="row">
								<c:if test="${sessionScope.exist!='true'}">
									<div class="col-md-12">
										<form class="form" role="form" method="post"
											action="http://localhost:8080/agence/AuthentificationServlet"
											id="login-nav">
											<div class="form-group">
												<label for="email">Email ou Pseudo :</label> <input
													type="text" class="form-control" id="email" name="login"
													placeholder="Email ou pseudo" required>
											</div>
											<div class="form-group">
												<label for="password">Mot de passe :</label> <input
													type="password" class="form-control" id="password"
													name="mdp" placeholder="Mot de passe" required>
												<div class="help-block text-right">
													<a
														href="http://localhost:8080/agence/motDePasseOublie.html">Mot
														de passe oublié?</a>
												</div>
											</div>
											<div class="form-group">
												<button type="submit" class="btn btn-primary btn-block">Se
													connecter</button>
											</div>
											<input type="hidden" name="hidden" value="Authentification">
										</form>
									</div>
									<div class="bottom text-center">
										Nouveau ici ? <a
											href="http://localhost:8080/agence/Inscription.html"><b>Rejoignez-nous</b></a>
									</div>
								</c:if>
								<c:if test="${sessionScope.exist=='true'}">
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
											<a
												href="http://localhost:8080/agence/AuthentificationServlet">Deconnexion</a>
										</p>
									</div>
								</c:if>

							</div>
						</div></li>
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/agence/aide.html">Aide</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/agence/conditions.html">Conditions
							générales</a></li>
					<li><a href="http://localhost:8080/agence/AjouterBien.jsp"><button type="button"
								class="btn btn-outline-dark" style="border-radius: 17px;">+
								Louer ma maison</button></a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container mt-3">
	    <c:if test="${sessionScope.exist!='true'}">                                      
		<a	href="http://localhost:8080/agence/index.jsp"><buttontype="button" class="btn btn-outline-info" style="border-radius: 17px;">Aller à la recherche</button></a>
		</c:if>
		<c:if test="${sessionScope.exist=='true'}">                                      
		<a	href="http://localhost:8080/agence/EspaceClient.jsp"><buttontype="button" class="btn btn-outline-info" style="border-radius: 17px;">Aller à la recherche</button></a>
		</c:if>
	</div>
	
	<nav 
		class="navbar navbar-expand-md navbar-primary bg-white navbar2 mt-3 mb-3">
		<div class="container">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#mainNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mainNav">
				<ul class="navbar-nav">
					<li class="nav-item "><a class="nav-link" href="#adresse">Adresse</a></li>
					<li class="nav-item "><a class="nav-link" href="#description">Description</a></li>
					<li class="nav-item "><a class="nav-link" href="#proprietaire">Propriétaire</a></li>
					<li class="nav-item "><a class="nav-link" href="#details">Détails</a></li>
					<li class="nav-item "><a class="nav-link" href="#photos">Photos</a></li>
					<li class="nav-item "><a class="nav-link" href="#avis">Avis</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-9">
				<div id="carouselControls" class="carousel slide mb-3"
					data-ride="carousel">
					<!--carousel begin-->
					<div class="carousel-inner" role="listbox" style="height: 100%;">
						<div class="carousel-item active">
							<a href="" data-toggle="modal" data-target="${bien.listPhoto[0]}"> <img
								class="d-block img-fluid" src="${bien.listPhoto[0]}">
							</a>
						</div>
						<c:if test="${not empty bien.listPhoto[1]}">          
						<div class="carousel-item">
							<a href="" data-toggle="modal" data-target="${bien.listPhoto[1]}"> <img
								class="d-block img-fluid" src="${bien.listPhoto[1]}">
							</a>
						</div>
						</c:if>
						<c:if test="${not empty bien.listPhoto[2]}">
						<div class="carousel-item">
							<a href="" data-toggle="modal" data-target="${bien.listPhoto[2]}"> <img
								class="d-block img-fluid" src="${bien.listPhoto[2]}">
							</a>
						</div>	
						</c:if>	
					</div>
					<a class="carousel-control-prev" href="#carouselControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"
						style="color: black;"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<!--carousel end-->
				<hr>
			</div>




            <c:if test="${bien.statut=='Accepter' or bien.statut=='EnLocation'}">
			<c:if test="${bien.pseudo!=sessionScope.pseudo}">
				<div class="col-12 col-lg-3 reserve">
					<div class="card bg-light mb-3">
						<div class="card-body">
							<p class="prix">
								<span id="nb">${bien.prixMensuelle}</span><span
									id="da"> DA/mois</span>
							</p>
							<input type="hidden" id="prix"
								value="${bien.prixMensuelle}">
							<form id="idForm" style="margin-bottom: 0px;">
								<input type="hidden" name="hidden" value="LouerBien">
								<div class="form-group">
									<c:if test="${sessionScope.exist=='true'}">
										<label for="dateDebut">Date de debut de location:</label>
										<input id="dateDebut" name="dateDebut" type="text"
											readonly="readonly">
									</c:if>
								</div>
								<div class="form-group">
									<label>Nombre de mois :</label>
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<button type="button"
												class="quantity-left-minus btn btn-danger btn-number"
												data-type="minus">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<input type="number" class="form-control" id="nbMois"
											name="nbMois" readonly="readonly" min="1" max="100" value="1">
										<div class="input-group-append">
											<button type="button"
												class="quantity-right-plus btn btn-success btn-number"
												data-type="plus" data-field="">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</div>
							</form>

							<c:if test="${sessionScope.exist=='true'}">
								<button id="reserver"
									class="btn btn-info btn-md btn-block text-uppercase">
									<i class="fas fa-calendar-check"></i> Réserver
								</button>
							</c:if>
							<br>
							<c:if test="${sessionScope.exist!='true'}">
								<div id="cc">
									<a href="http://localhost:8080/agence/AuthentificationServlet">connectez-vous
										pour effectuer une reservation</a>
								</div>
							</c:if>
							<br>

							<button class="btn btn-info btn-md btn-block text-uppercase"
								onclick="calc()">
								<i class="fas fa-calendar-check"></i> Calculer
							</button>
							<input type="text" id="result" class="form-control"
								placeholder="Montant Total" />
							<p style="text-align: center">
								<a href="#" id="dialog-link1">Contacter le propriétaire</a>
							</p>
						</div>
					</div>
				</div>
			</c:if>
			</c:if>

		</div>
		<div class="row">
			<div class="col-12 col-lg-9">
				<div>
					<h5 id="adresse">${bien.wilaya}</h5>
					<h4>${requestScope.bien.titre}</h4>
				</div>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-3 col-lg-2">
				<b style="font-size: 1.1em">Adresse:</b>
			</div>
			<div class="col-9 col-lg-7">${bien.adresse}</div>
			<div class="col-9">
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-3 col-lg-2">
				<b style="font-size: 1.1em" id="description">Description:</b>
			</div>
			<div class="col-9 col-lg-7" style="white-space: pre-wrap;">
				<p>${bien.description}</p>
			</div>
			<div class="col-9">
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-3 col-lg-2">
				<b style="font-size: 1.1em" id="proprietaire">Propriétaire:</b>
			</div>
			<div class="col-6 col-lg-4">
				<p>
					<b>${proprietaire.pseudo}</b> <br>Nom : <b>${proprietaire.nom}</b>
					<br>Prénom : <b>${proprietaire.prenom}</b> <br>Age
					: <b>${age}</b> <br>Numero de telephone : <b>0${proprietaire.numTel}</b>
				</p>
			</div>
			<c:if test="${bien.pseudo!=sessionScope.pseudo}">
				<div class="col-12 col-lg-3">
					<a href=""><button type="button" id="dialog-link2"
							class="btn btn-outline-primary" style="border-radius: 17px;">Contacter
							le propriétaire</button></a>
				</div>
			</c:if>
			<div class="col-9">
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-3 col-lg-2">
				<b style="font-size: 1.1em" id="details">Détails:</b>
			</div>


			<c:if test="${bien.type=='maison'}">
				<div class="col-9 col-lg-7">
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
				<div class="col-9 col-lg-7">
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
				<div class="col-9 col-lg-7">
					<div class="row text-center">
						<span class="details"><i class="fas fa-chart-area d-block"></i>Surface<span
							class="d-block">${bien.surface}m²</span></span>
					</div>
					<br>
				</div>
			</c:if>

			<c:if test="${bien.type=='terrain'}">
				<div class="col-9 col-lg-7">
					<div class="row text-center">
						<span class="details"><i class="fas fa-chart-area d-block"></i>Surface<span
							class="d-block">${bien.surface}m²</span></span> <span
							class="details"><i class="fas fa-question d-block"></i>Type<span class="d-block">${bien.typeTerrain}</span></span>
					</div>
					<br>
				</div>
			</c:if>


			<div class="col-12">
				<hr>
			</div>
		</div>

		<div class="container gallery-container">
			<!--Photos-->
			<h1 class="text-center" id="photos">Photos</h1>
			<div class="tz-gallery">
				<div class="row mb-3">


					<c:forEach var="url" items="${bien.listPhoto}">
						<div class="col-md-4 mb-3">
							<div class="card">
								<a class="lightbox" href="http://localhost:8080/agence/${url}">
									<img src="http://localhost:8080/agence/${url}"
									class="card-img-top">
								</a>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</div>

		<div class="row" id="avis">
			<!-- Avis -->
			<div class="col-12" id="reviews">
				<div class="card border-light mb-3">
					<div class="card-header bg-info text-white text-uppercase">
						<i class="fa fa-comment"></i> Avis
					</div>
					<div class="container">
						<div class="row" style="margin-top: 20px;">
							<div class="col-12">
								<div class="well well-sm">
								
								    <c:if test="${sessionScope.exist=='true'}">
								    <c:if test="${bien.pseudo!=sessionScope.pseudo}">
									<div>
										<a class="btn btn-success" 
											id="open-review-box">Evaluer le bien</a>
									</div>
									</c:if>
									</c:if>
									<div class="row" id="post-review-box"  style="display: none;">
										<div class="col-md-12">
											<form action="http://localhost:8080/agence/LocataireServlet"
												method="post">
												<input type="hidden" name="hidden" value="AjouterAvis">
												<select id="note" name="note">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select> <br>
												<textarea class="form-control animated"
													id="new-review" name="comment"
													placeholder="Inserez votre message ici..." rows="6"></textarea>
                                                <br>
												<div>
													<a class="btn btn-danger" href="#"
														id="close-review-box"
														style="display: none; margin-right: 10px;">Annuler</a>
													<button class="btn btn-success" type="submit">Enregistrer</button>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card-body">
					    <c:forEach var="avis" items ="${listAvis}">
						<div class="review">
                                <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                ${avis.dateAvis}
                                <c:forEach begin="1" end="${avis.note}" varStatus="loop">
                                <span class="fa fa-star valide"></span>
                                </c:forEach>
                                <c:forEach begin="${avis.note+1}" end="5" varStatus="loop">
                                <span class="fa fa-star"></span>
                                </c:forEach>
                                par<b>${avis.pseudo}</b> 
                                <p class="blockquote">
                                <p class="mb-0">${avis.message}</p>
                                <hr>
                        </div>
						</c:forEach>
						<c:if test="${empty listAvis}">
						
						<p>aucun avis disponible</p>
						
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container"></div>

	<!-- Footer -->
	<footer>
		<div class="container-fluid">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-6">
						<img src="images/img/Ekrili_blanc1.png">
						<hr class="light">
						<p>Constantine, 25000</p>
						<p>
							<a href="#">Conditions générales</a>
						</p>
						<p>
							<a href="#">Aide</a>
						</p>
					</div>
					<div class="col-md-6">
						<hr class="light">
						<h5>Contactez-nous</h5>
						<hr class="light">
						<p>E-mail: agenceekrili@gmail.com</p>
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

	<form method="POST" id="ContacterProprietaire"
		title="Contacter proriétaire"
		action="http://localhost:8080/agence/BienServlet">
		<input type="hidden" name="hidden" value="contacterProprietaire">
		<label for="email">Email:</label> <input type="text" id="email"
			name="email" style="float: right; width: 240px;"></input> <br> <br>
		<label for="message">Message :</label>
		<textarea id="message" name="message"
			style="float: right; width: 240px; height =: 180" rows="6"></textarea>
		<br> <br>
	</form>

	<div id="reponse"></div>
	<div id="confirmation">
	<div id="confirmationPrix" align="center"></div>
	<br>
	<p align="center"> Voulez-vous vraiment effectuer la location ?</p>
	</div>


	<!-- Modal image -->
	<div class="modal fade" id="${bien.listPhoto[0]}" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<img class="img-fluid" src="${bien.listPhoto[0]}" />
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="${listPhoto[1]}" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<img class="img-fluid" src="${bien.listPhoto[1]}" />
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="${bien.listPhoto[2]}" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<img class="img-fluid" src="${bien.listPhoto[2]}" />
				</div>
			</div>
		</div>
	</div>
	<script>
	        var array = ${ListDisabledDates};
            var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
            $('#dateDebut').datepicker({
                minDate: today,
                dateFormat: 'dd-mm-yy',
                inline: true,
                showOn: 'button',
                buttonImage: 'jquery-ui/images/ui-icon-calendar.png',
                beforeShowDay: function(date){
                    var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
                    return [ array.indexOf(string) == -1 ]
                }
            });
            jQuery(function($){
            	$.datepicker.regional['fr'] = {
            		closeText: 'Fermer',
            		prevText: '&#x3c;Préc',
            		nextText: 'Suiv&#x3e;',
            		currentText: 'Aujourd\'hui',
            		monthNames: ['Janvier','Fevrier','Mars','Avril','Mai','Juin',
            		'Juillet','Aout','Septembre','Octobre','Novembre','Decembre'],
            		monthNamesShort: ['Jan','Fev','Mar','Avr','Mai','Jun',
            		'Jul','Aou','Sep','Oct','Nov','Dec'],
            		dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'],
            		dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'],
            		dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'],
            		weekHeader: 'Sm',
            		firstDay: 1,
            		isRTL: false,
            		showMonthAfterYear: false,
            		yearSuffix: '',
            		minDate: 0,
            		maxDate: '+12M +0D',
            		numberOfMonths: 2,
            		showButtonPanel: true
            		};
            	$.datepicker.setDefaults($.datepicker.regional['fr']);
            });
            
            !function(a){a.fn.datepicker.dates.fr={days:["dimanche","lundi","mardi","mercredi","jeudi","vendredi","samedi"],daysShort:["dim.","lun.","mar.","mer.","jeu.","ven.","sam."],daysMin:["d","l","ma","me","j","v","s"],months:["janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"],monthsShort:["janv.","févr.","mars","avril","mai","juin","juil.","août","sept.","oct.","nov.","déc."],today:"Aujourd'hui",monthsTitle:"Mois",clear:"Effacer",weekStart:0,format:"dd/mm/yyyy"}}(jQuery);
        </script>
	<script>
            baguetteBox.run('.tz-gallery');
    </script>
	<script type="text/javascript">
        $( "#ContacterProprietaire" ).dialog({
        	autoOpen: false,
        	width: 400,
        	modal: true,
        	buttons: [
        		{
        			text: "Envoyer",
        			click: function() {
        				$.ajax({
                            url: "http://localhost:8080/agence/BienServlet",
                            method: "post",
                            async: false,
                            data: $("#ContacterProprietaire").serialize(),
                            success: function(responseText) {   
                                $("#reponse").text(responseText);
                            }
                        });
        				$( this ).dialog( "close" );
        				$( "#reponse" ).dialog( "open" );
        			}
        		},
        		{
        			text: "Annuler",
        			click: function() {
        				$( this ).dialog( "close" );
        			}
        		}
        	]
        });
        
        $( "#reponse" ).dialog({
        	autoOpen: false,
        	width: 400,
        	modal: true
        });
         
        // Link to open the dialog
        $( "#dialog-link1" ).click(function( event ) {
        	$( "#ContacterProprietaire" ).dialog( "open" );
        	event.preventDefault();
        });
     // Link to open the dialog
        $( "#dialog-link2" ).click(function( event ) {
        	$( "#ContacterProprietaire" ).dialog( "open" );
        	event.preventDefault();
        });
     
     
        
        $(document).on("click", "#reserver", function() {
        	var nn = parseInt(document.getElementById('nbMois').value);
            var pprix = parseInt(document.getElementById('prix').value);
        	var p  =  nn * pprix;
        	$("#confirmationPrix").text("le montant total est de : "+p+" DA")
            $( "#confirmation" ).dialog( "open" );
        });
        
        $( "#confirmation" ).dialog({
        	autoOpen: false,
        	width: 400,
        	modal: true,
        	buttons: [
        		{
        			text: "Confirmer",
        			click: function() {if( $('#dateDebut').val() ) {
        				 $.ajax({
        		                url: "http://localhost:8080/agence/LocataireServlet",
        		                method: "post",
        		                data: $("#idForm").serialize(),
        		                async: false,
        		                success: function(responseText) {   
        		                    $("#reponse").text(responseText);
        		                }
        		            });
        				$( this ).dialog( "close" );
        				$( "#reponse" ).dialog( "open" );}
        			}
        		},
        		{
        			text: "Annuler",
        			click: function() {
        				$( this ).dialog( "close" );
        			}
        		}
        	]
        });
        
        (function(e){var t,o={className:"autosizejs",append:"",callback:!1,resizeDelay:10},i='<textarea tabindex="-1" style="position:absolute; top:-999px; left:0; right:auto; bottom:auto; border:0; padding: 0; -moz-box-sizing:content-box; -webkit-box-sizing:content-box; box-sizing:content-box; word-wrap:break-word; height:0 !important; min-height:0 !important; overflow:hidden; transition:none; -webkit-transition:none; -moz-transition:none;"/>',n=["fontFamily","fontSize","fontWeight","fontStyle","letterSpacing","textTransform","wordSpacing","textIndent"],s=e(i).data("autosize",!0)[0];s.style.lineHeight="99px","99px"===e(s).css("lineHeight")&&n.push("lineHeight"),s.style.lineHeight="",e.fn.autosize=function(i){return this.length?(i=e.extend({},o,i||{}),s.parentNode!==document.body&&e(document.body).append(s),this.each(function(){function o(){var t,o;"getComputedStyle"in window?(t=window.getComputedStyle(u,null),o=u.getBoundingClientRect().width,e.each(["paddingLeft","paddingRight","borderLeftWidth","borderRightWidth"],function(e,i){o-=parseInt(t[i],10)}),s.style.width=o+"px"):s.style.width=Math.max(p.width(),0)+"px"}function a(){var a={};if(t=u,s.className=i.className,d=parseInt(p.css("maxHeight"),10),e.each(n,function(e,t){a[t]=p.css(t)}),e(s).css(a),o(),window.chrome){var r=u.style.width;u.style.width="0px",u.offsetWidth,u.style.width=r}}function r(){var e,n;t!==u?a():o(),s.value=u.value+i.append,s.style.overflowY=u.style.overflowY,n=parseInt(u.style.height,10),s.scrollTop=0,s.scrollTop=9e4,e=s.scrollTop,d&&e>d?(u.style.overflowY="scroll",e=d):(u.style.overflowY="hidden",c>e&&(e=c)),e+=w,n!==e&&(u.style.height=e+"px",f&&i.callback.call(u,u))}function l(){clearTimeout(h),h=setTimeout(function(){var e=p.width();e!==g&&(g=e,r())},parseInt(i.resizeDelay,10))}var d,c,h,u=this,p=e(u),w=0,f=e.isFunction(i.callback),z={height:u.style.height,overflow:u.style.overflow,overflowY:u.style.overflowY,wordWrap:u.style.wordWrap,resize:u.style.resize},g=p.width();p.data("autosize")||(p.data("autosize",!0),("border-box"===p.css("box-sizing")||"border-box"===p.css("-moz-box-sizing")||"border-box"===p.css("-webkit-box-sizing"))&&(w=p.outerHeight()-p.height()),c=Math.max(parseInt(p.css("minHeight"),10)-w||0,p.height()),p.css({overflow:"hidden",overflowY:"hidden",wordWrap:"break-word",resize:"none"===p.css("resize")||"vertical"===p.css("resize")?"none":"horizontal"}),"onpropertychange"in u?"oninput"in u?p.on("input.autosize keyup.autosize",r):p.on("propertychange.autosize",function(){"value"===event.propertyName&&r()}):p.on("input.autosize",r),i.resizeDelay!==!1&&e(window).on("resize.autosize",l),p.on("autosize.resize",r),p.on("autosize.resizeIncludeStyle",function(){t=null,r()}),p.on("autosize.destroy",function(){t=null,clearTimeout(h),e(window).off("resize",l),p.off("autosize").off(".autosize").css(z).removeData("autosize")}),r())})):this}})(window.jQuery||window.$);


        $(function(){

          $('#new-review').autosize({append: "\n"});

          var reviewBox = $('#post-review-box');
          var newReview = $('#new-review');
          var openReviewBtn = $('#open-review-box');
          var closeReviewBtn = $('#close-review-box');
          var ratingsField = $('#ratings-hidden');

          openReviewBtn.click(function(e)
          {
            reviewBox.slideDown(400, function()
              {
                $('#new-review').trigger('autosize.resize');
                newReview.focus();
              });
            openReviewBtn.fadeOut(100);
            closeReviewBtn.show();
          });

          closeReviewBtn.click(function(e)
          {
            e.preventDefault();
            reviewBox.slideUp(300, function()
              {
                newReview.focus();
                openReviewBtn.fadeIn(200);
              });
            closeReviewBtn.hide();
            
          });
        });
        
        $(function() {
            $('#note').barrating({
              theme: 'css-stars'
            });
         });
        
        </script>
</body>
</html>