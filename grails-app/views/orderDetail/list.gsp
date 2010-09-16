
<%@ page import="fr.nadouani.crm.OrderDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderDetail.label', default: 'OrderDetail')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'orderDetail.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="quantity" title="${message(code: 'orderDetail.quantity.label', default: 'Quantity')}" />
                        
                            <th><g:message code="orderDetail.product.label" default="Product" /></th>
                   	    
                            <th><g:message code="orderDetail.order.label" default="Order" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${orderDetailInstanceList}" status="i" var="orderDetailInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${orderDetailInstance.id}">${fieldValue(bean: orderDetailInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: orderDetailInstance, field: "quantity")}</td>
                        
                            <td>${fieldValue(bean: orderDetailInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: orderDetailInstance, field: "order")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${orderDetailInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
