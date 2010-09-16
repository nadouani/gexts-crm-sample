package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class CustomerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def customerInstance = new Customer()
		customerInstance.properties = params
		return [customerInstance: customerInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def customerInstanceList = Customer.list(params)
		
		def dataToRender = ['data' : Customer.list(params), 'totalCount' : Customer.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def customerInstance = new Customer(params)
		if (customerInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			customerInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def customerInstance = Customer.get(params.id)
		if (customerInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (customerInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this Customer while you were editing'}")
					return
				}
			}
			
			customerInstance.properties = params
			if (!customerInstance.hasErrors() && customerInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'customer.label', default: 'Customer'), customerInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				customerInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def customerInstance = Customer.get(params.id)
		if (!customerInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
			redirect(action: "list")
		}
		else {
			[customerInstance: customerInstance]
		}
	}
	
	def edit = {
		def customerInstance = Customer.get(params.id)
		if (!customerInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, customerInstance) as JSON
			}
		}
	}
	
	def delete = {
		def customerInstance = Customer.get(params.data)
		if (customerInstance) {
			try {
				customerInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'customer.label', default: 'Customer'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'customer.label', default: 'Customer'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
