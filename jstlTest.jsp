<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
         <h1>Test JSTL</h1>
        <!-- tag out -->
        <c:out value="Hola mundo, soy el tag out!" />

        <!-- tag set -->
        <%-- Setea una variable --%>
        <c:set var="miVariable" scope="request" value="soy el valor" />

        <%-- Imprime el valor miVariable --%>
        <c:out value="miVariable" />

        <P>

            <%-- Imprime el contenido de miVariable --%>
            <c:out value="${miVariable}" />

        <P>
            
        
            <%-- Define variables --%>
            <c:set var="vacio" scope="request" value="" />
            <c:set var="miVariable" scope="request" value="100" />


            <c:if test="${ miVariable == '100'}">
                <c:out value="miVariable es igual a 100" />
            </c:if>        

            <c:if test="${!(miVariable == '100')}">
                <c:out value="miVariable NO es igual a 100" />
            </c:if>        


            <%--
                    Para ejecutar este ejemplo: param.jsp?saludar=true&nombre=Juan
            --%>
            <c:if test="${param.saludar}">
            <h1>Hola ${param.nombre}!</H1>
            </c:if>

        <jsp:useBean id="now" class="java.util.Date" />
        Date: <fmt:formatDate value="${now}" dateStyle="full" />
    <br>
    <br>
    Date: <fmt:formatDate value="${now}" pattern="EEE, MMM d, yy" />

    <%--
        Para formatear una fecha se puede utilizar la propiedad 'pattern' del tag fmt:formatDate
        Ejemplos de uso:
            
            Date and Time Pattern           Result
            ----------------------------------------------------------------
            "yyyy.MM.dd G 'at' HH:mm:ss z" 	2001.07.04 AD at 12:08:56 PDT
            "EEE, MMM d, ''yy"                  Wed, Jul 4, '01
            "h:mm a"                            12:08 PM
            "hh 'o''clock' a, zzzz"             12 o'clock PM, Pacific Daylight Time
            "K:mm a, z"                         0:08 PM, PDT
            "yyyyy.MMMMM.dd GGG hh:mm aaa" 	02001.July.04 AD 12:08 PM
            "EEE, d MMM yyyy HH:mm:ss Z" 	Wed, 4 Jul 2001 12:08:56 -0700
            "yyMMddHHmmssZ"                     010704120856-0700
            "yyyy-MM-dd'T'HH:mm:ss.SSSZ" 	2001-07-04T12:08:56.235-0700            
    ---%>
    
    <%-- Define variables --%>
    <c:set var="categoria" value="C" scope="request" />

    <%-- Utiliza el choose --%>
    <c:choose>
        <c:when test="${categoria == 'A'}">
            <c:out value="Es la categoría A" />
        </c:when>
        <c:when test="${categoria == 'B'}">
            <c:out value="Es la categoría B" />
        </c:when>
        <c:when test="${categoria == 'C'}">
            <c:out value="Es la categoría C" />
        </c:when>
        <c:otherwise>
            <c:out value="No es una categoria" />
        </c:otherwise>
    </c:choose>



    <%-- Itera desde 10 al 20 saltando de a dos --%>
    <c:forEach var="i" begin="10" end="20" step="2">
        <c:out value="${i}"/><BR>
    </c:forEach>

    <HR>
    
    
    <%-- Itera desde 10 al 20 saltando index y count--%>
    <c:forEach var="i" begin="10" end="20" varStatus="status">
        indice: <c:out value="${status.index}"/> 
        iteracion #: <c:out value="${status.count}"/> <BR>
    </c:forEach>

    <HR>

    
    <%-- Itera por los items de una lista --%>

    <jsp:useBean id="in" scope="request" class="curso.java.web.parte05.repositories.Inscripto" />

    <c:forEach var="i" items="${in.all}">
        <c:out value="${i.id}" /> | <c:out value="${i.nombre}" /> | <c:out value="${i.apellido}" /><BR>
    </c:forEach>

    <table border="1">
        <thead><th>id</th><th>nombre</th><th>apellido</th></thead>
        <c:forEach var="i" items="${in.all}">
            <tr>
                <td><c:out value="${i.id}" />       </td>
                <td><c:out value="${i.nombre}" />   </td>
                <td><c:out value="${i.apellido}" /> </td>
            </tr>
        </c:forEach>
    </table>
     
    
    <%-- JSTL SQL --%>


        <sql:setDataSource 
            var="ds"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost/inscriptos"
            user="root"
            password=""
        />
        <sql:query var="allRows" dataSource="${ds}">
            select id,nombre,apellido from inscriptos;
        </sql:query>
            
         <c:forEach var="in" items="${allRows.rows}">
            <c:out value="${in.id}" /> 
            <c:out value="${in.nombre}" /> 
            <c:out value="${in.apellido}" /> 
        </c:forEach>
            
    </body>
</html>
