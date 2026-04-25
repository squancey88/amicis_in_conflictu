import { createRoot } from "react-dom/client";
import { NewGameForm } from "Organisms/NewGameForm";

// Component registry
const components = {
  NewGameForm,
};

function mountComponents() {
  document.querySelectorAll("[data-react-component]").forEach((container) => {
    const componentName = container.dataset.reactComponent;
    const Component = components[componentName];
    if (Component) {
      const props = JSON.parse(container.dataset.props || "{}");
      const root = createRoot(container);
      root.render(<Component {...props} />);
    }
  });
}

// document.addEventListener("DOMContentLoaded", mountComponents);
document.addEventListener("turbo:load", mountComponents);
