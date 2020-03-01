<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Espace Agent</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/EspaceAgent.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
    </head>
    <body>
    
  
  
                   <%@include file="EspaceAgentBar.jsp" %>
  
                    <div id="content" class="col-12 col-md-8 col-lg-9 mt-3">
                        <div class="welcome row justify-content-between">
                            <h1>Bienvenue</h1>
                            <i class="fas fa-calendar"></i>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6 bg-light row m-3 p-3 rounded main">
                                    <div class="col-md-2">
                                        <i class="fas fa-home"></i>
                                    </div>
                                    <div class="col-md-10">
                                        <h2 id="title">Gestion des biens :</h2>
                                        <ul>
                                            <li>
                                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListBienAGerer">
                                                    -<button type="submit" class="btn-link">Gérer les demandes d'ajout des biens</button>
                                                </form>
                                            </li>
                                            <li>
                                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListBien">
                                                    -<button type="submit" class="btn-link">Supprimer des biens</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-5 bg-light row m-3 p-3 rounded main">
                                    <div class="col-md-2">
                                        <i class="fas fa-user-circle"></i>
                                    </div>
                                    <div class="col-md-10">
                                        <h2 id="title">Gestion des clients :</h2>
                                        <ul>
                                            <li>
                                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListclientBloque">
                                                    -<button type="submit" class="btn-link">Debloquer Clients</button>
                                                </form>
                                            </li>
                                            <li>
                                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListclientDebloque">
                                                    -<button type="submit" class="btn-link">Bloquer Clients</button>
                                                </form>
                                            </li>
                                            <li>
                                                <form action="http://localhost:8080/agence/AgentServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListClientSupprimable">
                                                    -<button type="submit" class="btn-link">Supprimer Clients</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-8 bg-light row m-3 p-3 rounded main">
                                    <div class="col-md-2">
                                        <i class="fas fa-male"></i><i class="fas fa-male"></i><i class="fas fa-male"></i>
                                    </div>
                                    <div class="col-md-10">
                                        <h2 id="title">Gestion des agents :</h2>
                                        <ul>
                                            <li>
                                                <form action="http://localhost:8080/agence/AjouterAgent.jsp">
                                                    <input type="hidden" name="hidden" value="">
                                                    -<button type="submit" class="btn-link">Ajouter des agents</button>
                                                </form>
                                            </li>
                                            <li>
                                                <form action="http://localhost:8080/agence/AdministrateurServlet" method="post">
                                                    <input type="hidden" name="hidden" value="ListAgent">
                                                    -<button type="submit" class="btn-link">Supprimer des agents</button>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-3 bg-light m-3 p-3 rounded row">
                                    <div class="col-md-3">
                                        <i class="fas fa-money-bill-wave"></i>
                                    </div>
                                    <div class="col-md-9">
                                        <form action="http://localhost:8080/agence/CalculerRecette.jsp">
                                        <button type="submit" class="btn btn-info">Calculer la recette</button>
                                        </form>
                                        <p class="my-2">Spécifiez la période désirée.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>