package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class OrderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def orderInstance = new Order()
		orderInstance.properties = params
		return [orderInstance: orderInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def orderInstanceList = Order.list(params)
		
		def dataToRender = ['data' : Order.list(params), 'totalCount' : Order.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def orderInstance = new Order(params)
		if (orderInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			orderInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def orderInstance = Order.get(params.id)
		if (orderInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (orderInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this Order while you were editing'}")
					return
				}
			}
			
			orderInstance.properties = params
			if (!orderInstance.hasErrors() && orderInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'order.label', default: 'Order'), orderInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				orderInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])}"
			redirect(action: "list")
		}
		else {
			[orderInstance: orderInstance]
		}
	}
	
	def edit = {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, orderInstance) as JSON
			}
		}
	}
	
	def delete = {
		def orderInstance = Order.get(params.data)
		if (orderInstance) {
			try {
				orderInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'order.label', default: 'Order'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
