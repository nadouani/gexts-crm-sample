package fr.nadouani.crm

class Category {
	String name
	String description
	String picture
	
	static hasMany = [products: Product]
	
    static constraints = {
		name(nullable:false, blank:false)
		description()
		picture()
    }
	
	String toString(){
		name
	}
}
