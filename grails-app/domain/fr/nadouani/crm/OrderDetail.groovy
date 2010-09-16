package fr.nadouani.crm

class OrderDetail {
	
	Long quantity
	
	static belongsTo = [order: Order, product: Product]
	 
	static constraints = {
		quantity(nullable:false, blank:false, min: 0L)
	}
	
	String toString(){
		"${product.name} X $quantity"
	}
}
