
<g:set var="entityLabel" value="${message(code: 'customer.label', default: 'Customer')}" />
<g:set var="entity" value="Customer" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.CustomerGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'Customer',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','company','contactName','contactTitle','contactEmail','address','city','region','postalCode','country','phone','fax','homePage','orders',],
			urlRead : '<g:resource dir="customer" file="list" />',
		    urlCreate : '<g:resource dir="customer" file="save" />',
		    urlUpdate: '<g:resource dir="customer" file="update" />',
		    urlDestroy: '<g:resource dir="customer" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="customer.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.company.label" default="Company" />', dataIndex: 'company', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.contactName.label" default="Contact Name" />', dataIndex: 'contactName', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.contactTitle.label" default="Contact Title" />', dataIndex: 'contactTitle', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.contactEmail.label" default="Contact Email" />', dataIndex: 'contactEmail', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.address.label" default="Address" />', dataIndex: 'address', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.city.label" default="City" />', dataIndex: 'city', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.region.label" default="Region" />', dataIndex: 'region', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.postalCode.label" default="Postal Code" />', dataIndex: 'postalCode', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.country.label" default="Country" />', dataIndex: 'country', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.phone.label" default="Phone" />', dataIndex: 'phone', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.fax.label" default="Fax" />', dataIndex: 'fax', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="customer.homePage.label" default="Home Page" />', dataIndex: 'homePage', width: 50, sortable:true},		
		            		
            	{header: '<g:message code="customer.orders.label" default="Orders" />', dataIndex: 'orders', width: 50, renderer: function(value) {return value.length>0 ? value.length + " instance(s)":"";}},	            	
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> Customer',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> Customer',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> Customer',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.CustomerDialog({
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
			
	        var editDialog = new GrailsApp.ext.dialog.CustomerDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> Customer',
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
    
    var tabListCustomer = new Ext.Panel({
    	id:'tabListCustomer',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.CustomerGrid()],
        layout:'fit'
    });
    tabs.add(tabListCustomer);
});
