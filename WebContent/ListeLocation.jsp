<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Espace Agent</title>
<link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
<script src="style/bootstrap/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="DataTables/datatables.min.css" />
<script type="text/javascript" src="DataTables/datatables.min.js"></script>
<link href="style/css/EspaceAgent.css" rel="stylesheet">
<link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">

</head>
<body>
        <c:if test="${sessionScope.agent!='true'}">
		<c:redirect url="Administrator.html"></c:redirect>
	    </c:if>
	<%@include file="EspaceAgentBar.jsp"%>
	<div id="content" class="col-12 col-md-8 col-lg-9 mt-3">
		<div class="container pb-3" id="main">
					<div id="content">
						<ul id="tabs" class="nav nav-tabs" data-tabs="tabs">
							<li class="nav-item"><a class="nav-link active" href="#Acceptee"
								data-toggle="tab">En attente des documents</a></li>
							<li class="nav-item"><a class="nav-link" href="#Acceptee2"
								data-toggle="tab">Acceptée</a></li>
							<li class="nav-item"><a class="nav-link" href="#EnCours"
								data-toggle="tab">En cours</a></li>
							<li class="nav-item"><a class="nav-link" href="#Termine"
								data-toggle="tab">Terminé</a></li>
						</ul>
					</div>
					<div id="my-tab-content" class="tab-content">
						<div class="tab-pane active" id="Acceptee">
							<table id="myTable3" class="table table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>titre du bien</th>
										<th>date de debut</th>
										<th>date de fin</th>
										<th>prix total</th>
										<th>Locataire</th>
										<th>Proprietaire</th>
										<th>Facture/Contrat</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="location" items="${sessionScope.ListLocation}" varStatus="myIndex">
											<c:if test="${location.statut=='Accepter'}">
											<c:if test="${sessionScope.ListFacture[myIndex.index].dateFacture==null}">
												<tr>
													<td>${sessionScope.ListBien[myIndex.index].titre}</td>
													<td>${location.dateDebut}</td>
													<td>${location.dateFin}</td>
													<td>${sessionScope.ListFacture[myIndex.index].prixTotale} DA</td>
													<td>${location.pseudo}</td>
													<td>${sessionScope.ListBien[myIndex.index].pseudo}</td>
													<td><form method="POST" align="center"
															action="http://localhost:8080/agence/AgentServlet">
															<input type="hidden" name="idLocation"
																value="${location.idLocation}"> <input type="hidden"
																name="hidden" value="GenererDocument"> <input
																type="Submit" value=" Gérer" id="sub" class="btn btn-primary"></input>
													</form></td>
												</tr>
											</c:if>
											</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="Acceptee2">
							<table id="myTable3" class="table table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>titre du bien</th>
										<th>date de debut</th>
										<th>date de fin</th>
										<th>prix total</th>
										<th>Locataire</th>
										<th>Proprietaire</th>
										<th>Facture/Contrat</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="location" items="${sessionScope.ListLocation}" varStatus="myIndex">
											<c:if test="${location.statut=='Accepter'}">
											<c:if test="${sessionScope.ListFacture[myIndex.index].dateFacture!=null}">
												<tr>
													<td>${sessionScope.ListBien[myIndex.index].titre}</td>
													<td>${location.dateDebut}</td>
													<td>${location.dateFin}</td>
													<td>${sessionScope.ListFacture[myIndex.index].prixTotale} DA</td>
													<td>${location.pseudo}</td>
													<td>${sessionScope.ListBien[myIndex.index].pseudo}</td>
													<td>
													<a class="mr-5 ml-3" href="http://localhost:8080/agence/Document/Facture/facture-n${sessionScope.ListFacture[myIndex.index].idFacture}.pdf"><i class="fas fa-clone"></i></a>			
													<a href="http://localhost:8080/agence/Document/Contrat/contrat-n${location.idLocation}.pdf"><i class="fas fa-clone"></i></a>													
													</td>
												</tr>
											</c:if>
											</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="EnCours">
							<table id="myTable4" class="table table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
							<tr>

								<th>titre du bien</th>
								<th>date de debut</th>
								<th>date de fin</th>
								<th>prix total</th>
								<th>Locataire</th>
								<th>Proprietaire</th>
								<th>Facture/Contrat</th>
							</tr>
						</thead>
								<tbody>
									<c:forEach var="location" items="${sessionScope.ListLocation}" varStatus="myIndex">
											<c:if test="${location.statut=='EnCours'}">
												<tr>
													<td>${sessionScope.ListBien[myIndex.index].titre}</td>
													<td>${location.dateDebut}</td>
													<td>${location.dateFin}</td>
													<td>${sessionScope.ListFacture[myIndex.index].prixTotale} DA</td>
													<td>${location.pseudo}</td>
													<td>${sessionScope.ListBien[myIndex.index].pseudo}</td>
													<td>
													<a class="mr-5 ml-3" href="http://localhost:8080/agence/Document/Facture/facture-n${sessionScope.ListFacture[myIndex.index].idFacture}.pdf"><i class="fas fa-clone"></i></a>			
													<a href="http://localhost:8080/agence/Document/Contrat/contrat-n${location.idLocation}.pdf"><i class="fas fa-clone"></i></a>													
													</td>
												</tr>
											</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane" id="Termine">
							<table id="myTable5" class="table table-striped table-bordered"
								cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>titre du bien</th>
										<th>date de debut</th>
										<th>date de fin</th>
										<th>prix total</th>
										<th>Locataire</th>
										<th>Proprietaire</th>
										<th>Facture/Contrat</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="location" items="${sessionScope.ListLocation}" varStatus="myIndex">
											<c:if test="${location.statut=='Termine'}">
												<tr>
													<td>${sessionScope.ListBien[myIndex.index].titre}</td>
													<td>${location.dateDebut}</td>
													<td>${location.dateFin}</td>
													<td>${sessionScope.ListFacture[myIndex.index].prixTotale} DA</td>
													<td>${location.pseudo}</td>
													<td>${sessionScope.ListBien[myIndex.index].pseudo}</td>
													<td>
													<a class="mr-5 ml-3" href="http://localhost:8080/agence/Document/Facture/facture-n${sessionScope.ListFacture[myIndex.index].idFacture}.pdf"><i class="fas fa-clone"></i></a>			
													<a href="http://localhost:8080/agence/Document/Contrat/contrat-n${location.idLocation}.pdf"><i class="fas fa-clone"></i></a>													
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


</body>
<script>
	$(document).ready(function() {

		$('table.table').DataTable({
			"bLengthChange" : false,
			"pageLength" : 8,
			"language" : {
				"lengthMenu" : "Display _MENU_ records per page",
				"zeroRecords" : "aucune location trouvé",
				"info" : "page _PAGE_ sur _PAGES_",
				"infoEmpty" : "",
				"infoFiltered" : "(filtered from _MAX_ total records)",
				"search" : "Rechercher:",
				"paginate" : {
					"first" : "First",
					"last" : "Last",
					"next" : "Suivant",
					"previous" : "Précedant"
				}
			}
		});
	});
</script>
</html>