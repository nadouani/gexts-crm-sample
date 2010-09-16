
<%@ page import="fr.nadouani.crm.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'supplier.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="company" title="${message(code: 'supplier.company.label', default: 'Company')}" />
                        
                            <g:sortableColumn property="contactName" title="${message(code: 'supplier.contactName.label', default: 'Contact Name')}" />
                        
                            <g:sortableColumn property="contactTitle" title="${message(code: 'supplier.contactTitle.label', default: 'Contact Title')}" />
                        
                            <g:sortableColumn property="contactEmail" title="${message(code: 'supplier.contactEmail.label', default: 'Contact Email')}" />
                        
                            <g:sortableColumn property="address" title="${message(code: 'supplier.address.label', default: 'Address')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${supplierInstanceList}" status="i" var="supplierInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${supplierInstance.id}">${fieldValue(bean: supplierInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "company")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "contactName")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "contactTitle")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "contactEmail")}</td>
                        
                            <td>${fieldValue(bean: supplierInstance, field: "address")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${supplierInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
