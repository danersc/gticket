package gticket



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChamadoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Chamado.list(params), model:[chamadoInstanceCount: Chamado.count()]
    }

    def show(Chamado chamadoInstance) {
        respond chamadoInstance
    }

    def create() {
        respond new Chamado(params)
    }

    @Transactional
    def save(Chamado chamadoInstance) {
        if (chamadoInstance == null) {
            notFound()
            return
        }

        if (chamadoInstance.hasErrors()) {
            respond chamadoInstance.errors, view:'create'
            return
        }

        chamadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect chamadoInstance
            }
            '*' { respond chamadoInstance, [status: CREATED] }
        }
    }

    def edit(Chamado chamadoInstance) {
        respond chamadoInstance
    }

    @Transactional
    def update(Chamado chamadoInstance) {
        if (chamadoInstance == null) {
            notFound()
            return
        }

        if (chamadoInstance.hasErrors()) {
            respond chamadoInstance.errors, view:'edit'
            return
        }

        chamadoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect chamadoInstance
            }
            '*'{ respond chamadoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Chamado chamadoInstance) {

        if (chamadoInstance == null) {
            notFound()
            return
        }

        chamadoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Chamado.label', default: 'Chamado'), chamadoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chamado.label', default: 'Chamado'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
