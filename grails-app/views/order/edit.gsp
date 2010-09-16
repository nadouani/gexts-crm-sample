
<%@ page import="fr.nadouani.crm.Order" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'order.label', default: 'Order')}" />
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
            <g:hasErrors bean="${orderInstance}">
            <div class="errors">
                <g:renderErrors bean="${orderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${orderInstance?.id}" />
                <g:hiddenField name="version" value="${orderInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="reference"><g:message code="order.reference.label" default="Reference" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'reference', 'errors')}">
                                    


{xtype: 'textfield', name: 'reference', fieldLabel: '<g:message code="order.reference.label" default="Reference" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="orderDate"><g:message code="order.orderDate.label" default="Order Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'orderDate', 'errors')}">
                                    


{xtype: 'datefield', name: 'orderDate', fieldLabel: '<g:message code="order.orderDate.label" default="Order Date" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shippedDate"><g:message code="order.shippedDate.label" default="Shipped Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shippedDate', 'errors')}">
                                    


{xtype: 'datefield', name: 'shippedDate', fieldLabel: '<g:message code="order.shippedDate.label" default="Shipped Date" />', }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipVia"><g:message code="order.shipVia.label" default="Ship Via" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipVia', 'errors')}">
                                    


{xtype:'combo', store:<extjsUtils:array data="${orderInstance.constraints.shipVia.inList}"/>, name:'shipVia', fieldLabel:'<g:message code="order.shipVia.label" default="Ship Via" />', triggerAction:'all', emptyText:'Select a <g:message code="order.shipVia.label" default="Ship Via" />...', editable:false,allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipName"><g:message code="order.shipName.label" default="Ship Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipName', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipName', fieldLabel: '<g:message code="order.shipName.label" default="Ship Name" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipAddress"><g:message code="order.shipAddress.label" default="Ship Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipAddress', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipAddress', fieldLabel: '<g:message code="order.shipAddress.label" default="Ship Address" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipCity"><g:message code="order.shipCity.label" default="Ship City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipCity', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipCity', fieldLabel: '<g:message code="order.shipCity.label" default="Ship City" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipRegion"><g:message code="order.shipRegion.label" default="Ship Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipRegion', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipRegion', fieldLabel: '<g:message code="order.shipRegion.label" default="Ship Region" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipPostalCode"><g:message code="order.shipPostalCode.label" default="Ship Postal Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipPostalCode', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipPostalCode', fieldLabel: '<g:message code="order.shipPostalCode.label" default="Ship Postal Code" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipCountry"><g:message code="order.shipCountry.label" default="Ship Country" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipCountry', 'errors')}">
                                    


{xtype: 'textfield', name: 'shipCountry', fieldLabel: '<g:message code="order.shipCountry.label" default="Ship Country" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="shipPrice"><g:message code="order.shipPrice.label" default="Ship Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'shipPrice', 'errors')}">
                                    


{xtype: 'numberfield',name: 'shipPrice',fieldLabel: '<g:message code="order.shipPrice.label" default="Ship Price" />',allowBlank: false, },
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="lastUpdated"><g:message code="order.lastUpdated.label" default="Last Updated" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'lastUpdated', 'errors')}">
                                    


{xtype: 'datefield', name: 'lastUpdated', fieldLabel: '<g:message code="order.lastUpdated.label" default="Last Updated" />', allowBlank: false, }, 
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="details"><g:message code="order.details.label" default="Details" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'details', 'errors')}">
                                    


this.gridOrderOrderDetail = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="order.details.label" default="Details" />',
	urlSelect: '<g:resource dir="orderDetail" file="list" />',
	root : 'details',
	newButtonLabel : '<g:message code="default.button.new.label" default="New" /> OrderDetail',
	deleteButtonLabel : '<g:message code="default.button.delete.label" default="Delete" /> OrderDetail',
	selectButtonLabel : '<g:message code="default.button.select.label" default="Select" /> OrderDetail',
	fields : [
		{name: 'id'},{name: 'quantity'},
	],
	cols : [
		{header: '<g:message code="orderDetail.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable: true},
		{header: '<g:message code="orderDetail.quantity.label" default="Quantity" />', dataIndex: 'quantity', width: 50, sortable: true},
	]
}),
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="order.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'owner', 'errors')}">
                                    


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a customer...',
	fieldLabel: '<g:message code="order.owner.label" default="Owner" />',
	name: 'owner.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="customer" file="list" />'
}),
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dateCreated"><g:message code="order.dateCreated.label" default="Date Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: orderInstance, field: 'dateCreated', 'errors')}">
                                    


{xtype: 'datefield', name: 'dateCreated', fieldLabel: '<g:message code="order.dateCreated.label" default="Date Created" />', allowBlank: false, }, 
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
