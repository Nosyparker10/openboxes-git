
<%@ page import="org.pih.warehouse.core.PartyType" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${warehouse.message(code: 'partyType.label', default: 'PartyType')}" />
        <title><warehouse:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${partyTypeInstance}">
	            <div class="errors" role="alert" aria-label="error-message">
	                <g:renderErrors bean="${partyTypeInstance}" as="list" />
	            </div>
            </g:hasErrors>

			<div class="button-bar">
				<g:link class="button" action="list"><warehouse:message code="default.list.label" args="['partyType']"/></g:link>
				<g:link class="button" action="create"><warehouse:message code="default.add.label" args="['partyType']"/></g:link>
			</div>


			<g:form action="save" method="post" >
				<div class="box">
					<h2><warehouse:message code="default.create.label" args="[entityName]" /></h2>
					<table>
						<tbody>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="code"><warehouse:message code="default.code.label" default="code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: partyTypeInstance, field: 'code', 'errors')}">
									<g:textField class="text" size="80" name="code" maxlength="255" value="${partyTypeInstance?.code}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label for="name"><warehouse:message code="partyType.name.label" default="Name" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: partyTypeInstance, field: 'name', 'errors')}">
									<g:textField class="text" size="80" name="name" maxlength="255" value="${partyTypeInstance?.name}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="description"><warehouse:message code="partyType.description.label" default="Description" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: partyTypeInstance, field: 'description', 'errors')}">
									<g:textField class="text" size="80" name="description" maxlength="255" value="${partyTypeInstance?.description}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name">
									<label for="partyTypeCode"><warehouse:message code="partyType.partyTypeCode.label" default="Party Type Code" /></label>
								</td>
								<td valign="top" class="value ${hasErrors(bean: partyTypeInstance, field: 'partyTypeCode', 'errors')}">
									<g:select class="chzn-select-deselect" name="partyTypeCode" from="${org.pih.warehouse.core.PartyTypeCode?.values()}" value="${partyTypeInstance?.partyTypeCode}"  />
								</td>
							</tr>


							<tr class="prop">
								<td valign="top"></td>
								<td valign="top">
									<div class="buttons left">
									   <g:submitButton name="create" class="button" value="${warehouse.message(code: 'default.button.create.label', default: 'Create')}" />

									   <g:link action="list">${warehouse.message(code: 'default.button.cancel.label', default: 'Cancel')}</g:link>

									</div>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
            </g:form>
        </div>
    </body>
</html>
