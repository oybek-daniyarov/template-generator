---
to: <%=componentPath%>.vue
---
<script setup lang="ts">
import { bemBuilder } from "@chatfood/core-utils";
import type { I<%=componentName%>Props } from "./props";

const css = bemBuilder("<%=componentFullSlug%>");

const props = withDefaults(defineProps<I<%=componentName%>Props>(), {<% if (createProps) { %><%props.forEach(function(item){%>
  <%=item.name%>: <%-item.defaultValue%>,<% }); _%>
<% } %>
});

defineEmits<{
  (e: "click", event: MouseEvent): void;
}>();
</script>

<template>
  <div :class="css()" @click="$emit('click', $event)">
    I am the new <%=componentName%> component 😀
  </div>
</template>

<style lang="scss" scoped>
.<%=componentFullSlug%> {
  display: block;
}
</style>
