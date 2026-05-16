import { createRoot } from "react-dom/client";
import { NewGameForm } from "Organisms/NewGameForm";
import { QuestEventForm } from "Organisms/QuestEventForm";
import { TextEditor } from "Atoms/TextEditor";
import { IndexList } from "Organisms/IndexList";
import { NewGameMapForm } from "Organisms/NewGameMapForm";
import { GameMapViewer } from "Organisms/GameMapViewer";

// Component registry
const components = {
  NewGameForm,
  QuestEventForm,
  TextEditor,
  IndexList,
  NewGameMapForm,
  GameMapViewer,
};

const roots = new Map<Element, Root>();

function mountComponents() {
  document.querySelectorAll("[data-react-component]").forEach((container) => {
    const componentName = container.dataset.reactComponent;
    const Component = components[componentName!];

    if (Component) {
      const props = JSON.parse(container.dataset.props || "{}");

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
