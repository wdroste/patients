package org.sacredheart

import org.apache.shiro.crypto.hash.Sha256Hash

class UserController {
    static scaffold = true

    def create() {
        switch (request.method) {
            case 'GET':
                [userInstance: new User(params)]
                break
            case 'POST':
                if (params.password != params.confirmPassword) {
                    userInstance.errors.rejectValue(
                            'password',
                            'user.passwordMismatch',
                            [message(code: 'user.label')] as Object[],
                            "Passwords do not match.")
                    render view: 'create', model: [userInstance: userInstance]
                    return
                }

                def userInstance = new User(params)
                userInstance.passwordHash = new Sha256Hash(params.password).toHex()
                if (!userInstance.save(flush: true)) {
                    render view: 'create', model: ['userInstance': userInstance]
                    return
                }
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label'), userInstance.id])
                redirect action: 'show', id: userInstance.id
                break
        }
    }

    def edit() {
        switch (request.method) {
            case 'GET':
                if (params.password != params.confirmPassword) {
                    userInstance.errors.rejectValue(
                            'password',
                            'user.passwordMismatch',
                            [message(code: 'user.label')] as Object[],
                            "Passwords do not match.")
                    render view: 'edit', model: [userInstance: userInstance]
                    return
                }

                def userInstance = User.get(params.id)
                if (params.password == params.confirmPassword && params.password != '********') {
                    userInstance.passwordHash = new Sha256Hash(params.password).toHex()
                }

                if (!userInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label'), params.id])
                    redirect action: 'list'
                    return
                }

                [userInstance: userInstance]
                break
            case 'POST':
                def userInstance = User.get(params.id)
                if (!userInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                    redirect action: 'list'
                    return
                }

                if (params.version) {
                    def version = params.version.toLong()
                    if (userInstance.version > version) {
                        userInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                                [message(code: 'user.label', default: 'User')] as Object[],
                                "Another user has updated this User while you were editing")
                        render view: 'edit', model: [userInstance: userInstance]
                        return
                    }
                }
                userInstance.properties = params

                if (!userInstance.save(flush: true)) {
                    render view: 'edit', model: [userInstance: userInstance]
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label'), userInstance.id])
                redirect action: 'show', id: userInstance.id
                break
        }

    }

}
