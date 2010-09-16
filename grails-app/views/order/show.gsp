
<%@ page import="fr.nadouani.crm.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
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
                            <td valign="top" class="name"><g:message code="order.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.reference.label" default="Reference" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "reference")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.orderDate.label" default="Order Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${orderInstance?.orderDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shippedDate.label" default="Shipped Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${orderInstance?.shippedDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipVia.label" default="Ship Via" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipVia")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipName.label" default="Ship Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipAddress.label" default="Ship Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipCity.label" default="Ship City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipCity")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipRegion.label" default="Ship Region" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipRegion")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipPostalCode.label" default="Ship Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipPostalCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipCountry.label" default="Ship Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipCountry")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.shipPrice.label" default="Ship Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: orderInstance, field: "shipPrice")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${orderInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.details.label" default="Details" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${orderInstance.details}" var="d">
                                    <li><g:link controller="orderDetail" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value"><g:link controller="customer" action="show" id="${orderInstance?.owner?.id}">${orderInstance?.owner?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="order.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${orderInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${orderInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
