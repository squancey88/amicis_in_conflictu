import { createRoot } from "react-dom/client";
import { NewGameForm } from "Organisms/NewGameForm";
import { QuestEventForm } from "Organisms/QuestEventForm";
import { TextEditor } from "Atoms/TextEditor";

// Component registry
const components = {
  NewGameForm,
  QuestEventForm,
  TextEditor,
};

const roots = new Map<Element, Root>();

function mountComponents() {
  document.querySelectorAll("[data-react-component]").forEach((container) => {
    const componentName = container.getAttribute("data-react-component");
    const Component = components[componentName!];

    if (Component) {
      const props = JSON.parse(container.getAttribute("data-props") || "{}");

      const root = roots.get(container) ?? createRoot(container);
      roots.set(container, root);
      root.render(<Component {...props} />);
    }
  });
}

document.addEventListener("turbo:load", mountComponents);
document.addEventListener("turbo:before-stream-render", (e) => {
  setTimeout(() => mountComponents(), 10);
});
