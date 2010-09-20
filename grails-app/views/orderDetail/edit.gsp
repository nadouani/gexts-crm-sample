
<%@ page import="fr.nadouani.crm.OrderDetail" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'orderDetail.label', default: 'OrderDetail')}" />
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
            <g:hasErrors bean="${orderDetailInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderDetailInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${orderDetailInstance?.id}" />
                <g:hiddenField name="version" value="${orderDetailInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantity"><g:message code="orderDetail.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderDetailInstance, field: 'quantity', 'errors')}">
                                    


{xtype: 'numberfield',name: 'quantity',fieldLabel: '<g:message code="orderDetail.quantity.label" default="Quantity" />',allowBlank: false, },
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="orderDetail.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderDetailInstance, field: 'product', 'errors')}">
                                    


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a product...',
	fieldLabel: '<g:message code="orderDetail.product.label" default="Product" />',
	name: 'product.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="product" file="list" />'
}),
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="order"><g:message code="orderDetail.order.label" default="Order" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderDetailInstance, field: 'order', 'errors')}">
                                    


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a productOrder...',
	fieldLabel: '<g:message code="orderDetail.order.label" default="Order" />',
	name: 'order.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="productOrder" file="list" />'
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
