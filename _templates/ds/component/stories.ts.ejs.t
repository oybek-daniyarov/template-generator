---
to: <%=componentPath%>.stories.ts
---
import type { Meta, Story } from "@storybook/vue3";
import { defineComponent } from "vue";
import { <%=componentName%> } from ".";
import type { I<%=componentName%>Props } from "./props";
import { action } from "@storybook/addon-actions";

export const defaultProps: I<%=componentName%>Props = {<% if (createProps) { %><%props.forEach(function(item){%>
  <%=item.name%>: <%-item.defaultValue%>,<% }); _%>
<% } %>
};

const meta: Meta = {
  title: "<%=directoryNameUcf%>/<%=componentName%>",
  component: <%=componentName%>,
  excludeStories: ["defaultProps"],
  args: {
    ...defaultProps,
    default: "Label",
  },
  argTypes: {
    default: {
      control: "text",
    },
  },
};

const emits = {
  click: action("@click"),
};

export const Default: Story<I<%=componentName%>Props> = (args) =>
  defineComponent({
    components: { <%=componentName%> },
    setup: () => ({ args, emits }),
    template: `
      <<%=componentName%> v-bind="args" v-on="emits">
        {{ args.default }}
      </<%=componentName%>>
    `,
  });

export default meta;
