<g:set var="entity" value="ProductOrder" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.form');
    
    var $cls = GrailsApp.ext.form.ProductOrderForm = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="productOrder" file="save" />',
		    urlUpdate: '<g:resource dir="productOrder" file="update" />',
		    urlEdit: '<g:resource dir="productOrder" file="edit" />',
		    items: [
				
		        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="productOrder.id.label" default="Id" />'}, 
		    	
		        


{xtype: 'textfield', name: 'reference', fieldLabel: '<g:message code="productOrder.reference.label" default="Reference" />', allowBlank: false, }, 
		    	
		        


{xtype: 'datefield', name: 'orderDate', fieldLabel: '<g:message code="productOrder.orderDate.label" default="Order Date" />', allowBlank: false, }, 
		    	
		        


{xtype: 'datefield', name: 'shippedDate', fieldLabel: '<g:message code="productOrder.shippedDate.label" default="Shipped Date" />', }, 
		    	
		        


{xtype:'combo', store:<extjsUtils:array data="${productOrderInstance.constraints.shipVia.inList}"/>, name:'shipVia', fieldLabel:'<g:message code="productOrder.shipVia.label" default="Ship Via" />', triggerAction:'all', emptyText:'Select a <g:message code="productOrder.shipVia.label" default="Ship Via" />...', editable:false,allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipName', fieldLabel: '<g:message code="productOrder.shipName.label" default="Ship Name" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipAddress', fieldLabel: '<g:message code="productOrder.shipAddress.label" default="Ship Address" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipCity', fieldLabel: '<g:message code="productOrder.shipCity.label" default="Ship City" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipRegion', fieldLabel: '<g:message code="productOrder.shipRegion.label" default="Ship Region" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipPostalCode', fieldLabel: '<g:message code="productOrder.shipPostalCode.label" default="Ship Postal Code" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'shipCountry', fieldLabel: '<g:message code="productOrder.shipCountry.label" default="Ship Country" />', allowBlank: false, }, 
		    	
		        


{xtype: 'numberfield',name: 'shipPrice',fieldLabel: '<g:message code="productOrder.shipPrice.label" default="Ship Price" />',allowBlank: false, },
		    	
		        


{xtype: 'datefield', name: 'lastUpdated', fieldLabel: '<g:message code="productOrder.lastUpdated.label" default="Last Updated" />', allowBlank: false, }, 
		    	
		        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a customer...',
	fieldLabel: '<g:message code="productOrder.owner.label" default="Owner" />',
	name: 'owner.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="customer" file="list" />'
}),
		    	
		        


{xtype: 'datefield', name: 'dateCreated', fieldLabel: '<g:message code="productOrder.dateCreated.label" default="Date Created" />', allowBlank: false, }, 
		    				    	
		    	
		    	{xtype: 'tabpanel', activeItem:0,height:200,
			    	items:[
			    


this.gridProductOrderOrderDetail = new Ext.Grails.ux.EntityCollectionGridPanel({
	title:'<g:message code="productOrder.details.label" default="Details" />',
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
    		
			Ext.getCmp('gridProductOrderOrderDetail').store.loadData(action.result.data);
			
    	}
    });
    
})();
