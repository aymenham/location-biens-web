<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

        <c:if test="${sessionScope.agent!='true'}">
		<c:redirect url="Administrator.html"></c:redirect>
	    </c:if>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="images/img/Ekrili_blanc1.png"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" data-target="login" href="#">
                                ${sessionScope.nom} ${sessionScope.prenom}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-4 col-lg-3 sidebar" id="sidebar">
                        <ul class="list-sidebar">
                            <li><div>Agent :</div></li>
                            <li><a href="#" data-toggle="collapse" data-target="#biens" class="collapsed"><i class="fas fa-home"></i><span class="nav-label">Gérer les biens</span><span class="fa fa-chevron-left"></span></a>
                                <ul class="sub-menu collapse" id="biens">
                                    <li>
                                        <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListBienAGerer">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Demandes d'ajout</span></button>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListBien">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Supprimer biens</span></button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#" data-toggle="collapse" data-target="#clients" class="collapsed"><i class="fas fa-user-circle"></i><span class="nav-label">Gérer les clients</span><span class="fa fa-chevron-left"></span></a>
                                <ul class="sub-menu collapse" id="clients">
                                    <li>
                                        <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListclientBloque">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Debloquer Clients</span></button>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListclientDebloque">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Bloquer Clients</span></button>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListClientSupprimable">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Supprimer Clients</span></button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                    <input type="hidden" name="hidden" value="ListLocation">
                                    <button type="submit" class="btn-link"><i class="fas fa-file-alt"></i><span class="nav-label">Contrats et Factures</span></button>
                                </form>
                            </li>
                        </ul>
                        <c:if test="${sessionScope.admin=='true'}">
                        <ul class="list-sidebar">
                            <li><div>Administrateur :</div></li>
                            <li><a href="#" data-toggle="collapse" data-target="#agents" class="collapsed"><i class="fas fa-male"></i><span class="nav-label">Gérer les agents</span><span class="fa fa-chevron-left"></span></a>
                                <ul class="sub-menu collapse" id="agents">
                                    <li>
                                        <form action="http://localhost:8080/agence/AjouterAgent.jsp">
                                            <input type="hidden" name="hidden" value="">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Ajouter un agent</span></button>
                                        </form>
                                    </li>
                                    <li>
                                        <form action="http://localhost:8080/agence/AdministrateurServlet" method="post">
                                            <input type="hidden" name="hidden" value="ListAgent">
                                            <button type="submit" class="btn-link"><i class="fas fa-chevron-right"></i><span class="nav-label">Supprimer un agent</span></button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <form action="http://localhost:8080/agence/CalculerRecette.jsp">
                                    <button type="submit" class="btn-link"><i class="fas fa-money-check-alt"></i><span class="nav-label">Calculer la recette</span></button>
                                </form>
                            </li>
                        </ul>
                        </c:if>
                        <ul class="list-sidebar">
                            <li><div>Compte :</div></li>
                            <li>
                                <form action="http://localhost:8080/agence/AuthentificationServlet" method="get">
                                    <input type="hidden" name="hidden" value="">
                                    <button type="submit" class="btn-link"><i class="fas fa-sign-out-alt"></i><span class="nav-label">Deconnexion</span></button>
                                </form>
                            </li>
                        </ul>
                    </div>
</body>
</html>