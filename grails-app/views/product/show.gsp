
<%@ page import="fr.nadouani.crm.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.picture.label" default="Picture" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "picture")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "quantityPerUnit")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.unitPrice.label" default="Unit Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "unitPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.unitsInStock.label" default="Units In Stock" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productInstance, field: "unitsInStock")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.category.label" default="Category" /></td>
                            
                            <td valign="top" class="value"><g:link controller="category" action="show" id="${productInstance?.category?.id}">${productInstance?.category?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="product.supplier.label" default="Supplier" /></td>
                            
                            <td valign="top" class="value"><g:link controller="supplier" action="show" id="${productInstance?.supplier?.id}">${productInstance?.supplier?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
