---
to: <%=componentDir%>/props.ts
---
export type I<%=componentName%>Props = {<% if (createProps) { %><%props.forEach(function(item){%>
  <%=item.name%>?: <%=item.type-%>;<% }); %>
<% } %>};
