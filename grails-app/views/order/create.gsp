<g:set var="entity" value="Order" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.form');
    
    var $cls = GrailsApp.ext.form.OrderForm = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="order" file="save" />',
		    urlUpdate: '<g:resource dir="order" file="update" />',
		    urlEdit: '<g:resource dir="order" file="edit" />',
		    items: [
				
		        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="order.id.label" default="Id" />'}, 
		    	
		        


{xtype: 'textfield', name: 'reference', fieldLabel: '<g:message code="order.reference.label" default="Reference" />', allowBlank: false, }, 
		    	
		        


{xtype: 'datefield', name: 'orderDate', fieldLabel: '<g:message code="order.orderDate.label" default="Order Date" />', allowBlank: false, }, 
		    	
		        


{xtype: 'datefield', name: 'shippedDate', fieldLabel: '<g:message code="order.shippedDate.label" default="Shipped Date" />', }, 
		    	
		        


{xtype:'combo', store:<extjsUtils:array data="${orderInstance.constraints.shipVia.inList}"/>, name:'shipVia', fieldLabel:'<g:message code="order.shipVia.label" default="Ship Via" />', triggerAction:'all', emptyText:'Select a <g:message code="order.shipVia.label" default="Ship Via" />...', editable:false,allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipName', fieldLabel: '<g:message code="order.shipName.label" default="Ship Name" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipAddress', fieldLabel: '<g:message code="order.shipAddress.label" default="Ship Address" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipCity', fieldLabel: '<g:message code="order.shipCity.label" default="Ship City" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipRegion', fieldLabel: '<g:message code="order.shipRegion.label" default="Ship Region" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipPostalCode', fieldLabel: '<g:message code="order.shipPostalCode.label" default="Ship Postal Code" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipCountry', fieldLabel: '<g:message code="order.shipCountry.label" default="Ship Country" />', allowBlank: false, }, 
		    	
		        


{xtype: 'numberfield',name: 'shipPrice',fieldLabel: '<g:message code="order.shipPrice.label" default="Ship Price" />',allowBlank: false, },
		    	
		        


{xtype: 'datefield', name: 'lastUpdated', fieldLabel: '<g:message code="order.lastUpdated.label" default="Last Updated" />', allowBlank: false, }, 
		    	
		        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a customer...',
	fieldLabel: '<g:message code="order.owner.label" default="Owner" />',
	name: 'owner.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="customer" file="list" />'
}),
		    	
		        


{xtype: 'datefield', name: 'dateCreated', fieldLabel: '<g:message code="order.dateCreated.label" default="Date Created" />', allowBlank: false, }, 
		    				    	
		    	
		    	{xtype: 'tabpanel', activeItem:0,height:200,
			    	items:[
			    


this.gridOrderOrderDetail = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="order.details.label" default="Details" />',
	urlSelect: '<g:resource dir="orderDetail" file="list" />',
	root : 'details',
	newButtonLabel : '<g:message code="default.button.new.label" default="New" /> OrderDetail',
	deleteButtonLabel : '<g:message code="default.button.delete.label" default="Delete" /> OrderDetail',
	selectButtonLabel : '<g:message code="default.button.select.label" default="Select" /> OrderDetail',
	fields : [
		{name: 'id'},{name: 'quantity'},
	],
	cols : [
		{header: '<g:message code="orderDetail.id.label" default="Id" />', dataIndex: 'id', width: 50, sortable: true},
		{header: '<g:message code="orderDetail.quantity.label" default="Quantity" />', dataIndex: 'quantity', width: 50, sortable: true},
	]
}),
			    	]}
		    						
			],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormPanel, { 
    	loadSuccess: function(form, action){
    		
			Ext.getCmp('gridOrderOrderDetail').store.loadData(action.result.data);
			
    	}
    });
    
})();
