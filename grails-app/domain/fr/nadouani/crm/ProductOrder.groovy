package fr.nadouani.crm

import java.util.Date;

class ProductOrder {

    String reference
	
	Date dateCreated
	Date lastUpdated
	
	Date orderDate
	Date shippedDate
	
	String shipVia
	String shipName
	String shipAddress
	String shipCity
	String shipRegion
	String shipPostalCode
	String shipCountry
	Float shipPrice
	
	static belongsTo = [owner: Customer]
	static hasMany = [details: OrderDetail]
	 
    static constraints = {
		reference(nullable:false, blank:false)
		orderDate(nullable:false)
		shippedDate(nullable:true)
		shipVia(nullable: false, inList: ['Home delivery', 'FedEx', 'Freight International', 'Other'])
		shipName(nullable: false, blank:false)
		shipAddress(nullable: false, blank:false)
		shipCity(nullable: false, blank:false)
		shipRegion()
		shipPostalCode(nullable: false, blank:false)
		shipCountry(nullable: false, blank:false)
		shipPrice(nullable:false, min:0F)
    }
	
	String toString(){
		"Order N°$reference ($shipName - $orderDate)"
	}
}
