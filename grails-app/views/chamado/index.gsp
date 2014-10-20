
<%@ page import="gticket.Chamado" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-chamado" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'chamado.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'chamado.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'chamado.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'chamado.dateCreated.label', default: 'Data de Criação')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'chamado.lastUpdated.label', default: 'Atualizado em')}" />
						
						<th style="text-align:center;">Atualizar</th>
						<th style="text-align:center;">Deletar</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chamadoInstanceList}" status="i" var="chamadoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chamadoInstance.id}">${fieldValue(bean: chamadoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: chamadoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: chamadoInstance, field: "tipo")}</td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${chamadoInstance.dateCreated}" /></td>
					
						<td><g:formatDate format="dd/MM/yyyy" date="${chamadoInstance.lastUpdated}" /></td>
						
						<td style="text-align:center;"><g:link class="btn btn-primary" action="edit" resource="${chamadoInstance}"><i class="fa fa-edit"></i></g:link></td>
						
						<td style="text-align:center;" ><g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Deseja realmente excluir o registro?')}');" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chamadoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
