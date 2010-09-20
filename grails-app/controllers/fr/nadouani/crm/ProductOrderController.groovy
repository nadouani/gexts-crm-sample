package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class ProductOrderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def productOrderInstance = new ProductOrder()
		productOrderInstance.properties = params
		return [productOrderInstance: productOrderInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def productOrderInstanceList = ProductOrder.list(params)
		
		def dataToRender = ['data' : ProductOrder.list(params), 'totalCount' : ProductOrder.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def productOrderInstance = new ProductOrder(params)
		if (productOrderInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), productOrderInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			productOrderInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def productOrderInstance = ProductOrder.get(params.id)
		if (productOrderInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (productOrderInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this ProductOrder while you were editing'}")
					return
				}
			}
			
			productOrderInstance.properties = params
			if (!productOrderInstance.hasErrors() && productOrderInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), productOrderInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				productOrderInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def productOrderInstance = ProductOrder.get(params.id)
		if (!productOrderInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
			redirect(action: "list")
		}
		else {
			[productOrderInstance: productOrderInstance]
		}
	}
	
	def edit = {
		def productOrderInstance = ProductOrder.get(params.id)
		if (!productOrderInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, productOrderInstance) as JSON
			}
		}
	}
	
	def delete = {
		def productOrderInstance = ProductOrder.get(params.data)
		if (productOrderInstance) {
			try {
				productOrderInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'productOrder.label', default: 'ProductOrder'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
