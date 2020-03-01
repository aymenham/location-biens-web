<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mes biens</title>
<link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
<script src="style/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<script type="text/javascript" src="DataTables/datatables.min.js"></script>
<link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
<script src="style/bootstrap/js/bootstrap.min.js"></script>
<link href="style/css/MesReservations.css" rel="stylesheet">
<link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
<link href="jquery-ui/jquery-ui.css" rel="stylesheet">
<script src="jquery-ui/jquery-ui.js"></script>
<script src="jquery-ui/jquery.validate.js"></script>
<script type="text/javascript" src="jquery-ui/localization/messages_fr.js"> </script>
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
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						data-target="login" href="#"> ${sessionScope.pseudo}<span
							class="caret"></span>
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
									<p>
										<a href="http://localhost:8080/agence/AuthentificationServlet">Deconnexion</a>
									</p>
								</div>
							</div>
						</div></li>
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/agence/aide.html">Aide</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8080/agence/conditions.html">Conditions
							générales</a></li>
					<li><a href="#"><button type="button"
								class="btn btn-outline-dark" style="border-radius: 17px;">+
								Louer ma maison</button></a></li>
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
								<button type="submit" class="btn-link">
									<i class="fas fa-search"></i><span class="nav-label">Rechercher</span>
								</button>
							</form>
						</li>
						<li>
							<form action="http://localhost:8080/agence/LocataireServlet"
								method="post">
								<input type="hidden" name="hidden" value="MesReservations">
								<button type="submit" class="btn-link">
									<i class="fa fa-laptop"></i><span class="nav-label">Mes
										réservations</span>
								</button>
							</form>
						</li>
					</ul>
					<ul class="list-sidebar">
						<li><div>Propriétaire :</div></li>
						<li>
							<form action="http://localhost:8080/agence/ProprietaireServlet"
								method="post" class="active">
								<input type="hidden" name="hidden" value="MesBiens">
								<button type="submit" class="btn-link">
									<i class="fas fa-home"></i><span class="nav-label">Mes
										biens</span>
								</button>
							</form>
						</li>
						<li>
							<form action="http://localhost:8080/agence/AjouterBien.jsp">
								<button type="submit" class="btn-link">
									<i class="fas fa-plus-circle"></i><span class="nav-label">Proposer
										un bien</span>
								</button>
							</form>
						</li>
						<li>
							<form action="http://localhost:8080/agence/ProprietaireServlet"
								method="post">
								<input type="hidden" name="hidden" value="ListeDemandeLocation">
								<button type="submit" class="btn-link">
									<i class="fas fa-edit"></i><span class="nav-label">Valider
										une location</span>
								</button>
							</form>
						</li>
					</ul>
					<ul class="list-sidebar">
						<li><div>Compte :</div></li>
						<li>
							<form action="http://localhost:8080/agence/EditerProfilServlet"
								method="post">
								<input type="hidden" name="hidden" value="EditerProfil">
								<button type="submit" class="btn-link">
									<i class="fas fa-user"></i><span class="nav-label">Editer
										mon Profil</span>
								</button>
							</form>
						</li>
						<li>
							<form
								action="http://localhost:8080/agence/AuthentificationServlet"
								method="get">
								<button type="submit" class="btn-link">
									<i class="fas fa-sign-out-alt"></i><span class="nav-label">Deconnexion</span>
								</button>
							</form>
						</li>
					</ul>
				</div>
 

	<div class="container pb-3" id="main">
    <div id="content">
      <ul id="tabs" class="nav nav-tabs"  data-tabs="tabs">
        <li class="nav-item"><a href="#EnAttente" data-toggle="tab" class="nav-link active">En attente</a>
        </li>
        <li class="nav-item"><a href="#Refuse" data-toggle="tab" class="nav-link">Refusé</a>
        </li>
        <li class="nav-item"><a href="#Disponible" data-toggle="tab" class="nav-link">Disponible</a>
        </li>
        <li class="nav-item"><a href="#EnLocation" data-toggle="tab" class="nav-link">En location</a>
      </ul>
    </div>
    <div id="my-tab-content" class="tab-content">
      <div class="tab-pane active" id="EnAttente">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
		<tr>
			<th>titre du bien</th>
			<th>type du bien</th>
			<th>wilaya</th>
			<th>surface</th>
			<th>prix mensuel</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.listBien}">
		<c:if test="${bien.statut=='EnAttente'}">
		<tr>
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td><div id="prix${bien.idBien}" style="display:inline;">${bien.prixMensuelle} DA</div>
			<a href="#" name="${bien.idBien}" class="modifier" style="display:inline;"><i class="fa fa-money-bill"></i></a>
			<form method="POST"  id="${bien.idBien}" class="formModifier">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ModifierPrix">
			<label for="NouveauPrix">Nouveau prix :</label>
			<input type="number" name="NouveauPrix" id="NouveauPrix">
            </form>
			</td>
			
			<td>
			<div id="suppsupp${bien.idBien}" style="display:inline;">
			<form method="POST"  id="supp${bien.idBien}" class="formSupp">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="Supprimer">
            </form>
            <a href="#" name="supp${bien.idBien}" class="supp btn btn-danger mx-2" style="width: 34px; height:34px;border-radius: 17px;"><i class="fas fa-times" style="position: relative; left: -5px; top:-2px; font-size:26px;"></i></a>
			</div>
			<span>
			<form method="POST"  action="http://localhost:8080/agence/BienServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ConsulterBien">
			<input type="Submit" value="Consulter" class="btn btn-info"></input>
			</form>
			</span>
			</td>
		</tr>
		 </c:if>
		</c:forEach>
		</tbody>
	    </table>
      </div>
      <div class="tab-pane" id="Refuse">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
		<tr>
			<th>titre du bien</th>
			<th>type du bien</th>
			<th>wilaya</th>
			<th>surface</th>
			<th>prix mensuel</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.listBien}">
		<c:if test="${bien.statut=='Refuser'}">
		<tr>
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td><div id="prix${bien.idBien}" style="display:inline;">${bien.prixMensuelle} DA</div>
			<a href="#" name="${bien.idBien}" class="modifier" style="display:inline;"><i class="fa fa-money-bill"></i></a>
			<form method="POST"  id="${bien.idBien}" class="formModifier">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ModifierPrix">
			<label for="NouveauPrix">Nouveau prix :</label>
			<input type="number" name="NouveauPrix" id="NouveauPrix">
            </form>
			</td>
			
			<td>
			<div id="suppsupp${bien.idBien}" style="display:inline;">
			<form method="POST"  id="supp${bien.idBien}" class="formSupp">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="Supprimer">
            </form>
            <a href="#" name="supp${bien.idBien}" class="supp btn btn-danger mx-2" style="width: 34px; height:34px;border-radius: 17px;"><i class="fas fa-times" style="position: relative; left: -5px; top:-2px; font-size:26px;"></i></a>
			</div>
			<span>
			<form method="POST"  action="http://localhost:8080/agence/BienServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ConsulterBien">
			<input type="Submit" value="Consulter" class="btn btn-info"></input>
			</form>
			</span>
			</td>
		</tr>
		 </c:if>
		</c:forEach>
		</tbody>
	    </table>
      </div>
      <div class="tab-pane" id="Disponible">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
		<tr>
			<th>titre du bien</th>
			<th>type du bien</th>
			<th>wilaya</th>
			<th>surface</th>
			<th>prix mensuel</th>
			<th>locations</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.listBien}">
		<c:if test="${bien.statut=='Accepter'}">
		<tr>
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td><div id="prix${bien.idBien}" style="display:inline;">${bien.prixMensuelle} DA</div>
			<a href="#" name="${bien.idBien}" class="modifier" style="display:inline;"><i class="fa fa-money-bill"></i></a>
			<form method="POST"  id="${bien.idBien}" class="formModifier">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ModifierPrix">
			<label for="NouveauPrix">Nouveau prix :</label>
			<input type="number" name="NouveauPrix" id="NouveauPrix">
            </form>
			</td>
			<td>
			<form method="POST"  action="http://localhost:8080/agence/ProprietaireServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ListLocation">
			<input type="Submit" value="locations" class="btn btn-info"></input>
			</form>
			</td>
			<td>
			<div id="suppsupp${bien.idBien}" style="display:inline;">
			<form method="POST"  id="supp${bien.idBien}" class="formSupp">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="Supprimer">
            </form>
            <a href="#" name="supp${bien.idBien}" class="supp btn btn-danger mx-2" style="width: 34px; height:34px;border-radius: 17px;"><i class="fas fa-times" style="position: relative; left: -5px; top:-2px; font-size:26px;"></i></a>
			</div>
			<span>
			<form method="POST"  action="http://localhost:8080/agence/BienServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ConsulterBien">
			<input type="Submit" value="Consulter" class="btn btn-info"></input>
			</form>
			</span>
			</td>
		</tr>
		 </c:if>
		</c:forEach>
		</tbody>
	    </table>
      </div>
      <div class="tab-pane" id="EnLocation">
        <table id="myTable1" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
		<tr>
			<th>titre du bien</th>
			<th>type du bien</th>
			<th>wilaya</th>
			<th>surface</th>
			<th>prix mensuel</th>
			<th>locations</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.listBien}">
		<c:if test="${bien.statut=='EnLocation'}">
		<tr>
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td><div id="prix${bien.idBien}" style="display:inline;">${bien.prixMensuelle} DA</div>
			<a href="#" name="${bien.idBien}" class="modifier" style="display:inline;"><i class="fa fa-money-bill"></i></a>
			<form method="POST"  id="${bien.idBien}" class="formModifier">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ModifierPrix">
			<label for="NouveauPrix">Nouveau prix :</label>
			<input type="number" name="NouveauPrix" id="NouveauPrix">
            </form>
			</td>
			<td>
			<form method="POST"  action="http://localhost:8080/agence/ProprietaireServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ListLocation">
			<input type="Submit" value="locations" class="btn btn-info"></input>
			</form>
			</td>
			<td>
			<span>
			<form method="POST"  action="http://localhost:8080/agence/BienServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ConsulterBien">
			<input type="Submit" value="Consulter" class="btn btn-info"></input>
			</form>
			</span>
			</td>
		</tr>
		 </c:if>
		</c:forEach>
		</tbody>
	    </table>
      </div>
    </div>
  </div>
  </div>
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
</body>
<script>
$(document).ready(function() {
	
	    $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
        $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
        } );
    
	    $('table.table').DataTable({ 
	    	"bLengthChange": false,
	    	"pageLength": 8,
	    	"language": {
	            "lengthMenu": "Display _MENU_ records per page",
	            "zeroRecords": "Aucune bien trouvé",
	            "info": "page _PAGE_ sur _PAGES_",
	            "infoEmpty": "",
	            "infoFiltered": "(filtered from _MAX_ total records)",
	            "search":         "Rechercher:",
	            	"paginate": {
	                    "first":      "First",
	                    "last":       "Last",
	                    "next":       "Suivant",
	                    "previous":   "Précedant"
	             }
	        }
	    });
});
</script>
<script type="text/javascript">
        
        
         
        // Link to open the dialog
        $( ".modifier" ).click(function( event ) {
        	var x = this.name;
        	$( "#"+x ).dialog( "open" );
        	event.preventDefault();
        });
        
        $( ".supp" ).click(function( event ) {
        	var x = this.name;
        	$.ajax({
                url: "http://localhost:8080/agence/ProprietaireServlet",
                method: "post",
                data: $("#"+x).serialize(),
                success: function(responseText) {   
                    $("#supp"+x).html(responseText);
                }
            });
        	event.preventDefault();
        });
        
        $(document).ready(function(){

      	  jQuery.validator.addMethod("noSpace", function(value, element) { 
      	  return value.indexOf(" ") < 0 && value != ""; 
      	}, "Espace entre caractéres non autorisé");
      	  
      	  jQuery.validator.addMethod('positiveNumber',
      			    function (value) { 
      			        return Number(value) > 0;
      			    }, 'nombre positive requis');

        $('.formModifier').validate({
        	
        lang: 'fr',
        rules: {
        
        NouveauPrix: {
            required: true,
            noSpace: true,
            positiveNumber: true
        }
                
            }
        });

      });
        
        $( ".formModifier" ).dialog({
        	title:"modifier le prix du bien",
        	autoOpen: false,
        	width: 400,
        	buttons: [
        		{
        			text: "Modifier",
        			click: function() {
        				
        				if ( $(this).valid()  ) {
        				 var id = $(this).attr('id');
        				$.ajax({
                            url: "http://localhost:8080/agence/ProprietaireServlet",
                            method: "post",
                            async: false,
                            data: $(this).serialize(),
                            success: function(responseText) {   
                                $("#prix"+id).text(responseText+" DA");
                            
                            }
                        });
        				$( this ).dialog( "close" );
        				}
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

      </script>  
</html>