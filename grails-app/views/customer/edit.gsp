
<%@ page import="fr.nadouani.crm.Customer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'customer.label', default: 'Customer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${customerInstance}">
            <div class="errors">
                <g:renderErrors bean="${customerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${customerInstance?.id}" />
                <g:hiddenField name="version" value="${customerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="company"><g:message code="customer.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'company', 'errors')}">
                                    


{xtype: 'textfield', name: 'company', fieldLabel: '<g:message code="customer.company.label" default="Company" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactName"><g:message code="customer.contactName.label" default="Contact Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'contactName', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactName', fieldLabel: '<g:message code="customer.contactName.label" default="Contact Name" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactTitle"><g:message code="customer.contactTitle.label" default="Contact Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'contactTitle', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactTitle', fieldLabel: '<g:message code="customer.contactTitle.label" default="Contact Title" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactEmail"><g:message code="customer.contactEmail.label" default="Contact Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'contactEmail', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactEmail', fieldLabel: '<g:message code="customer.contactEmail.label" default="Contact Email" />', allowBlank: false, vtype: 'email', }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="customer.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'address', 'errors')}">
                                    


{xtype: 'textarea', name: 'address', fieldLabel: '<g:message code="customer.address.label" default="Address" />'}, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="customer.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'city', 'errors')}">
                                    


{xtype: 'textfield', name: 'city', fieldLabel: '<g:message code="customer.city.label" default="City" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="region"><g:message code="customer.region.label" default="Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'region', 'errors')}">
                                    


{xtype: 'textfield', name: 'region', fieldLabel: '<g:message code="customer.region.label" default="Region" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postalCode"><g:message code="customer.postalCode.label" default="Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'postalCode', 'errors')}">
                                    


{xtype: 'textfield', name: 'postalCode', fieldLabel: '<g:message code="customer.postalCode.label" default="Postal Code" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="country"><g:message code="customer.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'country', 'errors')}">
                                    


{xtype: 'textfield', name: 'country', fieldLabel: '<g:message code="customer.country.label" default="Country" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="customer.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'phone', 'errors')}">
                                    


{xtype: 'textfield', name: 'phone', fieldLabel: '<g:message code="customer.phone.label" default="Phone" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="customer.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'fax', 'errors')}">
                                    


{xtype: 'textfield', name: 'fax', fieldLabel: '<g:message code="customer.fax.label" default="Fax" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="homePage"><g:message code="customer.homePage.label" default="Home Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'homePage', 'errors')}">
                                    


{xtype: 'textfield', name: 'homePage', fieldLabel: '<g:message code="customer.homePage.label" default="Home Page" />', allowBlank: false, vtype: 'url', }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orders"><g:message code="customer.orders.label" default="Orders" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: customerInstance, field: 'orders', 'errors')}">
                                    


this.gridCustomerProductOrder = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="customer.orders.label" default="Orders" />',
	urlSelect: '<g:resource dir="productOrder" file="list" />',
	root : 'orders',
	newButtonLabel : '<g:message code="default.button.new.label" default="New" /> ProductOrder',
	deleteButtonLabel : '<g:message code="default.button.delete.label" default="Delete" /> ProductOrder',
	selectButtonLabel : '<g:message code="default.button.select.label" default="Select" /> ProductOrder',
	fields : [
		{name: 'id'},{name: 'reference'},{name: 'orderDate'},{name: 'shippedDate'},{name: 'shipVia'},{name: 'shipName'},{name: 'shipAddress'},{name: 'shipCity'},{name: 'shipRegion'},{name: 'shipPostalCode'},{name: 'shipCountry'},{name: 'shipPrice'},{name: 'lastUpdated'},{name: 'dateCreated'},
	],
	cols : [
		{header: '<g:message code="productOrder.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable: true},
		{header: '<g:message code="productOrder.reference.label" default="Reference" />', dataIndex: 'reference', width: 50, sortable: true},
		{header: '<g:message code="productOrder.orderDate.label" default="Order Date" />', dataIndex: 'orderDate', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shippedDate.label" default="Shipped Date" />', dataIndex: 'shippedDate', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipVia.label" default="Ship Via" />', dataIndex: 'shipVia', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipName.label" default="Ship Name" />', dataIndex: 'shipName', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipAddress.label" default="Ship Address" />', dataIndex: 'shipAddress', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipCity.label" default="Ship City" />', dataIndex: 'shipCity', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipRegion.label" default="Ship Region" />', dataIndex: 'shipRegion', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipPostalCode.label" default="Ship Postal Code" />', dataIndex: 'shipPostalCode', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipCountry.label" default="Ship Country" />', dataIndex: 'shipCountry', width: 50, sortable: true},
		{header: '<g:message code="productOrder.shipPrice.label" default="Ship Price" />', dataIndex: 'shipPrice', width: 50, sortable: true},
		{header: '<g:message code="productOrder.lastUpdated.label" default="Last Updated" />', dataIndex: 'lastUpdated', width: 50, sortable: true},
		{header: '<g:message code="productOrder.dateCreated.label" default="Date Created" />', dataIndex: 'dateCreated', width: 50, sortable: true},
	]
}),
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
