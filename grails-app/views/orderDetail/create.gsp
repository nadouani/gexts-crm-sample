<g:set var="entity" value="OrderDetail" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.form');
    
    var $cls = GrailsApp.ext.form.OrderDetailForm = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="orderDetail" file="save" />',
		    urlUpdate: '<g:resource dir="orderDetail" file="update" />',
		    urlEdit: '<g:resource dir="orderDetail" file="edit" />',
		    items: [
				
		        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="orderDetail.id.label" default="Id" />'}, 
		    	
		        


{xtype: 'numberfield',name: 'quantity',fieldLabel: '<g:message code="orderDetail.quantity.label" default="Quantity" />',allowBlank: false, },
		    	
		        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a product...',
	fieldLabel: '<g:message code="orderDetail.product.label" default="Product" />',
	name: 'product.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="product" file="list" />'
}),
		    	
		        


new Ext.Grails.ux.RowSelectorField({
	dialogTitle:'Select a productOrder...',
	fieldLabel: '<g:message code="orderDetail.order.label" default="Order" />',
	name: 'order.id',
	displayProperty : 'toString',
	form: this,
	urlList: '<g:resource dir="productOrder" file="list" />'
}),
		    				    	
		    						
			],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormPanel, { 
    	loadSuccess: function(form, action){
    		
    	}
    });
    
})();
