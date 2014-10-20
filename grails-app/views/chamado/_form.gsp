<%@ page import="gticket.Chamado" %>

 <div class="panel panel-default">
     <div class="panel-heading">
         Basic Form Elements
     </div>
     <div class="panel-body">
         <div class="row">
             <div class="col-lg-6">

                     <div class="form-group">
                         <label><g:message code="chamado.titulo.label" default="Titulo" /></label>
                         <g:textField name="titulo" maxlength="80" required="" value="${chamadoInstance?.titulo}" class="form-control"/>
                     </div>

                     <div class="form-group">
                         <label><g:message code="chamado.descricao.label" default="Descricao" /></label>
                         <g:textArea name="descricao" cols="40" rows="5" maxlength="400" required="" value="${chamadoInstance?.descricao}" class="form-control"/>
                     </div>

                    
                     
                     <div class="form-group">
                         <label><g:message code="chamado.tipo.label" default="Tipo" /></label>
                         <g:select name="tipo" from="${enums.TipoChamado?.values()}" keys="${enums.TipoChamado.values()*.name()}" required="" value="${chamadoInstance?.tipo?.name()}" class="form-control" />
                     </div>
                    
                     
             </div>

             <!-- /.col-lg-6 (nested) -->
         </div>
         <!-- /.row (nested) -->
     </div>
     <!-- /.panel-body -->
 </div>

