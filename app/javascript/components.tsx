import React from "react";
import { createRoot } from "react-dom/client";
import HelloWorld from "./components/HelloWorld.jsx";

import NewGameForm from "./components/organisms/NewGameForm.js";

// Component registry
const components = {
  HelloWorld,
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
