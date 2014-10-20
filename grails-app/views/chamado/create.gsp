<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<h4><g:set var="entityName" value="${message(code: 'chamado.label', default: 'Chamado')}" /></h4>
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-chamado" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${chamadoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${chamadoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:chamadoInstance, action:'save']" role="form" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Salvar')}" class="btn btn-default" />
					<button type="reset" class="btn btn-default">Limpar</button>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
