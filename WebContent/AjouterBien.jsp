<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <title>Proposer un bien</title>
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
                                    <form action="http://localhost:8080/agence/AjouterBien.jsp" class="active">
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
                                    <form action="http://localhost:8080/agence/EditerProfilServlet" method="post">
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

                    <div class="col-12 col-md-8 col-lg-9 m-2 content">
                        <div class="personal-info col-lg-10">
                            <H1>Proposer un bien</H1>
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
                            <form class="form-horizontal bg-light rounded pb-1" id="idForm" method="post" action="http://localhost:8080/agence/ProprietaireServlet" enctype="multipart/form-data">
                                <div class="form-group pt-3">
                                    <div class="col-md-6">
                                        <select class="custom-select" name="type" id="type">
                                            <option selected disabled>Type du bien</option>
                                            <option value=maison>Maison</option>
                                            <option value=appartement>Appartement</option>
                                            <option value=terrain>Terrain</option>
                                            <option value=garage>Garage</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <select class="custom-select" name="wilaya" id="wilaya">
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
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 control-label" for="adresse">Adresse :</label>
                                    <div class="col-lg-12">
                                        <input class="form-control" type="text" id="adresse" name="adresse">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-6 control-label" for="prixMensuelle">Prix mensuel :</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="number" id="prixMensuelle" name="prixMensuelle" min="0" max="100000">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-6 control-label" for="actePropriéte">Acte de propriété :</label>
                                    <div class="col-lg-12">
                                        <input class="form-control-file" type="file" name="actePropriete" accept="image/*">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-6 control-label" for="surface">Surface :</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="number" id="surface" name="surface" min="0">
                                    </div>
                                </div>
								<div class="form-group">
                                    <label class="col-lg-6 control-label" for="titre">Titre du bien :</label>
                                    <div class="col-lg-6">
                                        <input class="form-control" type="text" id="titre" name="titre">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-12 control-label" for="description">Description du bien :</label>
                                    <div class="col-lg-12">
                                        <textarea class="form-control" id="description" name="description" rows="4"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-6 control-label" for="photoBien">Images du bien :</label>
                                    <div class="col-lg-12">
                                        <input class="form-control-file" type="file" name="photoBien" multiple="true" accept="image/*">
                                    </div>
                                </div>
                                <div id="appartement" class="options m-3">
                                    <label for="etage">numéro d'étages :</label>
                                    <input type=number name="etage" class="form-control" value="1" min="1">
                                    <label for="nbChambre">Nombre de chambres :</label>
                                    <input type=number name="nbChambre" class="form-control" value="1" min="1">
                                </div>
                                <div id="maison" class="options m-3">
                                    <label for="numeroEtage">Nombre d'étages :</label>
                                    <input type=number name="numeroEtage" class="form-control" value="1" min="1">
                                    <br>
                                    <label for="nbChambre2">Nombre de chambres :</label>
                                    <input type=number name="nbChambre2" class="form-control" value="1" min="1">
                                    <br>
                                    <span id="check">
                                        <label for="piscine">Piscine</label>
                                        <input type="checkbox" name="piscine" id="piscine" value="FALSE"/>
                                    </span>
                                    <span id="check">
                                        <label for="jardin">Jardin</label>
                                        <input type="checkbox" name="jardin" id="jardin" value="FALSE"/>
                                    </span>
                                    <span id="check">
                                        <label for="jardin">Garage</label>
                                        <input type="checkbox" name="garage" id="garage" value="FALSE"/>
                                    </span>
                                </div>
                                <div id="terrain" class="options m-3">
                                    <select class="custom-select" name="terrain" id="terrain">
                                        <option selected disabled>Type du terrain</option>
                                        <option value=agricole>Agricole</option>
                                        <option value=diffus>En diffus</option>
                                        <option value=terralotissementin>En lotissement</option>
                                    </select>
                                </div>
                                <div id="garage" class="options">
                                </div>
								<input type="hidden" name="hidden" value="AjouterBien">
                                <input type="submit" value="Ajouter" class="btn btn-secondary m-3">
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
$('.options').hide();


//show options based on the selected option
$(function() {
        $('#type').change(function(){
            $('.options').hide();
            $('#' + $(this).val()).show();
        });
 });
 
$(document).ready(function(){

	  jQuery.validator.addMethod("noSpace", function(value, element) { 
	  return value.indexOf(" ") < 0 && value != ""; 
	}, "Espace entre caractéres non autorisé");
	  
	  jQuery.validator.addMethod('positiveNumber',
			    function (value) { 
			        return Number(value) > 0;
			    }, 'nombre positive requis');

  $('#idForm').validate({
  	
  lang: 'fr',
  rules: {
  type: {
      required: true
  }
  ,
  wilaya: {
      required: true
  },
  prixMensuelle: {
      required: true,
      noSpace: true,
      positiveNumber: true,
      min :5000,
      max:100000
  },
  surface: {
      required: true,
      noSpace: true,
      positiveNumber: true,
      min: 0,
      max: 3000
  },
  adresse: {
      required: true
  },
  titre: {
      required: true
  },
  description: {
      required: true,
      minlength : 50
  },
  actePropriete: {
  	required : true
  },
  photoBien: {
  	required : true
  },
  numeroEtage: {
      noSpace: true,
      positiveNumber: true
  },
  etage: {
      noSpace: true,
      positiveNumber: true
  },
  nbChambre: {
      noSpace: true,
      positiveNumber: true
  },
  nbChambre2: {
      noSpace: true,
      positiveNumber: true
  }
          
      }
  });

});

</script>  
</body>
</html>