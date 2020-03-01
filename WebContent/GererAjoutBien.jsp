<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Gestion d'ajout des biens</title>
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
		<table id="myTable" class="table table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>titre du bien</th>
					<th>Type du bien</th>
					<th>surface</th>
					<th>Prix mensuel</th>
					<th>pseudo proprietaire</th>
					<th></th>
				</tr>
			</thead>
			<tbody>

				</tr>
				<c:forEach var="bien" items="${sessionScope.ListBien}">
					<tr>
						<td>${bien.titre}</td>
						<td>${bien.type}</td>
						<td>${bien.surface}</td>
						<td>${bien.prixMensuelle}</td>
						<td>${bien.pseudo}</td>
						<td><form method="POST" align="center"
								action="http://localhost:8080/agence/AgentServlet">
								<input type="hidden" name="idBien" value="${bien.idBien}">
								<input type="hidden" name="hidden" value="GererAjoutBien">
								<input type="Submit" class="btn btn-info" value="Consulter" id="sub"></input>
							</form></td>
					</tr>
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

		$('#myTable').DataTable({
			"bLengthChange" : false,
			"pageLength" : 8,
			"language" : {
				"lengthMenu" : "Display _MENU_ records per page",
				"zeroRecords" : "aucune demande trouvé",
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