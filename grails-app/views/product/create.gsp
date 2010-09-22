<g:set var="entity" value="Product" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.dialog');
    
    var $cls = GrailsApp.ext.dialog.ProductDialog = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="product" file="save" />',
		    urlUpdate: '<g:resource dir="product" file="update" />',
		    urlEdit: '<g:resource dir="product" file="edit" />',
			tabs:[
		    	{
		    		xtype: 'panel',
		    		layout: 'form',
		    		title: 'Details',
		    		bodyStyle: 'padding: 5px',
		    		items:[
		    			
				        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="product.id.label" default="Id" />'}, 
				    	
				        


{xtype: 'textfield', name: 'name', fieldLabel: '<g:message code="product.name.label" default="Name" />', allowBlank: false, }, 
				    	
				        


{xtype: 'textarea', name: 'description', fieldLabel: '<g:message code="product.description.label" default="Description" />'}, 
				    	
				        


{xtype: 'textfield', name: 'picture', fieldLabel: '<g:message code="product.picture.label" default="Picture" />', allowBlank: false, }, 
				    	
				        


{xtype: 'numberfield',name: 'quantityPerUnit',fieldLabel: '<g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" />',allowBlank: false, },
				    	
				        


{xtype: 'numberfield',name: 'unitPrice',fieldLabel: '<g:message code="product.unitPrice.label" default="Unit Price" />',allowBlank: false, },
				    	
				        


{xtype: 'numberfield',name: 'unitsInStock',fieldLabel: '<g:message code="product.unitsInStock.label" default="Units In Stock" />',allowBlank: false, },
				    	
				        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a category...',
	fieldLabel: '<g:message code="product.category.label" default="Category" />',
	name: 'category.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="category" file="list" />'
}),
				    	
				        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a supplier...',
	fieldLabel: '<g:message code="product.supplier.label" default="Supplier" />',
	name: 'supplier.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="supplier" file="list" />'
}),
				    	
		    		]
		    	},
		    	
		    ],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormDialog, { 
    	loadSuccess: function(form, action){
    		
    	}
    });
    
})();
