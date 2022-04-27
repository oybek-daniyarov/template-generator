---
arbitrary:
    <%=  componentName = h.changeCase.upperCaseFirst(directory) + h.changeCase.pascal(name)%>
    <%=  directoryNameUcf = h.changeCase.upperCaseFirst(directory)%>
    <%=  directoryPath = h.changeCase.param(directory)%>
    <%=  componentSlug = h.changeCase.param(name)%>
    <%=  componentFullSlug = h.changeCase.param(componentName)%>
    <%=  componentDir = 'src/' + directoryPath + '/' + componentSlug%>
    <%=  componentPath = componentDir + '/'+ componentName%>
to: <%=componentDir%>/index.ts
---
export { default as <%=componentName%> } from "./<%=componentName%>.vue";
