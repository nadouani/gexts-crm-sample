
<%@ page import="fr.nadouani.crm.ProductOrder" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
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
                            <td valign="top" class="name"><g:message code="productOrder.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.reference.label" default="Reference" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "reference")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.orderDate.label" default="Order Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productOrderInstance?.orderDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shippedDate.label" default="Shipped Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productOrderInstance?.shippedDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipVia.label" default="Ship Via" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipVia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipName.label" default="Ship Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipAddress.label" default="Ship Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipCity.label" default="Ship City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipRegion.label" default="Ship Region" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipRegion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipPostalCode.label" default="Ship Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipPostalCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipCountry.label" default="Ship Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.shipPrice.label" default="Ship Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: productOrderInstance, field: "shipPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productOrderInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.details.label" default="Details" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${productOrderInstance.details}" var="d">
                                    <li><g:link controller="orderDetail" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${productOrderInstance?.owner?.id}">${productOrderInstance?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="productOrder.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${productOrderInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${productOrderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
