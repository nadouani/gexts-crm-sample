
<g:set var="entityLabel" value="${message(code: 'product.label', default: 'Product')}" />
<g:set var="entity" value="Product" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.ProductGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'Product',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','name','description','picture','quantityPerUnit','unitPrice','unitsInStock','category','supplier',],
			urlRead : '<g:resource dir="product" file="list" />',
		    urlCreate : '<g:resource dir="product" file="save" />',
		    urlUpdate: '<g:resource dir="product" file="update" />',
		    urlDestroy: '<g:resource dir="product" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="product.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.name.label" default="Name" />', dataIndex: 'name', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.description.label" default="Description" />', dataIndex: 'description', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.picture.label" default="Picture" />', dataIndex: 'picture', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.quantityPerUnit.label" default="Quantity Per Unit" />', dataIndex: 'quantityPerUnit', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.unitPrice.label" default="Unit Price" />', dataIndex: 'unitPrice', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.unitsInStock.label" default="Units In Stock" />', dataIndex: 'unitsInStock', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="product.category.label" default="Category" />', dataIndex: 'category', width: 50, renderer: function(value) {return value.toString}},
		            	
            	{header: '<g:message code="product.supplier.label" default="Supplier" />', dataIndex: 'supplier', width: 50, renderer: function(value) {return value.toString}},
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> Product',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> Product',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> Product',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.ProductDialog({
				title : '<g:message code="default.new.label" args="[entityLabel]" />',
				closable: true,
				actionName : 'create',
				listeners: {
	        		onSaved: function(dialog, formPanel){
	        			this.store.load();
	        		},
	        		scope:this
	        	}
			});
			createDialog.show();
    	},
    	
    	rowDblClickFn: function(grid, rowIndex, e) {
			var record = grid.getStore().getAt(rowIndex);
			
	        var editDialog = new GrailsApp.ext.dialog.ProductDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> Product',
	        	closable: true,
	        	modale: true,
	        	actionName : 'edit',
	        	entityId: record.data.id,
	        	listeners: {
	        		onSaved: function(dialog, formPanel){
	        			this.store.load();
	        		},
	        		scope:this
	        	}
	        });
	        editDialog.show();
		}
    });
    
})();


Ext.onReady(function(){
	var tabs = Ext.getCmp("content-panel");
    
    var tabListProduct = new Ext.Panel({
    	id:'tabListProduct',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.ProductGrid()],
        layout:'fit'
    });
    tabs.add(tabListProduct);
});
