package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class OrderDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def orderDetailInstance = new OrderDetail()
		orderDetailInstance.properties = params
		return [orderDetailInstance: orderDetailInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def orderDetailInstanceList = OrderDetail.list(params)
		
		def dataToRender = ['data' : OrderDetail.list(params), 'totalCount' : OrderDetail.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def orderDetailInstance = new OrderDetail(params)
		if (orderDetailInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), orderDetailInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			orderDetailInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def orderDetailInstance = OrderDetail.get(params.id)
		if (orderDetailInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (orderDetailInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this OrderDetail while you were editing'}")
					return
				}
			}
			
			orderDetailInstance.properties = params
			if (!orderDetailInstance.hasErrors() && orderDetailInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), orderDetailInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				orderDetailInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def orderDetailInstance = OrderDetail.get(params.id)
		if (!orderDetailInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.id])}"
			redirect(action: "list")
		}
		else {
			[orderDetailInstance: orderDetailInstance]
		}
	}
	
	def edit = {
		def orderDetailInstance = OrderDetail.get(params.id)
		if (!orderDetailInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, orderDetailInstance) as JSON
			}
		}
	}
	
	def delete = {
		def orderDetailInstance = OrderDetail.get(params.data)
		if (orderDetailInstance) {
			try {
				orderDetailInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'orderDetail.label', default: 'OrderDetail'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
