package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class SupplierController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def supplierInstance = new Supplier()
		supplierInstance.properties = params
		return [supplierInstance: supplierInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def supplierInstanceList = Supplier.list(params)
		
		def dataToRender = ['data' : Supplier.list(params), 'totalCount' : Supplier.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def supplierInstance = new Supplier(params)
		if (supplierInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			supplierInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def supplierInstance = Supplier.get(params.id)
		if (supplierInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (supplierInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this Supplier while you were editing'}")
					return
				}
			}
			
			supplierInstance.properties = params
			if (!supplierInstance.hasErrors() && supplierInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'supplier.label', default: 'Supplier'), supplierInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				supplierInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def supplierInstance = Supplier.get(params.id)
		if (!supplierInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])}"
			redirect(action: "list")
		}
		else {
			[supplierInstance: supplierInstance]
		}
	}
	
	def edit = {
		def supplierInstance = Supplier.get(params.id)
		if (!supplierInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, supplierInstance) as JSON
			}
		}
	}
	
	def delete = {
		def supplierInstance = Supplier.get(params.data)
		if (supplierInstance) {
			try {
				supplierInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'supplier.label', default: 'Supplier'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
