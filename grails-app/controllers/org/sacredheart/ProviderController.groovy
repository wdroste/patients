package org.sacredheart

import org.springframework.dao.DataIntegrityViolationException

class ProviderController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        forward(action: 'list', params: params)
    }

    def list() {
        flash.message = ''
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		try {
			[providerInstanceList: Provider.list(params), providerInstanceTotal: Provider.count()]
		} catch (Exception ex) {
            log.error('Failed to execute query: ' + ex.message)
            flash.message = ex.localizedMessage.replaceAll(/.*ParseException: /, '')
			[providerInstanceList: [], providerInstanceTotal: 0]
		}
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[providerInstance: new Provider(params)]
			break
		case 'POST':
	        def providerInstance = new Provider(params)
	        if (!providerInstance.save(flush: true)) {
	            render view: 'create', model: [providerInstance: providerInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'provider.label'), providerInstance.id])
	        redirect action: 'show', id: providerInstance.id
			break
		}
    }

    def show() {
        def providerInstance = Provider.get(params.id)
        if (!providerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'provider.label'), params.id])
            redirect action: 'list'
            return
        }

        [providerInstance: providerInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def providerInstance = Provider.get(params.id)
	        if (!providerInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provider.label'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [providerInstance: providerInstance]
			break
		case 'POST':
	        def providerInstance = Provider.get(params.id)
	        if (!providerInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'provider.label'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (providerInstance.version > version) {
	                providerInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'provider.label', default: 'Provider')] as Object[],
	                          "Another user has updated this Provider while you were editing")
	                render view: 'edit', model: [providerInstance: providerInstance]
	                return
	            }
	        }

	        providerInstance.properties = params

	        if (!providerInstance.save(flush: true)) {
	            render view: 'edit', model: [providerInstance: providerInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'provider.label'), providerInstance.id])
	        redirect action: 'show', id: providerInstance.id
			break
		}
    }

    def delete() {
        def providerInstance = Provider.get(params.id)
        if (!providerInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'provider.label'), params.id])
            redirect action: 'list'
            return
        }

        try {
            providerInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'provider.label'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'provider.label'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
