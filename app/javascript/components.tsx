import { createRoot } from "react-dom/client";
import { NewGameForm } from "Organisms/NewGameForm";

// Component registry
const components = {
  NewGameForm,
};

document.addEventListener("DOMContentLoaded", () => {
  document.querySelectorAll("[data-react-component]").forEach((container) => {
    const componentName = container.dataset.reactComponent;
    const Component = components[componentName];

    if (Component) {
      const props = JSON.parse(container.dataset.props || "{}");
      const root = createRoot(container);
      root.render(<Component {...props} />);
    }
  });
});
