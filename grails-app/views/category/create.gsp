<g:set var="entity" value="Category" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.dialog');
    
    var $cls = GrailsApp.ext.dialog.CategoryDialog = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="category" file="save" />',
		    urlUpdate: '<g:resource dir="category" file="update" />',
		    urlEdit: '<g:resource dir="category" file="edit" />',
			tabs:[
		    	{
		    		xtype: 'panel',
		    		layout: 'form',
		    		title: 'Details',
		    		bodyStyle: 'padding: 5px',
		    		items:[
		    			
				        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="category.id.label" default="Id" />'}, 
				    	
				        


{xtype: 'textfield', name: 'name', fieldLabel: '<g:message code="category.name.label" default="Name" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'description', fieldLabel: '<g:message code="category.description.label" default="Description" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textfield', name: 'picture', fieldLabel: '<g:message code="category.picture.label" default="Picture" />', allowBlank: false, }, 
				    	
		    		]
		    	},
		    	


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
		    ],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormDialog, { 
    	loadSuccess: function(form, action){
    		
			this.gridCategoryProduct.store.loadData(action.result.data);
			
    	}
    });
    
})();
