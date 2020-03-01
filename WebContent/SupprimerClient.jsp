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
		<table id="myTable" class="table table-striped table-bordered"
			cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Pseudo</th>
					<th>Nom</th>
					<th>Prenom</th>
					<th>Email</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="client" items="${sessionScope.ListClientSupprimable}">
					<tr>
						<td>${client.pseudo}</td>
						<td>${client.nom}</td>
						<td>${client.prenom}</td>
						<td>${client.email}</td>
						<td><form method="POST" align="center"
								action="http://localhost:8080/agence/AgentServlet">
								<input type="hidden" name="pseudo" value="${client.pseudo}">
								<input type="hidden" name="hidden" value="supprimerClient">
								<input type="Submit" class="btn btn-success" value="Supprimer"
									id="sub">
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
				"zeroRecords" : "aucun client trouvé",
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