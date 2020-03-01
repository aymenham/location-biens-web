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
				    <th>Login</th>
					<th>Nom</th>
					<th>prenom</th>
					<th>Numero telephone</th>
					<th>grade</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="agent" items="${sessionScope.ListAgent}">
				<c:if test="${agent.login!=sessionScope.login}">
					<tr>
					    <td>${agent.login}</td>
						<td>${agent.nom}</td>
						<td>${agent.prenom}</td>
						<td>0${agent.numTel}</td>
						<td><c:if test="${agent.grade!='true'}">
		    Agent
	        </c:if> <c:if test="${agent.grade=='true'}">
		    Administrateur
	        </c:if></td>
						<td><form align="center" method="POST"
								action="http://localhost:8080/agence/AdministrateurServlet">
								<input type="hidden" name="login" value="${agent.login}">
								<input type="hidden" name="hidden" value="SupprimerAgent">
								<input type="Submit" class="btn btn-danger" value="Supprimer"
									id="sub">
							</form></td>
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

		$('#myTable').DataTable({
			"bLengthChange" : false,
			"pageLength" : 8,
			"language" : {
				"lengthMenu" : "Display _MENU_ records per page",
				"zeroRecords" : "aucun agent trouvé",
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