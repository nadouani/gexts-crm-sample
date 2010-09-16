package fr.nadouani.crm

class Supplier {
	String company
	
	String contactName
	String contactTitle
	String contactEmail
	
	String address
	String city
	String region
	String postalCode
	String country
	
	String phone
	String fax
	String homePage
	
	static hasMany = [products: Product]
	
    static constraints = {
		company(nullable: false, blank:false)
		contactName(nullable: false, blank:false)
		contactTitle(nullable: false, blank:false)
		contactEmail(nullable:false, blank:false, email: true)
		address(nullable: false, blank:false, maxSize: 256)
		city(nullable: false, blank:false)
		region()
		postalCode(nullable: false, blank:false)
		country(nullable: false, blank:false)
		phone(nullable: false, blank:false)
		fax()
		homePage(url: true)
    }
	
	String toString(){
		"$company (country)"
	}
}
