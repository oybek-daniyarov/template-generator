---
to: <%=componentDir%>/__test__/<%=componentName%>.spec.ts
---
import { it, expect, beforeEach, vi } from "vitest";
import { mount } from "@vue/test-utils";
import { <%=componentName%> } from "..";
import { defaultProps } from "../<%=componentName%>.stories";
import type { I<%=componentName%>Props } from "../props";

let underTest: ReturnType<typeof wrapperFactory>;

function wrapperFactory(props: Partial<I<%=componentName%>Props> = {}) {
  return mount(<%=componentName%>, {
    props: {
      ...defaultProps,
      ...props,
    },
  });
}

beforeEach(() => {
  underTest = wrapperFactory();
});

it.todo("test cases missing for <%=componentName%> component");

// Example
// it("should call the onClick callback when clicked", async () => {
//   const mock = vi.fn().mockImplementation(() => {});
//   await underTest.setProps({ onClick: mock });
//   expect(mock).toHaveBeenCalled();
// });