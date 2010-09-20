
<%@ page import="fr.nadouani.crm.Product" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'product.label', default: 'Product')}" />
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
            <g:hasErrors bean="${productInstance}">
            <div class="errors">
                <g:renderErrors bean="${productInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productInstance?.id}" />
                <g:hiddenField name="version" value="${productInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="product.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'name', 'errors')}">
                                    


{xtype: 'textfield', name: 'name', fieldLabel: '<g:message code="product.name.label" default="Name" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="product.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'description', 'errors')}">
                                    


{xtype: 'textarea', name: 'description', fieldLabel: '<g:message code="product.description.label" default="Description" />'}, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="picture"><g:message code="product.picture.label" default="Picture" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'picture', 'errors')}">
                                    


{xtype: 'textfield', name: 'picture', fieldLabel: '<g:message code="product.picture.label" default="Picture" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantityPerUnit"><g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'quantityPerUnit', 'errors')}">
                                    


{xtype: 'numberfield',name: 'quantityPerUnit',fieldLabel: '<g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" />',allowBlank: false, },
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unitPrice"><g:message code="product.unitPrice.label" default="Unit Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'unitPrice', 'errors')}">
                                    


{xtype: 'numberfield',name: 'unitPrice',fieldLabel: '<g:message code="product.unitPrice.label" default="Unit Price" />',allowBlank: false, },
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="unitsInStock"><g:message code="product.unitsInStock.label" default="Units In Stock" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'unitsInStock', 'errors')}">
                                    


{xtype: 'numberfield',name: 'unitsInStock',fieldLabel: '<g:message code="product.unitsInStock.label" default="Units In Stock" />',allowBlank: false, },
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="category"><g:message code="product.category.label" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'category', 'errors')}">
                                    


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a category...',
	fieldLabel: '<g:message code="product.category.label" default="Category" />',
	name: 'category.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="category" file="list" />'
}),
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="supplier"><g:message code="product.supplier.label" default="Supplier" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productInstance, field: 'supplier', 'errors')}">
                                    


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a supplier...',
	fieldLabel: '<g:message code="product.supplier.label" default="Supplier" />',
	name: 'supplier.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="supplier" file="list" />'
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
