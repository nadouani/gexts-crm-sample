
<%@ page import="fr.nadouani.crm.Category" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}" />
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
            <g:hasErrors bean="${categoryInstance}">
            <div class="errors">
                <g:renderErrors bean="${categoryInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${categoryInstance?.id}" />
                <g:hiddenField name="version" value="${categoryInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="category.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'name', 'errors')}">
                                    


{xtype: 'textfield', name: 'name', fieldLabel: '<g:message code="category.name.label" default="Name" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="category.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'description', 'errors')}">
                                    


{xtype: 'textfield', name: 'description', fieldLabel: '<g:message code="category.description.label" default="Description" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="picture"><g:message code="category.picture.label" default="Picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'picture', 'errors')}">
                                    


{xtype: 'textfield', name: 'picture', fieldLabel: '<g:message code="category.picture.label" default="Picture" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="products"><g:message code="category.products.label" default="Products" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: categoryInstance, field: 'products', 'errors')}">
                                    


this.gridCategoryProduct = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="category.products.label" default="Products" />',
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
