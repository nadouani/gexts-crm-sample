
<%@ page import="fr.nadouani.crm.Supplier" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'supplier.label', default: 'Supplier')}" />
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
            <g:hasErrors bean="${supplierInstance}">
            <div class="errors">
                <g:renderErrors bean="${supplierInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${supplierInstance?.id}" />
                <g:hiddenField name="version" value="${supplierInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="company"><g:message code="supplier.company.label" default="Company" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'company', 'errors')}">
                                    


{xtype: 'textfield', name: 'company', fieldLabel: '<g:message code="supplier.company.label" default="Company" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactName"><g:message code="supplier.contactName.label" default="Contact Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'contactName', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactName', fieldLabel: '<g:message code="supplier.contactName.label" default="Contact Name" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactTitle"><g:message code="supplier.contactTitle.label" default="Contact Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'contactTitle', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactTitle', fieldLabel: '<g:message code="supplier.contactTitle.label" default="Contact Title" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactEmail"><g:message code="supplier.contactEmail.label" default="Contact Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'contactEmail', 'errors')}">
                                    


{xtype: 'textfield', name: 'contactEmail', fieldLabel: '<g:message code="supplier.contactEmail.label" default="Contact Email" />', allowBlank: false, vtype: 'email', }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="supplier.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'address', 'errors')}">
                                    


{xtype: 'textarea', name: 'address', fieldLabel: '<g:message code="supplier.address.label" default="Address" />'}, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="supplier.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'city', 'errors')}">
                                    


{xtype: 'textfield', name: 'city', fieldLabel: '<g:message code="supplier.city.label" default="City" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="region"><g:message code="supplier.region.label" default="Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'region', 'errors')}">
                                    


{xtype: 'textfield', name: 'region', fieldLabel: '<g:message code="supplier.region.label" default="Region" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postalCode"><g:message code="supplier.postalCode.label" default="Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'postalCode', 'errors')}">
                                    


{xtype: 'textfield', name: 'postalCode', fieldLabel: '<g:message code="supplier.postalCode.label" default="Postal Code" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="country"><g:message code="supplier.country.label" default="Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'country', 'errors')}">
                                    


{xtype: 'textfield', name: 'country', fieldLabel: '<g:message code="supplier.country.label" default="Country" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="phone"><g:message code="supplier.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'phone', 'errors')}">
                                    


{xtype: 'textfield', name: 'phone', fieldLabel: '<g:message code="supplier.phone.label" default="Phone" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="fax"><g:message code="supplier.fax.label" default="Fax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'fax', 'errors')}">
                                    


{xtype: 'textfield', name: 'fax', fieldLabel: '<g:message code="supplier.fax.label" default="Fax" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="homePage"><g:message code="supplier.homePage.label" default="Home Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'homePage', 'errors')}">
                                    


{xtype: 'textfield', name: 'homePage', fieldLabel: '<g:message code="supplier.homePage.label" default="Home Page" />', allowBlank: false, vtype: 'url', }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="products"><g:message code="supplier.products.label" default="Products" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: supplierInstance, field: 'products', 'errors')}">
                                    


this.gridSupplierProduct = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="supplier.products.label" default="Products" />',
	urlSelect: '<g:resource dir="product" file="list" />',
	root : 'products',
	newButtonLabel : '<g:message code="default.button.new.label" default="New" /> Product',
	deleteButtonLabel : '<g:message code="default.button.delete.label" default="Delete" /> Product',
	selectButtonLabel : '<g:message code="default.button.select.label" default="Select" /> Product',
	fields : [
		{name: 'id'},{name: 'name'},{name: 'description'},{name: 'picture'},{name: 'quantityPerUnit'},{name: 'unitPrice'},{name: 'unitsInStock'},
	],
	cols : [
		{header: '<g:message code="product.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable: true},
		{header: '<g:message code="product.name.label" default="Name" />', dataIndex: 'name', width: 50, sortable: true},
		{header: '<g:message code="product.description.label" default="Description" />', dataIndex: 'description', width: 50, sortable: true},
		{header: '<g:message code="product.picture.label" default="Picture" />', dataIndex: 'picture', width: 50, sortable: true},
		{header: '<g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" />', dataIndex: 'quantityPerUnit', width: 50, sortable: true},
		{header: '<g:message code="product.unitPrice.label" default="Unit Price" />', dataIndex: 'unitPrice', width: 50, sortable: true},
		{header: '<g:message code="product.unitsInStock.label" default="Units In Stock" />', dataIndex: 'unitsInStock', width: 50, sortable: true},
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
