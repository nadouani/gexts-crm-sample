
<%@ page import="fr.nadouani.crm.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'order.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="reference" title="${message(code: 'order.reference.label', default: 'Reference')}" />
                        
                            <g:sortableColumn property="orderDate" title="${message(code: 'order.orderDate.label', default: 'Order Date')}" />
                        
                            <g:sortableColumn property="shippedDate" title="${message(code: 'order.shippedDate.label', default: 'Shipped Date')}" />
                        
                            <g:sortableColumn property="shipVia" title="${message(code: 'order.shipVia.label', default: 'Ship Via')}" />
                        
                            <g:sortableColumn property="shipName" title="${message(code: 'order.shipName.label', default: 'Ship Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderInstanceList}" status="i" var="orderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderInstance.id}">${fieldValue(bean: orderInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "reference")}</td>
                        
                            <td><g:formatDate date="${orderInstance.orderDate}" /></td>
                        
                            <td><g:formatDate date="${orderInstance.shippedDate}" /></td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "shipVia")}</td>
                        
                            <td>${fieldValue(bean: orderInstance, field: "shipName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
