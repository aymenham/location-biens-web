<%@ page language="java" contentType="text/html; charset=utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
<html>
    <head>
        <title>Espace Agent</title>
        <link rel="shortcut icon" type="img/png" href="http://localhost:8080/agence/images/img/flavicon.png">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="style/bootstrap/js/jquery.min.js"></script>
        <link rel="stylesheet" href="style/bootstrap/css/bootstrap.min.css">
        <script src="style/bootstrap/js/bootstrap.min.js"></script>
        <link href="style/css/CalculerRecette.css" rel="stylesheet">
        <link href="style/fa/css/fontawesome-all.min.css" rel="stylesheet">
        <link href="jquery-ui/jquery-ui.min.css" rel="stylesheet">
        <script src="jquery-ui/jquery-ui.min.js"></script>
    </head>
    <body>
        <c:if test="${sessionScope.agent!='true'}">
            <c:redirect url="Administrator.html"></c:redirect>
        </c:if>
        <%@include file="EspaceAgentBar.jsp"%>
            <div class="main container mt-3">
                <div class="content bg-light rounded">
                    <form align="center" id="form">
                        <div class="pt-3 choix">
                            <span class="mr-5">
                                <label for="radio1">Date</label>
                                <input type="radio" id="radio1" name="choix" value="date" checked>
                            </span>
                            <span>
                                <label for="radio2">Période</label>
                                <input type="radio" id="radio2" name="choix" value="periode">
                            </span>
                        </div>
                        <div id="choix1">
                            <p for="date">veuillez choisir la date souhaitez:</p>
                            <input id="date" name="date" class="date" type="text" readonly="readonly">
                        </div>

                        <div id="choix2">
                            <P>veuillez choisir la période souhaitez:</P>
                            <label for="date1">date de depart:</label>
                            <input id="date1" name="date1" class="date" type="text" readonly="readonly">
                            <label for="date2" class="ml-5">date de fin:</label>
                            <input id="date2" name="date2" class="date" type="text" readonly="readonly">
                        </div>
                        <button class="btn btn-info btn-md btn-block text-uppercase mt-3 mb-1" type="submit" id="sub"><i class="fas fa-calendar-check"></i> Calculer</button>
                        <div id="resultat" class="mb-3"></div>
                        <input type="hidden" name="hidden" value="CalculerRecette">
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
<script>


    $('.date').datepicker({
        dateFormat: 'yy-mm-dd',
        inline: true,
        showOn: 'button',
        buttonImage: 'jquery-ui/images/ui-icon-calendar.png'
    });
    jQuery(function($){
        $.datepicker.regional['fr'] = {
            closeText: 'Fermer',
            prevText: '&#x3c;Préc',
            nextText: 'Suiv&#x3e;',
            currentText: 'Aujourd\'hui',
            monthNames: ['Janvier','Fevrier','Mars','Avril','Mai','Juin',
                         'Juillet','Aout','Septembre','Octobre','Novembre','Decembre'],
            monthNamesShort: ['Jan','Fev','Mar','Avr','Mai','Jun',
                              'Jul','Aou','Sep','Oct','Nov','Dec'],
            dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'],
            dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'],
            dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'],
            weekHeader: 'Sm',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: '',
            maxDate: 0,
            showButtonPanel: true
        };
        $.datepicker.setDefaults($.datepicker.regional['fr']);
    });

</script>
<script>
    $(document).ready(function() {
        $('#choix2').hide();
        $('#radio1').click(function(){
            $('#choix2').hide();
            $('#choix1').show();
        });
        $('#radio2').click(function(){
            $('#choix1').hide();
            $('#choix2').show();
        });
    });

    $( "#sub" ).click(function( event ) {
        $.ajax({
            url: "http://localhost:8080/agence/AdministrateurServlet",
            method: "post",
            data: $("#form").serialize(),
            success: function(responseText) {    
                $("#resultat").text(responseText);
            }
        });
        event.preventDefault();
    });
</script>
</html>