<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html>
    <head>
        <title>Recherche</title>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/ListeBiens.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="jquery-ui/jquery-ui.css" rel="stylesheet">
        <script src="jquery-ui/external/jquery/jquery.js"></script>
        <script src="jquery-ui/jquery-ui.js"></script>
        <script src="jquery-ui/jquery.validate.js"></script>
        <script type="text/javascript" src="jquery-ui/localization/messages_fr.js"></script>
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
         <!--Navigation-->
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
                            <c:if test="${sessionScope.exist=='true'}">
                            ${sessionScope.pseudo}
                            </c:if>
                            <c:if test="${sessionScope.exist!='true'}">
                            Login
                            </c:if>
                            <span class="caret"></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="login" id="login-dp">
                            <div class="row">
                                <c:if test="${sessionScope.exist!='true'}">
                                <div class="col-md-12">
                                    <form class="form" role="form" method="post" action="http://localhost:8080/agence/AuthentificationServlet" id="login-nav">
                                        <div class="form-group">
                                            <label for="email">Email ou Pseudo :</label>
                                            <input type="text" class="form-control" id="email" name="login" placeholder="Email ou pseudo" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Mot de passe :</label>
                                            <input type="password" class="form-control" id="password" name="mdp" placeholder="Mot de passe" required>
                                            <div class="help-block text-right"><a href="http://localhost:8080/agence/motDePasseOublie.html">Mot de passe oublié?</a></div>
                                        </div>
                                        <div class="form-group">
											 <button type="submit" class="btn btn-primary btn-block">Se connecter</button>
										</div>
										<input type="hidden" name="hidden" value="Authentification">
                                    </form>
                                </div>
                                <div class="bottom text-center">
                                    Nouveau ici ? <a href="http://localhost:8080/agence/Inscription.html"><b>Rejoignez-nous</b></a>
                                </div>
                                </c:if>
                                <c:if test="${sessionScope.exist=='true'}">
                                <div class="col-md-12">
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
                                </c:if>
 
                            </div>
                        </div>
                    </li>
                    <li class="nav-item "><a class="nav-link" href="http://localhost:8080/agence/aide.html">Aide</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/agence/conditions.html">Conditions
							générales</a></li>
                    <li>
                        <a href="http://localhost:8080/agence/AjouterBien.jsp"><button type="button" class="btn btn-outline-dark" style="border-radius: 17px;">+ Louer ma maison</button></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        <section class="search-box mt-3">
        
        <div id="search-bg" class="container-fluid mb-3">
        <div class="search container">
						<form method="post"
							action="http://localhost:8080/agence/RechercheServlet"
							id="idForm" class="rounded">
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
								</span> <span class="row col-12 col-md-9"> <b id="surface">Surface
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
									<div class="dropdown-menu" id="dd">
										<fieldset name="plus de critéres"
											style="width: 84%; margin: auto;" class="pb-3">
											<div id="appartement" class="options row">
												<label for="etage">numero d'étages</label> <input
													type=number name="etage" class="form-control" min="1">
												<label for="nbChambre">Nombre de chambres</label> <input
													type=number name="nbChambre" class="form-control" min="1">
											</div>
											<div id="maison" class="options">
												<div class="row">
													<label for="nombreEtage">Nombre d'étages</label> <input
														type=number name="nombreEtage" class="form-control"
														min="1"> <label for="nbChambre2">Nombre de
														chambres</label> <input type=number name="nbChambre2"
														class="form-control" min="1">
												</div>
												<span id="check"> <label for="piscine">Piscine</label>
													<input type="checkbox" name="piscine" id="piscine"
													value="FALSE" />
												</span> <span id="check"> <label for="jardin">Jardin</label>
													<input type="checkbox" name="jardin" id="jardin"
													value="FALSE" />
												</span> <span id="check"> <label for="jardin">Garage</label>
													<input type="checkbox" name="garage" id="garage"
													value="FALSE" />
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
												<h1>pas de critéres additional pour le type garage</h1>
											</div>
										</fieldset>
									</div>
									<button type=submit class="btn btn-primary m-1">
										Rechercher</button>
								</div>
							</div>
						</form>
					</div>
                 </div>
            <c:if test="${!empty listBien}">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 listing-block">
                        <c:forEach var="bien" items ="${listBien}">
                        <div class="media rounded">
                            <img class="d-flex align-self-start rounded-left" src="${bien.listPhoto[0]}" alt="image">
                            <div class="media-body pl-3">
                                <div class="row">
                                    <div class="col-12 col-md-8 bg-light">
                                        <h6>${bien.type}</h6>
                                        <h5>${bien.titre}</h5>
                                        <p style="white-space: pre-wrap;" class="crop">${bien.description}</p>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="price"><span class="da">${bien.prixMensuelle}</span> DA/mois</div>
                                        <div class="price"><span class="da">200</span> m²<small>${bien.wilaya}</small></div>
                                        <div class="address">${bien.adresse}</div>
                                        <form method="POST"  action="http://localhost:8080/agence/BienServlet" align="center">
			                            <input type="hidden" name="idBien" value="${bien.idBien}">
			                            <input type="hidden" name="hidden" value="ConsulterBien">
			                            <input type="Submit" value="Consulter" class="btn btn-info mt-2" id="sub"></input></form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            </c:if>
            <c:if test="${empty listBien}">
            <div class="main" align="center">
            <p class="m-4" style="font-size: 30px;"><i class="fas fa-search"></i> Aucun Resultat trouvé</p>
            </div>
            </c:if>
        </section>
        <!-- Footer -->
        <footer class="site-footer">
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