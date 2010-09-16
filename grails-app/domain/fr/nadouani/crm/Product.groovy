package fr.nadouani.crm

class Product {
	
	String name
	String description
	String picture
	Integer quantityPerUnit
	Float unitPrice
	Long unitsInStock
	
	static belongsTo = [category: Category, supplier: Supplier]

    static constraints = {
		name(nullable:false, blank:false)
		description(maxSize:256)
		picture()
		quantityPerUnit(nullable:false, min:0)
		unitPrice(nullable:false, min:0F)
		unitsInStock(nullable:false, min:0L)
    }
	
	String toString(){
		name
	}
}
