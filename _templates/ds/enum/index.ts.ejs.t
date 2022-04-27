---
arbitrary:
    <%=  componentName = h.changeCase.upperCaseFirst(directory) + h.changeCase.pascal(component)%>
    <%=  enumName = componentName + h.changeCase.upperCaseFirst(name) + "Enum"%>
    <%=  directoryPath = h.changeCase.param(directory) + '/' + h.changeCase.param(component)%>
    <%=  componentDir = 'src/' + directoryPath%>
to: <%=componentDir%>/<%=h.changeCase.param(name)%>.enum.ts
---
export enum <%=enumName%> {<% enums.trim().split(/\s*,\s*/).forEach(function(enumName){ %>
  <%= h.changeCase.constant(enumName) %> = "<%=h.changeCase.param(enumName)%>",<% });%>
}
/**** test ****/