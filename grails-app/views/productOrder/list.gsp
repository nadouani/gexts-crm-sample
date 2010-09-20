
<%@ page import="fr.nadouani.crm.ProductOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productOrder.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="reference" title="${message(code: 'productOrder.reference.label', default: 'Reference')}" />
                        
                            <g:sortableColumn property="orderDate" title="${message(code: 'productOrder.orderDate.label', default: 'Order Date')}" />
                        
                            <g:sortableColumn property="shippedDate" title="${message(code: 'productOrder.shippedDate.label', default: 'Shipped Date')}" />
                        
                            <g:sortableColumn property="shipVia" title="${message(code: 'productOrder.shipVia.label', default: 'Ship Via')}" />
                        
                            <g:sortableColumn property="shipName" title="${message(code: 'productOrder.shipName.label', default: 'Ship Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productOrderInstanceList}" status="i" var="productOrderInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productOrderInstance.id}">${fieldValue(bean: productOrderInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productOrderInstance, field: "reference")}</td>
                        
                            <td><g:formatDate date="${productOrderInstance.orderDate}" /></td>
                        
                            <td><g:formatDate date="${productOrderInstance.shippedDate}" /></td>
                        
                            <td>${fieldValue(bean: productOrderInstance, field: "shipVia")}</td>
                        
                            <td>${fieldValue(bean: productOrderInstance, field: "shipName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productOrderInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
