
<g:set var="entityLabel" value="${message(code: 'order.label', default: 'Order')}" />
<g:set var="entity" value="Order" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.OrderGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'Order',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','reference','orderDate','shippedDate','shipVia','shipName','shipAddress','shipCity','shipRegion','shipPostalCode','shipCountry','shipPrice','lastUpdated','details','owner','dateCreated',],
			urlRead : '<g:resource dir="order" file="list" />',
		    urlCreate : '<g:resource dir="order" file="save" />',
		    urlUpdate: '<g:resource dir="order" file="update" />',
		    urlDestroy: '<g:resource dir="order" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="order.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.reference.label" default="Reference" />', dataIndex: 'reference', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.orderDate.label" default="Order Date" />', dataIndex: 'orderDate', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shippedDate.label" default="Shipped Date" />', dataIndex: 'shippedDate', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipVia.label" default="Ship Via" />', dataIndex: 'shipVia', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipName.label" default="Ship Name" />', dataIndex: 'shipName', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipAddress.label" default="Ship Address" />', dataIndex: 'shipAddress', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipCity.label" default="Ship City" />', dataIndex: 'shipCity', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipRegion.label" default="Ship Region" />', dataIndex: 'shipRegion', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipPostalCode.label" default="Ship Postal Code" />', dataIndex: 'shipPostalCode', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipCountry.label" default="Ship Country" />', dataIndex: 'shipCountry', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.shipPrice.label" default="Ship Price" />', dataIndex: 'shipPrice', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="order.lastUpdated.label" default="Last Updated" />', dataIndex: 'lastUpdated', width: 50, sortable:true},		
		            		
            	{header: '<g:message code="order.details.label" default="Details" />', dataIndex: 'details', width: 50, renderer: function(value) {return value.length>0 ? value.length + " instance(s)":"";}},	            	
		            	
            	{header: '<g:message code="order.owner.label" default="Owner" />', dataIndex: 'owner', width: 50, renderer: function(value) {return value.toString}},
		            	
            	{header: '<g:message code="order.dateCreated.label" default="Date Created" />', dataIndex: 'dateCreated', width: 50, sortable:true},		
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> Order',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> Order',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> Order',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var formTab = new GrailsApp.ext.form.OrderForm({
				title : '<g:message code="default.new.label" args="[entityLabel]" />',
				closable: true,
				actionName : 'create',				
				callerComponent: Ext.getCmp('tabListOrder')
			});
			
			var tabs = Ext.getCmp("content-panel");
			tabs.add(formTab).show();
    	},
    	
    	rowDblClickFn: function(grid, rowIndex, e) {
			var record = grid.getStore().getAt(rowIndex);
			
			var formTab = new GrailsApp.ext.form.OrderForm({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> Order',
	        	closable: true,
	        	actionName : 'edit',
	        	entityId: record.data.id,
	        	callerComponent: Ext.getCmp('tabListOrder')
	        });
	        
	        var tabs = Ext.getCmp("content-panel");
	        tabs.add(formTab).show();
		}
    });
    
})();


Ext.onReady(function(){
	var tabs = Ext.getCmp("content-panel");
    
    var tabListOrder = new Ext.Panel({
    	id:'tabListOrder',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.OrderGrid()],
        layout:'fit'
    });
    tabs.add(tabListOrder);
});
