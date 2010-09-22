
<g:set var="entityLabel" value="${message(code: 'supplier.label', default: 'Supplier')}" />
<g:set var="entity" value="Supplier" />
  


(function(){
    
    Ext.ns('GrailsApp.ext.grid');
    
    var $cls = GrailsApp.ext.grid.SupplierGrid = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	entity: 'Supplier',
			entityLabel : '${entityLabel}',
		
			// store properties
			fields : ['id','company','contactName','contactTitle','contactEmail','address','city','region','postalCode','country','phone','fax','homePage','products',],
			urlRead : '<g:resource dir="supplier" file="list" />',
		    urlCreate : '<g:resource dir="supplier" file="save" />',
		    urlUpdate: '<g:resource dir="supplier" file="update" />',
		    urlDestroy: '<g:resource dir="supplier" file="delete" />',
		
		    // structure properies
		    columns:[
		       	
            	{header: '<g:message code="supplier.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.company.label" default="Company" />', dataIndex: 'company', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.contactName.label" default="Contact Name" />', dataIndex: 'contactName', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.contactTitle.label" default="Contact Title" />', dataIndex: 'contactTitle', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.contactEmail.label" default="Contact Email" />', dataIndex: 'contactEmail', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.address.label" default="Address" />', dataIndex: 'address', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.city.label" default="City" />', dataIndex: 'city', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.region.label" default="Region" />', dataIndex: 'region', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.postalCode.label" default="Postal Code" />', dataIndex: 'postalCode', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.country.label" default="Country" />', dataIndex: 'country', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.phone.label" default="Phone" />', dataIndex: 'phone', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.fax.label" default="Fax" />', dataIndex: 'fax', width: 50, sortable:true},		
		            	
            	{header: '<g:message code="supplier.homePage.label" default="Home Page" />', dataIndex: 'homePage', width: 50, sortable:true},		
		            		
            	{header: '<g:message code="supplier.products.label" default="Products" />', dataIndex: 'products', width: 50, renderer: function(value) {return value.length>0 ? value.length + " instance(s)":"";}},	            	
		            	
		    ],    
			
		   	// Toolbar
			newButtonLabel : '<g:message code="default.button.create.label" default="Create" /> Supplier',
			editButtonLabel : '<g:message code="default.button.edit.label" default="Edit" /> Supplier',
			deleteButtonLabel : '<g:message code="default.button.delete.label" default="delete" /> Supplier',
			
			// Handlers
			newButtonHandler: this.createFn,
			rowDblClickHandler: this.rowDblClickFn
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityGridPanel, { 
   		createFn: function(){
			var createDialog = new GrailsApp.ext.dialog.SupplierDialog({
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
			
	        var editDialog = new GrailsApp.ext.dialog.SupplierDialog({
	        	title : '<g:message code="default.button.edit.label" default="Edit" /> Supplier',
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
    
    var tabListSupplier = new Ext.Panel({
    	id:'tabListSupplier',
        title: '${entityLabel}',
        items:[new GrailsApp.ext.grid.SupplierGrid()],
        layout:'fit'
    });
    tabs.add(tabListSupplier);
});
