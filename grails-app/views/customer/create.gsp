<g:set var="entity" value="Customer" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.dialog');
    
    var $cls = GrailsApp.ext.dialog.CustomerDialog = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="customer" file="save" />',
		    urlUpdate: '<g:resource dir="customer" file="update" />',
		    urlEdit: '<g:resource dir="customer" file="edit" />',
			tabs:[
		    	{
		    		xtype: 'panel',
		    		layout: 'form',
		    		title: 'Details',
		    		bodyStyle: 'padding: 5px',
		    		items:[
		    			
				        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="customer.id.label" default="Id" />'}, 
				    	
				        


{xtype: 'textfield', name: 'company', fieldLabel: '<g:message code="customer.company.label" default="Company" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactName', fieldLabel: '<g:message code="customer.contactName.label" default="Contact Name" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactTitle', fieldLabel: '<g:message code="customer.contactTitle.label" default="Contact Title" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactEmail', fieldLabel: '<g:message code="customer.contactEmail.label" default="Contact Email" />', allowBlank: false, vtype: 'email', }, 
				    	
				        


{xtype: 'textarea', name: 'address', fieldLabel: '<g:message code="customer.address.label" default="Address" />'}, 
				    	
				        


{xtype: 'textfield', name: 'city', fieldLabel: '<g:message code="customer.city.label" default="City" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'region', fieldLabel: '<g:message code="customer.region.label" default="Region" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'postalCode', fieldLabel: '<g:message code="customer.postalCode.label" default="Postal Code" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'country', fieldLabel: '<g:message code="customer.country.label" default="Country" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'phone', fieldLabel: '<g:message code="customer.phone.label" default="Phone" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'fax', fieldLabel: '<g:message code="customer.fax.label" default="Fax" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'homePage', fieldLabel: '<g:message code="customer.homePage.label" default="Home Page" />', allowBlank: false, vtype: 'url', }, 
				    	
		    		]
		    	},
		    	


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
		    ],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormDialog, { 
    	loadSuccess: function(form, action){
    		
			this.gridCustomerProductOrder.store.loadData(action.result.data);
			
    	}
    });
    
})();
