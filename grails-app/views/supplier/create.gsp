<g:set var="entity" value="Supplier" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.dialog');
    
    var $cls = GrailsApp.ext.dialog.SupplierDialog = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="supplier" file="save" />',
		    urlUpdate: '<g:resource dir="supplier" file="update" />',
		    urlEdit: '<g:resource dir="supplier" file="edit" />',
			tabs:[
		    	{
		    		xtype: 'panel',
		    		layout: 'form',
		    		title: 'Details',
		    		bodyStyle: 'padding: 5px',
		    		items:[
		    			
				        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="supplier.id.label" default="Id" />'}, 
				    	
				        


{xtype: 'textfield', name: 'company', fieldLabel: '<g:message code="supplier.company.label" default="Company" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactName', fieldLabel: '<g:message code="supplier.contactName.label" default="Contact Name" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactTitle', fieldLabel: '<g:message code="supplier.contactTitle.label" default="Contact Title" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'contactEmail', fieldLabel: '<g:message code="supplier.contactEmail.label" default="Contact Email" />', allowBlank: false, vtype: 'email', }, 
				    	
				        


{xtype: 'textarea', name: 'address', fieldLabel: '<g:message code="supplier.address.label" default="Address" />'}, 
				    	
				        


{xtype: 'textfield', name: 'city', fieldLabel: '<g:message code="supplier.city.label" default="City" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'region', fieldLabel: '<g:message code="supplier.region.label" default="Region" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'postalCode', fieldLabel: '<g:message code="supplier.postalCode.label" default="Postal Code" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'country', fieldLabel: '<g:message code="supplier.country.label" default="Country" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'phone', fieldLabel: '<g:message code="supplier.phone.label" default="Phone" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'fax', fieldLabel: '<g:message code="supplier.fax.label" default="Fax" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'homePage', fieldLabel: '<g:message code="supplier.homePage.label" default="Home Page" />', allowBlank: false, vtype: 'url', }, 
				    	
		    		]
		    	},
		    	


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
		    ],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormDialog, { 
    	loadSuccess: function(form, action){
    		
			this.gridSupplierProduct.store.loadData(action.result.data);
			
    	}
    });
    
})();
