<g:set var="entity" value="Customer" />
 

(function(){
    
    Ext.ns('GrailsApp.ext.form');
    
    var $cls = GrailsApp.ext.form.CustomerForm = function(cfg){
    	
        $cls.superclass.constructor.call(this, Ext.apply({
        	urlSave: '<g:resource dir="customer" file="save" />',
		    urlUpdate: '<g:resource dir="customer" file="update" />',
		    urlEdit: '<g:resource dir="customer" file="edit" />',
		    items: [
				
		        


{xtype: 'numberfield', name: 'id', fieldLabel: '<g:message code="customer.id.label" default="Id" />'}, 
		    	
		        


{xtype: 'textfield', name: 'company', fieldLabel: '<g:message code="customer.company.label" default="Company" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'contactName', fieldLabel: '<g:message code="customer.contactName.label" default="Contact Name" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'contactTitle', fieldLabel: '<g:message code="customer.contactTitle.label" default="Contact Title" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'contactEmail', fieldLabel: '<g:message code="customer.contactEmail.label" default="Contact Email" />', allowBlank: false, vtype: 'email', }, 
		    	
		        


{xtype: 'textarea', name: 'address', fieldLabel: '<g:message code="customer.address.label" default="Address" />'}, 
		    	
		        


{xtype: 'textfield', name: 'city', fieldLabel: '<g:message code="customer.city.label" default="City" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'region', fieldLabel: '<g:message code="customer.region.label" default="Region" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'postalCode', fieldLabel: '<g:message code="customer.postalCode.label" default="Postal Code" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'country', fieldLabel: '<g:message code="customer.country.label" default="Country" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'phone', fieldLabel: '<g:message code="customer.phone.label" default="Phone" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'fax', fieldLabel: '<g:message code="customer.fax.label" default="Fax" />', allowBlank: false, }, 
		    	
		        


{xtype: 'textfield', name: 'homePage', fieldLabel: '<g:message code="customer.homePage.label" default="Home Page" />', allowBlank: false, vtype: 'url', }, 
		    				    	
		    	
		    	{xtype: 'tabpanel', activeItem:0,height:200,
			    	items:[
			    


{value:'renderManyToMany', xtype: 'textfield', name: 'orders', fieldLabel: '<g:message code="customer.orders.label" default="Orders" />', anchor: '100%'}, 
			    	]}
		    						
			],
			loadSuccess: this.loadSuccess
        },cfg));
        
    };

    Ext.extend($cls, Ext.Grails.ux.EntityFormPanel, { 
    	loadSuccess: function(form, action){
    		
			Ext.getCmp('gridCustomerOrder').store.loadData(action.result.data);
			
    	}
    });
    
})();
