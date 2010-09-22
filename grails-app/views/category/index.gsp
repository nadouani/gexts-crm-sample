
<g:set var="entityLabel" value="${message(code: 'category.label', default: 'Category')}" />
<g:set var="entity" value="Category" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.CategoryGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'Category',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','name','description','picture','products',],
			urlRead : '<g:resource dir="category" file="list" />',
		    urlCreate : '<g:resource dir="category" file="save" />',
		    urlUpdate: '<g:resource dir="category" file="update" />',
		    urlDestroy: '<g:resource dir="category" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="category.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="category.name.label" default="Name" />', dataIndex: 'name', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="category.description.label" default="Description" />', dataIndex: 'description', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="category.picture.label" default="Picture" />', dataIndex: 'picture', width: 50, sortable:true},		
		            		
            	{header: '<g:message code="category.products.label" default="Products" />', dataIndex: 'products', width: 50, renderer: function(value) {return value.length>0 ? value.length + " instance(s)":"";}},	            	
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> Category',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> Category',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> Category',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.CategoryDialog({
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
			
	        var editDialog = new GrailsApp.ext.dialog.CategoryDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> Category',
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
    
    var tabListCategory = new Ext.Panel({
    	id:'tabListCategory',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.CategoryGrid()],
        layout:'fit'
    });
    tabs.add(tabListCategory);
});
