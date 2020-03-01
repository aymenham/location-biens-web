<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<html lang="en">
    <head>
        <title>Espace client</title>
        <meta charset="utf-8">
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/EspaceClient.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
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
                                        <p><a href="#">Mes réservations</a></p>
                                        <p><a href="#">Mes biens</a></p>
                                        <p><a href="#">Profile</a></p>
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
                    <a href="#"><button type="button" class="btn btn-outline-dark" style="border-radius: 17px;">+ Louer ma maison</button></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
          <div class="main" align="center">
          <p class="m-4" style="font-size: 30px;"><i class="fas fa-lock"></i> Votre compte est bloqué</p>
          </div>
    </body>
</html>