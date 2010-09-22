
<g:set var="entityLabel" value="${message(code: 'productOrder.label', default: 'ProductOrder')}" />
<g:set var="entity" value="ProductOrder" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.ProductOrderGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'ProductOrder',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','reference','orderDate','shippedDate','shipVia','shipName','shipAddress','shipCity','shipRegion','shipPostalCode','shipCountry','shipPrice','lastUpdated','details','owner','dateCreated',],
			urlRead : '<g:resource dir="productOrder" file="list" />',
		    urlCreate : '<g:resource dir="productOrder" file="save" />',
		    urlUpdate: '<g:resource dir="productOrder" file="update" />',
		    urlDestroy: '<g:resource dir="productOrder" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="productOrder.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.reference.label" default="Reference" />', dataIndex: 'reference', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.orderDate.label" default="Order Date" />', dataIndex: 'orderDate', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shippedDate.label" default="Shipped Date" />', dataIndex: 'shippedDate', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipVia.label" default="Ship Via" />', dataIndex: 'shipVia', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipName.label" default="Ship Name" />', dataIndex: 'shipName', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipAddress.label" default="Ship Address" />', dataIndex: 'shipAddress', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipCity.label" default="Ship City" />', dataIndex: 'shipCity', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipRegion.label" default="Ship Region" />', dataIndex: 'shipRegion', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipPostalCode.label" default="Ship Postal Code" />', dataIndex: 'shipPostalCode', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipCountry.label" default="Ship Country" />', dataIndex: 'shipCountry', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.shipPrice.label" default="Ship Price" />', dataIndex: 'shipPrice', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="productOrder.lastUpdated.label" default="Last Updated" />', dataIndex: 'lastUpdated', width: 50, sortable:true},		
		            		
            	{header: '<g:message code="productOrder.details.label" default="Details" />', dataIndex: 'details', width: 50, renderer: function(value) {return value.length>0 ? value.length + " instance(s)":"";}},	            	
		            	
            	{header: '<g:message code="productOrder.owner.label" default="Owner" />', dataIndex: 'owner', width: 50, renderer: function(value) {return value.toString}},
		            	
            	{header: '<g:message code="productOrder.dateCreated.label" default="Date Created" />', dataIndex: 'dateCreated', width: 50, sortable:true},		
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> ProductOrder',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> ProductOrder',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> ProductOrder',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.ProductOrderDialog({
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
			
	        var editDialog = new GrailsApp.ext.dialog.ProductOrderDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> ProductOrder',
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
    
    var tabListProductOrder = new Ext.Panel({
    	id:'tabListProductOrder',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.ProductOrderGrid()],
        layout:'fit'
    });
    tabs.add(tabListProductOrder);
});
