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
	<div id="content" class="col-12 col-md-8 col-lg-9 mt-3 pb-3">
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
    <br>
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
		<c:forEach var="bien" items ="${sessionScope.ListBien}">
		<c:if test="${bien.statut=='EnAttente'}">
		<tr>
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td>${bien.prixMensuelle} DA</td>
			<td>
			<form method="POST"  action="http://localhost:8080/agence/AgentServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="SupprimerBien">
			<input type="submit" class="supp btn btn-danger mx-2" value="supprimer">
            </form>
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
		<c:forEach var="bien" items ="${sessionScope.ListBien}">
		<c:if test="${bien.statut=='Refuser'}">
		<tr>
		    
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td>${bien.prixMensuelle} DA</td>
			<td>
			<form method="POST"  action="http://localhost:8080/agence/AgentServlet" align="center" style="display:inline;">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="SupprimerBien">
			<input type="submit" class="supp btn btn-danger mx-2" value="supprimer">
            </form>
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
			<th></th>
			
			
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.ListBien}">
		<c:if test="${bien.statut=='Accepter'}">
		<tr>
		    
		    <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td>${bien.prixMensuelle} DA</td>
			<td>
			<div class="row">
			<form method="POST"  action="http://localhost:8080/agence/AgentServlet">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="SupprimerBien">
			<input type="submit" class="supp btn btn-danger mx-2" value="supprimer">
            </form>
			<form method="POST"  action="http://localhost:8080/agence/BienServlet">
			<input type="hidden" name="idBien" value="${bien.idBien}">
			<input type="hidden" name="hidden" value="ConsulterBien">
			<input type="Submit" value="Consulter" class="btn btn-info"></input>
			</form>
			</div>
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
			<th></th>
			
		</tr>
		</thead>
		<tbody>
		<c:forEach var="bien" items ="${sessionScope.ListBien}">
		<c:if test="${bien.statut=='EnLocation'}">
		<tr>
		   
		   <td>${bien.titre}</td>
		    <td>${bien.type}</td>
		    <td>${bien.wilaya}</td>
		    <td>${bien.surface}m²</td>
		    <td>${bien.prixMensuelle} DA</td>
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

</body>
<script>
	$(document).ready(function() {

		$('table.table').DataTable({
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