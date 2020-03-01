<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="Modele.GestionBien" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Ekrili</title>
<link href="/images/img/favicon.ico" rel="shortcut icon">
<meta charset="utf-8">
<link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="style/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
<script src="style/bootstrap/js/bootstrap.min.js"></script>
<link href="style/css/index.css" rel="stylesheet">
<link href="jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="jquery-ui/external/jquery/jquery.js"></script>
<script src="jquery-ui/jquery-ui.js"></script>
<script src="jquery-ui/jquery.validate.js"></script>
<script type="text/javascript"
	src="jquery-ui/localization/messages_fr.js">
	
</script>
<link rel="stylesheet" href="style/slider/nouislider.min.css">
<script src="style/slider/nouislider.min.js"></script>
<script>
	$(document).ready(function() {
		var select = document.getElementById('input-select');
		var html5Slider = document.getElementById('slider');
		noUiSlider.create(html5Slider, {
			start : [ 5000, 100000 ],
			step : 1000,
			connect : true,
			range : {
				'min' : 5000,
				'max' : 100000
			}
		});
		var inputNumber = document.getElementById('input-number');
		html5Slider.noUiSlider.on('update', function(values, handle) {
			var value = values[handle];
			if (handle) {
				inputNumber.value = Math.round(value);
			} else {
				select.value = Math.round(value);
			}
		});
	});
	$(document).ready(function() {
		var select = document.getElementById('input-select2');
		var html5Slider = document.getElementById('slider2');
		noUiSlider.create(html5Slider, {
			start : [ 0, 3000 ],
			step : 10,
			connect : true,
			range : {
				'min' : 0,
				'max' : 3000
			}
		});
		var inputNumber = document.getElementById('input-number2');
		html5Slider.noUiSlider.on('update', function(values, handle) {
			var value = values[handle];
			if (handle) {
				inputNumber.value = Math.round(value);
			} else {
				select.value = Math.round(value);
			}
		});
	});
</script>
</head>
<body>
<%
	request.getSession(false).setAttribute("list",GestionBien.getListeBien("Accepter","statut"));	
%>
	<!--Navigation-->
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
                                                <span class="nav-label">Espace client</span>
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



	<div id="search-bg">
		<div class="container">
			<div class="search">
				<form method="post"
					action="http://localhost:8080/agence/RechercheServlet" id="idForm"
					class="rounded">
					<div class="row p-3 justify-content-around">
						<span class=" col-xm-12 col-md-3"> <select
							class="custom-select" name="type" id="type">
								<option selected disabled>Type du bien</option>
								<option value=maison>Maison</option>
								<option value=appartement>Appartement</option>
								<option value=terrain>Terrain</option>
								<option value=garage>Garage</option>
						</select>
						</span> <span class="row col-xm-12 col-md-9"> <b id="prix">Prix
								min/max :</b> <input class="form-control" id="input-select"
							name="minPrixMensuelle" readonly>
							<div id="slider"></div> <input class="form-control"
							id="input-number" name="maxPrixMensuelle" readonly>
						</span>
					</div>
					<div class="row p-3 justify-content-around">
						<span class=" col-xm-12 col-md-3"> <select
							class="custom-select" name="wilaya" id="wilaya">
								<option selected disabled>Wilaya</option>
								<option value=Adrar>1 Adrar</option>
								<option value=Chlef>2 Chlef</option>
								<option value=Laghouat>3 Laghouat</option>
								<option value="Oum El-Bouaghi">4 Oum El-Bouaghi</option>
								<option value=Batna>5 Batna</option>
								<option value=Béjaïa>6 Béjaïa</option>
								<option value=Biskra>7 Biskra</option>
								<option value=Béchar>8 Béchar</option>
								<option value=Blida>9 Blida</option>
								<option value=Bouira>10 Bouira</option>
								<option value=Tamanrasset>11 Tamanrasset</option>
								<option value=Tébessa>12 Tébessa</option>
								<option value=Tlemcen>13 Tlemcen</option>
								<option value=Tiaret>14 Tiaret</option>
								<option value="Tizi Ouzou">15 Tizi Ouzou</option>
								<option value=Alger>16 Alger</option>
								<option value=Djelfa>17 Djelfa</option>
								<option value=Jijel>18 Jijel</option>
								<option value=Sétif>19 Sétif</option>
								<option value=Saida>20 Saida</option>
								<option value=Skikda>21 Skikda</option>
								<option value="Sidi Bel Abbes">22 Sidi Bel Abbes</option>
								<option value=Annaba>23 Annaba</option>
								<option value=Ghelma>24 Guelma</option>
								<option value=Constantine>25 Constantine</option>
								<option value=Médéa>26 Médéa</option>
								<option value=Mostaganem>27 Mostaganem</option>
								<option value="M'Sila">28 M'Sila</option>
								<option value=Mascara>29 Mascara</option>
								<option value=Ouargla>30 Ouargla</option>
								<option value=Oran>31 Oran</option>
								<option value=El-Bayadh>32 El-Bayadh</option>
								<option value=Illizi>33 Illizi</option>
								<option value=Bord-bou-Arréridj>34 Bord-Bou-Arréridj</option>
								<option value=Boumerdès>35 Boumerdès</option>
								<option value=El-Taref>36 El-Taref</option>
								<option value=Tindouf>37 Tindouf</option>
								<option value=Tissemsilt>38 Tissemsilt</option>
								<option value="El Oued">39 El Oued</option>
								<option value=Khenchela>40 Khenchela</option>
								<option value="Souk Ahras">41 Souk Ahras</option>
								<option value=Tipaza>42 Tipaza</option>
								<option value=Mila>43 Mila</option>
								<option value="Aïn Defla">44 Aïn Defla</option>
								<option value=Naâma>45 Naâma</option>
								<option value="Aïn Témouchent">46 Aïn Témouchent</option>
								<option value=Ghardaïa>47 Ghardaïa</option>
								<option value=Rélizane>48 Relizane</option>
						</select>
						</span> <span class="row col-xm-12 col-md-9"> <b id="surface">Surface
								min/max :</b> <input class="form-control" id="input-select2"
							name="minSurface" readonly>
							<div id="slider2"></div> <input class="form-control"
							id="input-number2" name="maxSurface" readonly>
						</span>
					</div>
					<div class="row p-2 justify-content-end" style="width: 96%;">
						<div class="button-group">
							<button type=button id="plusCritere"
								class="btn btn-secondary m-1 dropdown-toggle"
								data-toggle="dropdown" disabled="disabled">+ de
								Critères</button>
								<button type=submit class="btn btn-primary m-1">
								Rechercher</button>
							<div class="dropdown-menu" id="dd">
								<fieldset name="plus de critéres"
									style="width: 84%; margin: auto;" class="pb-3">
									<div id="appartement" class="options">
										<div class="row justify-content-between m-2">
											<label for="etage">numero d'étages</label> 
											<input type=number name="etage" class="form-control" min="1">
										</div>
										<div class="row justify-content-between m-2">
											<label for="nbChambre">Nombre de chambres</label> 
											<input type=number name="nbChambre" class="form-control" min="1">
										</div>
									</div>
									<div id="maison" class="options">
										<div class="row justify-content-between m-2">
											<label for="nombreEtage">Nombre d'étages</label> <input
												type=number name="nombreEtage" class="form-control" min="1">
										</div>
										<div class="row justify-content-between m-2">
											<label for="nbChambre2">Nombre de chambres</label> <input
												type=number name="nbChambre2" class="form-control" min="1">
										</div>
										<span id="check"> <label for="piscine">Piscine</label>
											<input type="checkbox" name="piscine" id="piscine"
											value="FALSE" />
										</span> <span id="check"> <label for="jardin">Jardin</label> <input
											type="checkbox" name="jardin" id="jardin" value="FALSE" />
										</span> <span id="check"> <label for="jardin">Garage</label> <input
											type="checkbox" name="garage" id="garage" value="FALSE" />
										</span>
									</div>
									<div id="terrain" class="options">
										<select class="custom-select" name="typeTerrain"
											id="typeTerrain">
											<option selected disabled>Type du terrain</option>
											<option value='agricole'>agricole</option>
											<option value='jardin'>jardin</option>
											<option value='nu'>nu</option>
										</select>
									</div>
									<div id="garage" class="options">
										<div><p>pas de critéres additional pour le type garage</p></div>
									</div>
								</fieldset>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--Three column section-->
	<br>
	<div class="col-12">
		<h4 class="lead text-center">Comment trouver le bien idéale?</h4>
	</div>
	<div class="container">
		<div class="row text-center">
			<div class="col-xs-12 col-sm-6 col-md-4">
				<img src="images/img/search.png" id="icon">
				<h4>Recherchez</h4>
				<p>Précisez le type du bien et les critéres souhaitez,
					puis recherchez le bien qui vous correspond.</p>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<img src="images/img/choose.png" id="icon">
				<h4>Choisissez</h4>
				<p>Choisissez le meilleur bien pour vous parmit les
					resultats.</p>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-4">
				<img src="images/img/reserve.png" id="icon">
				<h4>Réservez</h4>
				<p>Après avoir trouvé le bien idéale, choissisez la période souhaitez,
				    faite votre demande de location  et attendez la reponse du 
					propriétaire.</p>
			</div>
		</div>
	</div>
	<!--Image Slider-->
	<div class="container-fluid  bg-light" id="carousel">
		<br>
		<div class="col-12">
			<h4 class="lead text-center">Trouvez le bien qui vous
				correspond!</h4>
		</div>
		<div class="row" style="height: 90%;">
			<div class="col-lg-1"></div>
			<div class="col-lg-10 col-xs-12 col-sm-12" style="height: 90%;">
				<div id="biens" class="carousel slide" data-ride="carousel"
					style="height: 100%;">
					<ol class="carousel-indicators">
						<li data-target="#biens" data-slide-to="0" class="active"></li>
						<li data-target="#biens" data-slide-to="1"></li>
						<li data-target="#biens" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" style="height: 100%;">
						<div class="carousel-item active">
							<div class="row">
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									    <img class="d-block w-100"
										src="${sessionScope.list[0].listPhoto[0]}" alt="First slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[0].wilaya}</h5>
											<p>${sessionScope.list[0].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[0].idBien}">
								            </form>
										</div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[3].listPhoto[0]}" alt="First slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[3].wilaya}</h5>
											<p>${sessionScope.list[3].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[3].idBien}">
								            </form>
									    </div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-12"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[2].listPhoto[0]}" alt="First slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[2].wilaya}</h5>
											<p>${sessionScope.list[2].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[2].idBien}">
								            </form>
									   </div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									    <img class="d-block w-100"
										src="${sessionScope.list[1].listPhoto[0]}" alt="Second slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[1].wilaya}</h5>
											<p>${sessionScope.list[1].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[1].idBien}">
								            </form>
										</div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[4].listPhoto[0]}" alt="Second slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[4].wilaya}</h5>
											<p>${sessionScope.list[4].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[4].idBien}">
								            </form>
									    </div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-12"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[5].listPhoto[0]}" alt="Second slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[5].wilaya}</h5>
											<p>${sessionScope.list[5].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[5].idBien}">
								            </form>
									   </div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="row">
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									    <img class="d-block w-100"
										src="${sessionScope.list[6].listPhoto[0]}" alt="Third slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[6].wilaya}</h5>
											<p>${sessionScope.list[6].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[6].idBien}">
								            </form>
										</div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-6"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[7].listPhoto[0]}" alt="Third slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[7].wilaya}</h5>
											<p>${sessionScope.list[7].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[7].idBien}">
								            </form>
									    </div>
								</div>
								<div class="col-lg-4 col-xs-12 col-sm-12"
									style="padding-bottom: 15px; padding-top: 15px;">
									<img class="d-block w-100"
										src="${sessionScope.list[8].listPhoto[0]}" alt="Third slide">
										<div class="carousel-caption">
											<h5>${sessionScope.list[8].wilaya}</h5>
											<p>${sessionScope.list[8].titre}</p>
											<form action="http://localhost:8080/agence/BienServlet" method="post">
								            <button type="submit" class="btn btn-primary btn-sm">consulter</button> 
								            <input type="hidden" name="hidden" value="ConsulterBien">
								            <input type="hidden" name="idBien" value="${sessionScope.list[8].idBien}">
								            </form>
									   </div>
								</div>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#biens" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#biens" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--Fixed background-->
	<div id="fixed">
		<div class="container">
			<h1>
				<b>Listez votre propriété <br>et gagnez de l'argent!
				</b>
			</h1>
			<br> <a href="http://localhost:8080/agence/AjouterBien.jsp"><button type="button"
					class="btn btn-primary btn-lg">Louer mon bien</button></a>
		</div>
	</div>
	<!--Footer-->
	<footer>
		<div class="container-fluid">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-6">
						<img src="images/img/Ekrili_blanc1.png">
						<hr class="light">
						<p>Constantine, 25000</p>
						<p>
							<a href="http://localhost:8080/agence/conditions.html">Conditions générales</a>
						</p>
						<p>
							<a href="http://localhost:8080/agence/aide.html">Aide</a>
						</p>
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
	//switch
	$('#piscine').change(function(){
	     cb = $(this);
	     cb.val(cb.prop('checked'));
	 });
	 
	$('#jardin').change(function(){
	    cb = $(this);
	    cb.val(cb.prop('checked'));
	});

	$('#garage').change(function(){
	    cb = $(this);
	    cb.val(cb.prop('checked'));
	});
	
		//hide the form
		$("#dd").hide();
		$('.options').hide();
		//show form when clicking and hide back when clicking again
		$("#plusCritere").click(function() {
			$("#dd").toggle();
		});
		$(document)
				.ready(
						function() {
							jQuery.validator.addMethod("noSpace", function(
									value, element) {
								return value.indexOf(" ") < 0 && value != "";
							}, "Espace entre caractéres non autorisé");
							$('#idForm').validate({
								lang : 'fr',
								rules : {
									type : {
										required : true
									},
									etage : {
										noSpace : true
									},
									nbChambre : {
										noSpace : true
									}
								}
							});
							//close when clicking outside
							$(document)
									.mouseup(
											function(e) {
												var container = $("#dd,#plusCritere");
												// if the target of the click isn't the container nor a descendant of the container
												if (!container.is(e.target)
														&& container
																.has(e.target).length === 0) {
													container.hide();
													$("#plusCritere").show();
												}
											});
							//show options based on the selected option
							$(function() {
								$('#type').change(function() {
									$('.options').hide();
									$('#' + $(this).val()).show();
									$('#plusCritere').prop('disabled', false);
								});
							});
						});
</script>
</body>
</html>