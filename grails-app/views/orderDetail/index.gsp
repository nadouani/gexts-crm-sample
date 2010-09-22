
<g:set var="entityLabel" value="${message(code: 'orderDetail.label', default: 'OrderDetail')}" />
<g:set var="entity" value="OrderDetail" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.OrderDetailGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'OrderDetail',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','quantity','product','order',],
			urlRead : '<g:resource dir="orderDetail" file="list" />',
		    urlCreate : '<g:resource dir="orderDetail" file="save" />',
		    urlUpdate: '<g:resource dir="orderDetail" file="update" />',
		    urlDestroy: '<g:resource dir="orderDetail" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="orderDetail.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="orderDetail.quantity.label" default="Quantity" />', dataIndex: 'quantity', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="orderDetail.product.label" default="Product" />', dataIndex: 'product', width: 50, renderer: function(value) {return value.toString}},
		            	
            	{header: '<g:message code="orderDetail.order.label" default="Order" />', dataIndex: 'order', width: 50, renderer: function(value) {return value.toString}},
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> OrderDetail',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> OrderDetail',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> OrderDetail',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.OrderDetailDialog({
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
			
	        var editDialog = new GrailsApp.ext.dialog.OrderDetailDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> OrderDetail',
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
    
    var tabListOrderDetail = new Ext.Panel({
    	id:'tabListOrderDetail',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.OrderDetailGrid()],
        layout:'fit'
    });
    tabs.add(tabListOrderDetail);
});
