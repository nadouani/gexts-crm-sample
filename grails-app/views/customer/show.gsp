
<%@ page import="fr.nadouani.crm.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
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
                            <td valign="top" class="name"><g:message code="customer.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.company.label" default="Company" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "company")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.contactName.label" default="Contact Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "contactName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.contactTitle.label" default="Contact Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "contactTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.contactEmail.label" default="Contact Email" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "contactEmail")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "address")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.city.label" default="City" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "city")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.region.label" default="Region" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "region")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.postalCode.label" default="Postal Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "postalCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.country.label" default="Country" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "country")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.phone.label" default="Phone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "phone")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.fax.label" default="Fax" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "fax")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.homePage.label" default="Home Page" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: customerInstance, field: "homePage")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="customer.orders.label" default="Orders" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${customerInstance.orders}" var="o">
                                    <li><g:link controller="order" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${customerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
