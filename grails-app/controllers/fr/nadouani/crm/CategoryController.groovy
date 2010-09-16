package fr.nadouani.crm



import fr.nadouani.extjsscaffold.dto.ExtJsJSONResponse;
import grails.converters.JSON

class CategoryController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        
    }

	def create = {
		def categoryInstance = new Category()
		categoryInstance.properties = params
		return [categoryInstance: categoryInstance]
	}

    def list = {		
		params.max = Math.min(params.limit ? params.int('limit') : 10, 100)
		params.offset = params.start ? params.int('start') : 0
		params.order = params.dir ? params.dir.toLowerCase() : ""
		
		def categoryInstanceList = Category.list(params)
		
		def dataToRender = ['data' : Category.list(params), 'totalCount' : Category.count() ]

		JSON.use("dcmWithToString") {
			render dataToRender as JSON
		}
    }
	
	def save = {
		def categoryInstance = new Category(params)
		if (categoryInstance.save(flush: true)) {
			def successMsg = "${message(code: 'default.created.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])}"
			render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
		}
		else {
			def errors = ""			
			categoryInstance.errors.allErrors.each {
				errors += "'${it.getField()}': '${message(error: it)}',"
			}
			errors = "{" + errors.substring(0, errors.length()-1) + "}"
			
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
		}
	}
	
	def update = {
		def categoryInstance = Category.get(params.id)
		if (categoryInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (categoryInstance.version > version) {
					render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Another user has updated this Category while you were editing'}")
					return
				}
			}
			
			categoryInstance.properties = params
			if (!categoryInstance.hasErrors() && categoryInstance.save(flush: true)) {
				def successMsg = "${message(code: 'default.updated.message', args: [message(code: 'category.label', default: 'Category'), categoryInstance.id])}"
				render(contentType:"application/json", text:"{'success': true, 'successMsg': '${successMsg}'}")
			}
			else {
				def errors = ""			
				categoryInstance.errors.allErrors.each {
					errors += "'${it.getField()}': '${message(error: it)}',"
				}
				errors = "{" + errors.substring(0, errors.length()-1) + "}"
				
				render(contentType:"application/json", text:"{'success': false, 'errorMsg': 'Validation Error', 'errors' : ${errors}}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
	}	
	
	def show = {
		def categoryInstance = Category.get(params.id)
		if (!categoryInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
			redirect(action: "list")
		}
		else {
			[categoryInstance: categoryInstance]
		}
	}
	
	def edit = {
		def categoryInstance = Category.get(params.id)
		if (!categoryInstance) {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.id])}"
			render(contentType:"application/json", text:"{'success': false, 'errorMsg': '${errorMsg}'}")
		}
		else {
			JSON.use("dcmWithToString") {
				render new ExtJsJSONResponse(true, categoryInstance) as JSON
			}
		}
	}
	
	def delete = {
		def categoryInstance = Category.get(params.data)
		if (categoryInstance) {
			try {
				categoryInstance.delete(flush: true)
				def successMsg = "${message(code: 'default.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.data])}"
				render(contentType:"application/json", text:"{'success': true, 'message': '${successMsg}'}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				def errorMsg = "${message(code: 'default.not.deleted.message', args: [message(code: 'category.label', default: 'Category'), params.data])}"
				render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
			}
		}
		else {
			def errorMsg = "${message(code: 'default.not.found.message', args: [message(code: 'category.label', default: 'Category'), params.data])}"
			render(contentType:"application/json", text:"{'success': false, 'message': '${errorMsg}'}")
		}
	}
}
